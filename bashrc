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

source ~/.bashitrc
source ~/.hstrrc
source ~/github/z/z.sh

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin

export PATH

# function xdev() {
#     if [ -f ".localprofile-rhel7" ]; then
#         bash --rcfile .localprofile-rhel7
#     elif [ -d "${PWD}/eamis" ]; then
#         cd eamis
#         bash --rcfile .localprofile-rhel7
#     else
#         echo "Error: Not in eamis directory?"
#     fi
# }
