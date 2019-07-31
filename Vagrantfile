#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure('2') do |config|
    config.vm.box = 'ubuntu/bionic64'

    config.ssh.insert_key = false

    config.vm.provider 'virtualbox' do |vb|
        vb.memory = '1024'
        vb.cpus = '1'
    end

    config.vm.synced_folder "./", "/tmp/swarm"
    config.vm.box_check_update = false

    config.vm.define 'node1' do |node1|
        node1.vm.hostname = 'nw1'
        node1.vm.network 'private_network', ip: '11.12.13.14'
        node1.vm.network 'forwarded_port', guest: 80, host: 80

        node1.vm.provision :chef_zero do |chef|
            chef.cookbooks_path = 'cookbooks'
            chef.provisioning_path = '/tmp/vagrant-chef-1'
            chef.roles_path = 'roles'
            chef.nodes_path = 'nodes'
            chef.add_role('master')

            chef.custom_config_path = 'custom.chef'
        end
    end

    config.vm.define 'node2' do |node2|
        node2.vm.hostname = 'nw2'
        node2.vm.network 'private_network', ip: '11.12.13.15'

        node2.vm.provision :chef_zero do |chef|
            chef.cookbooks_path = 'cookbooks'
            chef.provisioning_path = '/tmp/vagrant-chef-2'
            chef.roles_path = 'roles'
            chef.nodes_path = 'nodes'
            chef.add_role('node')

            chef.custom_config_path = 'custom.chef'
        end
    end
end
