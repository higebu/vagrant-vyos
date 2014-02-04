# vagrant-vyatta
[![Build Status](https://travis-ci.org/higebu/vagrant-vyatta.png)](https://travis-ci.org/higebu/vagrant-vyatta)

Vagrant-vyatta is a [Vagrant](http://www.vagrantup.com) plugin that adds a [Vyatta](http://www.vyatta.org/) support to Vagrant.

This plugin fixes following features.

* `vagrant halt`.
* `config.vm.hostname`.
* `config.vm.network`.

## Installation

```
$ vagrant plugin install vagrant-vyatta
```

## Usage

```
$ vagrant box add vyatta http://higebu.com/box/vyatta-livecd_VC6.5R1_amd64_virtualbox.box
$ vagrant init vyatta
$ vagrant up
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
