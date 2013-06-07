# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "funky_form/version"

Gem::Specification.new do |s|
  s.name        = "funky_form"
  s.version     = FunkyForm::VERSION
  s.authors     = ["Indrek Juhkam"]
  s.email       = ["indrek@urgas.eu"]
  s.homepage    = ""
  s.summary     = %q{Simple form objects in ruby}
  s.description = %q{}

  s.rubyforge_project = "funky_form"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "virtus", "~> 1.0.0.beta0"
  s.add_dependency "activemodel", "~> 3.2.0"
end
