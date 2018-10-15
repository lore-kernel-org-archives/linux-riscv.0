From: pintu.ping@gmail.com (Pintu Kumar)
Date: Mon, 15 Oct 2018 19:30:59 +0530
Subject: riscv-qemu - linux boot is failing for vda device
Message-ID: <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,
I am trying to setup riscv-qemu booting on a new Ubuntu PC.
I dont want to use freedom-u-sdk, so I am preparing my own environment.
I could able to build the following:
- riscv-toolchain
- riscv-linux
- riscv-qemu
- riscv-pk
- busybear

After that, I am trying to boot riscv-qemu, using the following command:
# sudo qemu-system-riscv64 -nographic -machine virt -kernel
PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0" -drive
file=busybear.bin,format=raw,id=hd0 -device
virtio-blk-device,drive=hd0

But, I am getting kernel panic.

---------
bbl loader
....
Linux version 4.18.0-rc6...
....
devtmpfs: initialized
cpu cpu0: Error -2 creating of_node link
......
SCSI subsystem initialized
....
Unpacking initramfs...
....
loop: module loaded
virtio_blk: probe of virtio0 failed with error -22
...
VFS: Cannot open root device "vda" or unknown-block(0,0): error -6
Please append a correct "root=" boot option; here are the available partitions:
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.0-rc6-13927-gd72e90f3 #3
-----------

Basically, it could not find the "vda" device, even though I passed
the "root=/dev/vda"

What could be the cause of this issue?

CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_VIRTIO_BLK=y
# CONFIG_VIRTIO_BLK_SCSI is not set
# CONFIG_SCSI_VIRTIO is not set
CONFIG_VIRTIO_NET=y

These are already enabled in the kernel.
If I am missing any config, please let me know.



Thanks,
Pintu
