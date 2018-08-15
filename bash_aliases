# command default options and variations

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lla='ll -A'
alias l='ls -CF'


#
# My own creations:
#
# alias l='ls'
# alias la='ls -la'    # list all
alias ll='ls -lh'   # list all
alias dir='lla'     # List all in columns
alias lh='ll -h'    # list all
alias lx='ls -X'    # sort by extension
alias lt='ls -tr'   # sort by mod time, reverse order
alias lS='ls -S'    # sort by size
alias lL='ll -S'    # sort by size
alias lr='ls -R'    # recursive
alias du='du -h'  # human readable units
alias df='df -h'  # human readable units
alias cp='cp -r'    # recursive
alias ..='cd ..'  # up
alias watch='watch -d -n 1' # update every 1 second, showing changes
alias cat='more'
alias cls='clear'
alias br='. ~/.bash_profile'
alias getdns='scutil --dns'
alias showdns='getdns'
# alias ping='ping -c 4'

#
# Synching data
#
# New version of RSYNC and enhanced commands.
alias nrsync="/usr/local/bin/rsync -e 'ssh -c arcfour' -vzP -aNHAXx --fileflags --protect-decmpfs --force-change --rsync-path=/usr/local/bin/rsync --stats -i"
# New version to update exisiting sync...
alias ursync="/usr/local/bin/rsync -e 'ssh -c arcfour' -vzuP --delete -aNHAXx --fileflags --protect-decmpfs --force-change --rsync-path=/usr/local/bin/rsync --stats -i"
# Sync documents from Mac to Nassie.
alias docsync="ursync ~/Documents/ /Volumes/Data/VMware\ Mac\ Data/Documents/"

#
# Show / Hide all files in Finder:
#
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


# MySQL related aliases
# alias mysql=/usr/local/mysql/bin/mysql
# alias mysqladmin=/usr/local/mysql/bin/mysqladmin
# alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'
# alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'

findfile()
{
	find . -iname "*$1*"
}
 
