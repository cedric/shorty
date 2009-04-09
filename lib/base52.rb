module Base52
  
  class << self
    def encode(c)
      encode = lambda do |d|
        (d < 52 ? '' : encode.call((d / 52.0).to_i)) +
          ((d = d % 52) > 25 ? (d + 39).chr : (d + 97).chr)
      end
      encoded = encode.call(c.to_i)
      encoded = encoded[1..-1] + '0' if encoded =~ /^(do|if|in)$/
      encoded
    end
  end
  
end