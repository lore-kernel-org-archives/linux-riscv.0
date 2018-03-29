From: shea@shealevy.com (Shea Levy)
Date: Thu, 29 Mar 2018 07:32:00 -0400
Subject: [PATCH v5 09/16] m68k: Switch to generic free_initrd_mem.
In-Reply-To: <20180329113207.30674-1-shea@shealevy.com>
References: <20180328203659.18692-1-shea@shealevy.com>
 <20180329113207.30674-1-shea@shealevy.com>
Message-ID: <20180329113207.30674-9-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The generic implementation is functionally identical.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/m68k/mm/init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index e85acd131fa8..e20bef09258c 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -172,10 +172,3 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 	print_memmap();
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-- 
2.16.2
