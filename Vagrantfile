# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "web101" do |web|
    web.vm.box = "ubuntu/precise64"
    web.vm.hostname = 'web101'
    web.vm.box_url = "ubuntu/precise64"

    web.vm.network :private_network, ip: "192.168.56.101"
    web.vm.network :forwarded_port, guest: 22, host: 10122, id: "ssh"
    web.vm.network :forwarded_port, guest:4848, host: 4848
    web.vm.network :forwarded_port, guest:8080, host: 8080

    web.vm.synced_folder "~/.m2", "/home/vagrant/.m2"

    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "web"]
    end
  end

  # Enable provisioning with a shell script. 
  config.vm.provision :"shell", privileged: false, :path => "bootstrap.sh", run: "always"
  config.vm.provision "shell", privileged: false, inline: "echo Hello, Motivians", run: "always"
end
