From: shea@shealevy.com (Shea Levy)
Date: Tue, 20 Feb 2018 08:50:43 -0500
Subject: [PATCH] riscv: Implement free_initrd_mem.
Message-ID: <20180220135043.15411-1-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/mm/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c77df8142be2..1c832b541e95 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -66,5 +66,11 @@ void free_initmem(void)
 #ifdef CONFIG_BLK_DEV_INITRD
 void free_initrd_mem(unsigned long start, unsigned long end)
 {
+	if (start == initrd_start)
+		start = round_down(start, PAGE_SIZE);
+	if (end == initrd_end)
+		end = round_up(end, PAGE_SIZE);
+
+	free_reserved_area((void *)start, (void *)end, -1, "initrd");
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
-- 
2.16.1
