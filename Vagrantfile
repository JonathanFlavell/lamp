#!/usr/bin/ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "sql01" do |sql01|
    sql01.vm.box = "lamp/database"
    sql01.vm.network :private_network, ip: "192.168.33.113"
    sql01.ssh.forward_agent = true
  end

  config.vm.define "load-balancer" do |load_balancer|
    load_balancer.vm.box = "lamp/load-balancer"
    load_balancer.vm.network :private_network, ip: "192.168.33.110"
    load_balancer.ssh.forward_agent = true
  end

  config.vm.define "web01" do |web01|
    web01.vm.box = "lamp/web"
    web01.vm.network :private_network, ip: "192.168.33.111"
    web01.ssh.forward_agent = true
  end

  config.vm.define "web02" do |web02|
    web02.vm.box = "lamp/web"
    web02.vm.network :private_network, ip: "192.168.33.112"
    web02.ssh.forward_agent = true
  end
end
