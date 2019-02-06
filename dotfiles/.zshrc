# Aliases
alias git="hub"
alias l="ls -alh"
alias code="cd ~/code && tmux new -A -s code"
alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias canihazip="curl -L https://canihazip.com/s"
alias cat="bat"

# npm settings
export PATH=~/.npm-global/bin:$PATH

# ohmyzsh
export ZSH="/Users/alex/.oh-my-zsh"
ZSH_THEME="terminalparty"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
