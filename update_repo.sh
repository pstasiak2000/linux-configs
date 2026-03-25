# This script pulls the current vim configuration from the system, saves it to the repository and pushes it to the current branch.
#
#


### <<<< VIM <<<<

# Pull the vim configuration
cp ~/.vim/ini.vim vim/

# Pull the new spellings
cp -r ~/.vim/spell vim/


# Push all to the repo on the current branch
git add * 
git commit -m "Updated vim configuration and spellings"
