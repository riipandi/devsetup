#!/bin/bash

if [[ $EUID -ne 0 ]]; then echo -e 'This script must be run as root' ; exit 1 ; fi

rm -f /etc/yum.repos.d/fedora.repo
rm -f /etc/yum.repos.d/fedora-updates.repo
rm -f /etc/yum.repos.d/fedora-updates-testing.repo
rm -f /etc/yum.repos.d/fedora-cisco-openh264.repo

cat > /etc/yum.repos.d/fedora.repo <<EOF
[fedora]
name=Fedora \$releasever - \$basearch
mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-\$releasever&arch=\$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
metadata_expire=7d
repo_gpgcheck=0
gpgcheck=1
enabled=1
type=rpm

[updates]
name=Fedora \$releasever - \$basearch - Updates
mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f\$releasever&arch=\$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
metadata_expire=7d
repo_gpgcheck=0
gpgcheck=1
enabled=1
type=rpm

[updates-testing]
name=Fedora \$releasever - \$basearch - Updates Testing
mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f\$releasever&arch=\$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
metadata_expire=7d
repo_gpgcheck=0
gpgcheck=1
enabled=0
type=rpm
EOF

echo 'Repository has been configured'
