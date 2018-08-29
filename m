From: linux@roeck-us.net (Guenter Roeck)
Date: Tue, 28 Aug 2018 17:33:46 -0700
Subject: [PATCH v2] riscv: Do not overwrite initrd_start and initrd_end
Message-ID: <1535502826-23856-1-git-send-email-linux@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

setup_initrd() overwrites initrd_start and initrd_end if __initramfs_size
is larger than 0, which is always true even if there is no embedded
initramfs. This prevents booting qemu with "-initrd" parameter.
Overwriting initrd_start and initrd_end is not necessary since
__initramfs_start and __initramfs_size are used directly in
populate_rootfs() to load the built-in initramfs, so just drop
that code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Instead of dropping setup_initrd() entirely, only stop
    overwriting initrd_start and initrd_end. Adjust explanation
    accordingly.

 arch/riscv/kernel/setup.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index db20dc630e7e..aee603123030 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -85,15 +85,8 @@ atomic_t hart_lottery;
 #ifdef CONFIG_BLK_DEV_INITRD
 static void __init setup_initrd(void)
 {
-	extern char __initramfs_start[];
-	extern unsigned long __initramfs_size;
 	unsigned long size;
 
-	if (__initramfs_size > 0) {
-		initrd_start = (unsigned long)(&__initramfs_start);
-		initrd_end = initrd_start + __initramfs_size;
-	}
-
 	if (initrd_start >= initrd_end) {
 		printk(KERN_INFO "initrd not found or empty");
 		goto disable;
-- 
2.7.4
