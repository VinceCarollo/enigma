require './lib/offset'
require './lib/key'

class Enigma

  def encrypt(message, key_shift=Key.create_shift, date=nil)
    if date.nil?
      date_shift = Offset.create_shift
    else
      date_shift = Offset.return_shift(date)
    end
    p message
    p key_shift
    p date_shift
  end

end
