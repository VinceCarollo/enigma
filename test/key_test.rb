require './test/test_helper'
require 'minitest/autorun'
require 'pry'
require './lib/key'

class KeyTest < Minitest::Test
  attr_reader :key

  def test_it_can_create_keys_5_digits_long
    assert Key.create_shift.match(/^[0-9]*$/)
    assert_equal 5, Key.create_shift.length
  end
end
