 #!/usr/bin/env bash

# Adds firewall rules to open necessary ports for UniFi Controller

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

firewall-cmd --add-port=8081/tcp --permanent
firewall-cmd --add-port=8080/tcp --permanent
firewall-cmd --add-port=8443/tcp --permanent
firewall-cmd --add-port=8843/tcp --permanent
firewall-cmd --add-port=8880/tcp --permanent
firewall-cmd --add-port=6789/tcp --permanent
firewall-cmd --add-port=10001/udp --permanent
firewall-cmd --add-port=3478/udp --permanent
firewall-cmd --reload
