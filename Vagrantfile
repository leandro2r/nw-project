#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.ssh.insert_key = false

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '512'
    vb.cpus = '1'
  end

  config.vm.synced_folder "./", "/tmp/swarm"
  config.vm.box_check_update = false

  (1..2).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "nw#{i}"
      node.vm.network 'private_network', ip: "10.11.12.5#{i}"
      if i == 1
        node.vm.network 'forwarded_port', guest: 8080, host: 80
      end

      node.vm.provision :chef_zero do |chef|
        chef.cookbooks_path = 'cookbooks'
        chef.provisioning_path = "/tmp/vagrant-chef-#{1}"
        chef.roles_path = 'roles'
        chef.nodes_path = 'nodes'

        if i == 1
          chef.add_role('master')
        else
          chef.add_role('node')
        end

        chef.custom_config_path = 'custom.chef'
      end
    end
  end
end
