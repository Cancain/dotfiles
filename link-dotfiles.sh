#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# i3
mkdir -p ~/.i3
[ ! -f ~/.i3/config ] && ln -s $DIR/i3 ~/.i3/config

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

mkdir -p ~/.config/fish
[ ! -f ~/.config/fish/config.fish ] && ln -s $DIR/config.fish ~/.config/fish/config.fish

exit 0
