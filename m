From: shea@shealevy.com (Shea Levy)
Date: Thu, 29 Mar 2018 07:32:02 -0400
Subject: [PATCH v5 11/16] nios2: Switch to generic free_initrd_mem.
In-Reply-To: <20180329113207.30674-1-shea@shealevy.com>
References: <20180328203659.18692-1-shea@shealevy.com>
 <20180329113207.30674-1-shea@shealevy.com>
Message-ID: <20180329113207.30674-11-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The generic implementation is functionally identical.

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/nios2/mm/init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
index c92fe4234009..3df75ff8c768 100644
--- a/arch/nios2/mm/init.c
+++ b/arch/nios2/mm/init.c
@@ -82,13 +82,6 @@ void __init mmu_init(void)
 	flush_tlb_all();
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
-void __init free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-
 void __ref free_initmem(void)
 {
 	free_initmem_default(-1);
-- 
2.16.2
