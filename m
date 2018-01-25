From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 19:07:54 -0800
Subject: [PATCH v2 2/4] arm64: Use the new MULTI_IRQ_HANDLER
In-Reply-To: <20180125030756.21787-1-palmer@sifive.com>
References: <20180125030756.21787-1-palmer@sifive.com>
Message-ID: <20180125030756.21787-3-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

It appears arm64 copied arm's MULTI_IRQ_HANDLER code, but made it
unconditional.  I wanted to make this generic so it could be used by the
RISC-V port.  This patch converts the arm64 code to use the new generic
code, which simply consists of deleting the arm64 code and setting
MULTI_IRQ_HANDLER instead.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/arm64/Kconfig           |  1 +
 arch/arm64/include/asm/irq.h |  2 --
 arch/arm64/kernel/irq.c      | 10 ----------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c9a7e9e1414f..effb04a80520 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -129,6 +129,7 @@ config ARM64
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_RELA
+	select MULTI_IRQ_HANDLER
 	select NO_BOOTMEM
 	select OF
 	select OF_EARLY_FLATTREE
diff --git a/arch/arm64/include/asm/irq.h b/arch/arm64/include/asm/irq.h
index a0fee6985e6a..b2b0c6405eb0 100644
--- a/arch/arm64/include/asm/irq.h
+++ b/arch/arm64/include/asm/irq.h
@@ -8,8 +8,6 @@
 
 struct pt_regs;
 
-extern void set_handle_irq(void (*handle_irq)(struct pt_regs *));
-
 static inline int nr_legacy_irqs(void)
 {
 	return 0;
diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 713561e5bcab..67b781270402 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -41,16 +41,6 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	return 0;
 }
 
-void (*handle_arch_irq)(struct pt_regs *) = NULL;
-
-void __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
-{
-	if (handle_arch_irq)
-		return;
-
-	handle_arch_irq = handle_irq;
-}
-
 #ifdef CONFIG_VMAP_STACK
 static void init_irq_stacks(void)
 {
-- 
2.13.6
