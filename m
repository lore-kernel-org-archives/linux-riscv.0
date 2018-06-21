From: schwab@suse.de (Andreas Schwab)
Date: Thu, 21 Jun 2018 16:30:55 +0200
Subject: Risc-V, qemu, and initrd
In-Reply-To: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net> (Guenter
 Roeck's message of "Wed, 20 Jun 2018 23:11:37 -0700")
References: <64d50cba-8215-763c-a5c9-f384b2901d01@roeck-us.net>
Message-ID: <mvmpo0kjjog.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Jun 20 2018, Guenter Roeck <linux@roeck-us.net> wrote:

> Loking into the kernel source, I found arch/riscv/kernel/setup.c:setup_initrd().
> Debugging shows that initrd_start and initrd_end is set correctly in
> drivers/of/fdt.c:early_init_dt_check_for_initrd(), but overwritten with the value
> of __initramfs_start / __initramfs_size in setup_initrd(). This doesn't make
> sense to me, since populate_rootfs() tries to populate the root file system
> from both __initramfs_start and initrd_start.
>
> Has anyone else noticed this problem ? Any idea what I need to do to load an
> initrd with the -initrd option of qemu ?

Try removing the offending lines in setup_initrd.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
