From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 19:07:53 -0800
Subject: [PATCH v2 1/4] arm: Make set_handle_irq and handle_arch_irq generic
In-Reply-To: <20180125030756.21787-1-palmer@sifive.com>
References: <20180125030756.21787-1-palmer@sifive.com>
Message-ID: <20180125030756.21787-2-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

It looks like this same irqchip registration mechanism has been copied
into a handful of ports, including aarch64 and openrisc.  I want to use
this in the RISC-V port, so I thought it would be good to make this
generic instead.

This patch simply moves set_handle_irq and handle_arch_irq from arch/arm
to kernel/irq/handle.c.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/arm/Kconfig             |  5 -----
 arch/arm/include/asm/irq.h   |  5 -----
 arch/arm/kernel/entry-armv.S |  6 ------
 arch/arm/kernel/irq.c        | 10 ----------
 include/linux/irq.h          | 18 ++++++++++++++++++
 kernel/irq/Kconfig           |  5 +++++
 kernel/irq/handle.c          | 10 ++++++++++
 7 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 51c8df561077..e51f907668f6 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -917,11 +917,6 @@ config IWMMXT
 	  Enable support for iWMMXt context switching at run time if
 	  running on a CPU that supports it.
 
-config MULTI_IRQ_HANDLER
-	bool
-	help
-	  Allow each machine to specify it's own IRQ handler at run time.
-
 if !MMU
 source "arch/arm/Kconfig-nommu"
 endif
diff --git a/arch/arm/include/asm/irq.h b/arch/arm/include/asm/irq.h
index b6f319606e30..c883fcbe93b6 100644
--- a/arch/arm/include/asm/irq.h
+++ b/arch/arm/include/asm/irq.h
@@ -31,11 +31,6 @@ extern void asm_do_IRQ(unsigned int, struct pt_regs *);
 void handle_IRQ(unsigned int, struct pt_regs *);
 void init_IRQ(void);
 
-#ifdef CONFIG_MULTI_IRQ_HANDLER
-extern void (*handle_arch_irq)(struct pt_regs *);
-extern void set_handle_irq(void (*handle_irq)(struct pt_regs *));
-#endif
-
 #ifdef CONFIG_SMP
 extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
 					   bool exclude_self);
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index fbc707626b3e..2d31cec2f4cb 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -1230,9 +1230,3 @@ vector_addrexcptn:
 	.globl	cr_alignment
 cr_alignment:
 	.space	4
-
-#ifdef CONFIG_MULTI_IRQ_HANDLER
-	.globl	handle_arch_irq
-handle_arch_irq:
-	.space	4
-#endif
diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index ece04a457486..9908dacf9229 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -102,16 +102,6 @@ void __init init_IRQ(void)
 	uniphier_cache_init();
 }
 
-#ifdef CONFIG_MULTI_IRQ_HANDLER
-void __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
-{
-	if (handle_arch_irq)
-		return;
-
-	handle_arch_irq = handle_irq;
-}
-#endif
-
 #ifdef CONFIG_SPARSE_IRQ
 int __init arch_probe_nr_irqs(void)
 {
diff --git a/include/linux/irq.h b/include/linux/irq.h
index a0231e96a578..4e7ca0216fb9 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1170,4 +1170,22 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
 int ipi_send_single(unsigned int virq, unsigned int cpu);
 int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
 
+#ifdef CONFIG_MULTI_IRQ_HANDLER
+/*
+ * Registers a generic IRQ handling function as the top-level IRQ handler in
+ * the system, which is generally the first C code called from an assembly
+ * architecture-specific interrupt handler.
+ *
+ * Returns 0 on success, or -EBUSY if an IRQ handler has already been
+ * registered.
+ */
+void __init set_handle_irq(void (*handle_irq)(struct pt_regs *));
+
+/*
+ * Allows interrupt handlers to find the irqchip that's been registered as the
+ * top-level IRQ handler.
+ */
+extern void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
+#endif
+
 #endif /* _LINUX_IRQ_H */
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 89e355866450..1b84dccd1a03 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -142,3 +142,8 @@ config GENERIC_IRQ_DEBUGFS
 	  If you don't know what to do here, say N.
 
 endmenu
+
+config MULTI_IRQ_HANDLER
+	bool
+	help
+	  Allow each machine to specify it's own IRQ handler at run time.
diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index 79f987b942b8..eb55650a2abc 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -20,6 +20,8 @@
 
 #include "internals.h"
 
+void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
+
 /**
  * handle_bad_irq - handle spurious and unhandled irqs
  * @desc:      description of the interrupt
@@ -207,3 +209,11 @@ irqreturn_t handle_irq_event(struct irq_desc *desc)
 	irqd_clear(&desc->irq_data, IRQD_IRQ_INPROGRESS);
 	return ret;
 }
+
+void __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
+{
+	if (handle_arch_irq)
+		return;
+
+	handle_arch_irq = handle_irq;
+}
-- 
2.13.6
