#!/bin/bash

cp -r ~/.config/i3 .
cp -r ~/.config/i3status .
cp -r ~/.config/i3blocks .

cp ~/.vimrc ./vimrc
cp -r ~/.vim/colors ./vim/
cp -r ~/.vim/ftplugin ./vim/
cp -r ~/.vim/syntax ./vim/

cp ~/.bashrc ./bashrc
cp ~/.inputrc ./inputrc
cp ~/.bash_aliases ./bash_aliases
cp ~/.zshrc ./zshrc

cp ~/.config/libinput-gestures.conf .
cp -r ~/.config/background .
cp -r ~/.scripts/* ./scripts/
cp ~/.Xmodmap .
