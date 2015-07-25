#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
PS1='[\u@\h \W]\$ '

alias chrome='google-chrome-stable'
alias poweroff='shutdown -h now'

setxkbmap -option ctrl:nocaps

