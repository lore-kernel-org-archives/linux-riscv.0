From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 17 Sep 2018 07:35:50 -0700
Subject: [RFC 3/3] RISC-V: Remove per cpu clocksource
In-Reply-To: <1536962096-233842-4-git-send-email-atish.patra@wdc.com>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-4-git-send-email-atish.patra@wdc.com>
Message-ID: <20180917143550.GC15588@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

I think only having one clocksource is indeed the right thing.

But that makes the whole TIMER_OF_DECLARE for each hart (cpu core for
those not RISC-V savvy) even more questionable than it already is.

I think we should just initialize the clocksource directly as it is
architectually guaranteed to exist.  Below is a completely untested
(not even compiled) version of your patch that does what I think
we should be doing here.  But I'd rather hear from more timer and/or
DT savvy folks before proceeding.

diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 4e8b347e43e2..2fe497c67283 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -48,7 +48,7 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
 	return get_cycles64();
 }
 
-static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
+static struct clocksource, riscv_clocksource = {
 	.name		= "riscv_clocksource",
 	.rating		= 300,
 	.mask		= CLOCKSOURCE_MASK(BITS_PER_LONG),
@@ -82,24 +82,16 @@ void riscv_timer_interrupt(void)
 	evdev->event_handler(evdev);
 }
 
-static int __init riscv_timer_init_dt(struct device_node *n)
+static int __init riscv_timer_init(void)
 {
-	int cpu_id = riscv_of_processor_hart(n), error;
-	struct clocksource *cs;
-
-	if (cpu_id != smp_processor_id())
-		return 0;
-
-	cs = per_cpu_ptr(&riscv_clocksource, cpu_id);
-	clocksource_register_hz(cs, riscv_timebase);
+	int error;
 
+	clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
 	if (error)
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpu_id);
+		pr_err("RISCV timer register failed: %d.\n", error);
 	return error;
 }
-
-TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+core_initcall(riscv_timer_init);
