# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "scrabble"
  s.version     = File.read('VERSION').strip
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Brandon Tilley"]
  s.email       = ["brandon@brandontilley.com"]
  s.homepage    = "https://github.com/BinaryMuse/scrabble"
  s.summary     = %q{A Scrabble library written in Ruby.}
  s.description = %q{A Scrabble library written in Ruby.}

  runtime_dependencies = [
    # none at this time
  ]

  development_dependencies = [
    "rspec"
  ]

  if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    runtime_dependencies.each do |dep|
      s.add_runtime_dependency dep
    end
    development_dependencies.each do |dep|
      s.add_development_dependency dep
    end
  else
    runtime_dependencies.concat.uniq.each do |dep|
      s.add_dependency dep
    end
  end

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
