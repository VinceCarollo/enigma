require './lib/enigma'
ARGV == ['encrypted_path', 'cracked_path', 'date']

encryption = File.read(ARGV[0])
encryption.strip!
enigma = Enigma.new
cracked = enigma.crack(encryption, ARGV[2])


File.open(ARGV[1], 'w') do |file|
  file.write cracked[:decryption]
end

puts "Created '#{ARGV[1]}' with key #{cracked[:key]} and date #{cracked[:date]}"
