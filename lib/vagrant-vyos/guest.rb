require "vagrant"

require Vagrant.source_root.join("plugins/guests/debian/guest")

module VagrantPlugins
  module GuestVyOS
    class Guest < VagrantPlugins::GuestDebian::Guest
      def detect?(machine)
        machine.communicate.test("cat /etc/issue | grep -e 'VyOS'")
      end
    end
  end
end
