# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cells/capture/version"

Gem::Specification.new do |s|
  s.name        = "cells-capture"
  s.version     = Cells::Capture::Version
  s.platform    = Gem::Platform::RUBY
  s.authors     = `git shortlog --summary --numbered         | awk '{print $2, $3    }'`.split("\n")
  s.email       = `git shortlog --summary --numbered --email | awk '{print $2, $3, $4}'`.split("\n")
  s.homepage    = ""
  s.summary     = %q{Capture helper for Cells}
  s.description = %q{Provides helpers that allow your cell views to communicate with the view that rendered the cell}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
