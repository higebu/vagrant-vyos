require "vagrant"

module VagrantPlugins
  module GuestVyatta
    class Plugin < Vagrant.plugin("2")
      name "Vyatta guest"
      description "Vyatta guest support."

      guest("vyatta", "debian") do
        require File.expand_path("../guest", __FILE__)
        Guest
      end

      guest_capability("vyatta", "halt") do
        require_relative "cap/halt"
        Cap::Halt
      end

      guest_capability("vyatta", "configure_networks") do
        require_relative "cap/configure_networks"
        Cap::ConfigureNetworks
      end

      guest_capability("vyatta", "change_host_name") do
        require_relative "cap/change_host_name"
        Cap::ChangeHostName
      end
    end
  end
end
