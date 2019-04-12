class Offset
  attr_reader :date, :date_shift

  def initialize(date, date_shift)
    @date = date
    @date_shift = date_shift
  end

  def self.return(date)
    (date.to_i * date.to_i).to_s[-4..-1]
  end

  def self.create
    date = Time.now.to_s[0..9].delete('-')
    date = date[-2..-1] + date[4..5] + date[2..3]
    date_shift = (date.to_i * date.to_i).to_s[-4..-1]
    Offset.new(date, date_shift)
  end
end
