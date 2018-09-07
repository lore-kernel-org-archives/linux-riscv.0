From: anup@brainfault.org (Anup Patel)
Date: Fri,  7 Sep 2018 18:14:29 +0530
Subject: [PATCH] RISC-V: Show IPI stats
Message-ID: <20180907124429.31407-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch provides arch_show_interrupts() implementation to
show IPI stats via /proc/interrupts.

Now the contents of /proc/interrupts" will look like below:
           CPU0       CPU1       CPU2       CPU3
  8:         17          7          6         14  SiFive PLIC   8  virtio0
 10:         10         10          9         11  SiFive PLIC  10  ttyS0
IPI0:       170        673        251         79  Rescheduling interrupts
IPI1:         1         12         27          1  Function call interrupts
IPI2:         0          0          0          0  CPU wake-up interrupts

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/smp.h |  5 +++++
 arch/riscv/kernel/irq.c      |  9 +++++++++
 arch/riscv/kernel/smp.c      | 30 ++++++++++++++++++++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 8145b8657d20..a87e292becba 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -48,6 +48,11 @@ enum ipi_message_type {
 void send_ipi_message(const struct cpumask *to_whom,
 		      enum ipi_message_type operation);
 
+struct seq_file;
+
+/* print IPI stats */
+void show_ipi_stats(struct seq_file *p, int prec);
+
 /* SMP initialization hook for setup_arch */
 void __init setup_smp(void);
 
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7e14b0d9a71d..9177552cd76c 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/seq_file.h>
 
 /*
  * Possible interrupt causes:
@@ -24,6 +25,14 @@
  */
 #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
 
+int arch_show_interrupts(struct seq_file *p, int prec)
+{
+#ifdef CONFIG_SMP
+	show_ipi_stats(p, prec);
+#endif
+	return 0;
+}
+
 asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 629456bb6122..4e67a690edbc 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -22,6 +22,7 @@
 #include <linux/interrupt.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/seq_file.h>
 
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
@@ -29,6 +30,7 @@
 
 /* A collection of single bit ipi messages.  */
 static struct {
+	unsigned long stats[IPI_MAX] ____cacheline_aligned;
 	unsigned long bits ____cacheline_aligned;
 } ipi_data[NR_CPUS] __cacheline_aligned;
 
@@ -61,6 +63,7 @@ int setup_profiling_timer(unsigned int multiplier)
 void riscv_software_interrupt(void)
 {
 	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
+	unsigned long *stats = ipi_data[smp_processor_id()].stats;
 
 	/* Clear pending IPI */
 	csr_clear(sip, SIE_SSIE);
@@ -75,11 +78,15 @@ void riscv_software_interrupt(void)
 		if (ops == 0)
 			return;
 
-		if (ops & (1 << IPI_RESCHEDULE))
+		if (ops & (1 << IPI_RESCHEDULE)) {
+			stats[IPI_RESCHEDULE]++;
 			scheduler_ipi();
+		}
 
-		if (ops & (1 << IPI_CALL_FUNC))
+		if (ops & (1 << IPI_CALL_FUNC)) {
+			stats[IPI_CALL_FUNC]++;
 			generic_smp_call_function_interrupt();
+		}
 
 		BUG_ON((ops >> IPI_MAX) != 0);
 
@@ -105,6 +112,25 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 	sbi_send_ipi(cpumask_bits(&hartid_mask));
 }
 
+static const char *ipi_names[IPI_MAX] = {
+	[IPI_RESCHEDULE] = "Rescheduling interrupts",
+	[IPI_CALL_FUNC] = "Function call interrupts",
+	[IPI_CALL_WAKEUP] = "CPU wake-up interrupts",
+};
+
+void show_ipi_stats(struct seq_file *p, int prec)
+{
+	unsigned int cpu, i;
+
+	for (i = 0; i < IPI_MAX; i++) {
+		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
+			   prec >= 4 ? " " : "");
+		for_each_online_cpu(cpu)
+			seq_printf(p, "%10lu ", ipi_data[cpu].stats[i]);
+		seq_printf(p, " %s\n", ipi_names[i]);
+	}
+}
+
 void arch_send_call_function_ipi_mask(struct cpumask *mask)
 {
 	send_ipi_message(mask, IPI_CALL_FUNC);
-- 
2.17.1
