# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

IP=`/sbin/ifconfig en1 | sed -n '4s/^[[:space:]]\{1,\}inet[[:space:]]\{1,\}\([[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\).*$/\1/p'`

export PS1='[\u@\[\e[1;31m\]$IP\[\e[0m\] \w]$ '
PROMPT_COMMAND='PS1="`~/.bash/parrt-prompt.py`"'
#PS1="`~/.bash/parrt-prompt.py`"

export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/c++/4.2.1/backward/
export PATH=/Library/Frameworks/Python'.'framework/Versions/Current/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/Users/Hanzhou/bin:~/bin

ulimit -c unlimited
alias ll='ls -l'
alias la='ls -a'
alias mysql='mysql --prompt="\u@\d:\h mysql> "'

export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
			 vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
		     -c 'set nonumber' \
			 -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
			 -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#export PATH=/home/richard/chromium/depot_tools:$PATH

#keyboard layout
set -o emacs

export VIMHOME=~/.vim 

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=exfxcxdxcxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# git auto-completion
source ~/bin/git-completion.bash

# setup java classpath
source ~/.cprc
