alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias to="ruby ~/dotfiles/scripts/testonly.rb"
alias be="bundle exec"
alias rtest="ruby -Itest"

alias cds="cd ~/code/Shopify"
alias cdc="cd ~/code/"
alias cdd="cd ~/Desktop/docs"

alias gl='git log --graph --pretty=format:"%Creset%h %aN %Cred%d %Cblue%s"'
alias gd='git diff HEAD --color'
alias ggg="git grep -n -5"
alias gg="git grep -n"
alias gb="git branch"
alias gbranches="git for-each-ref refs/heads --format='%(align:70)%(refname:short)%(end) %(committerdate:iso8601) (%(committerdate:relative))' --sort -committerdate | head -n30"
alias git-clean="git remote prune origin;git branch --merged master | grep -v \"master\" | xargs -n 1 git branch -d"

alias vssh='cd ~/code/vagrant/ && vagrant ssh'
alias vmount='cd ~/code/vagrant/src/'
alias weather='curl wttr.in/ottawa'

alias shipit='dev open shipit'
alias admin='dev open admin'

# thefuck https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"
alias f='fuck'

bundle-up () {
  git checkout master
  git pull origin master

  bin/bootstrap
  bundle exec rake db:migrate
}

ggfp () {
  git push origin +$(current_branch)
}

amend-last () {
  local answer

  if [[ $(current_branch) = 'master' ]]; then
    echo 'Switch to a branch to amend'
    return
  fi

  git diff HEAD
  git add .

  vared -p 'Would you like to force push?: ' -c answer
  if [[ $answer = 'y' ]]; then
    git commit --amend
    git push origin +$(current_branch)
  fi
}

rebase-master() {
  local answer
  local prev_branch=$(current_branch)

  if [[ $prev_branch = 'master' ]]; then
    echo 'Switch to a branch to rebase'
    return
  fi

  git checkout master
  git pull origin master
  git checkout $prev_branch
  git rebase master

  git push origin $prev_branch

  vared -p 'Would you like to force push?: ' -c answer
  if [[ $answer = 'y' ]]; then
    echo $prev_branch
    git push origin +$prev_branch
  fi
}

export NVM_DIR="/Users/berkcaputcu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
