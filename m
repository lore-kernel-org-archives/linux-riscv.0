From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:11 -0500
Subject: [PATCH 2/9] RISC-V: Load modules within relative jump range of the
 kernel text.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-3-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/include/asm/pgtable.h |  9 +++++++++
 arch/riscv/kernel/module.c       | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 16301966d65b..b08ded13364a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -25,6 +25,7 @@
 #include <asm/page.h>
 #include <asm/tlbflush.h>
 #include <linux/mm_types.h>
+#include <linux/sizes.h>
 
 #ifdef CONFIG_64BIT
 #include <asm/pgtable-64.h>
@@ -425,6 +426,14 @@ static inline void pgtable_cache_init(void)
 #define TASK_SIZE VMALLOC_START
 #endif
 
+/*
+ * The module space lives between the addresses given by TASK_SIZE
+ * and PAGE_OFFSET - it must be within 2G of the kernel text.
+ */
+#define MODULES_SIZE		(SZ_128M)
+#define MODULES_VADDR		(PAGE_OFFSET - MODULES_SIZE)
+#define MODULES_END		(VMALLOC_END)
+
 #include <asm-generic/pgtable.h>
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index e0f05034fc21..8ad24bdf69de 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -16,6 +16,8 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/moduleloader.h>
+#include <linux/vmalloc.h>
+#include <asm/pgtable.h>
 
 static int apply_r_riscv_64_rela(struct module *me, u32 *location, Elf_Addr v)
 {
@@ -215,3 +217,12 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
 	return 0;
 }
+
+void *module_alloc(unsigned long size)
+{
+	return __vmalloc_node_range(size, 1, MODULES_VADDR,
+				    MODULES_END, GFP_KERNEL,
+				    PAGE_KERNEL_EXEC, 0,
+				    NUMA_NO_NODE,
+				    __builtin_return_address(0));
+}
-- 
2.16.1
