From: anup@brainfault.org (Anup Patel)
Date: Tue,  4 Sep 2018 18:15:10 +0530
Subject: [RFC PATCH 1/5] RISC-V: Make IPI triggering flexible
In-Reply-To: <20180904124514.6290-1-anup@brainfault.org>
References: <20180904124514.6290-1-anup@brainfault.org>
Message-ID: <20180904124514.6290-2-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The mechanism to trigger IPI is generally part of interrupt-controller
driver for various architectures. On RISC-V, we have an option to trigger
IPI using SBI or SOC vendor can implement RISC-V CPU where IPI will be
triggered using SOC interrupt-controller (e.g. custom PLIC).

This patch makes IPI triggering flexible by providing a mechanism for
interrupt-controller driver to register IPI trigger function using
set_smp_ipi_trigger() function.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/irq.h |  1 -
 arch/riscv/include/asm/smp.h | 10 ++++++++++
 arch/riscv/kernel/irq.c      | 26 +++++++++++++++++++++-----
 arch/riscv/kernel/smp.c      | 23 +++++++++++++++++++----
 4 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 996b6fbe17a6..93eb75eac4ff 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -18,7 +18,6 @@
 #define NR_IRQS         0
 
 void riscv_timer_interrupt(void);
-void riscv_software_interrupt(void);
 
 #include <asm-generic/irq.h>
 
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 36016845461d..72671580e1d4 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -27,6 +27,16 @@
 /* SMP initialization hook for setup_arch */
 void __init setup_smp(void);
 
+/*
+ * Called from C code, this handles an IPI.
+ */
+void handle_IPI(struct pt_regs *regs);
+
+/*
+ * Provide a function to raise an IPI on CPUs in callmap.
+ */
+void __init set_smp_ipi_trigger(void (*fn)(const struct cpumask *));
+
 /* Hook for the generic smp_call_function_many() routine. */
 void arch_send_call_function_ipi_mask(struct cpumask *mask);
 
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 0cfac48a1272..5532e7cedaec 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -9,6 +9,8 @@
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 
+#include <asm/sbi.h>
+
 /*
  * Possible interrupt causes:
  */
@@ -26,12 +28,15 @@
 
 asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
 {
-	struct pt_regs *old_regs = set_irq_regs(regs);
+	struct pt_regs *old_regs;
 
-	irq_enter();
 	switch (cause & ~INTERRUPT_CAUSE_FLAG) {
 	case INTERRUPT_CAUSE_TIMER:
+		old_regs = set_irq_regs(regs);
+		irq_enter();
 		riscv_timer_interrupt();
+		irq_exit();
+		set_irq_regs(old_regs);
 		break;
 #ifdef CONFIG_SMP
 	case INTERRUPT_CAUSE_SOFTWARE:
@@ -39,21 +44,32 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
 		 * We only use software interrupts to pass IPIs, so if a non-SMP
 		 * system gets one, then we don't know what to do.
 		 */
-		riscv_software_interrupt();
+		handle_IPI(regs);
 		break;
 #endif
 	case INTERRUPT_CAUSE_EXTERNAL:
+		old_regs = set_irq_regs(regs);
+		irq_enter();
 		handle_arch_irq(regs);
+		irq_exit();
+		set_irq_regs(old_regs);
 		break;
 	default:
 		panic("unexpected interrupt cause");
 	}
-	irq_exit();
+}
 
-	set_irq_regs(old_regs);
+#ifdef CONFIG_SMP
+static void smp_ipi_trigger_sbi(const struct cpumask *to_whom)
+{
+	sbi_send_ipi(cpumask_bits(to_whom));
 }
+#endif
 
 void __init init_IRQ(void)
 {
 	irqchip_init();
+#ifdef CONFIG_SMP
+	set_smp_ipi_trigger(smp_ipi_trigger_sbi);
+#endif
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 906fe21ea21b..04571d77eceb 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -38,17 +38,19 @@ enum ipi_message_type {
 	IPI_MAX
 };
 
-
 /* Unsupported */
 int setup_profiling_timer(unsigned int multiplier)
 {
 	return -EINVAL;
 }
 
-void riscv_software_interrupt(void)
+void handle_IPI(struct pt_regs *regs)
 {
+	struct pt_regs *old_regs = set_irq_regs(regs);
 	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
 
+	irq_enter();
+
 	/* Clear pending IPI */
 	csr_clear(sip, SIE_SSIE);
 
@@ -60,7 +62,7 @@ void riscv_software_interrupt(void)
 
 		ops = xchg(pending_ipis, 0);
 		if (ops == 0)
-			return;
+			goto done;
 
 		if (ops & (1 << IPI_RESCHEDULE))
 			scheduler_ipi();
@@ -73,6 +75,17 @@ void riscv_software_interrupt(void)
 		/* Order data access and bit testing. */
 		mb();
 	}
+
+done:
+	irq_exit();
+	set_irq_regs(old_regs);
+}
+
+static void (*__smp_ipi_trigger)(const struct cpumask *);
+
+void __init set_smp_ipi_trigger(void (*fn)(const struct cpumask *))
+{
+	__smp_ipi_trigger = fn;
 }
 
 static void
@@ -85,7 +98,9 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
 		set_bit(operation, &ipi_data[i].bits);
 
 	mb();
-	sbi_send_ipi(cpumask_bits(to_whom));
+
+	if (__smp_ipi_trigger)
+		__smp_ipi_trigger(to_whom);
 }
 
 void arch_send_call_function_ipi_mask(struct cpumask *mask)
-- 
2.17.1
