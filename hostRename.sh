#!/bin/bash

#
# To generate a new unique computername the date and time are added.
#
# The current and to be old name:
OLDNAME="$(uname -n)"

echo "Current ComputerName : $OLDNAME"

#
# Format the date and time string
# 
current_time=$(date "+%Y%m%d-%H%M%S")
echo "Current Time : $current_time"

#
# Combine old name with time stamp
#
NEWNAME=$OLDNAME-$current_time
echo "New ComputerName : $NEWNAME"

#
# Set the new hostname.
#
hostnamectl set-hostname $NEWNAME

#
# Update the /etc/hosts file.
#
if grep -Fq "127.0.1.1" /etc/hosts
then
    # code if found
    sed -i "/127.0.1.1/c\127.0.1.1    $NEWNAME" /etc/hosts
else
    # code if not found
    # Add the line
    echo '127.0.1.1    '$NEWNAME &>> /etc/hosts
fi

#
# Check if Ubuntu Cloud config is used
#
cloudFile="/etc/cloud/cloud.cfg"
if [ -f "$cloudFile" ]
then
    # code if found
    sed -i "/preserve_hostname/c\preserve_hostname: true" $cloudFile
else
    # code if not found
    echo 'Cloud file does not exist.'
fi

#
# Reboot the host.
#

read -t5 -n1 -r -p 'Press any key in the next five seconds to reboot...' key
if [ "$?" -eq "0" ]; then
    echo 'Rebooting the server now ...'
    shutdown -r now
else
    echo 'No key was pressed. Aborting reboot.'
fi
