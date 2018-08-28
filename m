From: linux@roeck-us.net (Guenter Roeck)
Date: Tue, 28 Aug 2018 13:59:02 -0700
Subject: [PATCH] riscv: Drop setup_initrd
In-Reply-To: <mhng-7faee2bb-ee3e-48d1-a016-782ebbbb903d@palmer-si-x1c4>
References: <1533874300-17656-1-git-send-email-linux@roeck-us.net>
 <mhng-7faee2bb-ee3e-48d1-a016-782ebbbb903d@palmer-si-x1c4>
Message-ID: <20180828205902.GB31691@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Aug 28, 2018 at 01:10:20PM -0700, Palmer Dabbelt wrote:
> On Thu, 09 Aug 2018 21:11:40 PDT (-0700), linux at roeck-us.net wrote:
> >setup_initrd() does not appear to serve a practical purpose other than
> >preventing qemu boots with "-initrd" parameter, so let's drop it.
> >
> >Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >---
> > arch/riscv/kernel/setup.c | 39 ---------------------------------------
> > 1 file changed, 39 deletions(-)
> >
> >diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> >index 2e56af3281f8..579f58a42974 100644
> >--- a/arch/riscv/kernel/setup.c
> >+++ b/arch/riscv/kernel/setup.c
> >@@ -82,41 +82,6 @@ EXPORT_SYMBOL(empty_zero_page);
> > /* The lucky hart to first increment this variable will boot the other cores */
> > atomic_t hart_lottery;
> >
> >-#ifdef CONFIG_BLK_DEV_INITRD
> >-static void __init setup_initrd(void)
> >-{
> >-	extern char __initramfs_start[];
> >-	extern unsigned long __initramfs_size;
> >-	unsigned long size;
> >-
> >-	if (__initramfs_size > 0) {
> >-		initrd_start = (unsigned long)(&__initramfs_start);
> >-		initrd_end = initrd_start + __initramfs_size;
> >-	}
> >-
> >-	if (initrd_start >= initrd_end) {
> >-		printk(KERN_INFO "initrd not found or empty");
> >-		goto disable;
> >-	}
> >-	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
> >-		printk(KERN_ERR "initrd extends beyond end of memory");
> >-		goto disable;
> >-	}
> >-
> >-	size =  initrd_end - initrd_start;
> >-	memblock_reserve(__pa(initrd_start), size);
> >-	initrd_below_start_ok = 1;
> >-
> >-	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
> >-		(void *)(initrd_start), size);
> >-	return;
> >-disable:
> >-	pr_cont(" - disabling initrd\n");
> >-	initrd_start = 0;
> >-	initrd_end = 0;
> >-}
> >-#endif /* CONFIG_BLK_DEV_INITRD */
> >-
> > pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
> >
> >@@ -195,10 +160,6 @@ static void __init setup_bootmem(void)
> > 	set_max_mapnr(PFN_DOWN(mem_size));
> > 	max_low_pfn = pfn_base + PFN_DOWN(mem_size);
> >
> >-#ifdef CONFIG_BLK_DEV_INITRD
> >-	setup_initrd();
> >-#endif /* CONFIG_BLK_DEV_INITRD */
> >-
> > 	early_init_fdt_reserve_self();
> > 	early_init_fdt_scan_reserved_mem();
> > 	memblock_allow_resize();
> 
> With this patch I can't boot in QEMU.  It might be something with my setup,
> though.  I'm testing with a unified BBL+vmlinux, and using QEMU 3.0.0-rc3 (I
> should probably update that one, but I don't remember anything going by).
> Do you have time to take a look?  Here's my QEMU commandline
> 

Odd. Maybe 'RISC-V: Support separate firmware and kernel payload' creates
incompatibilities, or you have an embedded initrd in your kernel image
and that somehow doesn't work (I thought I tested that but maybe I didn't).

Unfortunately, I have no means to generate a unified bbl+vmlinux,
I would have to set it up, and I won't have time anytime soon to do that.
Guess we'll have to live with broken initrd for non-unified builds.
I'll just drop the initrd boot tests from my setup.

Guenter

> ./riscv64-softmmu/qemu-system-riscv64    -nographic    -machine virt    -smp 4    -m 2G    -kernel /home/palmer/work/riscv/riscv-pk/build/bbl -object rng-random,filename=/dev/urandom,id=rng0    -device virtio-rng-device,rng=rng0    -append "console=ttyS0 ro root=/dev/vda"    -device virtio-blk-device,drive=hd0    -drive file=stage4-disk.img,format=raw,id=hd0    -device virtio-net-device,netdev=usernet    -netdev user,id=usernet,hostfwd=tcp::10000-:22
> 
> I just tagged the PR I plan to submit for RC2 tomorrow, so at least it
> should be easy for everyone to get on the same page.
