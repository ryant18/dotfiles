#!/bin/bash

mkdir -p ~/.config
cp ./libinput-gestures.conf ~/.config/
cp -r ./background ~/.config/
cp -r ./i3 ~/.config/
cp -r ./i3status ~/.config/
cp -r ./i3blocks ~/.config/

cp .vimrc ~
cp -r ./.vim ~

cp .zshrc ~
cp -r ./.zsh ~

cp -r .scripts/ ~

