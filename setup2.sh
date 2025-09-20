# Install essentials
sudo pacman -Syu sway noto-fonts-emoji swaybg rsync reflector firefox fuzzel foot \
pipewire pipewire-pulse pipewire-alsa pipewire-jack flatpak i3blocks acpi

# Enable PipeWire and WirePlumber
systemctl --user enable --now pipewire.service pipewire.socket
systemctl --user enable --now wireplumber.service
systemctl --user enable --now pipewire-pulse.service pipewire-pulse.socket

# Check audio
pactl info

# Update mirrors
sudo reflector --country India --sort rate --save /etc/pacman.d/mirrorlist

# Enable Flatpak + Flathub
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Example Flatpak install (replace with your app)
flatpak install --user flathub org.vinegarhq.Sober

# Setup sway config
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/config
nano ~/.config/sway/config

# Setup i3blocks config
mkdir -p ~/.config/i3blocks
cp /usr/share/doc/i3blocks/examples/* ~/.config/i3blocks/ 2>/dev/null || true

echo "✅ Your minimal Sway setup is complete. Reboot if needed."
