From: linux@roeck-us.net (Guenter Roeck)
Date: Wed, 20 Jun 2018 23:11:37 -0700
Subject: Risc-V, qemu, and initrd
Message-ID: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi folks,

I tried to boot the latest Linux kernel with qemu from https://github.com/riscv/riscv-qemu.git,
branch qemu-2.13-for-upstream.

My command line is something like

     riscv64-softmmu/qemu-system-riscv64 -machine virt -m 512M -bios bbl -kernel vmlinux \
         -nographic -monitor none -initrd rootfs.cpio -append "rdinit=/sbin/init"

Unfortunately this doesn't work; the image crashes, complaining about a missing
root file system.

Loking into the kernel source, I found arch/riscv/kernel/setup.c:setup_initrd().
Debugging shows that initrd_start and initrd_end is set correctly in
drivers/of/fdt.c:early_init_dt_check_for_initrd(), but overwritten with the value
of __initramfs_start / __initramfs_size in setup_initrd(). This doesn't make
sense to me, since populate_rootfs() tries to populate the root file system
from both __initramfs_start and initrd_start.

Has anyone else noticed this problem ? Any idea what I need to do to load an
initrd with the -initrd option of qemu ?

Thanks,
Guenter
