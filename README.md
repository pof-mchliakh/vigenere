## Vigenere

Implementation of the [Vigenere][0] cipher in Ruby.

### Usage

```ruby
ciphertext = Vigenere.encrypt('PLAINTEXT', 'KEY')
Vigenere.decrypt(ciphertext, 'KEY') == 'PLAINTEXT' #=> true
```

[0]: http://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher