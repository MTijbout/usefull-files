# command default options and variations

##
## Version 1.0
##

#
# Changelog
#
# 1.0 - Optimized for Raspberry Pi usage
#

#
# Taken from Ubuntu Bash config .bashrc:
#
# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi


#
# Enable color
#
export CLICOLOR=true


#
# My own creations:
#
# alias l='ls'
alias la='ls -la'   # list all
alias ll='ls -lhF'  # list all
alias dir='lla'     # List all in columns
alias lh='ll -h'    # list all
alias lx='ls -X'    # sort by extension
alias lt='ls -tr'   # sort by mod time, reverse order
alias lS='ls -S'    # sort by size
alias lL='ll -S'    # sort by size
alias lr='ls -R'    # recursive
alias du='du -h'    # human readable units
alias df='df -h'    # human readable units
alias cp='cp -r'    # recursive
alias ..='cd ..'    # up
alias watch='watch -d -n 1' # update every 1 second, showing changes
alias cat='more'
alias cls='clear'
alias br='. ~/.bash_profile'
alias getdns='scutil --dns'
alias showdns='getdns'
# alias ping='ping -c 4'
