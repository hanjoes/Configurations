# ~/.bashrc: executed by bash(1) for non-login shells.

#==============================================================================
# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#==============================================================================
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


#==============================================================================
# Setup prompt to using neat-prompt
#==============================================================================

PROMPT_COMMAND='PS1="`python ~/Configurations/neat-prompt/neat_prompt.py`"'

#==============================================================================
# Some important environment variables.
#==============================================================================
# PATH
export PATH=$PATH:\
/usr/local/apache-maven-3.2.3/bin:\
/usr/local/gcc-arm-none-eabi-4_9-2015q1/bin:\
/opt/local/bin:\
/Users/hanjoes/Library/Android/sdk/platform-tools/:\
/usr/local/bin

# JAVA_HOME for Intellij
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

# JAVA classpath system-wide
export CLASSPATH=.:\
/usr/local/lib/antlr-4.5-complete.jar:\
/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home/lib/tools.jar

# For tmux
export TERM='screen-256color' 

# For emacs as the default editor
export ALTERNATE_EDITOR=""
export EDITOR=emacsclient

#==============================================================================
# Set system limits
#==============================================================================
ulimit -c unlimited

#==============================================================================
# Aliases
#==============================================================================
alias ll='ls -Gl'
alias la='ls -Ga'
alias ls='ls -G'
alias antlr4='java -jar /usr/local/lib/antlr-4.5-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias rp='screen /dev/cu.usbserial 115200l'
alias j='java'
alias jc='javac'
alias sb='source ~/.bashrc'
alias tmux='tmux -2'
alias ec='emacsclient -c "$@"'


#==============================================================================
# Set vim as default pager:
#==============================================================================
#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#    -c 'set nonumber' \
#    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#==============================================================================
# Keyboard layout
#==============================================================================
set -o emacs

#==============================================================================
# Misc
#==============================================================================

# Prevent terminal input from overriding prompt
# (by calculating the wrong window size)
shopt -s checkwinsize
