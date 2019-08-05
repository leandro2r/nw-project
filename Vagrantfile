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
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  config.vm.synced_folder "./", "/tmp/swarm"
  config.vm.box_check_update = false

  (1..2).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "nw#{i}"
      node.vm.network 'private_network', ip: "192.168.56.1#{i}"
      node.vm.network 'forwarded_port', guest: 80, host: "808#{i}"

      node.vm.provision :chef_zero do |chef|
        chef.cookbooks_path = 'cookbooks'
        chef.provisioning_path = "/tmp/vagrant-chef-#{i}"
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
