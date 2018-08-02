From: alankao@andestech.com (Alan Kao)
Date: Thu, 2 Aug 2018 13:39:51 +0800
Subject: [PATCH v3 4/4] Add an option to support no-FPU systems
In-Reply-To: <1533188391-5932-1-git-send-email-alankao@andestech.com>
References: <1533188391-5932-1-git-send-email-alankao@andestech.com>
Message-ID: <1533188391-5932-5-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

FP codes have been separated from common part in previous patches.
This patch add the CONFIG_FPU option and some stubs to support
no-FPU systems.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/Kconfig                 |  9 +++++++++
 arch/riscv/include/asm/switch_to.h | 12 ++++++++++++
 arch/riscv/kernel/Makefile         |  2 +-
 arch/riscv/kernel/process.c        |  4 +++-
 arch/riscv/kernel/signal.c         |  2 ++
 5 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6debcc4afc72..6069597ba73f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -232,6 +232,15 @@ config RISCV_BASE_PMU
 
 endmenu
 
+config FPU
+	bool "FPU support"
+	default y
+	help
+	  Say N here if you want to disable all floating-point related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 endmenu
 
 menu "Kernel type"
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index dd6b05bff75b..94a08d28ccf5 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -18,6 +18,7 @@
 #include <asm/ptrace.h>
 #include <asm/csr.h>
 
+#ifdef CONFIG_FPU
 extern void __fstate_save(struct task_struct *save_to);
 extern void __fstate_restore(struct task_struct *restore_from);
 
@@ -55,6 +56,17 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
+#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_INITIAL)
+
+#else
+#define save_fp_state(task, regs) (0)
+#define restore_fp_state(task, regs) (0)
+#define fstate_save(task, regs) do { } while (0)
+#define fstate_restore(task, regs) do { } while (0)
+#define __switch_to_aux(__prev, __next) do { } while (0)
+#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_OFF)
+#endif
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index bd433efd915e..f13f7f276639 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -13,7 +13,6 @@ extra-y += vmlinux.lds
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
-obj-y	+= fpu.o
 obj-y	+= irq.o
 obj-y	+= process.o
 obj-y	+= ptrace.o
@@ -32,6 +31,7 @@ obj-y	+= vdso/
 
 CFLAGS_setup.o := -mcmodel=medany
 
+obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_MODULES)		+= module.o
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index cb209139ba53..3820d89e2db9 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -83,7 +83,7 @@ void show_regs(struct pt_regs *regs)
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
-	regs->sstatus = SR_SPIE /* User mode, irqs on */ | SR_FS_INITIAL;
+	regs->sstatus = DEFAULT_SSTATUS;
 	regs->sepc = pc;
 	regs->sp = sp;
 	set_fs(USER_DS);
@@ -91,12 +91,14 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 
 void flush_thread(void)
 {
+#ifdef CONFIG_FPU
 	/*
 	 * Reset FPU context
 	 *	frm: round to nearest, ties to even (IEEE default)
 	 *	fflags: accrued exceptions cleared
 	 */
 	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
+#endif
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index bfce852d5ddc..b7bbb5c33594 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -37,6 +37,7 @@ struct rt_sigframe {
 	struct ucontext uc;
 };
 
+#ifdef CONFIG_FPU
 static long restore_fp_state(struct pt_regs *regs,
 	union __riscv_fp_state *sc_fpregs)
 {
@@ -85,6 +86,7 @@ static long save_fp_state(struct pt_regs *regs,
 
 	return err;
 }
+#endif
 
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
-- 
2.18.0
