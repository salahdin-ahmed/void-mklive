#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

# Copy all modules from initramfs to new rootfs.
KVER=$(uname -r)
mkdir -p $NEWROOT/usr/lib/modules
cp -a /usr/lib/modules/$KVER/kernel/* $NEWROOT/usr/lib/modules/$KVER/kernel/
depmod -b $NEWROOT/usr

# Copy the initramfs back to the new rootfs for proper shutdown.
cp /run/initramfs/live/boot/initrd.lz $NEWROOT/boot/initramfs-${KVER}.img