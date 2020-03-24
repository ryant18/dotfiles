# Install Repos

Vim
```
sudo apt remove vim vim-runtime gvim


sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git \
xclip fonts-powerline

./configure --with-features=huge --enable-python3interp=yes

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
```

Markdown
```
npm -g install instant-markdown-d

xdg-utils
curl
nodejs
```

i3
```
curl
jq
feh
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


pip3 install bandit mypy flake8 vulture yapf isort
```
