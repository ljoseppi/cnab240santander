# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cnab240santander/version"

Gem::Specification.new do |s|
  s.name        = "cnab240santander"
  s.version     = Cnab240santander::Version::STRING
  s.authors     = ["Lairton Borges"]
  s.email       = ["lairton@gmail.com"]
  s.homepage    = "https://github.com/ljoseppi/"
  s.summary     = "Gem to read the cnab240 return file of Santander Bank (Brazil)"
  s.description = s.summary

  s.rubyforge_project = "cnab240santander"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", "~> 3.2"
  s.add_development_dependency "mocha", "~> 0.9.10"
  s.add_development_dependency "rspec", "~> 2.11"
end
