# puppet-enterprise
Deploy puppet-enterprise lab with vagrant

Prerequisites:
  1. Install VirtualBox https://www.virtualbox.org/
  2. Install Vagrant https://www.vagrantup.com/

Steps:

1. Run 'vagrant init' to intiate vagrant environment, this will create vagrantfile.
2. Replace vagrant file with the file from this repo
3. Run 'vagrant up'

login: vagrant
password: vagrant

Once the VMs will be deployed perform following steps:

 - on mom:
 
        sudo -i
        
        tar -xvzf puppet-enterprise.tar.gz

        mv puppet-enterprise-2023.0.0-el-7-x86_64/ pe
       
        pe/puppet-enterprise-installer
      
        puppet agent -t
      
        puppet agent -t
      
        puppet infra console_password --password=password
      
        puppet agent -t
      
        Console available under https://192.168.56.140
        Credentials: admin/password


- pe-centos:

      curl -k https://192.168.56.140:8140/packages/current/install.bash | sudo bash


- ubuntu:

      Class: pe_repo::platform::ubuntu_2004_amd64 has to be added in PE console -> Node Groups -> PE Infrastructure -> PE Master -> Add new class
      run puppet agent -t on mom
      
      curl -k https://192.168.56.140:8140/packages/current/install.bash | sudo bash

- on mom:

      puppetserver ca sign --all

s
