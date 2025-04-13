#!/bin/bash

# Disable Wi-Fi Power Save
echo "Disabling Wi-Fi Power Save on wlo1..."
sudo iw dev wlo1 set power_save off

# Create systemd service to make it persistent
echo "Creating systemd service to disable power save on boot..."
cat <<EOF | sudo tee /etc/systemd/system/wifi-no-power-save.service
[Unit]
Description=Disable Wi-Fi Power Save
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/sbin/iw dev wlo1 set power_save off
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and enable the service
echo "Reloading systemd and enabling the service..."
sudo systemctl daemon-reload
sudo systemctl enable wifi-no-power-save.service
sudo systemctl start wifi-no-power-save.service

echo "Wi-Fi power saving is disabled and the service is enabled to run at boot."
