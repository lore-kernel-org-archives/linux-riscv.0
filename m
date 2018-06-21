From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 21 Jun 2018 07:48:21 -0700
Subject: Risc-V, qemu, and initrd
In-Reply-To: <mvmpo0kjjog.fsf@suse.de>
References: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
 <mvmpo0kjjog.fsf@suse.de>
Message-ID: <20180621144821.GA15280@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Jun 21, 2018 at 04:30:55PM +0200, Andreas Schwab wrote:
> On Jun 20 2018, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > Loking into the kernel source, I found arch/riscv/kernel/setup.c:setup_initrd().
> > Debugging shows that initrd_start and initrd_end is set correctly in
> > drivers/of/fdt.c:early_init_dt_check_for_initrd(), but overwritten with the value
> > of __initramfs_start / __initramfs_size in setup_initrd(). This doesn't make
> > sense to me, since populate_rootfs() tries to populate the root file system
> > from both __initramfs_start and initrd_start.
> >
> > Has anyone else noticed this problem ? Any idea what I need to do to load an
> > initrd with the -initrd option of qemu ?
> 
> Try removing the offending lines in setup_initrd.
> 
I did. The resulting image hangs (I tried v4.17.2 and v4.18-rc1).
However, I can boot the latest image from the risc-v repository
to shell after commenting out the code in setup_initrd().

This is with qemu -M virt. The other machine types in qemu fail with
"rom: address overlap" errors. I didn't try to track down the reason.

Thanks,
Guenter
