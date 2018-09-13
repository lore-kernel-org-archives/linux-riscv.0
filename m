From: atish.patra@wdc.com (Atish Patra)
Date: Thu, 13 Sep 2018 11:36:54 -0700
Subject: [PATCH v5 01/12] RISC-V: No need to pass scause as arg to do_IRQ()
In-Reply-To: <1536863825-66808-1-git-send-email-atish.patra@wdc.com>
References: <1536863825-66808-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1536863825-66808-2-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Anup Patel <anup@brainfault.org>

The scause is already part of pt_regs so no need to pass
scause as separate arg to do_IRQ().

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/entry.S | 1 -
 arch/riscv/kernel/irq.c   | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index fa2c08e3..6eaacfa5 100644
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
index 0cfac48a..ca459331 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -24,12 +24,12 @@
  */
 #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
 
-asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs, unsigned long cause)
+asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
 	irq_enter();
-	switch (cause & ~INTERRUPT_CAUSE_FLAG) {
+	switch (regs->scause & ~INTERRUPT_CAUSE_FLAG) {
 	case INTERRUPT_CAUSE_TIMER:
 		riscv_timer_interrupt();
 		break;
-- 
2.7.4
