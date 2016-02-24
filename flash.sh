#/bin/bash

rkupgrade di resource resource.img
sleep 1
cp -f /home/gmathews/github/lollipop_kernel/arch/arm64/boot/Image /home/gmathews/rkfirmware/lubuntu.img.dump/Image/Image
cd /home/gmathews/rkfirmware/lubuntu.img.dump/Image
rkmkbootimg --base 0x60400000 --pagesize 16384 --ramdisk_offset 0x62000000 --second_offset 0x60f00000 --tags_offset 0x60088000 --kernel Image --ramdisk ramdisk.cpio.gz -o ramfs.img
sleep 1
rkupgrade di boot ramfs.img
sleep 1
rkflashtool b
cd /home/gmathews/github/lollipop_kernel
