# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
  #config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.name = "anvm"
    v.memory = 6144
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.hostname = "anvm"
  config.vm.network :private_network, ip: "192.168.33.34"

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :anvm do |anvm|
  end
 
  config.vm.provision :shell, path: "scripts/ConfigureRemotingForAnsible.ps1"
  config.vm.provision :shell, path: "scripts/IncreasePsMaxMemory.ps1"
  config.vm.provision :shell, path: "scripts/EnableCredSSP.ps1"

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.inventory_path = "ansible/inventory/local"
    ansible.compatibility_mode = "2.0"
  end

end