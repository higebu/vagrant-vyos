module VagrantPlugins
  module GuestVyOS
    module Cap
      class InsertPublicKey
        def self.insert_public_key(machine, contents)
          contents = contents.chomp

          ssh_username = machine.config.ssh.username
          key_type, key_value, key_name = contents.split()

          commands = <<-EOS
if [ "$(id -g -n)" != 'vyattacfg' ] ; then
  exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi
source /opt/vyatta/etc/functions/script-template
set system login user #{ssh_username} authentication public-keys #{key_name} type #{key_type}
set system login user #{ssh_username} authentication public-keys #{key_name} key #{key_value}
commit
save
          EOS

          temp = Tempfile.new("vagrant")
          temp.binmode
          temp.write(commands)
          temp.close

          machine.communicate.tap do |comm|
            comm.upload(temp.path, "/tmp/vagrant-insert-public-key")
            comm.execute("bash /tmp/vagrant-insert-public-key")
            comm.execute("rm -f /tmp/vagrant-insert-public-key")
          end

          temp.unlink

        end
      end
    end
  end
end
