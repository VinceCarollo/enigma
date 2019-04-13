require './lib/enigma'

ARGV == ['encrypt_path', 'decrypt_path', 'key', 'date']

message = File.read(ARGV[0])
message.strip!
enigma = Enigma.new
decrypted = enigma.decrypt(message, ARGV[2], ARGV[3])

File.open(ARGV[1], 'w') do |file|
  file.write decrypted[:decryption]
end

puts "Created '#{ARGV[1]}' with key #{decrypted[:key]} and date #{decrypted[:date]}"
