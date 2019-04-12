class Offset
  def self.return_shift(date)
    (date.to_i * date.to_i).to_s[-4..-1]
  end

  def self.create_shift
    date = Time.now.to_s[0..9].delete('-')
    date = date[-2..-1] + date[4..5] + date[2..3]
    (date.to_i * date.to_i).to_s[-4..-1]
  end
end
