class Vigenere
  class << self
    def encrypt(plaintext, key)
      _p, _k = encode(plaintext, key)

      decode apply_key(_p, _k, :+)
    end

    def decrypt(ciphertext, key)
      _c, _k = encode(ciphertext, key)

      decode apply_key(_c, _k, :-)
    end

    private

    def encode(*str)
      str.map {|x| pipe(x, :normalize_case!, :to_byte_array, :zero_offset!) }
    end

    def decode(ary)
      pipe(ary, :offset!, :_to_s)
    end

    def pipe(arg, *methods)
      methods.inject(arg) {|x, y| send y, x }
    end

    def normalize_case!(str)
      str.upcase! || str
    end

    def to_byte_array(str)
      str.each_byte.to_a
    end

    def zero_offset!(ary)
      ary.map! {|x| x - 65 }
    end

    def offset!(ary)
      ary.map! {|x| x + 65 }
    end    
    
    def _to_s(ary)
      ary.pack 'c*'
    end

    def apply_key(text, key, direction)
      result = []
      text.zip(key.cycle) {|x| result << x.reduce(&direction) % 26 }
      result
    end
  end
end