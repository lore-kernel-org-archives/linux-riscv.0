From: alankao@andestech.com (Alan Kao)
Date: Thu, 9 Aug 2018 15:44:40 +0800
Subject: [PATCH v6 5/5] Auto-detect whether a FPU exists
Message-ID: <1533800680-3653-1-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

We expect that a kernel with CONFIG_FPU=y can still support no-FPU
machines. To do so, the kernel should first examine the existence of a
FPU, then do nothing if a FPU does exist; otherwise, it should
disable/bypass all FPU-related functions.

In this patch, a new global variable, has_fpu, is created and determined
when parsing the hardware capability from device tree during booting.
This variable is used in those FPU-related functions.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/include/asm/switch_to.h | 8 ++++----
 arch/riscv/kernel/cpufeature.c     | 8 ++++++++
 arch/riscv/kernel/process.c        | 4 +++-
 arch/riscv/kernel/signal.c         | 6 ++++--
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 093050b03543..733559083f24 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -56,13 +56,12 @@ static inline void __switch_to_aux(struct task_struct *prev,
 	fstate_restore(next, task_pt_regs(next));
 }
 
-#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_INITIAL)
-
+extern bool has_fpu;
 #else
+#define has_fpu false
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
 #define __switch_to_aux(__prev, __next) do { } while (0)
-#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_OFF)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -72,7 +71,8 @@ extern struct task_struct *__switch_to(struct task_struct *,
 do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
-	__switch_to_aux(__prev, __next);		\
+	if (has_fpu)					\
+		__switch_to_aux(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 17011a870044..46942e635266 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,6 +22,9 @@
 #include <asm/hwcap.h>
 
 unsigned long elf_hwcap __read_mostly;
+#ifdef CONFIG_FPU
+bool has_fpu __read_mostly;
+#endif
 
 void riscv_fill_hwcap(void)
 {
@@ -58,4 +61,9 @@ void riscv_fill_hwcap(void)
 		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
 
 	pr_info("elf_hwcap is 0x%lx", elf_hwcap);
+
+#ifdef CONFIG_FPU
+	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
+		has_fpu = true;
+#endif
 }
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 3820d89e2db9..97155aee9e71 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -83,7 +83,9 @@ void show_regs(struct pt_regs *regs)
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
-	regs->sstatus = DEFAULT_SSTATUS;
+	regs->sstatus = SR_SPIE;
+	if (has_fpu)
+		regs->sstatus |= SR_FS_INITIAL;
 	regs->sepc = pc;
 	regs->sp = sp;
 	set_fs(USER_DS);
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 2450b824d799..f9b5e7e352ef 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -98,7 +98,8 @@ static long restore_sigcontext(struct pt_regs *regs,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
 	/* Restore the floating-point state. */
-	err |= restore_fp_state(regs, &sc->sc_fpregs);
+	if (has_fpu)
+		err |= restore_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
@@ -150,7 +151,8 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
-	err |= save_fp_state(regs, &sc->sc_fpregs);
+	if (has_fpu)
+		err |= save_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
-- 
2.18.0
