# vagrant-vyos
[![Build Status](https://travis-ci.org/higebu/vagrant-vyos.png)](https://travis-ci.org/higebu/vagrant-vyos)
[![Code Climate](https://codeclimate.com/github/higebu/vagrant-vyos/badges/gpa.svg)](https://codeclimate.com/github/higebu/vagrant-vyos)
[![Gem Version](https://badge.fury.io/rb/vagrant-vyos.svg)](https://badge.fury.io/rb/vagrant-vyos)
[![Dependency Status](https://gemnasium.com/badges/github.com/higebu/vagrant-vyos.svg)](https://gemnasium.com/github.com/higebu/vagrant-vyos)
[![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/vagrant-vyos?type=total&style=flat)](https://rubygems.org/gems/vagrant-vyos)

Vagrant-vyos is a [Vagrant](http://www.vagrantup.com) plugin that adds [VyOS](http://vyos.net/wiki/Main_Page) support to Vagrant.

This plugin fixes following features.

* `vagrant halt`.
* `config.vm.hostname`.
* `config.vm.network`.
* `config.ssh.insert_key`.

## Installation

```
$ vagrant plugin install vagrant-vyos
```

## Usage

```
$ vagrant init higebu/vyos
$ vagrant up
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
