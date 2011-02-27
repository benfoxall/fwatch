# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "filewatcher/version"

Gem::Specification.new do |s|
  s.name        = "filewatcher"
  s.version     = Filewatcher::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Foxall"]
  s.email       = ["benfoxall@gmail.com"]
  s.homepage    = "http://github.com/benfoxall/onchange"
  s.summary     = 'run commands when a file changes'
  s.description = 'This is a development tool for restarting processes when you update a file'

  s.rubyforge_project = "filewatcher"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
