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
    @str.split('').each_slice(4) do |arr|
      final << shift_letter(arr[0], a_shift) if !arr[0].nil?
      final << shift_letter(arr[1], b_shift) if !arr[1].nil?
      final << shift_letter(arr[2], c_shift) if !arr[2].nil?
      final << shift_letter(arr[3], d_shift) if !arr[3].nil?
    end
    final.join
  end
end