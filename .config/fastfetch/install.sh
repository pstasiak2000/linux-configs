#!/usr/bin/env bash

### The input parameter is the local directory of the git repository
### i.e use ./install $(git rev-parse --showtoplevel) to run this command


DIR="fastfetch"
FILE="config.jsonc"

GIT_PATH="$1/.config/$DIR/"
CONFIG_PATH="$HOME/.config/$DIR/"

### Initialising logo image
echo "Detected Archlinux..."
sed -e 's/LINUX_LOGO_SOURCE/arch.png/g' ${GIT_PATH}$FILE.ini > ${GIT_PATH}$FILE

### Installing configuration file
echo "Installing configuration file"
mkdir -p $CONFIG_PATH
mv ${GIT_PATH}$FILE ${CONFIG_PATH}$FILE

### Installing additional media
echo "Installing additional media"
cp -r ${GIT_PATH}images ${CONFIG_PATH}
echo ""

