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
@base-x @core \
@development-tools \
@development-libs \
aajohan-comfortaa-fonts \
abattis-cantarell-fonts \
adobe-source-han-sans-cn-fonts \
adobe-source-han-sans-tw-fonts \
adobe-source-han-serif-cn-fonts \
adobe-source-han-serif-tw-fonts \
adwaita-qt4 \
adwaita-qt5 \
alsa-plugins-pulseaudio \
alsa-ucm \
alsa-utils \
at-spi2-atk \
at-spi2-core \
avahi \
baobab \
binutils \
bluez-cups \
bsdtar \
ca-certificates \
caribou \
caribou-gtk2-module \
caribou-gtk3-module \
chromium \
colord \
copr-cli \
crudini \
cups \
cups-filters \
cups-pdf \
cups-pk-helper \
curl \
dconf \
dejavu-sans-fonts \
dejavu-sans-mono-fonts \
dejavu-serif-fonts \
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
foomatic \
foomatic-db-ppds \
frei0r-plugins \
ftp \
fuse-exfat \
geany \
ghostscript \
git \
glibc-all-langpacks \
glib-networking \
glx-utils \
gnome-backgrounds \
gnome-bluetooth \
gnome-calculator \
gnome-calendar \
gnome-disk-utility \
gnome-mpv \
gnome-screenshot \
gnome-software \
gnome-system-monitor \
gnu-free-mono-fonts \
gnu-free-sans-fonts \
gnu-free-serif-fonts \
google-noto-emoji-fonts \
google-noto-sans-lisu-fonts \
google-noto-sans-mandaic-fonts \
google-noto-sans-meetei-mayek-fonts \
google-noto-sans-sinhala-fonts \
google-noto-sans-tagalog-fonts \
google-noto-sans-tai-tham-fonts \
google-noto-sans-tai-viet-fonts \
gparted \
gstreamer1-libav \
gstreamer1-plugins-bad-free \
gstreamer1-plugins-bad-free-extras \
gstreamer1-plugins-bad-freeworld \
gstreamer1-plugins-bad-nonfree \
gstreamer1-plugins-good \
gstreamer1-plugins-good-extras \
gstreamer1-plugins-ugly-free \
gutenprint \
gutenprint-cups \
gvfs-afc \
gvfs-afp \
gvfs-archive \
gvfs-fuse \
gvfs-goa \
gvfs-gphoto2 \
gvfs-mtp \
gvfs-smb \
hplip \
htop \
hyperv-daemons \
ibus-gtk2 \
ibus-gtk3 \
ibus-hangul \
ibus-kkc \
ibus-libpinyin \
ibus-libzhuyin \
ibus-m17n \
ibus-qt \
ibus-rawcode \
ibus-typing-booster \
jomolhari-fonts \
julietaula-montserrat-fonts \
khmeros-base-fonts \
lame \
libcanberra-gtk2 \
libcanberra-gtk3 \
libcurl \
liberation-mono-fonts \
liberation-sans-fonts \
liberation-serif-fonts \
libpng12 \
libproxy-mozjs \
librsvg2 \
libsane-hpaio \
libva-intel-driver \
libXScrnSaver \
lohit-assamese-fonts \
lohit-bengali-fonts \
lohit-devanagari-fonts \
lohit-gujarati-fonts \
lohit-gurmukhi-fonts \
lohit-kannada-fonts \
lohit-odia-fonts \
lohit-tamil-fonts \
lohit-telugu-fonts \
lrzsz \
lsof \
mesa-dri-drivers \
ModemManager \
mousetweaks \
mozilla-fira-fonts-common \
mozilla-fira-mono-fonts \
mozilla-fira-sans-fonts \
mpage \
nano \
nautilus \
nautilus-sendto \
naver-nanum-gothic-fonts \
net-tools \
NetworkManager-iodine-gnome \
NetworkManager-l2tp-gnome \
NetworkManager-libreswan-gnome \
NetworkManager-openconnect-gnome \
NetworkManager-openvpn-gnome \
NetworkManager-pptp-gnome \
NetworkManager-ssh-gnome \
NetworkManager-vpnc-gnome \
nscd \
nss-mdns \
nss-tools \
ntfs-3g \
ntpdate \
openssh \
open-vm-tools-desktop \
PackageKit-command-not-found \
PackageKit-gstreamer-plugin \
PackageKit-gtk3-module \
paktype-naskh-basic-fonts \
paps \
paratype-pt-sans-fonts \
perl \
pinentry-gnome3 \
plymouth-plugin-script \
plymouth-system-theme \
powerline-fonts \
ppp \
pulseaudio \
pulseaudio-module-x11 \
pulseaudio-utils \
qemu-guest-agent \
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
samba-client \
sane-backends \
sane-backends-drivers-scanners \
sane-backends-libs \
scl-utils \
screenfetch \
sil-abyssinica-fonts \
sil-mingzat-fonts \
sil-nuosu-fonts \
sil-padauk-fonts \
simple-mtpfs \
simple-scan \
smc-meera-fonts \
spice-vdagent \
stix-fonts \
sushi \
system-config-printer-udev \
tabish-eeyek-fonts \
thai-scalable-waree-fonts \
tracker \
tracker-miners \
unrar \
unzip \
vlgothic-fonts \
whois \
wvdial \
xdg-desktop-portal \
xdg-desktop-portal-gtk \
xdg-user-dirs \
xdg-user-dirs-gtk \
xmlstarlet \
xorg-x11-drv-ati \
xorg-x11-drv-evdev \
xorg-x11-drv-fbdev \
xorg-x11-drv-intel \
xorg-x11-drv-libinput \
xorg-x11-drv-nouveau \
xorg-x11-drv-openchrome \
xorg-x11-drv-qxl \
xorg-x11-drv-vesa \
xorg-x11-drv-vmware \
xorg-x11-drv-wacom \
xorg-x11-server-Xorg \
xorg-x11-utils \
xorg-x11-xauth \
xorg-x11-xinit \
zip

# Budgie Packages
dnf -y install \
arc-theme \
budgie-brightness-control-applet \
budgie-desktop \
budgie-pixel-saver-applet \
budgie-screenshot-applet \
lightdm \
light-locker \
pop-gtk-theme \
pop-icon-theme \
tilix

# Basic Configuration
plymouth-set-default-theme -R charge
systemctl set-default graphical.target
systemctl enable lightdm

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
