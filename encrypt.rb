require './lib/enigma'

ARGV == ['txt_path', 'encrypt_path']

message = File.read(ARGV[0])
message.strip!
enigma = Enigma.new
encrypted = enigma.encrypt(message)

File.open(ARGV[1], 'w') do |file|
  file.write encrypted[:encryption]
end

puts "Created '#{ARGV[1]}' with key #{encrypted[:key]} and date #{encrypted[:date]}"
