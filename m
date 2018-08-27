From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 11:42:38 -0700
Subject: [PATCH 3/8] RISC-V: Rename riscv_of_processor_hart to
 riscv_of_processor_hartid
In-Reply-To: <20180827184243.25344-1-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
Message-ID: <20180827184243.25344-4-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

It's a bit confusing exactly what this function does: it actually
returns the hartid of an OF processor node, failing with -1 on invalid
nodes.  I've changed the name to _hartid() in order to make that a bit
more clear, as well as adding a comment.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/processor.h | 4 +++-
 arch/riscv/kernel/cpu.c            | 2 +-
 arch/riscv/kernel/smpboot.c        | 2 +-
 drivers/clocksource/riscv_timer.c  | 2 +-
 drivers/irqchip/irq-sifive-plic.c  | 2 +-
 5 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 3fe4af8147d2..9d32670d84a4 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -88,7 +88,9 @@ static inline void wait_for_interrupt(void)
 }
 
 struct device_node;
-extern int riscv_of_processor_hart(struct device_node *node);
+/* Returns the hart ID of the given device tree node, or -1 if the device tree
+ * node isn't a RISC-V hart. */
+extern int riscv_of_processor_hartid(struct device_node *node);
 
 extern void riscv_fill_hwcap(void);
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ca6c81e54e37..19e98c1710dd 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -16,7 +16,7 @@
 #include <linux/of.h>
 
 /* Return -1 if not a valid hart */
-int riscv_of_processor_hart(struct device_node *node)
+int riscv_of_processor_hartid(struct device_node *node)
 {
 	const char *isa, *status;
 	u32 hart;
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 56abab6a9812..5f29f8562cf6 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -53,7 +53,7 @@ void __init setup_smp(void)
 	int hart, im_okay_therefore_i_am = 0;
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
-		hart = riscv_of_processor_hart(dn);
+		hart = riscv_of_processor_hartid(dn);
 		if (hart >= 0) {
 			set_cpu_possible(hart, true);
 			set_cpu_present(hart, true);
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
index 4e8b347e43e2..ad7453fc3129 100644
--- a/drivers/clocksource/riscv_timer.c
+++ b/drivers/clocksource/riscv_timer.c
@@ -84,7 +84,7 @@ void riscv_timer_interrupt(void)
 
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
-	int cpu_id = riscv_of_processor_hart(n), error;
+	int cpu_id = riscv_of_processor_hartid(n), error;
 	struct clocksource *cs;
 
 	if (cpu_id != smp_processor_id())
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 532e9d68c704..c55eaa31cde2 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -176,7 +176,7 @@ static int plic_find_hart_id(struct device_node *node)
 {
 	for (; node; node = node->parent) {
 		if (of_device_is_compatible(node, "riscv"))
-			return riscv_of_processor_hart(node);
+			return riscv_of_processor_hartid(node);
 	}
 
 	return -1;
-- 
2.16.4
