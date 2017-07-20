require 'tempfile'

module VagrantPlugins
  module GuestVyOS
    module Cap
      class ChangeHostName
        def self.change_host_name(machine, name)
          machine.communicate.tap do |comm|
            if !comm.test("sudo hostname | grep '^#{name}$'")

              commands = <<-EOS
if [ "$(id -g -n)" != 'vyattacfg' ] ; then
  exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi
source /opt/vyatta/etc/functions/script-template
set system host-name #{name}
commit
save
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
