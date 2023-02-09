export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

ZSH_CUSTOM=~/dotfiles/zsh-custom

plugins=(git zsh-256color)

source $ZSH/oh-my-zsh.sh

export PRY=1
export EDITOR=vim

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export NVM_DIR="/Users/berkcaputcu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -e /Users/berkcaputcu/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/berkcaputcu/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
