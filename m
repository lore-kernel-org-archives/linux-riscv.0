From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 11 Sep 2018 13:05:33 -0700
Subject: [PATCH v4 06/12] RISC-V: Provide a cleaner raw_smp_processor_id()
In-Reply-To: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
References: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1536696339-15204-7-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Palmer Dabbelt <palmer@sifive.com>

I'm not sure how I managed to miss this the first time, but this is much
better.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: code comment formatting and other fixes]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/smp.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 36016845..85d7619e 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -14,13 +14,9 @@
 #ifndef _ASM_RISCV_SMP_H
 #define _ASM_RISCV_SMP_H
 
-/* This both needs asm-offsets.h and is used when generating it. */
-#ifndef GENERATING_ASM_OFFSETS
-#include <asm/asm-offsets.h>
-#endif
-
 #include <linux/cpumask.h>
 #include <linux/irqreturn.h>
+#include <linux/thread_info.h>
 
 #ifdef CONFIG_SMP
 
@@ -34,12 +30,10 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 void arch_send_call_function_single_ipi(int cpu);
 
 /*
- * This is particularly ugly: it appears we can't actually get the definition
- * of task_struct here, but we need access to the CPU this task is running on.
- * Instead of using C we're using asm-offsets.h to get the current processor
- * ID.
+ * Obtains the hart ID of the currently executing task.  This relies on
+ * THREAD_INFO_IN_TASK, but we define that unconditionally.
  */
-#define raw_smp_processor_id() (*((int*)((char*)get_current() + TASK_TI_CPU)))
+#define raw_smp_processor_id() (current_thread_info()->cpu)
 
 #endif /* CONFIG_SMP */
 
-- 
2.7.4
