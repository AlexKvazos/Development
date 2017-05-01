export ZSH=/Users/alex/.oh-my-zsh
ZSH_THEME="zhann"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias git="hub"
alias vtop="vtop -t acid"

export N_PREFIX="$HOME/.util/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
prmptcmd() { eval "$PROMPT_COMMAND" }
precmd_functions=(prmptcmd)
