#!/usr/bin/env sh

######################################################################
# @author      : ash (ash@me)
# @file        : yaourt_install
# @created     : Суббота мар 16, 2019 22:49:27 MSK
#
# @description : 
######################################################################

function install {
  base=$(pacman -Qs base-devel)
  if [[ $base == "" ]]; then
    echo "You don't have base-devel group package."
    echo 'To install base-devel group just do a "pacman -S base-devel"'
    exit 1
  else
    echo "Retrieving package-query ..."
    curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
    echo "Uncompressing package-query ..."
    tar zxvf package-query.tar.gz
    cd package-query
    echo "Installing package-query ..."
    makepkg -si --noconfirm
    cd ..
    echo "Retrieving yaourt ..."
    curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
    echo "Uncompressing yaourt ..."
    tar zxvf yaourt.tar.gz
    cd yaourt
    echo "Installing yaourt ..."
    makepkg -si --noconfirm
    echo "Done!"
  fi
}

install



