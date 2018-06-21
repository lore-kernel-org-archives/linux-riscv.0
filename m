From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:41:46 +0800
Subject: [PATCH 5/5] RISC-V: Use fixed width integer types for 32-bit
 compatible
In-Reply-To: <cover.1529506497.git.zong@andestech.com>
References: <cover.1529506497.git.zong@andestech.com>
Message-ID: <37a6523947397cd72320676030b96926e373d05a.1529506497.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Use fixed width integer types for print format on 32/64 bit
to fix warning about format compatible.

Like inttypes.h, but more simpler for RISC-V usage.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/include/asm/format.h | 20 ++++++++++++++++++++
 arch/riscv/kernel/module.c      | 13 +++++++------
 2 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/format.h

diff --git a/arch/riscv/include/asm/format.h b/arch/riscv/include/asm/format.h
new file mode 100644
index 000000000000..9b68ca7fac46
--- /dev/null
+++ b/arch/riscv/include/asm/format.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2018 Andes Technology Corporation */
+
+#ifndef _ASM_RISCV_FORMAT_H
+#define _ASM_RISCV_FORMAT_H
+
+#if __riscv_xlen == 64
+#define __PRI_PREFIX	"ll"
+#else
+#define __PRI_PREFIX
+#endif
+
+#define PRIdX	__PRI_PREFIX "d"
+#define PRIiX	__PRI_PREFIX "i"
+#define PRIuX	__PRI_PREFIX "u"
+#define PRIoX	__PRI_PREFIX "o"
+#define PRIxX	__PRI_PREFIX "x"
+#define PRIXX	__PRI_PREFIX "X"
+
+#endif /* _ASM_RISCV_FORMAT_H */
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index c88d2ee918a5..039f755ff3e3 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -18,11 +18,12 @@
 #include <linux/moduleloader.h>
 #include <linux/vmalloc.h>
 #include <asm/pgtable.h>
+#include <asm/format.h>
 
 static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
 {
 	if (v != (u32)v) {
-		pr_err("%s: value %016llx out of range for 32-bit field\n",
+		pr_err("%s: value %016" PRIxX "out of range for 32-bit field\n",
 		       me->name, v);
 		return -EINVAL;
 	}
@@ -103,7 +104,7 @@ static int apply_r_riscv_pcrel_hi20_rela(struct module *me, u32 *location,
 
 	if (offset != (s32)offset) {
 		pr_err(
-		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
+		  "%s: target %016" PRIxX "can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, v, location);
 		return -EINVAL;
 	}
@@ -145,7 +146,7 @@ static int apply_r_riscv_hi20_rela(struct module *me, u32 *location,
 
 	if (IS_ENABLED(CMODEL_MEDLOW)) {
 		pr_err(
-		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
+		  "%s: target %016" PRIxX "can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, v, location);
 		return -EINVAL;
 	}
@@ -189,7 +190,7 @@ static int apply_r_riscv_got_hi20_rela(struct module *me, u32 *location,
 		offset = (void *)offset - (void *)location;
 	} else {
 		pr_err(
-		  "%s: can not generate the GOT entry for symbol = %016llx from PC = %p\n",
+		  "%s: can not generate the GOT entry for symbol = %016" PRIxX "from PC = %p\n",
 		  me->name, v, location);
 		return -EINVAL;
 	}
@@ -213,7 +214,7 @@ static int apply_r_riscv_call_plt_rela(struct module *me, u32 *location,
 			offset = (void *)offset - (void *)location;
 		} else {
 			pr_err(
-			  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
+			  "%s: target %016" PRIxX "can not be addressed by the 32-bit offset from PC = %p\n",
 			  me->name, v, location);
 			return -EINVAL;
 		}
@@ -235,7 +236,7 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
 
 	if (offset != fill_v) {
 		pr_err(
-		  "%s: target %016llx can not be addressed by the 32-bit offset from PC = %p\n",
+		  "%s: target %016" PRIxX "can not be addressed by the 32-bit offset from PC = %p\n",
 		  me->name, v, location);
 		return -EINVAL;
 	}
-- 
2.16.1
