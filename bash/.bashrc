# Quick change alias'
alias fyp="cd ~/Dev/FinalYearProject/Project-Eidolon"
alias fyp="cd ~/Dev/FinalYearProject/Project-Eidolon"
alias dev="cd ~/Dev/"
alias mr="cd ~/Dev/Mint-Rice"
alias snd="cd ~/Dev/C/Sandbox/src"


# Quick edit alias'
alias evr="nvim ~/Dev/Mint-Rice/vim/.vimrc"
alias eba="nvim ~/Dev/Mint-Rice/bash/.bashrc"
alias ei3="nvim ~/.config/i3/config"
alias efyp="nvim ~/Dev/FinalYearProject/Project-Eidolon/Notes.txt"
alias ecom="nvim ~/.config/compton.conf"

# Quick source bashrc if adding aliases on the fly
alias sbr="source ~/.bashrc"

alias cls="clear"

# Doom emacs stuff
alias dmr="~/.emacs.d/bin/doom refresh"
alias dms="~/.emacs.d/bin/doom sync"

# Quick quit the terminal because I'm too lazy to type the entire thing
alias q="exit"

PATH=$HOME/Dev/Scripts:$PATH
export TEMPLATES="$HOME/Dev/Templates"
export PATH="$HOME/neovim/bin:$PATH"

# Set bash to edit in vi mode
set -o vi

cmkdir()
{
	[ -z "$1" ] && echo "cmkdir: missing operand" && return

	mkdir $1
	cd $1
}

