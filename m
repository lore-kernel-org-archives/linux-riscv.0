From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Thu, 31 May 2018 17:42:01 +0200
Subject: [PATCH] riscv: add riscv-specific predefines to CHECKFLAGS
Message-ID: <20180531154201.48618-1-luc.vanoostenryck@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

RISC-V uses the macro __riscv_xlen, predefined by GCC, to
make the distinction between 32 or 64 bit code.

However, sparse doesn't know anything about this macro
which lead to wrong warnings and failures.

Fix this by adding a define of __riscv_xlen to CHECKFLAGS
and add one for __riscv too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/riscv/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 76e958a54..6d4a5f6c3 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -71,6 +71,9 @@ KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 # architectures.  It's faster to have GCC emit only aligned accesses.
 KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
 
+# arch specific predefines for sparse
+CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
+
 head-y := arch/riscv/kernel/head.o
 
 core-y += arch/riscv/kernel/ arch/riscv/mm/
-- 
2.17.1
