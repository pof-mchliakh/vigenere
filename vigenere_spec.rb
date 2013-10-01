require 'minitest/autorun'
require "#{File.dirname(__FILE__)}/vigenere"

describe Vigenere do
  it 'encrypts correctly' do
    x = Vigenere.encrypt('ATTACKATDAWN', 'LEMON').must_equal 'LXFOPVEFRNHR' 
  end

  it 'decrypts correctly' do
    Vigenere.decrypt('LXFOPVEFRNHR', 'LEMON').must_equal 'ATTACKATDAWN' 
  end
end