From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 19:07:55 -0800
Subject: [PATCH v2 3/4] openrisc: Use the new MULTI_IRQ_HANDLER
In-Reply-To: <20180125030756.21787-1-palmer@sifive.com>
References: <20180125030756.21787-1-palmer@sifive.com>
Message-ID: <20180125030756.21787-4-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

It appears that openrisc copied arm64's MULTI_IRQ_HANDLER code (which
came from arm).  I wanted to make this generic so I could use it in the
RISC-V port.  This patch converts the openrisc code to use the generic
version.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/openrisc/Kconfig      | 1 +
 arch/openrisc/kernel/irq.c | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 339df7324e9c..77a9d45ac11e 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -35,6 +35,7 @@ config OPENRISC
 	select ARCH_USE_QUEUED_RWLOCKS
 	select OMPIC if SMP
 	select ARCH_WANT_FRAME_POINTERS
+	select MULTI_IRQ_HANDLER
 
 config CPU_BIG_ENDIAN
 	def_bool y
diff --git a/arch/openrisc/kernel/irq.c b/arch/openrisc/kernel/irq.c
index 35e478a93116..5f9445effaf8 100644
--- a/arch/openrisc/kernel/irq.c
+++ b/arch/openrisc/kernel/irq.c
@@ -41,13 +41,6 @@ void __init init_IRQ(void)
 	irqchip_init();
 }
 
-static void (*handle_arch_irq)(struct pt_regs *);
-
-void __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
-{
-	handle_arch_irq = handle_irq;
-}
-
 void __irq_entry do_IRQ(struct pt_regs *regs)
 {
 	handle_arch_irq(regs);
-- 
2.13.6
