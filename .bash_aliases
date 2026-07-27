### This file contains the bash aliases which I want to use


# Standard aliases
alias vi='vim'
alias copy='wl-copy' # Use to copy to clipboard
alias grep='grep --color=auto'


if command -v lsd >/dev/null 2>&1; then
	alias ls='lsd --color=auto'
	alias ll='eza --icons --group-directories-first -lA'	
	alias lt='eza --icons --group-directories-first --tree -lA'	
	# Set standard ls and ll in case I need to use the basic versions without symbols
	alias ls_='ls --color=auto'
	alias ll_='ls -lAtr --color=auto'
else	
	alias ls='ls --color=auto'
	alias ll='ls -lAtr --color=auto'
fi	






