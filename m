From: shea@shealevy.com (Shea Levy)
Date: Tue, 20 Feb 2018 07:54:26 -0500
Subject: [PATCH] riscv: Respect the initrd found in the dt, if any.
Message-ID: <20180220125426.6388-1-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/kernel/setup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 41d34008faf6..c4ebc907af34 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -88,15 +88,20 @@ static void __init setup_initrd(void)
 	extern unsigned long __initramfs_size;
 	unsigned long size;
 
+	if (initrd_start)
+		goto found;
+
 	if (__initramfs_size > 0) {
 		initrd_start = (unsigned long)(&__initramfs_start);
 		initrd_end = initrd_start + __initramfs_size;
 	}
 
+	initrd_below_start_ok = 1;
 	if (initrd_start >= initrd_end) {
 		printk(KERN_INFO "initrd not found or empty");
 		goto disable;
 	}
+found:
 	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
 		printk(KERN_ERR "initrd extends beyond end of memory");
 		goto disable;
@@ -104,13 +109,13 @@ static void __init setup_initrd(void)
 
 	size =  initrd_end - initrd_start;
 	memblock_reserve(__pa(initrd_start), size);
-	initrd_below_start_ok = 1;
 
 	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
 		(void *)(initrd_start), size);
 	return;
 disable:
 	pr_cont(" - disabling initrd\n");
+	initrd_below_start_ok = 0;
 	initrd_start = 0;
 	initrd_end = 0;
 }
-- 
2.16.1
