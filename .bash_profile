#!/usr/bin/env bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'



export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home:$PATH"

#export PS1="\u@\h\w$ "

print_pre_prompt ()
{
    PS1L=$PWD
    if [[ $PS1L/ = "$HOME"/* ]]; then PS1L=\~${PS1L#$HOME}; fi
    #PS1R=$USER@$HOSTNAME
    printf "\n%s%$(($COLUMNS-${#PS1L}))s" "$PS1L" ##"$PS1R"
}
PROMPT_COMMAND=print_pre_prompt

# # Path to the bash it configuration
# export BASH_IT="/Users/ashah/.bash_it"

# # Lock and Load a custom theme file
# # location /.bash_it/themes/
# export BASH_IT_THEME='arpit'

# # Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# # Don't check mail when opening terminal.
# unset MAILCHECK

# # Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# # Set this to the command you use for todo.txt-cli
# export TODO="t"

# # Set this to false to turn off version control status checking within the prompt for all themes
# export SCM_CHECK=true


# gst (){
# 	cd /Users/ashah/tibbrsvn/scripts/
# 	. env.sh
# 	cd /Users/ashah/tibbrsvn/tibbr/
# 	clear
# 	pwd
# 	# jruby -S script/server #unfortunately doesn't work
# 	jruby -S script/server -p 3000 -e production
# }

# gsk (){
# 	PID=`ps -eaf | grep jruby | grep -v grep | awk '{print $2}'`
# 	if [[ "" !=  "$PID" ]]; then
# 	  echo "killing $PID"
# 	  kill -9 $PID
# 	fi
# 	# clear
# }

# gk (){
# 	gsk
# 	gst
# }


eval "$(rbenv init -)"


# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

mcd () {
    mkdir -p $1
    cd $1
}

# gs (){
# 	cd scripts/
# 	. env.sh
# }



kpn (){
	PID=`ps -eaf | grep $1 | grep -v grep | awk '{print $2}'`
	if [[ "" !=  "$PID" ]]; then
	  echo "killing $PID"
	  kill -9 $PID
	fi
}

psa () {
  ps aux | grep $1
}





alias sbp="source ~/.bash_profile"
alias sublp="subl ~/.bash_profile"
alias vbp="vim ~/.bash_profile"
alias desk="cd ~/Desktop/"
alias dlds="cd ~/Downloads/"
alias docs="cd ~/Documents/"
alias nuke='killall -9 '

alias vim="mvim -v"
alias v='f -e mvim -v'

alias rf="rm -rf"
alias mf="touch"
alias md="mkdir"
alias ld="ls -d */"
alias lh="ls -d .*"
alias ll="ls -l"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias c="clear"
alias w="which"
alias j="jruby -S"
alias o="open ."

# alias gr='cd $(git rev-parse --show-cdup --show-toplevel)' #git-root
alias gr='cd $(git root)' # git config --global alias.root "rev-parse --show-toplevel" is ran already
alias gt="gr && cd tibbr/"
alias gs="gr && cd scripts/"
alias gth="gr && cd tibbr-config/shared/tenants/themes/tibbr/themes"
alias gtheme="gr && cd tibbr-config/shared/tenants/themes/tibbr/themes"
alias gc="gr && cd tibbr-config/"


alias e="gs && . env.sh"
alias status="gs && ./status.sh"
alias ss="gs && ./0_memcached.sh && ./2_cassandra.sh && ./2_zookeeper.sh start && ./2_search.sh && ./1_main_job_runner.sh"


alias vac="gr && vim tibbr-config/app_config.yml"
alias status="gs && ./status.sh"

alias .e=". env.sh"
alias wj="which jruby"
alias rmd="rm -rf"
alias mc="mycli -uroot"

alias j-tibbr="ssh ashah_c@vmtbr1.tibbr.com" # USAID
alias j-tibco="ssh ashah@vmtbr1.tibco.com"   # scania, psg-test

alias nah="git reset --hard;git clean -df;"

alias twba="jruby -S rake tibbr:web:build_all"
alias twbc="jruby -S rake tibbr:web:build_css"

alias rc="jruby -S script/console"
alias js="gt && jruby -S script/server"
alias jsp="jruby -S script/server -p 3000 -e production"
alias kall='killall "java" && killall "memcached"'





if command -v brew >/dev/null 2>&1; then
        # Load rupa's z if installed
     [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi


# Load Bash It
# source $BASH_IT/bash_it.sh


# fasd
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# test -e ${HOME}/.iterm2_shell_integration.
# bash && source ${HOME}/.iterm2_shell_integration.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi



source ~/git-completion.bash


# Tips and tricks
# 1. apachectl stop :: to stop apache


