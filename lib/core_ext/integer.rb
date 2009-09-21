class Integer
  
  BASE62_PRIMITIVES = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
  
  def base_encode(num=62)
    self.send("base#{num}_encode")
  end
  
  private
  
    def base52_encode
      encode = lambda do |d|
        (d < 52 ? '' : encode.call((d / 52.0).to_i)) +
          ((d = d % 52) > 25 ? (d + 39).chr : (d + 97).chr)
      end
      encoded = encode.call(self.to_i)
      encoded = encoded[1..-1] + '0' if encoded =~ /^(do|if|in)$/
      encoded
    end
    
    def base62_encode
      unless self.eql?(0)
        number = self
        result = ''
        while number > 0
          # result = BASE62_PRIMITIVES[number % BASE62_PRIMITIVES.size].to_s + result
          # number /= BASE62_PRIMITIVES.size
          number,r = number.divmod(BASE62_PRIMITIVES.length)
          result = (BASE62_PRIMITIVES[r]) + result
        end
        result
      else
        self.to_s
      end
    end
    
end