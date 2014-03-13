# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vagrant-vyatta/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "vagrant-vyatta"
  spec.version       = VagrantPlugins::GuestVyatta::VERSION
  spec.authors       = ["KUSAKABE Yuya"]
  spec.email         = ["yuya.kusakabe@gmail.com"]
  spec.description   = "Vyatta Guest Support for Vagrant"
  spec.summary       = "A small gem that adds Vyatta guest support to vagrant."
  spec.homepage      = "https://github.com/higebu/vagrant-vyatta"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths  = ["lib"]

  spec.required_rubygems_version = ">= 1.8.23"
  spec.rubyforge_project = "vagrant-vyatta"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
