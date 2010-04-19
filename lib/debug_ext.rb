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