#!/bin/sh
useradd -p $(openssl passwd -crypt 1111) adminuser

groupadd admin

echo '%admin ALL=(ALL:ALL) ALL' >> /etc/sudoers

usermod -a -G admin adminuser

useradd poweruser

echo 'poweruser ALL=(ALL:ALL) /usr/sbin/iptables' >> /etc/sudoers

usermod -a -G adminuser poweruser

find / -type d -perm 4000 -exec ls -ld {} >> /home/vagrant/suid_bit.txt 