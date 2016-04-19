VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "opscode_centos-7.0_chef-provisionerless"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.0_chef-provisionerless.box"

  # Set the IP address of unused if it would conflict with the IP you are using already
  config.vm.network :private_network, ip: "192.168.33.70"

  # Set the VirtualBox Configration
  config.vm.provider "virtualbox" do |vb|
    # Change memory size
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  # Install chef
  config.vm.provision :shell, :inline => "curl -L 'https://omnitruck.chef.io/install.sh' | sudo bash"

  # provisioning with chef solo.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./provision/chef/cookbooks","./provision/chef/site-cookbooks"]
    chef.data_bags_path = ["./provision/chef/data_bags"]
    chef.add_recipe "chkconfig"
    chef.add_recipe "selinux"
    chef.add_recipe "yum"
    chef.add_recipe "ntp"
    chef.add_recipe "nkf"
    chef.add_recipe "epel"
    chef.add_recipe "remi"
    chef.add_recipe "rpmforge"
    chef.add_recipe "php"
    chef.add_recipe "docker"
    chef.add_recipe "jenkins"
  end

  # Start Docker containers
  config.vm.provision :shell, inline: <<-EOS
    cd /vagrant
    sudo docker-compose up -d
  EOS

end
