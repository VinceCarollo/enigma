require './test/test_helper'
require 'minitest/autorun'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  attr_reader :enigma

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, enigma
  end

  def test_it_can_return_correct_hash_when_encrypting
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_return_correct_hash_when_encrypting_something_with_capital_letters
    expected = {
      :encryption=>"l ay cgxiogelj",
      :key=>"23819",
      :date=>"040119"
    }

    assert_equal expected, enigma.encrypt("Love Radically", "23819", "040119")
  end

  def test_it_can_encrypt_without_date_and_use_current_date
    expected = {
      :encryption=>"mdayaggxjsgemn",
      :key=>"23819",
      :date=>"110419"
    }

    assert_equal 14, expected[:encryption].length
    assert_equal 5, expected[:key].length
    assert_equal 6, expected[:date].length
  end

  def test_it_can_encrypt_without_date_and_key_and_creates_both
    expected = {
      :encryption=>"mdayaggxjsgemn",
      :key=>"23819",
      :date=>"110419"
    }

    assert_equal 14, expected[:encryption].length
    assert_equal 5, expected[:key].length
    assert_equal 6, expected[:date].length
  end
end
