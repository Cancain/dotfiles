#!/bin/bash

# Personal settings
REPO="Cancain/dotfiles"
USERNAME="tomeri"

# Exit on error
set -e

# Success/error message on exit
done=0
function finish {
  if [ $done == 1 ]; then
    echo SUCCESS: Done
  else
    echo ERROR: Crashed
  fi
}
trap finish EXIT

# Exit if missingroot privileges
if [ $(whoami) != "root" ]; then
  echo "I need root"
  exit 1
fi

# Create user
if [ ! -d /home/$USERNAME ]; then
  groupadd sudo
  useradd $USERNAME -mG sudo,audio
  read -sp "Password: " PASSWORD </dev/tty
  echo -e "$PASSWORD""\n""$PASSWORD""\n" | passwd "$USERNAME"
  unset PASSWORD
  sudo -u $USERNAME mkdir -p /home/$USERNAME/bin
  sudo -u $USERNAME mkdir -p /home/$USERNAME/.ssh
fi

# Install packages
pacman --noconfirm --needed -qSy \
  git \
  htop \
  i3status \
  libnotify \
  mesa \
  networkmanager \
  nmap \
  openssh \
  pavucontrol \
  pulseaudio \
  python \
  python2 \
  ripgrep \
  scrot \
  tldr \
  ttf-liberation \
  docker \
  dmenu \
  blueman \
  xclip \
  fish \
  i3-wm \
  xorg \
  xorg-xinit

if ! which ttp; then
  npm install -g toggle-touchpad
fi

# Groups
usermod -a -G docker $USERNAME
usermod -a -G video $USERNAME

# Autostart docker
systemctl enable docker

# Install vim after python to get +python
pacman --noconfirm --needed -qSy neovim

# (Auto)start network stuff
systemctl enable NetworkManager
systemctl restart NetworkManager
systemctl enable ModemManager
systemctl restart ModemManager

# Wait for network
while ! curl http://example.com --connect-timeout 5 > /dev/null; do
  sleep 3
done

# give sudo to sudo group
SUDOCONF="%sudo ALL=(ALL) ALL"
if ! grep -Fx "$SUDOCONF" /etc/sudoers; then
  echo "$SUDOCONF" >> /etc/sudoers
fi

# yay
if ! which yay; then
  yaydir=$(sudo -u $USERNAME mktemp -d)
  git clone https://aur.archlinux.org/yay-bin.git $yaydir
  cd $yaydir
  sudo -u $USERNAME makepkg
  ls
  pacman -U yay*.pkg.tar.zst --noconfirm
fi

# AUR packages
sudo -u $USERNAME yay -Sy --noconfirm \
  ttf-ms-fonts \
  fish \
  starship-bin \
  nerd-fonts-complete

# shell
chsh -s /usr/bin/fish $USERNAME

# Set locale
if ! (localectl list-locales | grep en_US.utf8); then
  echo "LANG=en_US.UTF-8" > /etc/locale.conf
  echo "LC_ALL=en_US.UTF-8" >> /etc/locale.conf
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
  locale-gen
fi

# Full system upgrade
pacman --noconfirm -qSyu
env SUDO_USER="$USERNAME" yay --noconfirm -Ayu

# Don't clear tty after boot
mkdir -p /etc/systemd/system/getty@tty1.service.d/
NOCLEARPATH="/etc/systemd/system/getty@tty1.service.d/noclear.conf"
echo "[Service]" > "$NOCLEARPATH"
echo "TTYVTDisallocate=no" >> "$NOCLEARPATH"

# Keymap/font in tty
echo "KEYMAP=sv-latin1" > /etc/vconsole.conf
echo "FONT=ter-v22n" >> /etc/vconsole.conf

# Download this repo
REPOPATH="/home/$USERNAME/dotfiles"
if [ ! -d "$REPOPATH" ]; then
  sudo -u $USERNAME git clone git@github.com:"$REPO".git "$REPOPATH"
fi

# Symlink dotfiles
sudo -u $USERNAME /home/$USERNAME/dotfiles/link-dotfiles.sh

# Set timezone
timedatectl set-timezone Europe/Stockholm

# Enable ntp
systemctl enable --now systemd-timesyncd.service

# Print success in trap
done=1
