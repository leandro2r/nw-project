Vagrant.configure('2') do |config|
    config.vm.box = 'ubuntu-18'
    config.vm.box_url = 'https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64-vagrant.box'

    config.vm.define 'node1' do |node1|
        node1.vm.hostname = 'nw1'    
        node1.vm.network 'private_network', ip: '11.12.13.14'
        node1.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = 'cookbooks'
            chef.add_recipe 'main'
        end
        node1.vm.provider 'virtualbox' do |vb|
            vb.memory = '1072'
            vb.cpus = '1'
        end
    end

    config.vm.define 'node2' do |node2|
        node2.vm.hostname = 'nw1'    
        node2.vm.network 'private_network', ip: '11.12.13.14'
        node2.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = 'cookbooks'
            chef.add_recipe 'main'
        end
        node2.vm.provider 'virtualbox' do |vb|
            vb.memory = '1072'
            vb.cpus = '1'
        end
    end
end
