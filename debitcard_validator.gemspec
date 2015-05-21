# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'debitcard_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "debitcard_validator"
  spec.version       = DebitcardValidator::VERSION
  spec.authors       = ["Yuta Kurotaki"]
  spec.email         = ["yuta.kurotaki@gmail.com"]

  spec.summary       = %q{a debitcard validator for Rails Apprication.}
  spec.description   = %q{debitcard_validator validates Debitcard/Prepaidcard based on Issuer Identifier Number(follows ISO/IEC 7812).}
  spec.homepage      = "https://github.com/kurotaky/debitcard_validator"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activemodel"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
