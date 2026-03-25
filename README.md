# Linux configuration files

This repository holds different configurations for programs and applications that I use on a daily basis.

## Installation

The file ```install.sh``` installs the relevant configurations to the system.


### Vim

The full vim installation requires a couple of additional steps.
The install script automatically installs the ```vim-plug``` utility for installing vim plugins.

In order to install the specified plugins, run ```vim ~/.vimrc``` and then install the plugins with 

```bash
    :PlugInstall
```

and then source the files with ```source .vimrc```.

You will also need a Nerd Font compatible font for devicons to show up properly.
I like using the JetBrainsMono font which can be installed and placed in the ```~/.fonts``` directory using 

```bash
    curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz

mkdir ~/.fonts/
tar -xvf JetBrainsMono.tar.xz -C ~/.fonts/
```
and then set the font in the shell.
