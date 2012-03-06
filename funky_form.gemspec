# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "funky_form/version"

Gem::Specification.new do |s|
  s.name        = "funky_form"
  s.version     = FunkyForm::VERSION
  s.authors     = ["Indrek Juhkam"]
  s.email       = ["indrek@urgas.eu"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "funky_form"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rails", "~> 3.2.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"

  s.add_runtime_dependency "active_attr", "~> 0.5.0.alpha2"
end
