 #!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

# Create nmcli profile
nmcli con add type ethernet con-name lv426 ifname enp0s25


# Test for network connectivity
ping -c 1 8.8.8.8 || echo ""
ping -c 1 test.lan || echo "hello"

# Post install
dnf -y update && dnf -y upgrade

# Core useful tools
dnf -y install bash vim wget curl git rsync screen tmux links htop tar bzip2

dnf -y install openssh-client openssh-server nfs-utils