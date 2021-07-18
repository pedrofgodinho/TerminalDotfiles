#!/bin/bash

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Clone repository
alias tdot='/usr/bin/git --git-dir=$HOME/.tdot --work-tree=$HOME'
git clone --bare https://github.com/pedrofgodinho/TerminalDotfiles.git $HOME/.tdot
tdot stash
tdot checkout
tdot config --local status.showUntrackedFiles no


# Install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo -e "\n" | nvim +PlugInstall +qall 

# Set starting zsh theme
~/.scripts/tdot/changezsh.sh simple

# Set shell to zsh
chsh -s $(which zsh)

