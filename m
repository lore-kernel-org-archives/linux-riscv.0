From: joe@perches.com (Joe Perches)
Date: Sat, 28 Jul 2018 09:39:57 -0700
Subject: [PATCH V2] riscv: Convert uses of REG_FMT to %p
Message-ID: <e14dedc721b7aed1cf3ff1bdbc09014c0131c276.1532795905.git.joe@perches.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Use %p pointer output instead of REG_FMT and cast the unsigned longs to
(void *) to avoid exposing kernel addresses.

Miscellanea:

o Convert pr_cont to printk(KERN_DEFAULT as these uses are
  new logging lines and not previous line continuations
o Remove the now unused REG_FMT defines

Signed-off-by: Joe Perches <joe@perches.com>
---

v2: sigh: Add missing fault.c

 arch/riscv/include/asm/ptrace.h |  6 -----
 arch/riscv/kernel/process.c     | 52 +++++++++++++++++++++--------------------
 arch/riscv/kernel/traps.c       |  4 ++--
 arch/riscv/mm/fault.c           |  6 ++---
 4 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index 2c5df945d43c..b123e723f8fa 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -60,12 +60,6 @@ struct pt_regs {
         unsigned long orig_a0;
 };
 
-#ifdef CONFIG_64BIT
-#define REG_FMT "%016lx"
-#else
-#define REG_FMT "%08lx"
-#endif
-
 #define user_mode(regs) (((regs)->sstatus & SR_SPP) == 0)
 
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index d7c6ca7c95ae..7223f6715ff3 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -36,7 +36,7 @@
 extern asmlinkage void ret_from_fork(void);
 extern asmlinkage void ret_from_kernel_thread(void);
 
-void arch_cpu_idle(void)
+void arch_yycpu_idle(void)
 {
 	wait_for_interrupt();
 	local_irq_enable();
@@ -46,31 +46,33 @@ void show_regs(struct pt_regs *regs)
 {
 	show_regs_print_info(KERN_DEFAULT);
 
-	pr_cont("sepc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
-		regs->sepc, regs->ra, regs->sp);
-	pr_cont(" gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
-		regs->gp, regs->tp, regs->t0);
-	pr_cont(" t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
-		regs->t1, regs->t2, regs->s0);
-	pr_cont(" s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
-		regs->s1, regs->a0, regs->a1);
-	pr_cont(" a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
-		regs->a2, regs->a3, regs->a4);
-	pr_cont(" a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
-		regs->a5, regs->a6, regs->a7);
-	pr_cont(" s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
-		regs->s2, regs->s3, regs->s4);
-	pr_cont(" s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
-		regs->s5, regs->s6, regs->s7);
-	pr_cont(" s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
-		regs->s8, regs->s9, regs->s10);
-	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
-		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	printk(KERN_DEFAULT "sepc: %p ra : %p sp : %p\n",
+	       (void *)regs->sepc, (void *)regs->ra, (void *)regs->sp);
+	printk(KERN_DEFAULT " gp : %p tp : %p t0 : %p\n",
+	       (void *)regs->gp, (void *)regs->tp, (void *)regs->t0);
+	printk(KERN_DEFAULT " t1 : %p t2 : %p s0 : %p\n",
+	       (void *)regs->t1, (void *)regs->t2, (void *)regs->s0);
+	printk(KERN_DEFAULT " s1 : %p a0 : %p a1 : %p\n",
+	       (void *)regs->s1, (void *)regs->a0, (void *)regs->a1);
+	printk(KERN_DEFAULT " a2 : %p a3 : %p a4 : %p\n",
+	       (void *)regs->a2, (void *)regs->a3, (void *)regs->a4);
+	printk(KERN_DEFAULT " a5 : %p a6 : %p a7 : %p\n",
+	       (void *)regs->a5, (void *)regs->a6, (void *)regs->a7);
+	printk(KERN_DEFAULT " s2 : %p s3 : %p s4 : %p\n",
+	       (void *)regs->s2, (void *)regs->s3, (void *)regs->s4);
+	printk(KERN_DEFAULT " s5 : %p s6 : %p s7 : %p\n",
+	       (void *)regs->s5, (void *)regs->s6, (void *)regs->s7);
+	printk(KERN_DEFAULT " s8 : %p s9 : %p s10: %p\n",
+	       (void *)regs->s8, (void *)regs->s9, (void *)regs->s10);
+	printk(KERN_DEFAULT " s11: %p t3 : %p t4 : %p\n",
+	       (void *)regs->s11, (void *)regs->t3, (void *)regs->t4);
+	printk(KERN_DEFAULT " t5 : %p t6 : %p\n",
+	       (void *)regs->t5, (void *)regs->t6);
 
-	pr_cont("sstatus: " REG_FMT " sbadaddr: " REG_FMT " scause: " REG_FMT "\n",
-		regs->sstatus, regs->sbadaddr, regs->scause);
+	printk(KERN_DEFAULT "sstatus: %p sbadaddr: %p scause: %p\n",
+	       (void *)regs->sstatus,
+	       (void *)regs->sbadaddr,
+	       (void *)regs->scause);
 }
 
 void start_thread(struct pt_regs *regs, unsigned long pc,
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 81a1952015a6..ba1942befa6a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -68,8 +68,8 @@ void do_trap(struct pt_regs *regs, int signo, int code,
 {
 	if (show_unhandled_signals && unhandled_signal(tsk, signo)
 	    && printk_ratelimit()) {
-		pr_info("%s[%d]: unhandled signal %d code 0x%x at 0x" REG_FMT,
-			tsk->comm, task_pid_nr(tsk), signo, code, addr);
+		pr_info("%s[%d]: unhandled signal %d code 0x%x at 0x%p",
+			tsk->comm, task_pid_nr(tsk), signo, code, (void *)addr);
 		print_vma_addr(KERN_CONT " in ", GET_IP(regs));
 		pr_cont("\n");
 		show_regs(regs);
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 88401d5125bc..f258a58fe9fc 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -195,9 +195,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 	 * terminate things with extreme prejudice.
 	 */
 	bust_spinlocks(1);
-	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n",
-		(addr < PAGE_SIZE) ? "NULL pointer dereference" :
-		"paging request", addr);
+	pr_alert("Unable to handle kernel %s@virtual address %p\n",
+		 (addr < PAGE_SIZE) ? "NULL pointer dereference" :
+		 "paging request", (void *)addr);
 	die(regs, "Oops");
 	do_exit(SIGKILL);
 
-- 
2.15.0
