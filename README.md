# vagrant-vyatta
[![Build Status](https://travis-ci.org/higebu/vagrant-vyatta.png)](https://travis-ci.org/higebu/vagrant-vyatta)

Vagrant-vyatta is a [Vagrant](http://www.vagrantup.com) plugin that adds [Vyatta](http://www.vyatta.org/) and [VyOS](http://vyos.net/wiki/Main_Page) support to Vagrant.

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
$ vagrant init higebu/vyos-1.0.2
$ vagrant up
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
