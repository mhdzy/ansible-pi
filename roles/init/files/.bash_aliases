# User-defined aliases are declared in this file to keep ~/.zshrc clean
#

##### general #####
alias c='clear'
alias l='ls -alhkF'
alias ta='type -a'

##### R #####
alias r='radian'

##### git #####
# git stuff
alias gap='git add -p'

##### docker #####
alias di="docker image"
alias dil="docker image list"
alias dirm="docker image rm"
alias dip="docker image prune"
alias dcl="docker container list"
alias dcrm="docker container rm"
alias dcp="docker container prune"
alias dstart="docker container start"
alias dstop="docker container stop"

##### rc files #####

# neofetch
alias neorc="vim ~/.config/neofetch/config.conf"

# vim
alias vimrc='vim $HOME/.vimrc'

# neovim
alias nv='nvim'
alias nvrc='vim $HOME/.config/nvim/init.vim'

# bash/zsh rc
alias sb='source $HOME/.bashrc'
alias sz='source $HOME/.zshrc'
alias bs='vim $HOME/.bashrc'
alias zs='vim $HOME/.zshrc'
alias balias='vim $HOME/.zsh_aliases'

##### sudo #####

# sudo apt
alias sagu='sudo apt update && sudo apt upgrade'
alias sagi='sudo apt install'
alias sagic='sudo apt install -y'

# (sudo) systemctl
alias ss='sudo systemctl'
alias sstop='ss stop'
alias sstart='ss start'
alias ssrest='ss restart'

##### HADOOP #####
alias hd='hdfs dfs'
alias hf='hadoop fs'

##### python #####
# airflow stuff
alias python=$(which python3)
alias pip=pip3
