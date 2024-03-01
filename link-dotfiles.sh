#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# neovim
mkdir -p ~/.config/nvim
ln -sf $DIR/init.vim ~/.config/nvim/init.vim
ln -sf $DIR/init.vim ~/.vimrc

# rg
ln -sf $DIR/rgrc ~/.rgrc

# xinit
ln -sf $DIR/xinitrc ~/.xinitrc

# fish
mkdir -p ~/.config/fish
ln -sf $DIR/config.fish ~/.config/fish/config.fish
ln -sf $DIR/fish_aliases ~/.config/fish/fish_aliases

# rg
ln -sf $DIR/rgrc ~/.rgrc

# picom
ln -sf $DIR/picom.conf ~/.config/picom.conf

# alacritty
mkdir -p ~/.config/alacritty
ln -sf $DIR/alacritty.toml ~/.config/alacritty/alacritty.toml

exit 0
