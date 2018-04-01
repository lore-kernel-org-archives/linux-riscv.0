From: shea@shealevy.com (Shea Levy)
Date: Sun,  1 Apr 2018 10:59:17 -0400
Subject: [PATCH v6 03/16] alpha: Switch to generic free_initrd_mem.
In-Reply-To: <20180401145931.7932-1-shea@shealevy.com>
References: <20180329113207.30674-1-shea@shealevy.com>
 <20180401145931.7932-1-shea@shealevy.com>
Message-ID: <20180401145931.7932-3-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The first patch in this series added a weakly-defined generic
implementation, which is functionally identical to the
architecture-specific one removed here.

Series boot-tested on RISC-V (which now uses the generic
implementation) and x86_64 (which doesn't).

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/alpha/mm/init.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 9d74520298ab..55f7c8efa962 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -291,11 +291,3 @@ free_initmem(void)
 {
 	free_initmem_default(-1);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void
-free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-- 
2.16.2
