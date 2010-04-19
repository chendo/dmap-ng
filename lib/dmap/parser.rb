class DMAP
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