From: zongbox@gmail.com (Zong Li)
Date: Wed,  3 Oct 2018 11:09:59 +0800
Subject: [PATCH v4 2/5] RISC-V: Add preprocessor directive for swiotlb
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
Message-ID: <0aaabb05426a360f71cbc7a910e2c613d3a3891c.1538535528.git.zongbox@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On RV32, it doesn't select the SWIOTLB, only RV64 support swiotlb now.

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
