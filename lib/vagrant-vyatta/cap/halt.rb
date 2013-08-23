module VagrantPlugins
  module GuestVyatta
    module Cap
      class Halt
        def self.halt(machine)
          begin
            machine.communicate.sudo("sudo shutdown -h now")
          rescue IOError
            # Do nothing, because it probably means the machine shut down
            # and SSH connection was lost.
          end
        end
      end
    end
  end
end
