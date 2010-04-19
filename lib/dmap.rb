$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class DMAP
  VERSION = '0.2.5'
end

Dir[File.dirname(__FILE__) + "/dmap/**.rb"].each { |f| require f }

require 'true_false_ext'
require 'debug_ext'

class DMAP
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
end