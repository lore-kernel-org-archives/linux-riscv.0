From: zong@andestech.com (Zong Li)
Date: Thu, 2 Aug 2018 23:22:56 +0800
Subject: [PATCH] RISC-V: Add preprocessor directives for boot_sec_cpu
Message-ID: <1533223376-10130-1-git-send-email-zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The boot_sec_cpu is for hutplug CPU on SMP system. It should
be conditional compiling. Otherwise, it causes undefined reference
to `smp_callin' when compiling uniprocessor kernel.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 11066d5..9b6f601 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -154,6 +154,7 @@ END(_start)
 .section .text
 .global boot_sec_cpu
 
+#ifdef CONFIG_HOTPLUG_CPU
 boot_sec_cpu:
 	/* clear all pending flags */
 	csrw sip, zero
@@ -162,6 +163,7 @@ boot_sec_cpu:
 	fence
 
 	tail smp_callin
+#endif
 
 __PAGE_ALIGNED_BSS
 	/* Empty zero page */
-- 
2.7.4
