From: shea@shealevy.com (Shea Levy)
Date: Sun,  1 Apr 2018 10:59:20 -0400
Subject: [PATCH v6 06/16] frv: Switch to generic free_initrd_mem.
In-Reply-To: <20180401145931.7932-1-shea@shealevy.com>
References: <20180329113207.30674-1-shea@shealevy.com>
 <20180401145931.7932-1-shea@shealevy.com>
Message-ID: <20180401145931.7932-6-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The first patch in this series added a weakly-defined generic
implementation, which is functionally identical to the
architecture-specific one removed here.

Series boot-tested on RISC-V (which now uses the generic
implementation) and x86_64 (which doesn't).

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/frv/mm/init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/frv/mm/init.c b/arch/frv/mm/init.c
index cf464100e838..345edc4dc462 100644
--- a/arch/frv/mm/init.c
+++ b/arch/frv/mm/init.c
@@ -131,14 +131,3 @@ void free_initmem(void)
 	free_initmem_default(-1);
 #endif
 } /* end free_initmem() */
-
-/*****************************************************************************/
-/*
- * free the initial ramdisk memory
- */
-#ifdef CONFIG_BLK_DEV_INITRD
-void __init free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-} /* end free_initrd_mem() */
-#endif
-- 
2.16.2
