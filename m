From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 21 Jun 2018 06:58:54 -0700
Subject: an initial RISC-V Linux 4.18 tree
In-Reply-To: <20180621063014.GA19319@infradead.org>
References: <20180619171444.GA10395@infradead.org>
 <mhng-5d12a1e7-6a25-4918-b086-41adda73d00b@palmer-si-x1c4>
 <20180621063014.GA19319@infradead.org>
Message-ID: <20180621135854.GA362@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

What about just removing the register map comment entirely, and
instead just use ?elf-describing macros for addressing, inspired
by the FreeBSD PLIC driver:

diff --git a/drivers/irqchip/irq-riscv-plic.c b/drivers/irqchip/irq-riscv-plic.c
index 395b8e7c17f4..3b9ada3a6f8a 100644
--- a/drivers/irqchip/irq-riscv-plic.c
+++ b/drivers/irqchip/irq-riscv-plic.c
@@ -35,64 +35,24 @@
 #define MAX_CONTEXTS	15872
 
 /*
- * The PLIC consists of memory-mapped control registers, with a memory map as
- * follows:
- *
- * base + 0x000000: Reserved (interrupt source 0 does not exist)
- * base + 0x000004: Interrupt source 1 priority
- * base + 0x000008: Interrupt source 2 priority
- * ...
- * base + 0x000FFC: Interrupt source 1023 priority
- * base + 0x001000: Pending 0
- * base + 0x001FFF: Pending
- * base + 0x002000: Enable bits for sources 0-31 on context 0
- * base + 0x002004: Enable bits for sources 32-63 on context 0
- * ...
- * base + 0x0020FC: Enable bits for sources 992-1023 on context 0
- * base + 0x002080: Enable bits for sources 0-31 on context 1
- * ...
- * base + 0x002100: Enable bits for sources 0-31 on context 2
- * ...
- * base + 0x1F1F80: Enable bits for sources 992-1023 on context 15871
- * base + 0x1F1F84: Reserved
- * ...              (higher context IDs would fit here, but wouldn't fit
- *                   inside the per-context priority vector)
- * base + 0x1FFFFC: Reserved
- * base + 0x200000: Priority threshold for context 0
- * base + 0x200004: Claim/complete for context 0
- * base + 0x200008: Reserved
- * ...
- * base + 0x200FFC: Reserved
- * base + 0x201000: Priority threshold for context 1
- * base + 0x201004: Claim/complete for context 1
- * ...
- * base + 0xFFE000: Priority threshold for context 15871
- * base + 0xFFE004: Claim/complete for context 15871
- * base + 0xFFE008: Reserved
- * ...
- * base + 0xFFFFFC: Reserved
+ * Each interrupt source has a priority register associated with it.
+ * (although for now we always assign a priority of 0).
  */
-
-/* Each interrupt source has a priority register associated with it. */
-#define PRIORITY_BASE		0
-#define PRIORITY_PER_ID		4
+#define PLIC_PRIORITY(irq)		(0x000000 + (irq) * 0x4)
 
 /*
  * Each hart context has a vector of interrupt enable bits associated with it.
  * There's one bit for each interrupt source.
  */
-#define ENABLE_BASE		0x2000
-#define ENABLE_PER_HART		0x80
+#define PLIC_ENABLE(ctxid, irq)		(0x002000 + (ctxid) * 0x80 + (irq) / 32)
 
 /*
  * Each hart context has a set of control registers associated with it.  Right
  * now there's only two: a source priority threshold over which the hart will
  * take an interrupt, and a register to claim interrupts.
  */
