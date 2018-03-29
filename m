From: shea@shealevy.com (Shea Levy)
Date: Thu, 29 Mar 2018 07:31:56 -0400
Subject: [PATCH v5 05/16] c6x: Switch to generic free_initrd_mem.
In-Reply-To: <20180329113207.30674-1-shea@shealevy.com>
References: <20180328203659.18692-1-shea@shealevy.com>
 <20180329113207.30674-1-shea@shealevy.com>
Message-ID: <20180329113207.30674-5-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The generic implementation is functionally identical.

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/c6x/mm/init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/c6x/mm/init.c b/arch/c6x/mm/init.c
index 4cc72b0d1c1d..a11cb657182a 100644
--- a/arch/c6x/mm/init.c
+++ b/arch/c6x/mm/init.c
@@ -66,13 +66,6 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 }
 
-#ifdef CONFIG_BLK_DEV_INITRD
-void __init free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-
 void __init free_initmem(void)
 {
 	free_initmem_default(-1);
-- 
2.16.2
