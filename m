From: alankao@andestech.com (Alan Kao)
Date: Wed, 8 Aug 2018 11:24:45 +0800
Subject: [PATCH v4 5/5] Auto-detect whether a FPU exists
In-Reply-To: <1533698685-18022-1-git-send-email-alankao@andestech.com>
References: <1533698685-18022-1-git-send-email-alankao@andestech.com>
Message-ID: <1533698685-18022-6-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

We expect that a kernel with CONFIG_FPU=y can still support no-FPU machines.
To do so, the kernel should first examine the existence of a FPU, then
do nothing if a FPU does exist; otherwise, it should disable/bypass all
FPU-related functions.

In this patch, a new global variable, no_fpu, is created and determined
when parsing the hardware capability from device tree during booting.
This variable is used in those FPU-related functions.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
---
 arch/riscv/include/asm/hwcap.h     |  3 +++
 arch/riscv/include/asm/switch_to.h | 13 ++++++++++++-
 arch/riscv/kernel/cpufeature.c     | 11 +++++++++++
 arch/riscv/kernel/signal.c         |  6 ++++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 8a4ed7bbcbea..1b870086a869 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -33,5 +33,8 @@ enum {
 };
 
 extern unsigned long elf_hwcap;
+#ifdef CONFIG_FPU
+extern bool no_fpu;
+#endif
 #endif
 #endif
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 093050b03543..7278e3eb7a70 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -17,6 +17,7 @@
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/csr.h>
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_FPU
 extern void __fstate_save(struct task_struct *save_to);
@@ -30,6 +31,9 @@ static inline void __fstate_clean(struct pt_regs *regs)
 static inline void fstate_save(struct task_struct *task,
 			       struct pt_regs *regs)
 {
+	if (unlikely(no_fpu))
+		return;
+
 	if ((regs->sstatus & SR_FS) == SR_FS_DIRTY) {
 		__fstate_save(task);
 		__fstate_clean(regs);
@@ -39,6 +43,9 @@ static inline void fstate_save(struct task_struct *task,
 static inline void fstate_restore(struct task_struct *task,
 				  struct pt_regs *regs)
 {
+	if (unlikely(no_fpu))
+		return;
+
 	if ((regs->sstatus & SR_FS) != SR_FS_OFF) {
 		__fstate_restore(task);
 		__fstate_clean(regs);
@@ -50,13 +57,17 @@ static inline void __switch_to_aux(struct task_struct *prev,
 {
 	struct pt_regs *regs;
 
+	if (unlikely(no_fpu))
+		return;
+
 	regs = task_pt_regs(prev);
 	if (unlikely(regs->sstatus & SR_SD))
 		fstate_save(prev, regs);
 	fstate_restore(next, task_pt_regs(next));
 }
 
-#define DEFAULT_SSTATUS (SR_SPIE | SR_FS_INITIAL)
+#define DEFAULT_SSTATUS \
+	((unlikely(no_fpu)) ? (SR_SPIE | SR_FS_OFF) : (SR_SPIE | SR_FS_INITIAL))
 
 #else
 #define fstate_save(task, regs) do { } while (0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 17011a870044..bc269c1e0b1a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -22,6 +22,9 @@
 #include <asm/hwcap.h>
 
 unsigned long elf_hwcap __read_mostly;
+#ifdef CONFIG_FPU
+bool no_fpu __read_mostly;
+#endif
 
 void riscv_fill_hwcap(void)
 {
@@ -58,4 +61,12 @@ void riscv_fill_hwcap(void)
 		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
 
 	pr_info("elf_hwcap is 0x%lx", elf_hwcap);
+
+#ifdef CONFIG_FPU
+	no_fpu = 0;
+	if (!(elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))) {
+		pr_info("Bypass FPU code.");
+		no_fpu = 1;
+	}
+#endif
 }
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 2450b824d799..9714e4fccb69 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -45,6 +45,9 @@ static long restore_fp_state(struct pt_regs *regs,
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
 	size_t i;
 
+	if (unlikely(no_fpu))
+		return 0;
+
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
 		return err;
@@ -72,6 +75,9 @@ static long save_fp_state(struct pt_regs *regs,
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
 	size_t i;
 
+	if (unlikely(no_fpu))
+		return 0;
+
 	fstate_save(current, regs);
 	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
 	if (unlikely(err))
-- 
2.18.0
