# This script will install the linux configurations from clean.
#
#


### <<<< VIM <<<<

# vim configuration
mkdir -p ~/.vim/
cp vim/ini.vim ~/.vim/

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add the spell dictionary with extra relevant words
cp -r vim/spell	~/.vim/

# Generate a link from ini.vim to .vimrc
ln -s ~/.vim/ini.vim ~/.vimrc 
