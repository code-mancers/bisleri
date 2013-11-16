# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bisleri/version'

Gem::Specification.new do |spec|
  spec.name          = "bisleri"
  spec.version       = Bisleri::VERSION
  spec.authors       = ["Emil Soman", "Kashyap Kondamudi"]
  spec.email         = ["emil.soman@gmail.com"]
  spec.description   = %q{Bisleri is a simple HTTP 1.1 server which uses EventMachine}
  spec.summary       = %q{A simple HTTP 1.1 server using EventMachine}
  spec.homepage      = "https://github.com/code-mancers/bisleri"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "eventmachine", "~> 1.0.3"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
