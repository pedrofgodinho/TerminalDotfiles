#!/bin/bash

# Clone my dotfiles to /tmp/tdot
git clone https://github.com/pedrofgodinho/TerminalDotfiles.git /tmp/temp-tdot

if [ -f ~/.vim/autoload/plug.vim ]; then
    touch /tmp/temp-tdot/plugexists
    echo "Found existing plug install"
else
    echo "No plug install, downloading..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -d ~/.config/coc ]; then
    echo "Found existing coc install"
    touch /tmp/temp-tdot/cocexists
fi

alias vim='vim -Nu /tmp/temp-tdot/.vimrc'

vim +PlugInstall +qall

