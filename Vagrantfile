# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "mom" do |mom|
	mom.vm.box = "generic/centos7"
	mom.vm.network "private_network", ip: "192.168.56.140"
	mom.vm.box_check_update = false
	mom.vm.hostname = "mom"
	mom.vm.provider "virtualbox" do |vb|
      vb.name = "mom"
      vb.gui = false
      vb.memory = "6144"
      vb.cpus = 2
    end
    mom.vm.provision "shell", inline: <<-SHELL
      /usr/bin/perl -pi -e \"s/PermitRootLogin no/PermitRootLogin yes/\" /etc/ssh/sshd_config
      /usr/bin/perl -pi -e \"s/PasswordAuthentication no/PasswordAuthentication yes/\" /etc/ssh/sshd_config
      systemctl restart sshd
      systemctl disable firewalld
      systemctl stop firewalld
	  wget --content-disposition --no-check-certificate 'https://pm.puppet.com/cgi-bin/download.cgi?dist=el&rel=7&arch=x86_64&ver=latest'
	  mv /home/vagrant/* /root/puppet-enterprise.tar.gz
	  tar -xaf /root/puppet-enterprise.tar.gz
    SHELL
  end
  
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "generic/ubuntu2004"
	ubuntu.vm.network "private_network", ip: "192.168.56.141"
    ubuntu.vm.box_check_update = false
    ubuntu.vm.hostname = "pe-ubuntu"
    ubuntu.vm.provider "virtualbox" do |vb|
	  vb.name = "pe-ubuntu"
	  vb.gui = false
	  vb.memory = "1024"
	  vb.cpus = 1
    end
	ubuntu.vm.provision "shell", inline: "/usr/bin/perl -pi -e \"s/PermitRootLogin prohibit-password/PermitRootLogin yes/\" /etc/ssh/sshd_config"
	ubuntu.vm.provision "shell", inline: "/usr/bin/perl -pi -e \"s/PasswordAuthentication no/PasswordAuthentication yes/\" /etc/ssh/sshd_config"
	ubuntu.vm.provision "shell", inline: "systemctl restart sshd"
	ubuntu.vm.provision "shell", inline: "echo 192.168.56.140 mom >> /etc/hosts"	
  end

  config.vm.define "pe-centos7" do |centos7|
    centos7.vm.box = "generic/centos7"
	centos7.vm.network "private_network", ip: "192.168.56.142"
    centos7.vm.box_check_update = false
    centos7.vm.hostname = "pe-centos7"
    centos7.vm.provider "virtualbox" do |vb|
	  vb.name = "pe-centos7"
	  vb.gui = false
	  vb.memory = "1024"
	  vb.cpus = 1
    end
	centos7.vm.provision "shell", inline: "/usr/bin/perl -pi -e \"s/PermitRootLogin no/PermitRootLogin yes/\" /etc/ssh/sshd_config"
	centos7.vm.provision "shell", inline: "/usr/bin/perl -pi -e \"s/PasswordAuthentication no/PasswordAuthentication yes/\" /etc/ssh/sshd_config"
	centos7.vm.provision "shell", inline: "systemctl restart sshd"
	centos7.vm.provision "shell", inline: "echo 192.168.56.140 mom >> /etc/hosts"
  end
end
