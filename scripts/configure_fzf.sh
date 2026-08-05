#!/usr/bin/env bash
# Installation of fzf configuration files to enable preview of files within fzf.
#
# Dependencies:
# - https://github.com/sharkdp/bat
# - https://github.com/hpjansson/chafa
# - https://iterm2.com/utilities/imgcat

PREVIEW=fzf-preview

echo "Configuring command-line fuzzy finder..."

# Download the necessary files (bat should already be installed by the packages)
curl https://iterm2.com/utilities/imgcat -o /tmp/imgcat
curl https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-preview.sh -o /tmp/$PREVIEW
curl https://raw.githubusercontent.com/junegunn/fzf/refs/heads/master/bin/fzf-tmux -o /tmp/fzf-tmux

# Make them executable
chmod +x /tmp/$PREVIEW
chmod +x /tmp/imgcat
chmod +x /tmp/fzf-tmux

sudo cp /tmp/$PREVIEW /usr/bin
sudo cp /tmp/imgcat /usr/bin
sudo cp /tmp/fzf-tmux /usr/bin

echo "Configuration successful!"
