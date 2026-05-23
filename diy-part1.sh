#!/bin/bash
# SD card image boyutunu artır
FILE="target/linux/mediatek/image/filogic.mk"
if [ -f "$FILE" ]; then
    echo "Patching $FILE..."
    sed -i 's/\(bs=\)[0-9]*\(M conv=sync\)/\1128\2/g' "$FILE"
    sed -i 's/> [0-9]\{8,\})/> 999999999)/g' "$FILE"
    echo "Done"
    grep -n "bs=.*M conv=sync" "$FILE" | head -5
else
    echo "ERROR: $FILE not found!"
    ls target/linux/mediatek/image/ || echo "Directory not found"
fi
