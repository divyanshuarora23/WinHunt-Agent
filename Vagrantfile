# Vagrantfile — WinHunt Lab (Kali + win-iis + win-file)
Vagrant.configure("2") do |config|
  DEFAULT_MEM = 4096
  DEFAULT_CPUS = 2

  # Kali attacker
  config.vm.define "kali" do |k|
    k.vm.box = "kalilinux/rolling"
    k.vm.hostname = "kali"
    k.vm.network "private_network", ip: "192.168.56.20"

    k.vm.provider "virtualbox" do |vb|
      vb.name = "winhunt-lab_kali"
      vb.memory = DEFAULT_MEM
      vb.cpus = DEFAULT_CPUS
    end

    k.vm.provision "shell", path: "provision_kali.sh"
  end

  # Windows IIS target
  config.vm.define "win-iis" do |w|
    w.vm.box = "StefanScherer/windows_2019"
    w.vm.hostname = "win-iis"
    w.vm.network "private_network", ip: "192.168.56.21"

    w.vm.provider "virtualbox" do |vb|
      vb.name = "winhunt-lab_win-iis"
      vb.memory = DEFAULT_MEM
      vb.cpus = DEFAULT_CPUS
      vb.gui = true
    end

    w.vm.communicator = "winrm"
    w.winrm.username = "vagrant"
    w.winrm.password = "vagrant"
    w.winrm.transport = :negotiate
    w.winrm.retry_limit = 12
    w.winrm.retry_delay = 5

    w.vm.provision "shell", privileged: true, path: "provision_win_iis.ps1"
  end
end
