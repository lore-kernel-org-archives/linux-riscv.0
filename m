From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 11:42:36 -0700
Subject: [PATCH 1/8] RISC-V: Provide a cleaner raw_smp_processor_id()
In-Reply-To: <20180827184243.25344-1-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
Message-ID: <20180827184243.25344-2-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I'm not sure how I managed to miss this the first time, but this is much
better.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/smp.h | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 36016845461d..27fd085188df 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -14,11 +14,6 @@
 #ifndef _ASM_RISCV_SMP_H
 #define _ASM_RISCV_SMP_H
 
-/* This both needs asm-offsets.h and is used when generating it. */
-#ifndef GENERATING_ASM_OFFSETS
-#include <asm/asm-offsets.h>
-#endif
-
 #include <linux/cpumask.h>
 #include <linux/irqreturn.h>
 
@@ -33,13 +28,12 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 /* Hook for the generic smp_call_function_single() routine. */
 void arch_send_call_function_single_ipi(int cpu);
 
-/*
- * This is particularly ugly: it appears we can't actually get the definition
- * of task_struct here, but we need access to the CPU this task is running on.
- * Instead of using C we're using asm-offsets.h to get the current processor
- * ID.
- */
-#define raw_smp_processor_id() (*((int*)((char*)get_current() + TASK_TI_CPU)))
+/* Obtains the hart ID of the currently executing task.  This relies on
+ * THREAD_INFO_IN_TASK, but we define that unconditionally. */
+#ifdef CONFIG_THREAD_INFO_IN_TASK
+#define get_ti()                ((struct thread_info *)get_current())
+#define raw_smp_processor_id()  (get_ti()->cpu)
+#endif
 
 #endif /* CONFIG_SMP */
 
-- 
2.16.4
