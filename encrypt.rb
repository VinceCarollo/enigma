require './lib/enigma'

ARGV == ['txt_path', 'encrypt_path', 'key']


message = File.read(ARGV[0])
enigma = Enigma.new
message.strip!



puts enigma.encrypt(message)[:date]
puts enigma.encrypt(message)[:key]
puts enigma.encrypt(message)[:encryption]
