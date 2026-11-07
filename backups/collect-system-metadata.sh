#!/usr/bin/env bash
set -Eeuo pipefail

# Arch Linux system metadata collector

OUTPUT="$HOME/backups/metadata"
mkdir -p "$OUTPUT"

echo "Collecting Arch Linux system metadata..."

# Installed packages
pacman -Qqe > "$OUTPUT/packages-explicit.txt"
pacman -Qqm > "$OUTPUT/packages-foreign.txt"
pacman -Q > "$OUTPUT/packages-all.txt"

# Disk and filesystem information
lsblk -f > "$OUTPUT/lsblk.txt"
lsblk -o NAME,SIZE,TYPE,FSTYPE,UUID,MOUNTPOINTS \
    > "$OUTPUT/storage-layout.txt"

findmnt --real > "$OUTPUT/mounts.txt"
df -hT > "$OUTPUT/disk-usage.txt"

# Partition information (requires root)
sudo fdisk -l > "$OUTPUT/partitions.txt"

# System services
systemctl list-unit-files --state=enabled \
    > "$OUTPUT/enabled-services.txt"

systemctl list-units --type=service --state=running \
    > "$OUTPUT/running-services.txt"

# Boot configuration
bootctl status > "$OUTPUT/bootctl-status.txt" 2>&1 || true
efibootmgr -v > "$OUTPUT/efi-boot-entries.txt" 2>&1 || true

# Hardware information
uname -a > "$OUTPUT/kernel.txt"
lscpu > "$OUTPUT/cpu.txt"
lspci -nnk > "$OUTPUT/pci-devices.txt"

# Arch Linux version information
cat /etc/os-release > "$OUTPUT/os-release.txt"

# Pacman configuration
cp /etc/pacman.conf "$OUTPUT/pacman.conf"

echo
echo "Metadata collection complete!"
echo "Files saved in: $OUTPUT"
echo
du -sh "$OUTPUT"

