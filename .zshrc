export ZSH=/Users/alex/.oh-my-zsh
ZSH_THEME="zhann"
KEYTIMEOUT=1

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

alias git="hub"
alias vtop="vtop -t acid"

export N_PREFIX="$HOME/.util/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
