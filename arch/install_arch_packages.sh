#!/usr/bin/env bash
#
# Install various packages that are specific to arch such as yay
#
APP_DIR=~/.cache/
mkdir -p $APP_DIR
cd $APP_DIR


### Installing yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
