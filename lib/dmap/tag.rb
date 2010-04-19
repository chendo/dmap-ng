class DMAP
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
      raise "Unknown tag #{code}" if tag.nil?
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
    
    # Could be optimised later down the track
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
end