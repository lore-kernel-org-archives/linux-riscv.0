From: zongbox@gmail.com (Zong Li)
Date: Tue,  2 Oct 2018 16:52:28 +0800
Subject: [PATCH v3 2/5] RISC-V: Use swiotlb on RV64 only
In-Reply-To: <cover.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
Message-ID: <a2ae9d4b7cd1d97cafe8161ec28f46e4a7968776.1538470103.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Only RV64 supports swiotlb. On RV32, it don't select the SWIOTLB.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index aee6031..6de6584 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -227,7 +227,10 @@ void __init setup_arch(char **cmdline_p)
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
+
+#ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
+#endif
 
 #ifdef CONFIG_SMP
 	setup_smp();
-- 
2.7.4
