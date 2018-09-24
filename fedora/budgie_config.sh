#!/bin/bash

pwddir=$(dirname "$(readlink -f "$0")")
androidhome="/media/ARDATA/SDKDroid"

# Budgie desktop configuration
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/fedora-workstation/paisaje.jpg'
gsettings set org.gnome.desktop.wm.preferences theme 'Pop'; gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Darker'
gsettings set org.gnome.desktop.interface icon-theme "Pop"; gsettings set org.gnome.desktop.interface cursor-theme "Pop"
gsettings set org.gnome.desktop.interface font-name           "'Fira Sans Book 10'"       # Cantarell Regular 10
gsettings set org.gnome.desktop.wm.preferences titlebar-font  "'Fira Sans SemiBold 10'"   # Cantarell Bold 10
gsettings set org.gnome.desktop.interface document-font-name  "'Roboto Slab Regular 11'"  # Sans Regular 10
gsettings set org.gnome.desktop.interface monospace-font-name "'Fira Mono Regular 11'"    # Monospace Regular 10
cat $pwddir/budgie.conf | dconf load /com/solus-project/
cat $pwddir/tilix.conf | dconf load /com/gexperts/Tilix/
fc-cache -fv

# Environment Variable
[[ $(cat $HOME/.bashrc | grep -c "artisan") -eq 1 ]] || echo "alias pa='php artisan'" >> $HOME/.bashrc

if [ $(cat $HOME/.bashrc | grep -c "composer") -eq 0 ]; then
  echo "export PATH=\$PATH:\$HOME/.config/composer/vendor/bin/" >> $HOME/.bashrc
fi

if [ $(cat $HOME/.bashrc | grep -c "ANDROID_HOME") -eq 0 ]; then
  echo "export ANDROID_HOME=$androidhome" >> $HOME/.bashrc
  echo "export PATH=\$PATH:\$ANDROID_HOME/tools" >> $HOME/.bashrc
  echo "export PATH=\$PATH:\$ANDROID_HOME/tools/bin" >> $HOME/.bashrc
  echo "export PATH=\$PATH:\$ANDROID_HOME/platform-tools" >> $HOME/.bashrc
  echo "export PATH=\$PATH:\$ANDROID_HOME/emulator" >> $HOME/.bashrc
fi

source $HOME/.bashrc
