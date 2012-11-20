# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'AsciiTitle/version'

Gem::Specification.new do |gem|
  gem.name          = "AsciiTitle"
  gem.version       = AsciiTitle::VERSION
  gem.authors       = ["Huba Nagy"]
  gem.email         = ["12huba@gmail.com"]
  gem.description   = %q{A library for displaying strings with Ascii Art font styles. Font styles can be loaded from xml.}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
