# DebitcardValidator
[![Build Status](https://travis-ci.org/kurotaky/debitcard_validator.svg)](https://travis-ci.org/kurotaky/debitcard_validator)
[![Code Climate](https://codeclimate.com/github/kurotaky/debitcard_validator/badges/gpa.svg)](https://codeclimate.com/github/kurotaky/debitcard_validator)

debitcard_validator validates Debitcard/Prepaidcard based on Issuer Identifier Number(follows ISO/IEC 7812).

## Usage
Add this line to your application's Gemfile:

```ruby
gem 'debitcard_validator'
```

And then execute:

```
bundle install
```

Then add the following to your model:

```ruby
validates :number, debitcard: true
```

## Contributing

1. Fork it ( https://github.com/kurotaky/debitcard_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
