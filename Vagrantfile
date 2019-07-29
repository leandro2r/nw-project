Vagrant.configure('2') do |config|
    config.vm.box = 'ubuntu/bionic64'

    config.vm.define 'node1' do |node1|
        node1.vm.hostname = 'nw1'
        node1.vm.network 'private_network', ip: '11.12.13.14'

        node1.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.provisioning_path = "/tmp/vagrant-chef-1"
            chef.roles_path = "roles"
            chef.add_role("master")
        end
    end

    config.vm.define 'node2' do |node2|
        node2.vm.hostname = 'nw2'
        node2.vm.network 'private_network', ip: '11.12.13.15'

        node2.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.provisioning_path = "/tmp/vagrant-chef-2"
            chef.roles_path = "roles"
            chef.add_role("node")
        end
    end
end
