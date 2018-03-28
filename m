From: shea@shealevy.com (Shea Levy)
Date: Wed, 28 Mar 2018 16:36:44 -0400
Subject: [PATCH v4 01/16] initrd: Add weakly-linked generic free_initrd_mem.
In-Reply-To: <20180328203659.18692-1-shea@shealevy.com>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
Message-ID: <20180328203659.18692-2-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 init/initramfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/init/initramfs.c b/init/initramfs.c
index 7e99a0038942..c8fe150f958a 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -526,6 +526,11 @@ extern unsigned long __initramfs_size;
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+void __init __weak free_initrd_mem(unsigned long start, unsigned long end)
+{
+       free_reserved_area((void *)start, (void *)end, -1, "initrd");
+}
+
 static void __init free_initrd(void)
 {
 #ifdef CONFIG_KEXEC_CORE
-- 
2.16.2
