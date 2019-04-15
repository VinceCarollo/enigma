class Message
  attr_reader :key_shift

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
    if @alphabet.index(letter).nil?
      letter
    else
      i = @alphabet.index(letter)
      @alphabet.rotate(shift)[i]
    end
  end

  def shift_all_letters(cipher, n)
    @str.split('').each_slice(4) do |arr|
      cipher << shift_letter(arr[0], n * a_shift) if !arr[0].nil?
      cipher << shift_letter(arr[1], n * b_shift) if !arr[1].nil?
      cipher << shift_letter(arr[2], n * c_shift) if !arr[2].nil?
      cipher << shift_letter(arr[3], n * d_shift) if !arr[3].nil?
    end
    cipher.join
  end

  def encrypt_with_keys
    shift_all_letters(Array.new, 1)
  end

  def decrypt_with_keys
    shift_all_letters(Array.new, -1)
  end

  def crack
    guide = ''
    until guide[-4..-1] == ' end'
      guide = @str
      @key_shift = (@key_shift.to_i + 1).to_s.rjust(5, '0')
      guide = decrypt_with_keys
    end
  end
end
