# This script reloads the system configurations with the current repo.
#
#


### <<<< VIM <<<<

# vim configuration
cp vim/ini.vim ~/.vim/

# Update the spell dictionary with extra relevant words
cp -r vim/spell	~/.vim/

# re-generate a link from ini.vim to .vimrc just in case
ln ~/.vim/ini.vim ~/.vimrc 

