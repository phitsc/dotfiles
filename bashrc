#!/usr/bin/env bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f $HOME/.alias ]; then
	. $HOME/.alias
fi

#LC_ALL=en_US.UTF-8

export EDITOR='vim'

export THEME_CLOCK_FORMAT="%a %H:%M"
export THEME_CHECK_SUDO=false

# Path to the bash it configuration
export BASH_IT="$HOME/github/bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/

export POWERLINE_AWS_PROFILE_CHAR=" "
export POWERLINE_PROMPT_USER_INFO_MODE="sudo"
export POWERLINE_LEFT_PROMPT="cwd scm"
export POWERLINE_RIGHT_PROMPT="last_status aws_profile clock"
export BASH_IT_THEME='powerline-multiline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

# hstr
export HH_CONFIG=hicolor,rawhistory         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace:ignoredups:erasedups   # leading space hides commands from history
export HISTIGNORE="rm *:rm -rf *:cd ..:ls:hh *"
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '\C-a:beginning-of-line'; fi
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-ahh \C-j"'; fi

# Load Z
source ~/github/z/z.sh

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin

export PATH

function xdev() {
    if [ -f ".localprofile-rhel7" ]; then
        bash --rcfile .localprofile-rhel7
    elif [ -d "${PWD}/eamis" ]; then
        cd eamis
        bash --rcfile .localprofile-rhel7
    else
        echo "Error: Not in eamis directory?"
    fi
}
