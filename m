From: jcowgill@debian.org (James Cowgill)
Date: Thu,  6 Sep 2018 22:57:56 +0100
Subject: [PATCH] RISC-V: include linux/ftrace.h in asm-prototypes.h
Message-ID: <20180906215756.28414-1-jcowgill@debian.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Building a riscv kernel with CONFIG_FUNCTION_TRACER and
CONFIG_MODVERSIONS enabled results in these two warnings:

  MODPOST vmlinux.o
WARNING: EXPORT symbol "return_to_handler" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "_mcount" [vmlinux] version generation failed, symbol will not be versioned.

When exporting symbols from an assembly file, the MODVERSIONS code
requires their prototypes to be defined in asm-prototypes.h (see
scripts/Makefile.build). Since both of these symbols have prototypes
defined in linux/ftrace.h, include this header from RISC-V's
asm-prototypes.h.

Reported-by: Karsten Merker <merker@debian.org>
Signed-off-by: James Cowgill <jcowgill@debian.org>
---
 arch/riscv/include/asm/asm-prototypes.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/riscv/include/asm/asm-prototypes.h

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
new file mode 100644
index 000000000000..c9fecd120d18
--- /dev/null
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_PROTOTYPES_H
+
+#include <linux/ftrace.h>
+#include <asm-generic/asm-prototypes.h>
+
+#endif /* _ASM_RISCV_PROTOTYPES_H */
-- 
2.19.0.rc2
