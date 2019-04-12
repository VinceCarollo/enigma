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

  def test_it_can_create_A_shift
    assert_equal 3, encryption.a_shift
  end

  def test_it_can_create_B_shift
    assert_equal 27, encryption.b_shift
  end

  def test_it_can_create_C_shift
    assert_equal 73, encryption.c_shift
  end

  def test_it_can_create_D_shift
    assert_equal 20, encryption.d_shift
  end

  def test_shift_letter
    assert_equal 'd', encryption.shift_letter('l', 73)
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", encryption.encrypt_with_keys
  end

  def test_it_can_decrypt
    decryption = Message.new("keder ohulw", "02715", "1025")

    assert_equal "Hellow World", decryption.decrypt_with_keys
  end
end
