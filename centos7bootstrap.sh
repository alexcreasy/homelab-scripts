 #!/usr/bin/env bash

# Installs docker for Fedora 31 server

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

yum -y update && yum -y upgrade

yum install git

mkdir -p "$HOME/scm"

cd "$HOME/scm"
git clone https://github.com/alexcreasy/homelab-scripts.git