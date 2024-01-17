#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# terminator
mkdir -p ~/.config/terminator
[ ! -f ~/.config/terminator/config ] && ln -s $DIR/terminator ~/.config/terminator/config

# vscode
[ ! -f ~/.config/Code/User/settings.json ] && ln -s $DIR/settings.json ~/.config/Code/User/settings.json

# neovim
mkdir -p ~/.config/nvim
[ ! -f ~/.config/nvim/init.vim ] && ln -s $DIR/init.vim ~/.config/nvim/init.vim
[ ! -f ~/.vimrc ] && ln -s $DIR/init.vim ~/.vimrc

# terminator
mkdir -p ~/.config/terminator
[ ! -f ~/.config/terminator/config ] && ln -s $DIR/terminator ~/.config/terminator/config

# rg
[ ! -f ~/.rgrc ] && ln -s $DIR/rgrc ~/.rgrc

# xinit
[ ! -f ~/.xinitrc ] && ln -s $DIR/xinitrc ~/.xinitrc

# fish
mkdir -p ~/.config/fish
[ ! -f ~/.config/fish/config.fish ] && ln -s $DIR/config.fish ~/.config/fish/config.fish
[ ! -f ~/.config/fish/fish_aliases ] && ln -s $DIR/config.fish ~/.config/fish/fish_aliases

#rg
[ ! -f ~/.rgrc ] && ln -s $DIR/rgrc ~/.rgrc

#picom
[ ! -f ~/.config ] && ln -s $DIR/picom.conf ~/.config/picom.conf

exit 0
