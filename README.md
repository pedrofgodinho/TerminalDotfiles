# My Dotfiles
This README is shared between my terminal dotfiles and my desktop dotfiles. Please reference the right section of the README for the repository you're looking at.

### Why are these files split?
I often work on headless machines. On those, I'd like to have all my terminal related dotfiles, like vim and tmux configs, without the bloat of all my other dotfiles and configs. Because of that, I decided to split my dotfiles in two and have them in different repositories, so that I can clone one repo only when needed. It also allows others to copy my terminal dotfiles without messing with their desktops and vice-versa. 

## Terminal Dotfiles
This repository has my dotfiles for zsh + ohmyzsh + powerlevel10k, a script to change between a simple (non-font dependent) and a complete (font dependent) powerlevel10k theme, and vim dotfiles.

***If you clone this repository, make sure to use the `.changezsh.sh` script to select your powerlevel10k theme***

Zsh + ohmyzsh + powerlevel10k dotfiles depend on exa being intalled, as well as the following:
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

Vim configuration depends on vimplug:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall # Errors are normal, since the dotfiles ask vim for a colorscheme we've yet to install
```

Clone Instructions:
```bash
alias tdot='/usr/bin/git --git-dir=$HOME/.tdot --work-tree=$HOME'
git clone --bare https://github.com/Fowlron/TerminalDotfiles.git $HOME/.tdot
tdot stash
tdot checkout
tdot config --local status.showUntrackedFiles no
```

Alternatively, you can run the install script from git directly to install these dotfiles. Make sure to install vim and zsh before running this script!
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/pedrofgodinho/TerminalDotfiles/main/.scripts/install.sh)"
```

### Portable

You can use the scripts provided in the .script directory to clone the repository into `/tmp`, install vim plugins, and alias vim to use the `.vimrc` in temp. A script is also provided to revert the changes. Vim must be installed before this script is run. 
```bash
# Start portable dotfiles
source <(curl -fsSL https://raw.githubusercontent.com/pedrofgodinho/TerminalDotfiles/main/.scripts/portable_start.sh)
# Revert changes
source /tmp/temp-tdot/.scripts/portable_exit.sh
```

## Desktop Dotfiles
This repository has dotfiles for my desktop environment. I am currently running arch with i3 as a window manager. 

For help installing the dependencies for my dotfiles, please reference `./.scripts/ddot/install.sh`. This script should install all dependencies and clone this repository into a new arch machine. Make sure you don't run it on your machine if it's not a fresh install of arch linux as I did not account for that when writing the script! Files will be overwritten! If you want to install my dotfiles on another system, the install script should be simple enough to read and understand what dependencies you need.
