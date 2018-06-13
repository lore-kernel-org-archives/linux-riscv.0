From: alankao@andestech.com (Alan Kao)
Date: Wed, 13 Jun 2018 14:26:53 +0800
Subject: On Supporting no-FPU machines
Message-ID: <20180613062653.GA14518@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

We would like to run Linux on a RISC-V machine that has no F and D
extension, but we found some problem.  We would like to have your
feedback on this.

When context-switching, fstate_restore is always called, and then
regs->sstatus.FS([13:14]) is checked; if the value is anything other
than SR_FS_OFF, the kernel restores the floating-point state for the
next process to be switched to.

However, when a process is loaded, its regs->sstatus.FS is set to
SR_FS_INITIAL (in start_thread), so it is going to lauch __fstate_restore 
(in __switch_to_aux) anyway.  On a board that doesn't have FPU, this causes
a following problem because flds are viewed as illegal instructions.

A quick work-around is something like this:

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index cb20913..96159e1 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -83,7 +83,11 @@ void show_regs(struct pt_regs *regs)
 void start_thread(struct pt_regs *regs, unsigned long pc,
        unsigned long sp)
 {
+#ifdef __riscv_flen
        regs->sstatus = SR_SPIE /* User mode, irqs on */ | SR_FS_INITIAL;
+#else
+       regs->sstatus = SR_SPIE | SR_FS_OFF;
+#endif
        regs->sepc = pc;
        regs->sp = sp;
        set_fs(USER_DS);

This prevents the flds in __fstate_restore if choosing an appropriate toolchain.
The condition

(regs->sstatus & SR_FS) != SR_FS_OFF

in fstate_restore will never be taken.  
Actually, we don't even need those floating-point routines for no-FPU boards.  
We would need a larger patch to make those FP code inside some __riscv_flen
pre-processor sections.

Do you think this is going to be a right direction to support no-FPU machines?

Many thanks,
Alan
