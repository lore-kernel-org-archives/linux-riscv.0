From: anup@brainfault.org (Anup Patel)
Date: Thu,  6 Sep 2018 18:06:47 +0530
Subject: [PATCH v2 1/5] RISC-V: self-contained IPI handling routine
In-Reply-To: <20180906123651.28500-1-anup@brainfault.org>
References: <20180906123651.28500-1-anup@brainfault.org>
Message-ID: <20180906123651.28500-2-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Currently, the IPI handling routine riscv_software_interrupt() does
not take any argument and also does not perform irq_enter()/irq_exit().

This patch makes IPI handling routine more self-contained by:
1. Passing "pt_regs *" argument
2. Explicitly doing irq_enter()/irq_exit()
3. Explicitly save/restore "pt_regs *" using set_irq_regs()

With above changes, IPI handling routine does not depend on caller
function to perform irq_enter()/irq_exit() and save/restore of
"pt_regs *" hence its more self-contained. This also enables us
to call IPI handling routine from IRQCHIP drivers.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/irq.h |  1 -
 arch/riscv/include/asm/smp.h |  3 +++
 arch/riscv/kernel/irq.c      | 16 ++++++++++------
 arch/riscv/kernel/smp.c      | 11 +++++++++--
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index a873a72d0f00..8d5d1a9f7fae 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -18,7 +18,6 @@
 #define NR_IRQS         0
 
 void riscv_timer_interrupt(void);
-void riscv_software_interrupt(void);
 void wait_for_software_interrupt(void);
 
 #include <asm-generic/irq.h>
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 8145b8657d20..d7c3da05f200 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -51,6 +51,9 @@ void send_ipi_message(const struct cpumask *to_whom,
 /* SMP initialization hook for setup_arch */
 void __init setup_smp(void);
 
+/* Called from C code, this handles an IPI. */
+void handle_IPI(struct pt_regs *regs);
+
 /* Hook for the generic smp_call_function_many() routine. */
 void arch_send_call_function_ipi_mask(struct cpumask *mask);
 
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7e14b0d9a71d..f5073dcbc560 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -26,12 +26,15 @@
 
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
@@ -39,18 +42,19 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
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
-
-	set_irq_regs(old_regs);
 }
 
 /*
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 629456bb6122..9e7bcf705946 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -58,10 +58,13 @@ int setup_profiling_timer(unsigned int multiplier)
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
 
@@ -73,7 +76,7 @@ void riscv_software_interrupt(void)
 
 		ops = xchg(pending_ipis, 0);
 		if (ops == 0)
-			return;
+			goto done;
 
 		if (ops & (1 << IPI_RESCHEDULE))
 			scheduler_ipi();
@@ -86,6 +89,10 @@ void riscv_software_interrupt(void)
 		/* Order data access and bit testing. */
 		mb();
 	}
+
+done:
+	irq_exit();
+	set_irq_regs(old_regs);
 }
 
 void
-- 
2.17.1
