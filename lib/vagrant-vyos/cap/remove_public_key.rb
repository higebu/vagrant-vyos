module VagrantPlugins
  module GuestVyOS
    module Cap
      class RemovePublicKey
        def self.remove_public_key(machine, contents)
          contents = contents.chomp

          key_type, key_value, key_name = contents.split()

          commands = <<-EOS
source /opt/vyatta/etc/functions/script-template
show system login user vagrant authentication public-keys #{key_name} key | grep #{key_value} || exit 0
delete system login user vagrant authentication public-keys #{key_name}
commit
save
          EOS

          temp = Tempfile.new("vagrant")
          temp.binmode
          temp.write(commands)
          temp.close

          machine.communicate.tap do |comm|
            comm.upload(temp.path, "/tmp/vagrant-remove-public-key")
            comm.execute("bash /tmp/vagrant-remove-public-key")
            comm.execute("rm -f /tmp/vagrant-remove-public-key")
          end

          temp.unlink

        end
      end
    end
  end
end
