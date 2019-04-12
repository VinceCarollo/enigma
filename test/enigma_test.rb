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
end
