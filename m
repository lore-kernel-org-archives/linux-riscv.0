From: shea@shealevy.com (Shea Levy)
Date: Thu, 29 Mar 2018 07:31:59 -0400
Subject: [PATCH v5 08/16] m32r: Switch to generic free_initrd_mem.
In-Reply-To: <20180329113207.30674-1-shea@shealevy.com>
References: <20180328203659.18692-1-shea@shealevy.com>
 <20180329113207.30674-1-shea@shealevy.com>
Message-ID: <20180329113207.30674-8-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The generic implementation is functionally identical.

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/m32r/mm/init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/m32r/mm/init.c b/arch/m32r/mm/init.c
index 93abc8c3a46e..e2b5f09209ee 100644
--- a/arch/m32r/mm/init.c
+++ b/arch/m32r/mm/init.c
@@ -139,14 +139,3 @@ void free_initmem(void)
 {
 	free_initmem_default(-1);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-/*======================================================================*
- * free_initrd_mem() :
- * orig : arch/sh/mm/init.c
- *======================================================================*/
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-- 
2.16.2
