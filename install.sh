#!/bin/bash

cp -r ./i3 ~/.config/
cp -r ./i3status ~/.config/

cp ./vimrc ~/.vimrc
mkdir -p ~/.vim
cp -r ./vim/* ~/.vim/

cp ./bashrc ~/.bashrc
cp ./bash_aliases ~/.bash_aliases

mkdir -p ~/.config
cp ./libinput-gestures.conf ~/.config/
cp -r ./background ~/.config/
cp -r ./scripts/* ~/.scripts/

