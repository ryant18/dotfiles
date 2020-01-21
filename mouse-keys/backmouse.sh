#!/bin/sh

path="/home/ryan/projects/dotfiles/mouse-keys/"

state=$(cat ${path}backmousestate.txt)
if [ "$state" = "pressed" ];
then
    echo "released" > ${path}backmousestate.txt
else
    $(xdotool keydown Alt key Left keyup Alt)
    echo "pressed" > ${path}backmousestate.txt
fi
