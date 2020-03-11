# Install Repos

```
xclip
fonts-powerline
```
Install other linters as needed for ale

## Touchpad Gestures
https://github.com/bulletmark/libinput-gestures

```
sudo gpasswd -a $USER input
sudo apt-get install xdotool wmctrl libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures && sudo make install
libinput-gestures-setup start
```

## YouCompleteMe
https://github.com/ycm-core/YouCompleteMe

```
sudo apt install build-essential cmake python3-dev
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer
```
