# ~/.bashrc: executed by bash(1) for non-login shells.

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# prompt setup

PROMPT_COMMAND='PS1="`python ~/.bash/bash-git-prompt/parrt-prompt.py`"'

#IP=`/sbin/ifconfig eth0 | sed -n '4s/^[[:space:]]\{1,\}inet[[:space:]]\{1,\}\([[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\).*$/\1/p'`

export PATH=$PATH:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin::~/bin:/usr/local/jdk1.8.0_20/bin
export JAVA_HOME=/usr/local/jdk1.8.0_20/

# set system limits
ulimit -c unlimited

# aliases
alias ll='ls --color -l'
alias la='ls --color -a'
alias ls='ls --color'
alias mysql='mysql --prompt="\u@\d:\h mysql> "'

# set vim as default pager:
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
			 vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
		     -c 'set nonumber' \
			 -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
			 -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# keyboard layout
set -o emacs