-#define CONTEXT_BASE		0x200000
-#define CONTEXT_PER_HART	0x1000
-#define CONTEXT_THRESHOLD	0
-#define CONTEXT_CLAIM		4
+#define PLIC_THRESHOLD(ctxid)		(0x200000 + (ctxid) * 0x1000 + 0x0)
+#define PLIC_CLAIM(ctxid)		(0x200000 + (ctxid) * 0x1000 + 0x4)
 
 /*
  * PLIC devices are named like 'riscv,plic0,%llx', this is enough space to
@@ -117,32 +77,6 @@ struct plic_data {
 	spinlock_t		lock;
 };
 
-/* Addressing helper functions. */
-static inline u32 __iomem *plic_enable_vector(struct plic_data *data,
-		int contextid)
-{
-	return data->reg + ENABLE_BASE + contextid * ENABLE_PER_HART;
-}
-
-static inline u32 __iomem *plic_priority(struct plic_data *data, int hwirq)
-{
-	return data->reg + PRIORITY_BASE + hwirq * PRIORITY_PER_ID;
-}
-
-static inline u32 __iomem *plic_hart_threshold(struct plic_data *data,
-		int contextid)
-{
-	return data->reg + CONTEXT_BASE + CONTEXT_PER_HART * contextid +
-			CONTEXT_THRESHOLD;
-}
-
-static inline u32 __iomem *plic_hart_claim(struct plic_data *data,
-		int contextid)
-{
-	return data->reg + CONTEXT_BASE + CONTEXT_PER_HART * contextid +
-			CONTEXT_CLAIM;
-}
-
 /*
  * Handling an interrupt is a two-step process: first you claim the interrupt
  * by reading the claim register, then you complete the interrupt by writing
@@ -151,33 +85,33 @@ static inline u32 __iomem *plic_hart_claim(struct plic_data *data,
  */
 static inline u32 plic_claim(struct plic_data *data, int contextid)
 {
-	return readl(plic_hart_claim(data, contextid));
+	return readl(data->reg + PLIC_CLAIM(contextid));
 }
 
-static inline void
-plic_complete(struct plic_data *data, int contextid, u32 claim)
+static inline void plic_complete(struct plic_data *data, int contextid,
+		u32 claim)
 {
-	writel(claim, plic_hart_claim(data, contextid));
+	writel(claim, data->reg + PLIC_CLAIM(contextid));
 }
 
 /* Explicit interrupt masking. */
 static void plic_disable(struct plic_data *data, int contextid, int hwirq)
 {
-	u32 __iomem *reg = plic_enable_vector(data, contextid) + (hwirq / 32);
+	u32 off = PLIC_ENABLE(contextid, hwirq);
 	u32 mask = ~(1 << (hwirq % 32));
 
 	spin_lock(&data->lock);
-	writel(readl(reg) & mask, reg);
+	writel(readl(data->reg + off) & mask, data->reg + off);
 	spin_unlock(&data->lock);
 }
 
 static void plic_enable(struct plic_data *data, int contextid, int hwirq)
 {
-	u32 __iomem *reg = plic_enable_vector(data, contextid) + (hwirq / 32);
+	u32 off = PLIC_ENABLE(contextid, hwirq);
 	u32 bit = 1 << (hwirq % 32);
 
 	spin_lock(&data->lock);
-	writel(readl(reg) | bit, reg);
+	writel(readl(data->reg + off) | bit, data->reg + off);
 	spin_unlock(&data->lock);
 }
 
@@ -188,6 +122,7 @@ static void plic_enable(struct plic_data *data, int contextid, int hwirq)
 static void plic_irq_mask(struct irq_data *d)
 {
 }
+
 static void plic_irq_unmask(struct irq_data *d)
 {
 }
@@ -195,10 +130,9 @@ static void plic_irq_unmask(struct irq_data *d)
 static void plic_irq_enable(struct irq_data *d)
 {
 	struct plic_data *data = irq_data_get_irq_chip_data(d);
-	void __iomem *priority = plic_priority(data, d->hwirq);
 	int i;
 
-	writel(1, priority);
+	writel(0, data->reg + PLIC_PRIORITY(d->hwirq));
 	for (i = 0; i < data->handlers; ++i)
 		if (data->handler[i].present)
 			plic_enable(data, i, d->hwirq);
@@ -207,10 +141,9 @@ static void plic_irq_enable(struct irq_data *d)
 static void plic_irq_disable(struct irq_data *d)
 {
 	struct plic_data *data = irq_data_get_irq_chip_data(d);
-	void __iomem *priority = plic_priority(data, d->hwirq);
 	int i;
 
-	writel(0, priority);
+	writel(0, data->reg + PLIC_PRIORITY(d->hwirq));
 	for (i = 0; i < data->handlers; ++i)
 		if (data->handler[i].present)
 			plic_disable(data, i, d->hwirq);
@@ -337,7 +270,7 @@ static int plic_init(struct device_node *node, struct device_node *parent)
 		handler->contextid = i;
 		handler->data = data;
 		/* hwirq prio must be > this to trigger an interrupt */
-		writel(0, plic_hart_threshold(data, i));
+		writel(0, data->reg + PLIC_THRESHOLD(i));
 
 		for (hwirq = 1; hwirq <= data->ndev; ++hwirq)
 			plic_disable(data, i, hwirq);
