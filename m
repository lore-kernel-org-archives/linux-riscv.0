From: atish.patra@wdc.com (Atish Patra)
Date: Thu, 21 Jun 2018 01:11:08 -0700
Subject: Risc-V, qemu, and initrd
In-Reply-To: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
References: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
Message-ID: <594d0a70-d990-fb0d-466d-e1c4be2e3a7c@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 6/20/18 11:12 PM, Guenter Roeck wrote:
> Hi folks,
> 
> I tried to boot the latest Linux kernel with qemu from https://github.com/riscv/riscv-qemu.git,
> branch qemu-2.13-for-upstream.
> 

Did you try the upstream kernel? That doesn't boot directly. You need 
some additional patches which you can find here.

https://github.com/riscv/riscv-linux/tree/riscv-all


> My command line is something like
> 
>       riscv64-softmmu/qemu-system-riscv64 -machine virt -m 512M -bios bbl -kernel vmlinux \
>           -nographic -monitor none -initrd rootfs.cpio -append "rdinit=/sbin/init"
>

AFAIK, qemu -kernel argument expects the bbl file which as vmlinux 
embedded in it. At least that's what the makefile from freedom-u-sdk says:

https://github.com/sifive/freedom-u-sdk/blob/master/Makefile

Regards,
Atish

> Unfortunately this doesn't work; the image crashes, complaining about a missing
> root file system.
> 
> Loking into the kernel source, I found arch/riscv/kernel/setup.c:setup_initrd().
> Debugging shows that initrd_start and initrd_end is set correctly in
> drivers/of/fdt.c:early_init_dt_check_for_initrd(), but overwritten with the value
> of __initramfs_start / __initramfs_size in setup_initrd(). This doesn't make
> sense to me, since populate_rootfs() tries to populate the root file system
> from both __initramfs_start and initrd_start.
> 
> Has anyone else noticed this problem ? Any idea what I need to do to load an
> initrd with the -initrd option of qemu ?
> 
> Thanks,
> Guenter
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
