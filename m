From: zong@andestech.com (Zong Li)
Date: Mon, 25 Jun 2018 16:49:37 +0800
Subject: [PATCH v2 1/4] RISC-V: Add conditional macro for zone of DMA32
In-Reply-To: <cover.1529915117.git.zong@andestech.com>
References: <cover.1529915117.git.zong@andestech.com>
Message-ID: <3d8fcfce1e99fe1f07c11b535319164ee2511c02.1529915117.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The DMA32 is for 64-bit usage.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c77df8142be2..58a522f9bcc3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -28,7 +28,9 @@ static void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
 
+#ifdef CONFIG_ZONE_DMA32
 	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G, max_low_pfn));
+#endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 
 	free_area_init_nodes(max_zone_pfns);
-- 
2.16.1
