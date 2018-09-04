From: anup@brainfault.org (Anup Patel)
Date: Tue,  4 Sep 2018 18:15:11 +0530
Subject: [RFC PATCH 2/5] RISC-V: No need to pass scause as arg to do_IRQ()
In-Reply-To: <20180904124514.6290-1-anup@brainfault.org>
References: <20180904124514.6290-1-anup@brainfault.org>
Message-ID: <20180904124514.6290-3-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The scause is already part of pt_regs so no need to pass
scause as separate arg to do_IRQ().

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/entry.S | 1 -
 arch/riscv/kernel/irq.c   | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index fa2c08e3c05e..6eaacfa5b63d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -168,7 +168,6 @@ ENTRY(handle_exception)
 
 	/* Handle interrupts */
 	move a0, sp /* pt_regs */
-	move a1, s4 /* scause */
 	tail do_IRQ
 1:
 	/* Exceptions run with interrupts enabled */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 5532e7cedaec..c51c9b402e87 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -26,11 +26,11 @@
  */
 #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
 
-asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
+asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs;
 
-	switch (cause & ~INTERRUPT_CAUSE_FLAG) {
+	switch (regs->scause & ~INTERRUPT_CAUSE_FLAG) {
 	case INTERRUPT_CAUSE_TIMER:
 		old_regs = set_irq_regs(regs);
 		irq_enter();
-- 
2.17.1
