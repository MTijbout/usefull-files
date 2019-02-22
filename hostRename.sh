#!/bin/bash

##
## To generate a new unique computername the date and time are added.
##
## Version 1.4
##

#
# Changelog
#
# 1.4 - Updated logging with timestamp.
# 1.3 - Check if run as root.
# 1.1 - Added date and time string to the log.
# 1.0 - Created the script to rename a Ubuntu 18.04 hostname permanently.
#

## Check if script is run as root
if [ $UID != "0" ]; then
    echo "You must run this script as root." 1>&2
    exit
fi

## Format the date and time strings 
current_time=$(date "+%Y%m%d-%H%M%S")
echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : Start of the hostRename.sh script ..." >> action.log

## The current and to be old name:
OLDNAME="$(uname -n)"
echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : Current ComputerName: $OLDNAME"  >> action.log

## Combine old name with time stamp
NEWNAME=$OLDNAME-$current_time
echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : New hostname will become: $NEWNAME" >> action.log

## Set the new hostname.
hostnamectl set-hostname $NEWNAME

## Update the /etc/hosts file.
if grep -Fq "127.0.1.1" /etc/hosts
then
    # code if found
    echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : 127.0.1.1 entry found in /etc/hosts" >> action.log
    # Replace the line
    sed -i "/127.0.1.1/c\127.0.1.1    $NEWNAME" /etc/hosts
else
    # code if not found
    # Add the line
    echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : Adding 127.0.1.1 line to /etc/hosts" >> action.log
    echo '127.0.1.1    '$NEWNAME &>> /etc/hosts
fi

## Check if Ubuntu Cloud config is used
cloudFile="/etc/cloud/cloud.cfg"
if [ -f "$cloudFile" ]
then
    # code if found
    echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : cloud.cfg found. Changing the value" >> action.log
    sed -i "/preserve_hostname/c\preserve_hostname: true" $cloudFile
else
    # code if not found
    echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : No cloud.cfg file found." >> action.log
fi

## Create log entry
echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : The hostRename.sh script has run..." >> action.log

## Reboot the host.
read -t5 -n1 -r -p 'Press any key in the next five seconds to reboot...' key
if [ "$?" -eq "0" ]; then
	# code if key is pressed
	echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : Rebooting the server now ..." >> action.log
	echo 'Rebooting the server now ...'
	shutdown -r now
else
	#code if no key is pressed
	echo "$(date +"%Y-%m-%d %H:%M:%S,%2N") : No key pressed. Abort Reboot ..." >> action.log
	echo 'No key was pressed. Aborting reboot.'
fi
