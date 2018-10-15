From: michaeljclark@mac.com (Michael Clark)
Date: Tue, 16 Oct 2018 09:26:20 +1300
Subject: [isa-dev] riscv-qemu - linux boot is failing for vda device
In-Reply-To: <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
References: <CAOuPNLgimMwWrw6oXs7Eu8xBG+geOt53D_LjiiNk7=OEtLtz3g@mail.gmail.com>
Message-ID: <0D61A5C7-23B7-466E-BE00-458675DE4FF7@mac.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Dropping isa-dev, adding sw-dev

> On 16/10/2018, at 3:00 AM, Pintu Kumar <pintu.ping@gmail.com> wrote:
> 
> Hi,
> I am trying to setup riscv-qemu booting on a new Ubuntu PC.
> I dont want to use freedom-u-sdk, so I am preparing my own environment.
> I could able to build the following:
> - riscv-toolchain
> - riscv-linux
> - riscv-qemu
> - riscv-pk
> - busybear
> 
> After that, I am trying to boot riscv-qemu, using the following command:
> # sudo qemu-system-riscv64 -nographic -machine virt -kernel
> PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0" -drive
> file=busybear.bin,format=raw,id=hd0 -device
> virtio-blk-device,drive=hd0

Note: sudo is not required. sudo is used in the busybear start-qemu.sh script as it uses bridged networking. The latest version of busybear points at linux-4.19-rc5 so the issue may have been fixed.

> But, I am getting kernel panic.
> 
> ---------
> bbl loader
> ....
> Linux version 4.18.0-rc6...
> ....
> devtmpfs: initialized
> cpu cpu0: Error -2 creating of_node link

Not sure what is happening here.

> ......
> SCSI subsystem initialized
> ....
> Unpacking initramfs...
> ....
> loop: module loaded
> virtio_blk: probe of virtio0 failed with error -22
> ...
> VFS: Cannot open root device "vda" or unknown-block(0,0): error -6

It is finding vda from the command-line, thus chosen in the generic open-firmware code is working fine.

> Please append a correct "root=" boot option; here are the available partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.0-rc6-13927-gd72e90f3 #3
> -----------
> 
> Basically, it could not find the "vda" device, even though I passed
> the "root=/dev/vda"
> 
> What could be the cause of this issue?
> 
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> CONFIG_VIRTIO_BLK=y
> # CONFIG_VIRTIO_BLK_SCSI is not set
> # CONFIG_SCSI_VIRTIO is not set
> CONFIG_VIRTIO_NET=y

I can?t tell at a glance what your problem is, but if that is your complete .config delta from defconfig then we can drop it into busybear and point it at your kernel version; currently the build scripts use an archive.

> These are already enabled in the kernel.
> If I am missing any config, please let me know.

You are probably missing config. Do you have the filesystems enabled?

> Thanks,
> Pintu
> 
> -- 
> You received this message because you are subscribed to the Google Groups "RISC-V ISA Dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to isa-dev+unsubscribe at groups.riscv.org.
> To post to this group, send email to isa-dev at groups.riscv.org.
> Visit this group at https://groups.google.com/a/groups.riscv.org/group/isa-dev/.
> To view this discussion on the web visit https://groups.google.com/a/groups.riscv.org/d/msgid/isa-dev/CAOuPNLgimMwWrw6oXs7Eu8xBG%2BgeOt53D_LjiiNk7%3DOEtLtz3g%40mail.gmail.com.
