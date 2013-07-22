# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'precise64'

  config.vm.provider :vmware_fusion do |v|
    v.vmx['memsize'] = 2048
  end

  config.vm.provider :virtualbox do |v|
    v.customize ['modifyvm', :id, '--memory', 2048]
  end

  config.vm.hostname = 'openam.vagrant.dev'
  config.vm.network :private_network, ip: '192.168.33.10'
  config.landrush.enable

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet"
    puppet.manifest_file = "site.pp"
    puppet.module_path = "puppet/modules"
  end
end
