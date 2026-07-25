#!/usr/bin/env bash

echo "##################################"
echo "##################################"
echo "##################################"

read -rp "Would you like to generate a new SSH key? [y/N]: " ans; [[ $ans =~ ^[Yy]$ ]] || exit 0

ssh-keygen -t ed25519
$ eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
