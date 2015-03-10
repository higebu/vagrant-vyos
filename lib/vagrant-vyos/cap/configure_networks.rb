require 'ipaddr'
require 'tempfile'

module VagrantPlugins
  module GuestVyOS
    module Cap
      class ConfigureNetworks

        def self.configure_networks(machine, networks)
          machine.communicate.tap do |comm|

            commands = <<-EOS
source /opt/vyatta/etc/functions/script-template
            EOS

            networks.each do |network|
              commands << "delete interfaces ethernet eth#{network[:interface]}\n"
              if network[:type].to_sym == :static
                subnet = IPAddr.new(network[:netmask]).to_i.to_s(2).count("1")
                commands << "set interfaces ethernet eth#{network[:interface]} address #{network[:ip]}/#{subnet}\n"
              elsif network[:type].to_sym == :dhcp
                commands << "set interfaces ethernet eth#{network[:interface]} address dhcp\n"
              end
            end

            commands << <<-EOS
 commit
 save
            EOS

            temp = Tempfile.new("vagrant")
            temp.binmode
            temp.write(commands)
            temp.close

            comm.upload(temp.path, "/tmp/vagrant-configure-network")
            comm.execute("bash /tmp/vagrant-configure-network")
            comm.execute("rm -f /tmp/vagrant-configure-network")
          end
        end
      end
    end
  end
end
