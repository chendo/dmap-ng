$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
require 'dmap/tags'
require 'true_false_ext'

class Object
  def tap(&block)
    yield
    block
  end
  
  def tapp(prefix = nil, &block)
    block ||= lambda { |x| x }
    str = (ret = block[self]).is_a?(String) ? ret : ret.inspect
    puts [prefix, str].compact.join(': ')
    self
  end
end
  

class DMAP
  VERSION = '0.0.1'
  
  class << self
    
    def build(&block)
      builder = TagBuilder.new
      builder.instance_eval &block
      r = builder.result
      r.size == 1 ? r.first : r
    end
    
    def parse(data)
      Parser.parse(data).first
    end
    
    
  end
  
  class Tag
    
    class << self
      def lookup(code)
        TAGS[code]
      end
    end
    
    attr_accessor :code, :value, :tag, :type
    
    def initialize(code, value)
      @code, @value = code, value
      @tag, @type = lookup
      
      raise "Cannot have nil value in tag #{code}" if value.nil? && type != :list
    end
    
    def to_dmap
      data = case type
      when :string
        value
      when :list
        (value || []).inject('') { |mem, v| mem += v.to_dmap }
      when :version
        value.pack(pack_code)
      when :long
        # Some types seem to be the wrong endian
        # so there are endian hacks
        [value].pack('Q').reverse
      when :signed_integer
        [value].pack(pack_code).reverse
      else
        [value.to_i].pack(pack_code)
      end
      "#{code}#{[length].pack('N')}#{data}"
    end
    
    def ==(obj)
      self.to_dmap == obj.to_dmap
    end
    
    def pack_code
      @pack_code ||= STATIC_LENGTH_TYPES[type].last rescue raise("No pack code definition for #{code}")
    end
    
    
    def length
      @length ||= case type
      when :string
        value.length
      when :list
        (value || []).inject(0) { |mem, v| mem += v.length + 8 }
      else
        STATIC_LENGTH_TYPES[type].first
      end
    end

    
    
    
    def lookup
      self.class.lookup(code)
    end
    
    
    
    def inspect(level = 0)
      pad = ' ' * (level * 2)
      case value
      when Array
        if value.any? { |e| e.is_a? Tag }
          (["#{pad}#{code}[#{length}]:"] + value.map{ |v| v.inspect(level + 1) }).join("\n")
        else
          "#{pad}#{code}[#{length}]: #{value.inspect}"
        end
      else
        "#{pad}#{code}[#{length}]: #{value.inspect}"
      end
    end
    
    def to_dsl(level = 0)
      pad = ' ' * (level * 2)
      case value
      when Array
        (["#{pad}#{code} do # #{@tag}"] + value.map{ |v| v.to_dsl(level + 1) } + ["#{pad}end"]).join("\n")
      else
        "#{pad}#{code} #{value.inspect} # #{@tag}"
      end
    end
    
    def method_missing(meth, *args)
      return super unless self.class.lookup(meth)
      return super unless value.is_a? Array
      value.find { |v| v.code == meth }.value
    end
    
  end
  
  class TagBuilder
    def initialize
      @tags = []
    end
    
    def method_missing(meth, *args, &block)
      return super unless meth.to_s.length == 4
      if block_given?
        nested = self.class.new
        nested.instance_eval &block
        value = nested.result
      else
        value = args.size > 1 ? args : args.first
      end
      @tags << Tag.new(meth, value)
      nil
    end
    
    def result
      @tags
    end
  end
  
  class Parser
    
    
    def self.parse(buffer)
      buffer = StringIO.new(buffer)
      
      ret = []
      while !buffer.eof?      
        code = buffer.read(4).to_sym
        
        raise "Invalid tag code format while parsing" unless code.to_s =~ /^[a-z]{4}$/i
          
        length = buffer.read(4).unpack('N').first
        data = buffer.read(length)
    
        definition = Tag.lookup(code)
        
        raise "No tag definition for #{code}, length: #{length}, data: #{data.inspect}" unless definition
    
        ret << if (type = definition.last) == :list
          Tag.new(code, parse(data))
        else
          expected_length, pack_code = STATIC_LENGTH_TYPES[type]
          value = case type
          when :string
            data
          when :version
            data.unpack(pack_code)
          when :long
            # Some types seem to be the wrong endian
            # so there are endian hacks
            data.reverse.unpack(pack_code).first
          when :signed_integer
            data.reverse.unpack(pack_code).first
          else
            data.unpack(pack_code).first
          end
          Tag.new(code, value)
        end
      end
      
      ret
    end
    
    
  end
end