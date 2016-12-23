export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

ZSH_CUSTOM=~/dotfiles/zsh-custom

plugins=(git zsh-256color)

source $ZSH/oh-my-zsh.sh

export PRY=1

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export NVM_DIR="/Users/berkcaputcu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
eval $(thefuck --alias)

export PATH="$HOME/.yarn/bin:$PATH"
