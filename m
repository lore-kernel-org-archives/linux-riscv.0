From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon,  5 Nov 2018 15:35:37 +0100
Subject: [PATCH] riscv: add missing vdso_install target
Message-ID: <20181105143537.27396-1-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Building kernel 4.20 for Fedora as RPM fails, because riscv is missing
vdso_install target in arch/riscv/Makefile.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d10146197533..4af153a182b0 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -77,4 +77,8 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
 
 libs-y += arch/riscv/lib/
 
+PHONY += vdso_install
+vdso_install:
+	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
+
 all: vmlinux
-- 
2.19.1
