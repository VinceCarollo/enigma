# Enigma

A Ruby program that encrypts, decrypts, and cracks text files based on a Caesar Cipher key. Cracking allows for optional date inputs that defaults to todays date and returns the key used to decrypt the message. Decrypting  requires a key and Encrypting creates one.

### Prerequisites

- Ruby

### Installing

- Clone Repo

## Running the tests

- Minitest

```
rake
```
## Deployment

- add txt file to be encrypted

```
ruby lib/encrypt.rb your_message_file.txt your_encryption_file.txt
```

- to decrypt or crack

```
ruby lib/decrypt.rb

ruby lib/crack.rb
```
## Built With

* [Ruby](https://www.ruby-lang.org/en/) - 2.4.1
* [Minitest](https://github.com/seattlerb/minitest)
