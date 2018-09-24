#!/usr/bin/ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "web01" do |web01|
    web01.vm.box = "centos-7"
    web01.vm.network :private_network, ip: "192.168.33.111"
    web01.ssh.forward_agent = true
  end

  config.vm.define "web02" do |web02|
    web02.vm.box = "centos-7"
    web02.vm.network :private_network, ip: "192.168.33.112"
    web02.ssh.forward_agent = true
  end
end
