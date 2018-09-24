#!/bin/bash

if [[ $EUID -ne 0 ]]; then echo -e 'This script must be run as root' ; exit 1 ; fi

# Disable IPv6
crudini --set /etc/sysctl.d/70-disable-ipv6.conf '' 'net.ipv6.conf.all.disable_ipv6' '1'
crudini --set /etc/sysctl.d/70-disable-ipv6.conf '' 'net.ipv6.conf.default.disable_ipv6' '1'
crudini --set /etc/sysctl.d/70-disable-ipv6.conf '' 'net.ipv6.conf.lo.disable_ipv6' '1'
crudini --set /etc/sysctl.conf '' 'net.ipv6.conf.all.disable_ipv6'     '1'
crudini --set /etc/sysctl.conf '' 'net.ipv6.conf.default.disable_ipv6' '1'
crudini --set /etc/sysctl.conf '' 'net.ipv6.conf.lo.disable_ipv6'      '1'
crudini --set /etc/sysctl.conf '' 'net.ipv4.ip_forward' '1'

# Swapfile
crudini --set /etc/sysctl.conf '' 'vm.swappiness' '10'
crudini --set /etc/sysctl.conf '' 'vm.vfs_cache_pressure' '50'

#crudini --set /etc/sysctl.conf '' 'vm.dirty_ratio'               '40'
#crudini --set /etc/sysctl.conf '' 'vm.dirty_background_ratio'    '3'
#crudini --set /etc/sysctl.conf '' 'vm.dirty_expire_centisecs'    '6000'
#crudini --set /etc/sysctl.conf '' 'net.core.netdev_max_backlog'  '3000'
#crudini --set /etc/sysctl.conf '' 'net.core.somaxconn'           '512'
#crudini --set /etc/sysctl.conf '' 'net.core.rmem_max'            '8388608'
#crudini --set /etc/sysctl.conf '' 'net.core.wmem_max'            '8388608'
#crudini --set /etc/sysctl.conf '' 'net.ipv4.tcp_wmem' '2048 6291456 8388608'
#crudini --set /etc/sysctl.conf '' 'net.ipv4.tcp_rmem' '2048 6291456 8388608'
#crudini --set /etc/sysctl.conf '' 'net.ipv4.tcp_max_syn_backlog' '4048'
#crudini --set /etc/sysctl.conf '' 'net.ipv4.tcp_slow_start_after_idle' '0'
#crudini --set /etc/sysctl.conf '' 'net.ipv4.tcp_tw_reuse'         '1'
#crudini --set /etc/sysctl.conf '' 'net.ipv4.ip_local_port_range'  '10240 65535'
#crudini --set /etc/sysctl.conf '' 'kernel.sysrq' '0'

echo 'Sysctl has been configured'
