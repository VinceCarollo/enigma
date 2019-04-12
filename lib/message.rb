class Message
  def initialize(str, key_shift, date_shift)
    @str = str
    @key_shift = key_shift
    @date_shift = date_shift
    @alphabet = ("a".."z").to_a << ' '
  end

  def a_shift
    @key_shift[0..1].to_i + @date_shift[0].to_i
  end

  def b_shift
    @key_shift[1..2].to_i + @date_shift[1].to_i
  end

  def c_shift
    @key_shift[2..3].to_i + @date_shift[2].to_i
  end

  def d_shift
    @key_shift[3..4].to_i + @date_shift[3].to_i
  end

  def shift_letter(letter, shift)
    i = @alphabet.index(letter)
    @alphabet.rotate(shift)[i]
  end

  def encrypt_with_keys
    final = []
    @str.split('').each_slice do |arr|
      final << arr[0] if !arr[0].nil?
      final << arr[1] if !arr[1].nil?
      final << arr[2] if !arr[2].nil?
      final << arr[3] if !arr[3].nil?
    end
  end
end
