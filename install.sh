#!/bin/bash

mkdir -p ~/.config
cp ./libinput-gestures.conf ~/.config/
cp -r ./background ~/.config/
cp -r ./i3 ~/.config/
cp -r ./i3status ~/.config/
cp -r ./i3blocks ~/.config/

cp ./vimrc ~/.vimrc
mkdir -p ~/.vim
cp -r ./vim/* ~/.vim/

cp ./bashrc ~/.bashrc
cp ./inputrc ~/.inputrc
cp ./bash_aliases ~/.bash_aliases
cp ./zshrc ~/.zshrc

mkdir -p ~/.scripts
cp -r ./scripts/* ~/.scripts/

