# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'indexable_attribute/version'

Gem::Specification.new do |spec|
  spec.name          = "indexable_attribute"
  spec.version       = IndexableAttribute::VERSION
  spec.authors       = ["Yehia Abo El-Nga"]
  spec.email         = ["yhia.yasser@gmail.com.com"]
  spec.description   = %q{This adds an indexable attribute to ActiveRecord Models}
  spec.summary       = %q{This adds an indexable attribute to ActiveRecord Models}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
