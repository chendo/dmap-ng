class DMAP
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
end
