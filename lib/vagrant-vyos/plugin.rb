require "vagrant"

module VagrantPlugins
  module GuestVyOS
    class Plugin < Vagrant.plugin("2")
      name "VyOS guest"
      description "VyOS guest support."

      guest("vyos", "debian") do
        require File.expand_path("../guest", __FILE__)
        Guest
      end

      guest_capability("vyos", "halt") do
        require_relative "cap/halt"
        Cap::Halt
      end

      guest_capability("vyos", "configure_networks") do
        require_relative "cap/configure_networks"
        Cap::ConfigureNetworks
      end

      guest_capability("vyos", "change_host_name") do
        require_relative "cap/change_host_name"
        Cap::ChangeHostName
      end

      guest_capability("vyos", "insert_public_key") do
        require_relative "cap/insert_public_key"
        Cap::InsertPublicKey
      end

      guest_capability("vyos", "remove_public_key") do
        require_relative "cap/remove_public_key"
        Cap::RemovePublicKey
      end
    end
  end
end
