require "vagrant"

require Vagrant.source_root.join("plugins/guests/debian/guest")

module VagrantPlugins
  module GuestVyatta
    class Guest < VagrantPlugins::GuestDebian::Guest
      def detect?(machine)
        machine.communicate.test("cat /etc/issue | grep 'Vyatta'")
      end
    end
  end
end
