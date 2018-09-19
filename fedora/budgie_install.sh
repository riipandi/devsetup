#!/bin/bash
#
# https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-28&arch=x86_64
#

if [[ $EUID -ne 0 ]]; then echo -e 'This script must be run as root' ; exit 1 ; fi

# Extra Repositories
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf -y copr enable alunux/budgie-desktop-stable

# Basic Packages
dnf -y install \
@base-x \
@guest-desktop-agents \
@standard \
@core \
@fonts \
@input-methods \
@dial-up \
@multimedia \
@hardware-support \
@printing \
@admin-tools \
@development-tools \
@development-libs \
@networkmanager-submodules \
adwaita-qt4 \
adwaita-qt5 \
at-spi2-atk \
at-spi2-core \
avahi \
baobab \
binutils \
bsdtar \
ca-certificates \
caribou \
caribou-gtk2-module \
caribou-gtk3-module \
chromium \
copr-cli \
crudini \
curl \
dconf \
desktop-backgrounds-gnome \
elinks \
evince \
evince-djvu \
evince-nautilus \
exfat-utils \
fedora-workstation-backgrounds \
ffmpeg \
file-roller \
file-roller-nautilus \
firefox \
frei0r-plugins \
ftp \
fuse-exfat \
geany \
glibc-all-langpacks \
glib-networking \
gparted \
gstreamer1-plugins-bad-free \
gstreamer1-plugins-bad-free-extras \
gstreamer1-plugins-bad-nonfree \
gstreamer1-plugins-good \
gstreamer1-plugins-good-extras \
gvfs-afc \
gvfs-afp \
gvfs-archive \
gvfs-fuse \
gvfs-goa \
gvfs-gphoto2 \
gvfs-mtp \
gvfs-smb \
ibus-gtk2 \
ibus-gtk3 \
ibus-qt \
lame \
libcanberra-gtk2 \
libcanberra-gtk3 \
libcurl \
libpng12 \
libproxy-mozjs \
librsvg2 \
libsane-hpaio \
libva-intel-driver \
libXScrnSaver \
lrzsz \
ModemManager \
mousetweaks \
mozilla-fira-fonts-common \
mozilla-fira-mono-fonts \
mozilla-fira-sans-fonts \
nautilus \
nautilus-sendto \
NetworkManager-iodine-gnome \
NetworkManager-l2tp-gnome \
NetworkManager-libreswan-gnome \
NetworkManager-openconnect-gnome \
NetworkManager-openvpn-gnome \
NetworkManager-pptp-gnome \
NetworkManager-ssh-gnome \
NetworkManager-vpnc-gnome \
nscd \
nss-tools \
ntpdate \
openssh \
PackageKit-command-not-found \
PackageKit-gtk3-module \
perl \
pinentry-gnome3 \
powerline-fonts \
ppp \
qgnomeplatform \
qt \
qt5-qtbase \
qt5-qtbase-gui \
qt5-qtdeclarative \
qt5-qtxmlpatterns \
qt-settings \
qt-x11 \
rdist \
rp-pppoe \
rygel \
sane-backends \
sane-backends-drivers-scanners \
sane-backends-libs \
scl-utils \
screenfetch \
simple-mtpfs \
simple-scan \
sushi \
tracker \
tracker-miners \
unrar \
whois \
wvdial \
xdg-desktop-portal \
xdg-desktop-portal-gtk \
xdg-user-dirs \
xdg-user-dirs-gtk \
xmlstarlet

# Budgie Packages
dnf -y install \
gnome-backgrounds \
gnome-bluetooth \
gnome-calculator \
gnome-calendar \
gnome-disk-utility \
gnome-keyring-pam \
gnome-mpv \
gnome-screenshot \
gnome-software \
gnome-system-monitor \
arc-theme \
budgie-brightness-control-applet \
budgie-desktop \
budgie-pixel-saver-applet \
budgie-screenshot-applet \
lightdm \
light-locker \
pop-gtk-theme \
pop-icon-theme \
tilix \
tuned

# Basic Configuration
plymouth-set-default-theme -R charge
systemctl set-default graphical.target
systemctl enable lightdm
systemctl enable --now tuned
tuned-adm profile powersave

sed -i "s|\("^Out" * *\).*|\1\${HOME}/Documents|" /etc/cups/cups-pdf.conf
perl -pi -e 's#(.*wheel.*ALL=)(.*)#${1}(ALL) NOPASSWD:ALL#' /etc/sudoers
perl -pi -e 's#(SELINUX=)(.*)#${1}permissive#' /etc/selinux/config

# GRUB Configuration
crudini --set /etc/default/grub '' 'GRUB_DISABLE_RECOVERY' 'true'
crudini --set /etc/default/grub '' 'GRUB_DISABLE_SUBMENU' 'true'
crudini --del /etc/default/grub '' 'GRUB_TERMINAL_OUTPUT'
crudini --set /etc/default/grub '' 'GRUB_DEFAULT' 'saved'
crudini --set /etc/default/grub '' 'GRUB_TIMEOUT' '3'
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
grub2-mkconfig -o /boot/grub2/grub.cfg
