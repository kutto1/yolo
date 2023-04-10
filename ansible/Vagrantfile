#Loads vagrant API version 2 and assigns to a variable named config
Vagrant.configure("2") do |config|
    #Provider for the provision defined here - virtualbox
    config.vm.provider "virtualbox" do |vb|
  end

  #Define new VM named webserver and assigned to a variable named web
  config.vm.define "webserver" do |web|

    #Hostname set to VM
    web.vm.hostname = "vagrant1"

    #Image for the VM
    web.vm.box = "geerlingguy/ubuntu2004"

    #Define the network for the VM -private_network
    web.vm.network :private_network, ip: "192.168.56.101"

    #Provision the webserver with Ansible and execute the playbook
    web.vm.provision "ansible" do |ansible|

    #Path mentioned
    ansible.playbook="main-playbook.yaml"

    end
end
end