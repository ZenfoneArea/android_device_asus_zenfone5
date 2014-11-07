#!/bin/bash
./adb reboot bootloader
./fastboot flash boot boot_signed.bin
if [ -f system.img ]; then
	if [ -f system.img.gz ]; then
		rm system.img.gz
	fi
	gzip system.img
fi
./fastboot flash system system.img.gz
./fastboot -w
./fastboot reboot

