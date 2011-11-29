# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cnab240santander/version"

Gem::Specification.new do |s|
  s.name        = "cnab240santander"
  s.version     = Cnab240santander::Version::STRING
  s.authors     = ["Lairton"]
  s.email       = ["lairton@zertico.com.br"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "cnab240santander"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activesupport", "~> 3.1.0"
  s.add_dependency "mocha", "~> 0.9.10"
  s.add_development_dependency "rspec", "~> 2.6.0"
end
