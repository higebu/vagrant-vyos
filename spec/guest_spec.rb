require 'vagrant-vyos/guest'
require 'vagrant-vyos/plugin'
require 'vagrant-vyos/cap/change_host_name'
require 'vagrant-vyos/cap/configure_networks'
require 'vagrant-vyos/cap/halt'
require 'vagrant-vyos/cap/insert_public_key'
require 'vagrant-vyos/cap/remove_public_key'

describe VagrantPlugins::GuestVyOS::Plugin do
  it 'should be loaded with vyos' do
    p described_class.components.guests[:vyos].first
    expect(described_class.components.guests[:vyos].first).to eq(VagrantPlugins::GuestVyOS::Guest)
  end

  {
    change_host_name: VagrantPlugins::GuestVyOS::Cap::ChangeHostName,
    configure_networks: VagrantPlugins::GuestVyOS::Cap::ConfigureNetworks,
    halt: VagrantPlugins::GuestVyOS::Cap::Halt,
    insert_public_key: VagrantPlugins::GuestVyOS::Cap::InsertPublicKey,
    remove_public_key: VagrantPlugins::GuestVyOS::Cap::RemovePublicKey,
  }.each do |cap, cls|
    it "should be capable of #{cap} with vyos" do
      expect(described_class.components.guest_capabilities[:vyos][cap])
        .to eq(cls)
    end
  end
end
