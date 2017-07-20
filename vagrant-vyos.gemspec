# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vagrant-vyos/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "vagrant-vyos"
  spec.version       = VagrantPlugins::GuestVyOS::VERSION
  spec.authors       = ["KUSAKABE Yuya"]
  spec.email         = ["yuya.kusakabe@gmail.com"]
  spec.description   = "VyOS Guest Support for Vagrant"
  spec.summary       = "A small gem that adds vyos guest support to vagrant."
  spec.homepage      = "https://github.com/higebu/vagrant-vyos"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths  = ["lib"]

  spec.required_ruby_version     = "~> 2.2"
  spec.required_rubygems_version = ">= 1.3.6"
  spec.rubyforge_project = "vagrant-vyos"

  spec.add_development_dependency "bundler", ">= 1.12.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-core", "~> 3.4.3"
  spec.add_development_dependency "rspec-expectations", "~> 3.4.0"
end
