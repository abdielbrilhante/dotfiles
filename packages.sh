sudo apt update
sudo apt full-upgrade
sudo apt install -y build-essential apt-transport-https ca-certificates curl gnupg-agent software-properties-common xdotool wmctrl libinput-tools


sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget -q -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

sudo apt update
sudo apt install -y fish git vim xclip pavucontrol-qt latte-dock papirus-icon-theme google-chrome-stable insomnia yarn code teams docker-ce docker-ce-cli containerd.io

gite clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
cd Tela-circle-icon-theme
./install.sh -a
cd ..
rm -r Tela-circle-icon-theme

git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
cd ..
rm -r libinput-gestures 


chsh -s /usr/bin/fish
set -U fish_greeting

code --install-extension Shan.code-settings-sync

git config --global core.editor vim
git config --global user.name "Abdiel Brilhante"

sudo gpasswd -a $USER input
libinput-gestures-setup autostart

ssh-keygen -t rsa -b 2048 -C "abdiel.brilhante@${1}" -f ~/.ssh/id_rsa -N ''
