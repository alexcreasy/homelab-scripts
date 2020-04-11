 #!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "You must be root to do this." 1>&2
    exit 100
fi

dnf -y install \
	gcc \
	make \
	kernel-devel \
	kernel-headers \
	elfutils-libelf-devel \
	tar \
	bzip2