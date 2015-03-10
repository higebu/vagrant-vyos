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

  spec.required_rubygems_version = ">= 2.4.6"
  spec.rubyforge_project = "vagrant-vyos"

  spec.add_development_dependency "bundler", ">= 1.5.2", "< 1.8.0"
  spec.add_development_dependency "rake"
end
