From: shea@shealevy.com (Shea Levy)
Date: Sun,  1 Apr 2018 10:59:16 -0400
Subject: [PATCH v6 02/16] riscv: Free initrds with generic free_initrd_mem.
In-Reply-To: <20180401145931.7932-1-shea@shealevy.com>
References: <20180329113207.30674-1-shea@shealevy.com>
 <20180401145931.7932-1-shea@shealevy.com>
Message-ID: <20180401145931.7932-2-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The first patch in this series added a weakly-defined generic
implementation, which works on RISC-V.

Series boot-tested on RISC-V (which now uses the generic
implementation) and x86_64 (which doesn't).

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/mm/init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c77df8142be2..36f83fe8a726 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -62,9 +62,3 @@ void free_initmem(void)
 {
 	free_initmem_default(0);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
-- 
2.16.2
