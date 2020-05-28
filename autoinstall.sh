#!/bin/bash

I3_LINK="https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2020.02.03_all.deb keyring.deb SHA256:c5dd35231930e3c8d6a9d9539c846023fe1a08e4b073ef0d2833acd815d80d48"
NEOVIM_LINK="https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage"
ST_LINK="https://github.com/ryant18/st.git"


#install i3
/usr/lib/apt/apt-helper download-file $I3_LINK

dpkg -i ./keyring.deb
echo "deb https://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
rm -f keyring.deb

apt update
apt -y install i3 i3blocks curl jq feh


#install neovim
apt-get -y install wget
wget $NEOVIM_LINK
mv nvim.appimage /usr/bin/nvim
pip3 install pynvim --upgrade

apt-get -y install xdg-utils nodejs
npm -g install instant-markdown-d

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +q
nvim --headless +CocInstall coc-python +q




#install st
git clone $ST_LINK
cd st
make install
cd ..
rm -rf st

#install zsh
apt-get -y install zsh
chsh -s /usr/bin/zsh


./install.sh
