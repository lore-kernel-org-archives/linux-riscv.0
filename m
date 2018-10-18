From: jimw@sifive.com (Jim Wilson)
Date: Wed, 17 Oct 2018 17:59:05 -0700
Subject: [PATCH, v2] RISC-V: Add FP register ptrace support for gdb.
Message-ID: <20181018005905.8100-1-jimw@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Add a variable and a macro to describe FP registers, assuming only D is
supported.  FP code is conditional on CONFIG_FPU.  The FP regs and FCSR
are copied separately to avoid copying struct padding.  Tested by hand and
with the gdb testsuite.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/include/uapi/asm/elf.h |  3 ++
 arch/riscv/kernel/ptrace.c        | 52 +++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index 1e0dfc36aab9..644a00ce6e2e 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -19,7 +19,10 @@ typedef unsigned long elf_greg_t;
 typedef struct user_regs_struct elf_gregset_t;
 #define ELF_NGREG (sizeof(elf_gregset_t) / sizeof(elf_greg_t))
 
+/* We don't support f without d, or q.  */
+typedef __u64 elf_fpreg_t;
 typedef union __riscv_fp_state elf_fpregset_t;
+#define ELF_NFPREG (sizeof(struct __riscv_d_ext_state) / sizeof(elf_fpreg_t))
 
 #if __riscv_xlen == 64
 #define ELF_RISCV_R_SYM(r_info)		ELF64_R_SYM(r_info)
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..60f1e02eed36 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -28,6 +28,9 @@
 
 enum riscv_regset {
 	REGSET_X,
+#ifdef CONFIG_FPU
+	REGSET_F,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -54,6 +57,45 @@ static int riscv_gpr_set(struct task_struct *target,
 	return ret;
 }
 
+#ifdef CONFIG_FPU
+static int riscv_fpr_get(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 void *kbuf, void __user *ubuf)
+{
+	int ret;
+	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
+				  offsetof(struct __riscv_d_ext_state, fcsr));
+	if (!ret) {
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
+					  offsetof(struct __riscv_d_ext_state, fcsr) +
+					  sizeof(fstate->fcsr));
+	}
+
+	return ret;
+}
+
+static int riscv_fpr_set(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
+				 offsetof(struct __riscv_d_ext_state, fcsr));
+	if (!ret) {
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
+					 offsetof(struct __riscv_d_ext_state, fcsr) +
+					 sizeof(fstate->fcsr));
+	}
+
+	return ret;
+}
+#endif
 
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
@@ -64,6 +106,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.get = &riscv_gpr_get,
 		.set = &riscv_gpr_set,
 	},
+#ifdef CONFIG_FPU
+	[REGSET_F] = {
+		.core_note_type = NT_PRFPREG,
+		.n = ELF_NFPREG,
+		.size = sizeof(elf_fpreg_t),
+		.align = sizeof(elf_fpreg_t),
+		.get = &riscv_fpr_get,
+		.set = &riscv_fpr_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
-- 
2.19.0.rc0
