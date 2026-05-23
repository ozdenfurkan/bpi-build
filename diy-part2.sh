#!/bin/bash
# SD card imajını tamamen devre dışı bırak
echo "# CONFIG_TARGET_ROOTFS_INITRAMFS is not set" >> .config
grep -v "SDCARD\|sdcard" .config > /tmp/.config.tmp && mv /tmp/.config.tmp .config
