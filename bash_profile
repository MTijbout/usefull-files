##
## Version 1.1
##

#
# Changelog
#
# 1.1 - Color enablement
# 1.0 - Optimized for Raspberry Pi usage
#

export PS1="\[\033[00;33m\]\n   \u \[\033[01;34m\] at \[\033[00;33m\] \h\[\033[00m\] \[\033[01;34m\]in \[\033[00;33m\]\w\[\033[00m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

if [ -f ~/.bashrc ]; then
source ~/.bashrc
fi
