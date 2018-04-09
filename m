From: shea@shealevy.com (Shea Levy)
Date: Mon,  9 Apr 2018 08:58:00 -0400
Subject: [PATCH] RISC-V: Load modules within relative jump range of the kernel
 text.
Message-ID: <20180409125800.5000-1-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---

Note that this patch worked in my old modules patchset and seems to be
working now, but my kernel boot locks up on top of
riscv-for-linus-4.17-mw0 and I don't know if it's due to this patch or
something else that's changed in the mean time.

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
index 5dddba301d0a..1b382c7de095 100644
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
@@ -382,3 +384,12 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 
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
2.16.2
