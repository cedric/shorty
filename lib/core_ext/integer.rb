class Integer
  
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
        chars = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a
        i = self
        s = ''
        while i > 0
          i,r = i.divmod(62)
          s = (chars[r]) + s
        end
        s
      else
        self.to_s
      end
    end
    
end