require './lib/offset'
require './lib/key'
require './lib/message'

class Enigma

  def make_encryption_hash
    {
      encryption: @encrypted_str,
      key: @key_shift,
      date: @date
    }
  end

  def make_decryption_hash
    {
      decryption: @decrypted_str,
      key: @key_shift,
      date: @date
    }
  end

  def create_proper_date_shift
    if @date.nil?
      @date = Offset.create.date
      Offset.create.date_shift
    else
      Offset.return(@date)
    end
  end

  def encrypt(str, key_shift=Key.create_shift, date=nil)
    @key_shift = key_shift
    @date = date
    date_shift = create_proper_date_shift
    @encrypted_str = Message.new(str.downcase, key_shift, date_shift).encrypt_with_keys
    make_encryption_hash
  end

  def decrypt(str, key_shift=Key.create_shift, date=nil )
    @key_shift = key_shift
    @date = date
    date_shift = create_proper_date_shift
    @decrypted_str = Message.new(str.downcase, key_shift, date_shift).decrypt_with_keys
    make_decryption_hash
  end

  def crack(str, date=nil)
    @date = date
    date_shift = create_proper_date_shift
    cracked_str = Message.new(str.downcase, '00000', date_shift)
    cracked_str.crack_with_keys
    @decrypted_str = cracked_str.decrypt_with_keys
    @key_shift = cracked_str.key_shift
    make_decryption_hash
  end
end
