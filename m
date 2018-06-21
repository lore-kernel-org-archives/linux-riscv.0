From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:41:41 +0800
Subject: [PATCH 1/5] RISC-V: Add conditional macro for zone of DMA32
In-Reply-To: <cover.1529506497.git.zong@andestech.com>
References: <cover.1529506497.git.zong@andestech.com>
Message-ID: <79dba59ab02752b260cb31f557a09df786fd80d7.1529506497.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The DMA32 is for 64-bit usage.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/mm/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c77df8142be2..91a5852e28fd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -28,8 +28,11 @@ static void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
 
+#ifdef CONFIG_ZONE_DMA32
 	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G, max_low_pfn));
+#else
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+#endif
 
 	free_area_init_nodes(max_zone_pfns);
 }
-- 
2.16.1
