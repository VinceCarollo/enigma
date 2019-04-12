require './test/test_helper'
require 'minitest/autorun'
require 'pry'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_can_take_date_and_give_shift
    assert_equal "1025", Offset.return("040895")
  end

  def test_it_can_create_shift_based_on_current_date
    date = Time.now.to_s[0..9].delete('-')
    day = date[-2..-1]
    month = date[4..5]
    year = date[2..3]
    date = day + month + year
    current_date_shift = (date.to_i * date.to_i).to_s[-4..-1]

    assert_equal current_date_shift, Offset.create.date_shift
  end
end
