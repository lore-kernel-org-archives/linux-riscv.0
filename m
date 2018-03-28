From: shea@shealevy.com (Shea Levy)
Date: Wed, 28 Mar 2018 16:36:45 -0400
Subject: [PATCH v4 02/16] riscv: Use generic free_initrd_mem.
In-Reply-To: <20180328203659.18692-1-shea@shealevy.com>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
Message-ID: <20180328203659.18692-3-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

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
