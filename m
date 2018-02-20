From: shea@shealevy.com (Shea Levy)
Date: Tue, 20 Feb 2018 08:57:21 -0500
Subject: [PATCH v2] riscv: Implement free_initrd_mem.
In-Reply-To: <20180220135043.15411-1-shea@shealevy.com>
References: <20180220135043.15411-1-shea@shealevy.com>
Message-ID: <20180220135721.966-1-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

v2: Remove incorrect page alignment.

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/mm/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c77df8142be2..1b6daa5184e0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -66,5 +66,6 @@ void free_initmem(void)
 #ifdef CONFIG_BLK_DEV_INITRD
 void free_initrd_mem(unsigned long start, unsigned long end)
 {
+	free_reserved_area((void *)start, (void *)end, -1, "initrd");
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
-- 
2.16.1
