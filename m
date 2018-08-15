From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 15 Aug 2018 16:56:13 -0700
Subject: [RFC PATCH 1/5] RISC-V: Add logical CPU indexing for RISC-V
In-Reply-To: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1534377377-70108-2-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Currently, both linux cpu id and hardware cpu id are same.
This is not recommended as it will lead to discontinuous cpu
indexing in Linux. Moreover, kdump kernel will run from CPU0
which would be absent if we follow existing scheme.

Implement a logical mapping between Linux cpu id and hardware
cpuid to decouple these two. Always mark the boot processor as
cpu0 and all other cpus get the logical cpu id based on their
booting order.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/smp.h | 17 ++++++++++++++++-
 arch/riscv/kernel/setup.c    |  2 ++
 arch/riscv/kernel/smp.c      | 19 +++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 36016845..0763337b 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -22,6 +22,12 @@
 #include <linux/cpumask.h>
 #include <linux/irqreturn.h>
 
+/*
+ * Mapping between linux logical cpu index and hartid.
+ */
+extern u64 __cpu_logical_map[NR_CPUS];
+#define cpu_logical_map(cpu)    __cpu_logical_map[cpu]
+
 #ifdef CONFIG_SMP
 
 /* SMP initialization hook for setup_arch */
@@ -33,6 +39,8 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 /* Hook for the generic smp_call_function_single() routine. */
 void arch_send_call_function_single_ipi(int cpu);
 
+int riscv_hartid_to_cpuid(int hartid);
+void cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
 /*
  * This is particularly ugly: it appears we can't actually get the definition
  * of task_struct here, but we need access to the CPU this task is running on.
@@ -41,6 +49,13 @@ void arch_send_call_function_single_ipi(int cpu);
  */
 #define raw_smp_processor_id() (*((int*)((char*)get_current() + TASK_TI_CPU)))
 
-#endif /* CONFIG_SMP */
+#else
+
+static inline int riscv_hartid_to_cpuid(int hartid) { return 0 ; }
+static inline void cpuid_to_hartid_mask(const struct cpumask *in,
+				       struct cpumask *out) {
+	cpumask_set_cpu(cpu_logical_map(0), out);
+}
 
+#endif /* CONFIG_SMP */
 #endif /* _ASM_RISCV_SMP_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index db20dc63..e21ed481 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -82,6 +82,8 @@ EXPORT_SYMBOL(empty_zero_page);
 /* The lucky hart to first increment this variable will boot the other cores */
 atomic_t hart_lottery;
 
+u64 __cpu_logical_map[NR_CPUS];
+
 #ifdef CONFIG_BLK_DEV_INITRD
 static void __init setup_initrd(void)
 {
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 906fe21e..d55379ee 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -38,7 +38,26 @@ enum ipi_message_type {
 	IPI_MAX
 };
 
+int riscv_hartid_to_cpuid(int hartid)
+{
+	int i = -1;
+
+	for (i = 0; i < NR_CPUS; i++)
+		if (cpu_logical_map(i) == hartid)
+			return i;
+
+	pr_err("Couldn't find cpu id for hartid [%d]\n", hartid);
+	BUG();
+	return i;
+}
 
+void cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
+{
+	int cpu;
+
+	for_each_cpu(cpu, in)
+		cpumask_set_cpu(cpu_logical_map(cpu), out);
+}
 /* Unsupported */
 int setup_profiling_timer(unsigned int multiplier)
 {
-- 
2.7.4
