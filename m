From: linux@roeck-us.net (Guenter Roeck)
Date: Thu,  9 Aug 2018 21:11:40 -0700
Subject: [PATCH] riscv: Drop setup_initrd
Message-ID: <1533874300-17656-1-git-send-email-linux@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

setup_initrd() does not appear to serve a practical purpose other than
preventing qemu boots with "-initrd" parameter, so let's drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/riscv/kernel/setup.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2e56af3281f8..579f58a42974 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -82,41 +82,6 @@ EXPORT_SYMBOL(empty_zero_page);
 /* The lucky hart to first increment this variable will boot the other cores */
 atomic_t hart_lottery;
 
-#ifdef CONFIG_BLK_DEV_INITRD
-static void __init setup_initrd(void)
-{
-	extern char __initramfs_start[];
-	extern unsigned long __initramfs_size;
-	unsigned long size;
-
-	if (__initramfs_size > 0) {
-		initrd_start = (unsigned long)(&__initramfs_start);
-		initrd_end = initrd_start + __initramfs_size;
-	}
-
-	if (initrd_start >= initrd_end) {
-		printk(KERN_INFO "initrd not found or empty");
-		goto disable;
-	}
-	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
-		printk(KERN_ERR "initrd extends beyond end of memory");
-		goto disable;
-	}
-
-	size =  initrd_end - initrd_start;
-	memblock_reserve(__pa(initrd_start), size);
-	initrd_below_start_ok = 1;
-
-	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
-		(void *)(initrd_start), size);
-	return;
-disable:
-	pr_cont(" - disabling initrd\n");
-	initrd_start = 0;
-	initrd_end = 0;
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
-
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
@@ -195,10 +160,6 @@ static void __init setup_bootmem(void)
 	set_max_mapnr(PFN_DOWN(mem_size));
 	max_low_pfn = pfn_base + PFN_DOWN(mem_size);
 
-#ifdef CONFIG_BLK_DEV_INITRD
-	setup_initrd();
-#endif /* CONFIG_BLK_DEV_INITRD */
-
 	early_init_fdt_reserve_self();
 	early_init_fdt_scan_reserved_mem();
 	memblock_allow_resize();
-- 
2.7.4
