sudo pacman-mirrors -g
sudo pacman -Syu --noconfirm
sudo pacman -S yay --noconfirm

yay -S --noconfirm --needed fish git vim xclip pavucontrol-qt latte-dock google-chrome chromium insomnia yarn visual-studio-code-bin teams docker libinput-gestures discord

git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme
./install.sh -a
cd ..
sudo rm -r Tela-circle-icon-theme

chsh -s /usr/bin/fish
set -U fish_greeting

code --install-extension Shan.code-settings-sync

git config --global core.editor vim
git config --global user.name "Abdiel Brilhante"

sudo gpasswd -a $USER docker
sudo systemctl enable docker

sudo gpasswd -a $USER input
libinput-gestures-setup autostart

ssh-keygen -t rsa -b 2048 -C "abdiel.brilhante@${1}" -f ~/.ssh/id_rsa -N ''
