My setting archiso operate scripts
=====================================
## Install 
requery mkarchiso, arch-install-scripts (new version!)


## Config files
list packages:  
packages.both  

config dir:  
airootfs/etc/  
airootfs/etc/skel - home dir  

after build script:  
./airootfs/root/customize_airootfs.sh   

## Build

```bash
git clone https://chetnuy@githu^Ccom/chetnuy/archiso-ash archiso-ash
cd archiso-ash  
git submodule init && git submodule update  
sudo ./build.sh -v
```

for rebuild:  
edit build.sh and delete run_once  



## Add function

locale.conf  
locale.gen  
vconsole.conf  
change localtime  
usermod -s /bin/bash  



## Gentoo assembly

For gentoo system. See pacman.conf file

Update key in system
pacman -Syu


## Not yaourt
Need install base-devel, add user, and etc....
