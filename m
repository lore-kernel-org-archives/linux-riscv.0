From: zong@andestech.com (Zong Li)
Date: Thu, 21 Jun 2018 09:39:15 +0800
Subject: [PATCH] RISC-V: Add conditional macro for boot_sec_cpu
Message-ID: <1529545155-26172-1-git-send-email-zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Fix link error when disable support SMP.
It causes the undefined reference to `smp_callin'.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3b6293f10e3e..396ec7b349ce 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -152,6 +152,7 @@ END(_start)
 .section .text
 .global boot_sec_cpu
 
+#ifdef CONFIG_HOTPLUG_CPU
 boot_sec_cpu:
 	/* clear all pending flags */
 	csrw sip, zero
@@ -160,6 +161,7 @@ boot_sec_cpu:
 	fence
 
 	tail smp_callin
+#endif
 
 __PAGE_ALIGNED_BSS
 	/* Empty zero page */
-- 
2.16.1
