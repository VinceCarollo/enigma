class Message
  attr_reader :cracked_str, :cracked_key

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

  def shift_all_letters(str, n)
    @str.split('').each_slice(4) do |arr|
      str << shift_letter(arr[0], n * a_shift) if !arr[0].nil?
      str << shift_letter(arr[1], n * b_shift) if !arr[1].nil?
      str << shift_letter(arr[2], n * c_shift) if !arr[2].nil?
      str << shift_letter(arr[3], n * d_shift) if !arr[3].nil?
    end
    str
  end

  def encrypt_with_keys
    encryption = []
    shift_all_letters(encryption, 1).join
  end

  def decrypt_with_keys
    decryption = []
    shift_all_letters(decryption, -1).join
  end

  def crack
    shift_guide = {}
    if @str.length % 3
      shift_guide[:a_shift_str] = @str[-1]
      shift_guide[:d_shift_str] = @str[-2]
      shift_guide[:c_shift_str] = @str[-3]
      shift_guide[:b_shift_str] = @str[-4]
    end
    require 'pry'; binding.pry
  end
end
