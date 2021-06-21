sudo pacman -S xorg xorg-xinit lightdm noto-fonts noto-fonts-emoji alacritty zsh pulseaudio pulseaudio-alsa alsa-utils pavucontrol rofi dunst feh polkit mate-polkit xclip python python2 tree unzip p7zip neofetch wget lolcat fortune-mod cowsay vlc ranger ueberzug libnotify exa

yay -S i3-gaps lightdm-slick-greeter bottom-bin picom-ibhagwan brave reversal-icon-theme-git polybar ttf-nerd-fonts-hack-complete-git

sudo sed -i '/^\[Seat:\*]/a user-session=i3wm' /etc/lightdm/lightdm.conf
sudo sed -i '/^\[Seat:\*]/a greeter-session=lightdm-slick-greeter' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm.service

mkdir --parents $HOME/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Regular.ttf"
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Bold.ttf"
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Italic.ttf"
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O "$HOME/.local/share/fonts/MesloLGS NF Bold Italic.ttf"
fc-cache -f -v

wget -o ~/.wallpaper/wallpaper.png https://i.redd.it/pm1yv0e8sf061.png
