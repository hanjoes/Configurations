# ~/.bashrc: executed by bash(1) for non-login shells.

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# prompt setup

# PROMPT_COMMAND='PS1="`python ~/Configurations/bash-git-prompt/parrt-prompt.py`"'

IP=`/sbin/ifconfig en1 | sed -n '4s/^[[:space:]]\{1,\}inet[[:space:]]\{1,\}\([[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\.[[:digit:]]\{1,\}\).*$/\1/p'`
export PS1='[\u@\[\e[1;31m\]$IP\[\e[0m\] \w]$ '

export PATH=$PATH:/usr/local/apache-maven-3.2.3/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
export CLASSPATH=.:/usr/local/lib/antlr-4.4-complete.jar:/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home/lib/tools.jar

# set system limits
ulimit -c unlimited

# aliases
alias ll='ls -Gl'
alias la='ls -Ga'
alias ls='ls -G'
alias antlr4='java -jar /usr/local/lib/antlr-4.4-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# alias mysql='mysql --prompt="\u@\d:\h mysql> "'


# set vim as default pager:
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
			 vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
		     -c 'set nonumber' \
			 -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
			 -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# keyboard layout
set -o emacs
