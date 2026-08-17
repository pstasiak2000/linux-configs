#!/usr/bin/env bash

set -euo pipefail

########################################
# Packages
########################################

BASE_PACKAGES=(
	git	
	base-devel
	curl
	wget
	vim
)

TERMINAL_PACKAGES=(
	starship
	kitty
    bash-completion	
	lsd
	eza
	fzf
	bat
	fastfetch	
)

UTILITY_PACKAGES=(
	blueman
	zathura
	mpv
	firefox
	cava
	zathura-pdf-mupdf
	ttf-jetbrains-mono
)

DEVELOPMENT_PACKAGES=(
	texlive	
)


########################################
# Detect Package Manager
########################################

if command -v pacman >/dev/null 2>&1; then
    PM="pacman"
elif command -v apt >/dev/null 2>&1; then
    PM="apt"
elif command -v dnf >/dev/null 2>&1; then
    PM="dnf"
elif command -v zypper >/dev/null 2>&1; then
    PM="zypper"
else
    echo "❌ Unsupported package manager."
    exit 1
fi

echo "Using package manager: $PM"

########################################
# Install a Package
########################################

install_package() {

    local package="$1"

    case "$PM" in

        pacman)
            if ! pacman -Qi "$package" >/dev/null 2>&1; then
                echo "Installing $package..."
                sudo pacman -S --needed --noconfirm "$package"
            else
                echo "✓ $package already installed"
            fi
            ;;

        apt)
            if ! dpkg -s "$package" >/dev/null 2>&1; then
                echo "Installing $package..."
                sudo apt install -y "$package"
            else
                echo "✓ $package already installed"
            fi
            ;;

        dnf)
            if ! rpm -q "$package" >/dev/null 2>&1; then
                echo "Installing $package..."
                sudo dnf install -y "$package"
            else
                echo "✓ $package already installed"
            fi
            ;;

        zypper)
            if ! rpm -q "$package" >/dev/null 2>&1; then
                echo "Installing $package..."
                sudo zypper install -y "$package"
            else
                echo "✓ $package already installed"
            fi
            ;;

    esac
}

########################################
# Install a Group
########################################

install_group() {

    local group_name="$1"
    shift

    echo
    echo "========== $group_name =========="

    for package in "$@"; do
        install_package "$package"
    done
}

########################################
# Install Everything
########################################

install_group "Base Packages" "${BASE_PACKAGES[@]}"
install_group "Terminal" "${TERMINAL_PACKAGES[@]}"
install_group "Utilities" "${UTILITY_PACKAGES[@]}"
install_group "Development" "${DEVELOPMENT_PACKAGES[@]}"

echo
echo "✅ All required packages are installed."



########################################
# Set-up packages (sourcing etc.) 
########################################
echo
source /usr/share/bash-completion/bash_completion 
echo "Package set up complete!"
