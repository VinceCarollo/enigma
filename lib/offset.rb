class Offset
  def self.return_shift(date)
    (date.to_i * date.to_i).to_s[-4..-1]
  end

  def self.create_shift
    date = Time.now.to_s[0..9].delete('-')
    day = date[-2..-1]
    month = date[4..5]
    year = date[2..3]
    date = day + month + year
    (date.to_i * date.to_i).to_s[-4..-1]
  end
end
