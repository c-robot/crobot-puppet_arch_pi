#/bin/bash

function install_docker {
	pacman -S --noconfirm docker
	systemctl start docker.service 
	systemctl status docker.service
	docker pull skaufm/rpi-arduino
	docker run skaufm/rpi-arduino
}


echo "http://die-kaufmanns.net/mediawiki/index.php/ArchLinux"
echo "password should be changed by your own ..."
echo "upgrade all packages"

pacman -Syyuu --noconfirm

pacman-db-upgrade 

pacman -S --noconfirm puppet

pacman -S --noconfirm ruby-shadow

echo "notify { 'hello puppet world test': }" > /root/test1.pp 
puppet apply /root/test1.pp
echo "now you should be able to run a 'puppet apply <mypuppetfile>.pp' "

echo "git clone https://github.com/skaufm/crobot-puppet_arch_pi"
pacman -S --noconfirm git
mkdir -p /data/github/skaufm 
cd /data/github/skaufm
git clone https://github.com/skaufm/crobot-puppet_arch_pi
cd crobot-puppet_arch_pi
git pull origin master


while true; do
    read -p "Do you wish to install docker and run an raspbian jessie container ?" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

