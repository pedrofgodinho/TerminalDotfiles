#!/bin/bash

if [ "$1" = "simple" ]; then
    if [[ -L ~/.p10k.zsh ]]; then
        rm ~/.p10k.zsh
    else
        echo "Found non-link .p10k.zsh, not continuing!"
        exit
    fi
    ln -s ~/.p10k.zsh.simple ~/.p10k.zsh
    echo Powerlevel10k Theme set to Simple
elif [ "$1" = "complete" ]; then
    if [[ -L ~/.p10k.zsh ]]; then
        rm ~/.p10k.zsh
    else
        echo "Found non-link .p10k.zsh, not continuing!"
        exit
    fi
    ln -s ~/.p10k.zsh.complete ~/.p10k.zsh
    echo Powerlevel10k Theme set to Complete
else
    echo Usage:
    echo $0 simple - set zsh to simple
    echo $0 complete - set zsh to complete
fi
