 #!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

# Create nmcli profile
#nmcli con add type ethernet con-name lv426 ifname enp0s25


# Test for network connectivity
#ping -c 5 8.8.8.8 || echo "Error: no network connection"
#ping -c 5 google.com || echo "Error: unable to resolve DNS"

# Post install
yum -y update && yum -y upgrade

# Core useful tools
yum -y install vim wget curl git rsync screen tmux links htop tar bzip2

yum -y install openssh-client openssh-server nfs-utils

yum -y install smartmontools


