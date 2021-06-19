#!/bin/bash

if [ -d "/tmp/temp-tdot" ]; then
    unalias vim 2> /dev/null
    if [ ! -f "/tmp/temp-tdot/plugexists" ]; then
        rm ~/.vim/autoload/plug.vim 
        rm -rf ~/.tdot-vim
    fi
    if [ ! -f "/tmp/temp-tdot/plugexists" ]; then
        rm -rf ~/.config/coc
    fi
    rm -rf /tmp/temp-tdot
fi

