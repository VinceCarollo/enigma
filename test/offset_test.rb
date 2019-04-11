require 'minitest/autorun'
require 'pry'
require './lib/offset'

class OffsetTest < Minitest::Test
  attr_reader :current_date_shift

  def setup
    date = Time.now.to_s[0..9].delete('-')
    day = date[-2..-1]
    month = date[4..5]
    year = date[2..3]
    @current_date_shift = day + month + year
  end

  def test_it_can_take_date_and_give_shift
    assert_equal "1025", Offset.make_shift("040895")
  end

  def test_it_can_create_shift_based_on_current_date
    assert_equal current_date_shift, Offset.create_shift
  end
end
