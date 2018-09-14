From: atish.patra@wdc.com (Atish Patra)
Date: Fri, 14 Sep 2018 14:54:55 -0700
Subject: [RFC 2/3] RISC-V:Support per-hart timebase-frequency
In-Reply-To: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1536962096-233842-3-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Follow the updated DT specs and read the timebase-frequency
from the boot cpu. Keep the old DT reading as well for backward
compatibility. This patch is rework of old patch from Palmer.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/time.c          |  9 +--------
 drivers/clocksource/riscv_timer.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 1911c8f6..225fe743 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -20,14 +20,7 @@ unsigned long riscv_timebase;
 
 void __init time_init(void)
 {
-	struct device_node *cpu;
-	u32 prop;
-
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	riscv_timebase = prop;
+	timer_probe();
 
 	lpj_fine = riscv_timebase / HZ;
-	timer_probe();
 }
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 084e97dc..335bdb91 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -83,6 +83,21 @@ void riscv_timer_interrupt(void)
 	evdev->event_handler(evdev);
 }
 
+static long __init riscv_timebase_frequency(struct device_node *node)
+{
+	u32 timebase;
+
+	if (!of_property_read_u32(node, "timebase-frequency", &timebase))
+		return timebase;
+
+	/* check under parent "cpus" node */
+	if (!of_property_read_u32(node->parent, "timebase-frequency",
+				  &timebase))
+		return timebase;
+
+	panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+}
+
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
@@ -94,6 +109,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	riscv_timebase = riscv_timebase_frequency(n);
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
 	clocksource_register_hz(cs, riscv_timebase);
 
-- 
2.7.4
