Build script for archlinux iso.
=====================================
## Install 
Requirements: mkarchiso, arch-install-scripts


## Config files
list packages:  
packages.both  

Config dir:  
airootfs/etc/  
airootfs/etc/skel - home dir  

after build script:  
./airootfs/root/customize_airootfs.sh   

## Build

```bash
git clone https://chetnuy@githuy.com/chetnuy/archiso-ash archiso-ash
cd archiso-ash  
git submodule init && git submodule update  
sudo ./build.sh -v
```

for rebuild:  
edit build.sh and delete run_once of station



## Add function

Loading full image in memory  
locale.conf  
locale.gen  
vconsole.conf  
change localtime  
usermod -s /bin/bash  


## Gentoo assembly

For gentoo system. See pacman.conf file

Update key in system
pacman -Syu

## Todo
branch for clear boot images
Not yaourt - need install base-devel(>200m), add user, and etc....
