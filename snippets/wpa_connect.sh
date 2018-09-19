#!/bin/bash

SSID="pasimnet"
PASS="YourWPAKey"
IFACE="wlp1s0"

iwconfig $IFACE essid $SSID
wpa_passphrase pasimnet $PASS | tee /etc/wpa_supplicant.conf
wpa_supplicant -Dwext -i$IFACE -c /etc/wpa_supplicant.conf &
dhclient $IFACE
ping -c3 209.244.0.3
