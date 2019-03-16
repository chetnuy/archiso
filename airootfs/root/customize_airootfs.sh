#!/bin/bash
#Script run for system

set -e -u

#sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#\(ru_RU\.UTF-8\)/\1/' /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime


usermod -s /usr/bin/bash root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf
sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

## enable sshd
echo "PermitRootLogin yes" > /etc/ssh/sshd_config
systemctl enable pacman-init.service choose-mirror.service sshd.service
systemctl set-default multi-user.target

## install yaourt
bash /root/yaourt.sh
useradd -m -G users,wheel,audio -s /bin/bash yaourt

## install megatools
cp /root/synctools/* /usr/bin/
rm -rf synctools

rm -rf /usr/bin/vi && ln -s /usr/bin/vim /usr/bin/vi
echo root:sad1 | chpasswd
