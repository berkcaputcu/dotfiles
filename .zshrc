export ZSH=/home/vagrant/.oh-my-zsh

ZSH_THEME="robbyrussell"

HIST_STAMPS="yyyy-mm-dd"

ZSH_CUSTOM=~/src/scripts

plugins=(git bgnotify)

source $ZSH/oh-my-zsh.sh

  export PATH="/home/vagrant/.gem/ruby/2.1.6/bin:/usr/lib/shopify-ruby/2.1.6-shopify2/lib/ruby/gems/2.1.0/bin:/usr/lib/shopify-ruby/2.1.6-shopify2/bin:/home/vagrant/.linuxbrew/bin:/home/vagrant/bin:/home/vagrant/.nvm/versions/node/v5.5.0/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/vagrant/src/go/bin"



export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PRY=1
