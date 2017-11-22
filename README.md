# Running on windows
- Install the Windows Subsystem for Linux
- Install [ansible and CredSSP](http://docs.ansible.com/ansible/latest/intro_windows.html)
```sh
$ sudo apt-get update
$ sudo apt-get install python-pip git libffi-dev libssl-dev -y
$ pip install ansible 'pywinrm[credssp]'
``` 

- Install [vagrant and enable windows access](https://www.vagrantup.com/docs/other/wsl.html)
```sh
$ wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb
$ sudo dpkg -i vagrant_2.0.0_x86_64.deb
$ export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
``` 
- Add to ~/.bashrc
```sh
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
```
- Add path to vboxmanage.exe to windows PATH 
- Then start the vm
```sh
$ vagrant up
```
