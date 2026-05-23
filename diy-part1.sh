#!/bin/bash
FILE="target/linux/mediatek/image/filogic.mk"
if [ -f "$FILE" ]; then
    echo "Patching $FILE"
    # SD card boyut limitini kaldır
    sed -i '/too big/d' "$FILE"
    sed -i 's/\(SDCARD_SIZE.*\)[0-9]\{5,\}/\1999999/g' "$FILE"
    echo "Patch done"
    grep -n "SDCARD_SIZE\|too big" "$FILE" | head -10
else
    echo "File not found, listing dir:"
    ls target/linux/mediatek/image/ 2>/dev/null || echo "Dir not found"
fi
