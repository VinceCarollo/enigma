require './lib/offset'
require './lib/key'
require './lib/message'

class Enigma

  def make_hash
    {
      encryption: @encrypted_str,
      key: @key_shift,
      date: @date
    }
  end

  def create_proper_offset
    if @date.nil?
      @date = Offset.create_shift.date
      Offset.create_shift
    else
      Offset.return_shift(@date)
    end
  end

  def encrypt(str, key_shift=Key.create_shift, date=nil)
    @key_shift = key_shift
    @date = date
    date_shift = create_proper_offset
    @encrypted_str = Message.new(str.downcase, key_shift, date_shift).encrypt_with_keys
    make_hash
  end

end
