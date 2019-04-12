class Message
  def initialize(str, key_shift, date_shift)
    @str = str
    @key_shift = key_shift
    @date_shift = date_shift
    @alphabet = ("a".."z").to_a << ' '
  end

  def encrypt_with_keys
    p @str
    p @key_shift
    p @date_shift
    p @alphabet
  end
end
