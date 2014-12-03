# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'the_alive_locales/version'

Gem::Specification.new do |spec|
  spec.name          = "the_alive_locales"
  spec.version       = TheAliveLocales::VERSION
  spec.authors       = ["Ilya N. Zykin"]
  spec.email         = ["zykin-ilya@ya.ru"]
  spec.summary       = %q{Alive locales logger}
  spec.description   = %q{Find required locales keys}
  spec.homepage      = "https://github.com/the-teacher/the_alive_locales"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake",  "~> 10.0"
  spec.add_development_dependency "rails", "~> 3.0.0"
end
