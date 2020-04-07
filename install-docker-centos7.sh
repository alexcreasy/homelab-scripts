 #!/usr/bin/env bash

# Installs docker for CentOS7

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

yum -y update

yum -y remove docker \
		   docker-client \
		   docker-client-latest \
		   docker-common \
		   docker-latest \
		   docker-latest-logrotate \
		   docker-logrotate \
		   docker-selinux \
		   docker-engine-selinux \
		   docker-engine

yum -y install yum-plugins-core

yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo

# Check fingerprint 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35
yum -y install docker-ce docker-ce-cli containerd.io


systemctl start docker
docker run hello-world
systemctl enable docker

usermod -aG docker homelab


echo "Done: remember to add your user to the docker group by running: sudo usermod -aG docker your-user"
