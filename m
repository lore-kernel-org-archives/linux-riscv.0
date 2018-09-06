From: anup@brainfault.org (Anup Patel)
Date: Thu,  6 Sep 2018 18:06:51 +0530
Subject: [PATCH v2 5/5] RISC-V: Remove do_IRQ() function
In-Reply-To: <20180906123651.28500-1-anup@brainfault.org>
References: <20180906123651.28500-1-anup@brainfault.org>
Message-ID: <20180906123651.28500-6-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The only thing do_IRQ() does is call handle_arch_irq function
pointer. We can very well call handle_arch_irq function pointer
directly from assembly and remove do_IRQ() function hence this
patch.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/entry.S | 4 +++-
 arch/riscv/kernel/irq.c   | 6 ------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 6eaacfa5b63d..69fbe9dd9e0c 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -168,7 +168,9 @@ ENTRY(handle_exception)
 
 	/* Handle interrupts */
 	move a0, sp /* pt_regs */
-	tail do_IRQ
+	la a1, handle_arch_irq
+	REG_L a1, (a1)
+	jr a1
 1:
 	/* Exceptions run with interrupts enabled */
 	csrs sstatus, SR_SIE
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 9ced284da30b..695e241d0402 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -8,12 +8,6 @@
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
 
-asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
-{
-	if (handle_arch_irq)
-		handle_arch_irq(regs);
-}
-
 /*
  * This function doesn't return until a software interrupt is sent via IPI.
  * Obviously, all the interrupts except software interrupt should be disabled
-- 
2.17.1
