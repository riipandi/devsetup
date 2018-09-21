#!/bin/bash
#
# Remove Old Kernel
#

if [[ $EUID -ne 0 ]]; then echo -e 'This script must be run as root' ; exit 1 ; fi

rpm -q kernel | awk -F 'kernel-' '{print $2}' > /tmp/oldkernel
current=`uname -r`

while IFS='' read -r list || [[ -n "$list" ]]; do
  [[ "$list" != "$current" ]] && dnf -y remove {kernel,kernel-*}-$list
done < /tmp/oldkernel

dnf -y remove $(dnf repoquery --unneeded)
