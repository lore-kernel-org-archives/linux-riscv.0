From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Mon, 28 May 2018 18:35:05 +0200
Subject: [PATCH] riscv: pass machine size to sparse
Message-ID: <20180528163505.15698-1-luc.vanoostenryck@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

By default, sparse assumes a 64bit machine when compiled on x86-64
and 32bit when compiled on anything else.

This can of course create all sort of problems when this doesn't
correspond to the target's machine size, like issuing false
warnings like: 'shift too big (32) for type unsigned long' or
is 64bit while sparse was compiled on a 32bit machine, or worse,
to not emit legitimate warnings.

Fix this by passing the appropriate -m32/-m64 flag to sparse.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 arch/riscv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 76e958a54..cb2502e4c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -71,6 +71,8 @@ KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 # architectures.  It's faster to have GCC emit only aligned accesses.
 KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
 
+CHECKFLAGS += -m$(BITS)
+
 head-y := arch/riscv/kernel/head.o
 
 core-y += arch/riscv/kernel/ arch/riscv/mm/
-- 
2.17.0
