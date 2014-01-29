require 'tempfile'

module VagrantPlugins
  module GuestVyatta
    module Cap
      class ChangeHostName
        def self.change_host_name(machine, name)
          machine.communicate.tap do |comm|
            if !comm.test("sudo hostname | grep '^#{name}$'")

              commands = <<-EOS
WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper
. /etc/bash_completion
$WRAPPER begin
$WRAPPER set system host-name #{name}
$WRAPPER commit
$WRAPPER save
$WRAPPER end
              EOS

              temp = Tempfile.new("vagrant")
              temp.binmode
              temp.write(commands)
              temp.close

              comm.upload(temp.path, "/tmp/vagrant-change-hostname")
              comm.execute("bash /tmp/vagrant-change-hostname")
              comm.execute("rm -f /tmp/vagrant-change-hostname")
            end
          end
        end
      end
    end
  end
end
