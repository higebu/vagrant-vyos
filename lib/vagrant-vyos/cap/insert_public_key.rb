module VagrantPlugins
  module GuestVyOS
    module Cap
      class InsertPublicKey
        def self.insert_public_key(machine, contents)
          contents = contents.chomp

          key_type, key_value, key_name = contents.split()

          commands = <<-EOS
source /opt/vyatta/etc/functions/script-template
set system login user vagrant authentication public-keys #{key_name} type #{key_type}
set system login user vagrant authentication public-keys #{key_name} key #{key_value}
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
