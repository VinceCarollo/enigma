require './lib/offset'
require './lib/key'
require './lib/message'

class Enigma

  def encrypt(message, key_shift=Key.create_shift, date=nil)
    @key_shift = key_shift
    @date = date
    if date.nil?
      date_shift = Offset.create_shift
      @date = Offset.create_shift.date
    else
      date_shift = Offset.return_shift(date)
    end
    @encryption_str = Message.new(message, key_shift, date_shift)
  end

end
