class Key
  def self.create_shift
    num = []
    5.times do
      num << rand(10)
    end
    num.join
  end
end
