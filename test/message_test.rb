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

  def test_leaves_punctuation_as_is
    assert_equal '!', encryption.shift_letter('!', 73)
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", encryption.encrypt_with_keys
  end

  def test_it_can_decrypt
    decryption = Message.new("keder ohulw", "02715", "1025")

    assert_equal "hello world", decryption.decrypt_with_keys
  end

  def test_it_can_crack
    encryption_to_crack = Message.new("vjqtbeaweqihssi", '00000', "6324")
    encryption_to_crack.crack

    assert_equal "hello world end", encryption_to_crack.decrypt_with_keys
    assert_equal "08304", encryption_to_crack.key_shift
  end
end
