From: anup@brainfault.org (Anup Patel)
Date: Thu,  6 Sep 2018 18:06:50 +0530
Subject: [PATCH v2 4/5] clocksource: riscv_timer: Make timer interrupt as a
 per-CPU interrupt
In-Reply-To: <20180906123651.28500-1-anup@brainfault.org>
References: <20180906123651.28500-1-anup@brainfault.org>
Message-ID: <20180906123651.28500-5-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Instead of directly calling RISC-V timer interrupt handler from
RISC-V local interrupt conntroller driver, this patch implements
RISC-V timer interrupt as a per-CPU interrupt using per-CPU APIs
of Linux IRQ subsystem.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/irq.h      |  1 -
 drivers/clocksource/riscv_timer.c | 78 ++++++++++++++++++++++++-------
 drivers/irqchip/irq-riscv-intc.c  |  8 ----
 3 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 2ad610802689..11c6dd365643 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -30,7 +30,6 @@
  */
 #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
 
-void riscv_timer_interrupt(void);
 void wait_for_software_interrupt(void);
 
 #include <asm-generic/irq.h>
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 084e97dc10ed..c7ac60a82754 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -3,12 +3,17 @@
  * Copyright (C) 2012 Regents of the University of California
  * Copyright (C) 2017 SiFive
  */
+#define pr_fmt(fmt) "riscv-timer: " fmt
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
-#include <asm/smp.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/sched_clock.h>
 #include <asm/sbi.h>
 
 /*
@@ -32,6 +37,7 @@ static int riscv_clock_next_event(unsigned long delta,
 	return 0;
 }
 
+static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
 	.features		= CLOCK_EVT_FEAT_ONESHOT,
@@ -39,6 +45,11 @@ static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.set_next_event		= riscv_clock_next_event,
 };
 
+static u64 riscv_sched_clock(void)
+{
+	return get_cycles64();
+}
+
 /*
  * It is guaranteed that all the timers across all the harts are synchronized
  * within one tick of each other, so while this could technically go
@@ -49,7 +60,7 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
 	return get_cycles64();
 }
 
-static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
+static struct clocksource riscv_clocksource = {
 	.name		= "riscv_clocksource",
 	.rating		= 300,
 	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
@@ -62,48 +73,81 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
 
 	ce->cpumask = cpumask_of(cpu);
+	ce->irq = riscv_clock_event_irq;
 	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
 
-	csr_set(sie, SIE_STIE);
+	enable_percpu_irq(riscv_clock_event_irq, IRQ_TYPE_NONE);
 	return 0;
 }
 
 static int riscv_timer_dying_cpu(unsigned int cpu)
 {
-	csr_clear(sie, SIE_STIE);
+	disable_percpu_irq(riscv_clock_event_irq);
 	return 0;
 }
 
-/* called directly from the low-level interrupt handler */
-void riscv_timer_interrupt(void)
+static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
 
 	csr_clear(sie, SIE_STIE);
 	evdev->event_handler(evdev);
+
+	return IRQ_HANDLED;
 }
 
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
-	int cpuid, hartid, error;
-	struct clocksource *cs;
+	int error;
+	struct irq_domain *domain;
+	struct of_phandle_args oirq;
+
+	/*
+	 * Either we have one INTC DT node under each CPU DT node
+	 * or a single system wide INTC DT node. Irrespective to
+	 * number of INTC DT nodes, we only proceed if we are able
+	 * to find irq_domain of INTC.
+	 *
+	 * Once we have INTC irq_domain, we create mapping for timer
+	 * interrupt HWIRQ and request_percpu_irq() on it.
+	 */
+
+	if (riscv_clock_event_irq)
+		return 0;
 
-	hartid = riscv_of_processor_hartid(n);
-	cpuid = riscv_hartid_to_cpuid(hartid);
+	oirq.np = n;
+	oirq.args_count = 1;
+	oirq.args[0] = INTERRUPT_CAUSE_TIMER;
 
-	if (cpuid != smp_processor_id())
-		return 0;
+	domain = irq_find_host(oirq.np);
+	if (!domain)
+		return -ENODEV;
 
-	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
-	clocksource_register_hz(cs, riscv_timebase);
+	riscv_clock_event_irq = irq_create_of_mapping(&oirq);
+	if (!riscv_clock_event_irq)
+		return -ENODEV;
+
+	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
+	sched_clock_register(riscv_sched_clock,
+			     BITS_PER_LONG, riscv_timebase);
+
+	error = request_percpu_irq(riscv_clock_event_irq,
+				   riscv_timer_interrupt,
+				   "riscv_timer", &riscv_clock_event);
+	if (error)
+		return error;
 
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
 	if (error)
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("RISCV timer register failed error %d\n", error);
+
+	pr_info("running at %lu.%02luMHz frequency\n",
+		(unsigned long)riscv_timebase / 1000000,
+		(unsigned long)(riscv_timebase / 10000) % 100);
+
 	return error;
 }
 
-TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+TIMER_OF_DECLARE(riscv_timer, "riscv,cpu-intc", riscv_timer_init_dt);
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 7dea2297daaa..259524145b1f 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -21,20 +21,12 @@ static atomic_t intc_init = ATOMIC_INIT(0);
 
 static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 {
-	struct pt_regs *old_regs;
 	unsigned long cause = regs->scause & ~INTERRUPT_CAUSE_FLAG;
 
 	if (unlikely(cause >= BITS_PER_LONG))
 		panic("unexpected interrupt cause");
 
 	switch (cause) {
-	case INTERRUPT_CAUSE_TIMER:
-		old_regs = set_irq_regs(regs);
-		irq_enter();
-		riscv_timer_interrupt();
-		irq_exit();
-		set_irq_regs(old_regs);
-		break;
 #ifdef CONFIG_SMP
 	case INTERRUPT_CAUSE_SOFTWARE:
 		/*
-- 
2.17.1
