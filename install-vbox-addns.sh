 #!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

eject /dev/cdrom

echo "Please load the Guest Additions CD by clicking:"
echo "    Devices -> Install Guest Additions CD Image..."
read -p "Then press [ENTER] to continue"

mkdir -p /media/vbox-additions
mount /dev/cdrom /media/vbox-additions
sh /media/vbox-additions/VBoxLinuxAdditions.run
eject /dev/cdrom

echo "VirtualBox Guest Additions successfully installed"