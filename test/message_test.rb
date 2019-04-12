require './test/test_helper'
require 'minitest/autorun'
require './lib/message'

class MessageTest < Minitest::Test
  attr_reader :encryption

  def setup
    @encryption = Message.new("hello world", "02715", "1025")
  end

  def test_it_exists
    assert_instance_of Message, encryption
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", encryption.encrypt_with_keys
  end
end
