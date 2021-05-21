# My Dotfiles
This README is shared between my terminal dotfiles and my desktop dotfiles. Please reference the right section of the README for the repository your looking at.
##
### Terminal Dotfiles
This repository has my dotfiles for zsh + ohmyzsh + powerlevel10k, a script to change between a simple (non-font dependent) and a complete (font dependent) powerlevel10k theme, and nvim dotfiles.
Planning to add tmux to this in the future.

***If you clone this repository, make sure to use the `.changezsh.sh` script to select your powerlevel10k theme***

Zsh + ohmyzsh + powerlevel10k dotfiles depend on:
```bash
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Nvim dotfiles depend on:
 - nodejs
 - npm
 - pylint

Make sure to run `:PlugInstall` on nvim after cloning the dotfiles. 

Clone Instructions:
```
alias tdot='/usr/bin/git --git-dir=$HOME/.tdot --work-tree=$HOME'
git clone --bare https://github.com/Fowlron/TerminalDotfiles.git $HOME/.tdot
tdot stash
tdot checkout
tdot config --local status.showUntrackedFiles no
```
##
### Desktop Dotfiles
TODO
