# vagrant-vyos
[![Build Status](https://travis-ci.org/higebu/vagrant-vyos.png)](https://travis-ci.org/higebu/vagrant-vyos)
[![Code Climate](https://codeclimate.com/repos/5302538e69568020f60027b2/badges/c5b01915845941764536/gpa.png)](https://codeclimate.com/repos/5302538e69568020f60027b2/feed)
[![Gem Version](https://badge.fury.io/rb/vagrant-vyos.png)](http://badge.fury.io/rb/vagrant-vyos)
[![Dependency Status](https://gemnasium.com/higebu/vagrant-vyos.png)](https://gemnasium.com/higebu/vagrant-vyos)

Vagrant-vyos is a [Vagrant](http://www.vagrantup.com) plugin that adds [VyOS](http://vyos.net/wiki/Main_Page) support to Vagrant.

This plugin fixes following features.

* `vagrant halt`.
* `config.vm.hostname`.
* `config.vm.network`.

## Installation

```
$ vagrant plugin install vagrant-vyos
```

## Usage

```
$ vagrant init higebu/vyos-1.1.4
$ vagrant up
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
