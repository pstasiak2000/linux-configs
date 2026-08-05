#!/usr/bin/env bash
#
# This script will install the linux configurations from clean.
#

OS_NAME=$(cat /etc/os-release | grep -m1 "ID" | awk -F= '{print $NF}') # OS release name
REPO_PATH=$(git rev-parse --show-toplevel) # Local path of GitHub repository



#################################
#### <<<< PACKAGES <<<<
#################################

### Installing the base system packages
echo "Installing system packages..."
./packages.sh
echo ""

### Installing tools for archlinux based systems
if ["$OS_NAME" = "arch"]; then
	echo "Running arch packages installation script"
	./arch/install_arch_packages.sh
fi

### Installing tools for Hyprland
if ["$XDG_CURRENT_DESKTOP" = "Hyprland"]; then
	echo "Running Hyprland packages installation script"
	./hypr/install_hypr_packages.sh
fi

#################################
#### <<<< CONFIGS <<<<
#################################

CONFIG_DIR=".config"
for dir in "$CONFIG_DIR"/*/; do
    script="${dir}install.sh"

    if [[ -f "$script" ]]; then
        echo "Running $dir - $script..."
        bash "$script" "$REPO_PATH"
    fi
done

./scripts/configure_fzf.sh

echo "Installing bash aliases"
cp .bash_aliases ~/
cat .bash_include >> ~/.bashrc
echo ""


#################################
#### <<<< VIM <<<<
#################################

# vim configuration
mkdir -p ~/.vim/
cp .vim/ini.vim ~/.vim/

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install the plugins
vim -c +"norm PlugInstall" +"qa!"

# Add the spell dictionary with extra relevant words
cp -r .vim/spell ~/.vim/

# Generate a link from ini.vim to .vimrc
ln -s ~/.vim/ini.vim ~/.vimrc 
