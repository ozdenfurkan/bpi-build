#!/bin/bash
# SD card image boyutunu artır
find target/linux/mediatek/image/ -name "filogic.mk" | xargs grep -l "sdcard\|SDCARD" | while read f; do
    sed -i 's/bs=[0-9]*M conv=sync/bs=128M conv=sync/g' "$f"
    sed -i 's/> [0-9]*[0-9])/> 999999999)/g' "$f"
done
