#!/bin/sh

path="/home/ryan/projects/dotfiles/mouse-keys/"

state=$(cat ${path}forwardmousestate.txt)
if [ "$state" = "pressed" ];
then
    echo "released" > ${path}forwardmousestate.txt
else
    $(xdotool keydown Alt key Right keyup Alt)
    echo "pressed" > ${path}forwardmousestate.txt
fi
