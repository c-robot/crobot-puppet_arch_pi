#/bin/bash

echo "http://die-kaufmanns.net/mediawiki/index.php/ArchLinux"

echo "password should be changed by your own ..."

echo "upgrade all packages"
pacman -Syyuu --noconfirm

pacman-db-upgrade 

pacman -S --noconfirm puppet

pacman -S --noconfirm ruby-shadow

echo "notify { 'hello puppet world test': }" > /root/test1.pp 

puppet apply /root/test1.pp

echo "git clone https://github.com/skaufm/crobot-puppet_arch_pi"

pacman -S --noconfirm git

mkdir -p /data/github/skaufm 

cd /data/github/skaufm

git clone https://github.com/skaufm/crobot-puppet_arch_pi

cd crobot-puppet_arch_pi

git pull origin master

echo "now you should be able to run a 'puppet apply <mypuppetfile>.pp' "
