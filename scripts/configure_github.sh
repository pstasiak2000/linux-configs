#!/usr/bin/env bash

echo "##################################"
echo "##################################"
echo "##################################"

### Setting up github configurations

echo "Entering GitHub configuration"

if [[ -z $(git config --global --get user.name) ]]; then
    read -rp "Enter your Git name: " GIT_NAME
    git config --global user.name "$GIT_NAME"
fi

if [[ -z $(git config --global --get user.email) ]]; then
    read -rp "Enter your Git email: " GIT_EMAIL
    git config --global user.email "$GIT_EMAIL"
fi

### Testing Authentication
while true; do
    if ssh -o BatchMode=yes -o StrictHostKeyChecking=accept-new -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
        break
    fi

    echo
    echo "GitHub SSH authentication failed."
    echo
    echo "To continue, you must authenticate with GitHub using SSH."
    echo
    echo "If you already have an SSH key:"
    echo "  • Copy your existing private and public key pair into ~/.ssh/."
    echo
    echo "If you do not have an SSH key, or have not added it to GitHub:"
    echo "  • Follow GitHub's guide to generate a new SSH key and add it to your GitHub account:"
    echo "    https://docs.github.com/en/authentication/connecting-to-github-with-ssh"
    echo
    read -rp "Press Enter to test your GitHub SSH authentication again (Ctrl+C to quit)... "
done

echo "Account successfully authenticated!"
