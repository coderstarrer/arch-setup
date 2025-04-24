sudo pacman -S sway noto-fonts-emoji swaybg rsync reflector firefox fuzzel foot pipewire pipewire-pulse pipewire-alsa pipewire-jack flatpak i3blocks acpi
systemctl --user enable --now pipewire.service pipewire.socket
systemctl --user enable --now wireplumber.service
systemctl --user enable --now pipewire-pulse.service pipewire-pulse.socket
systemctl --user restart pipewire pipewire-pulse wireplumber
pactl info
sudo reflector --country India --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
``
flatpak install --user flathub org.vinegarhq.Sober 
mkdir -p ~/.config/sway
cd ~/.config/sway
cp /etc/sway/config ~/.config/sway/config
nano config

mkdir ~/.config/i3blocks
cd ~/.config
mv config config.save battery2 volume-pipewire LICENSE README.md time_message.sh i3blocks
echo "Your Minimal Setup is complete, you may reboot if needed."
