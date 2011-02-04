# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "right_thing/version"

Gem::Specification.new do |s|
  s.name        = "right_thing"
  s.version     = RightThing::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael Guterl"]
  s.email       = ["mguterl@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Parses job XML from RightThing Inc.}
  s.description = %q{Parses job XML from RightThing Inc.}

  s.rubyforge_project = "right_thing"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'nokogiri', '~> 1.4'
  s.add_development_dependency 'rspec', '~> 2.4'
end
