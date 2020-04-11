 #!/usr/bin/env bash

# Installs docker for Fedora 31 server

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

dnf -y update

dnf -y remove docker \
		   docker-client \
		   docker-client-latest \
		   docker-common \
		   docker-latest \
		   docker-latest-logrotate \
		   docker-logrotate \
		   docker-selinux \
		   docker-engine-selinux \
		   docker-engine

dnf -y install dnf-plugins-core

dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Check fingerprint 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35
dnf -y install docker-ce docker-ce-cli containerd.io grubby

grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

systemctl start docker
systemctl enable docker

docker run hello-world

echo "Done: remember to add your user to the docker group by running: sudo usermod -aG docker your-user"
