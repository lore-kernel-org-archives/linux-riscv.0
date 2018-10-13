From: jimw@sifive.com (Jim Wilson)
Date: Fri, 12 Oct 2018 17:56:49 -0700
Subject: [PATCH] RISC-V: Add FP register ptrace support for gdb.
Message-ID: <20181013005649.14379-1-jimw@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This has been tested by hand, and with the gdb testsuite, and is working
well.  Corresponding patches for gdb have already been upstreamed, but
they don't depend on the exact form of this patch, they only depend on
the use of NT_PRFPREG.

I think there is room for improvement here, but not sure if that is required
before this can be accepted.  I'm abusing the ELF_NGREG macro because we don't
have one for FP registers, and the elf_greg_t type again because there isn't
one for FP registers.  In the riscv_fpr_get function, I'm using a single call
to user_regset_copyout which means effectively the entire fstate struct is
being copied from kernel space to user space.  That may include some padding
at the end of the structure.  I don't know if that is safe or not.  This could
be fixed by using two user_regset_copyout calls with a little bit of extra
complexity.  Similarly with riscv_fpr_set and user_regset_copyin.  This
probably only works for targets that have the D extension.  Not sure if
this matters; I don't have a system with only F support, or no FP support,
to test against.

Jim

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/kernel/ptrace.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..8352d1bfadaf 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -27,7 +27,7 @@
 #include <trace/events/syscalls.h>
 
 enum riscv_regset {
-	REGSET_X,
+	REGSET_X, REGSET_F
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -54,6 +54,27 @@ static int riscv_gpr_set(struct task_struct *target,
 	return ret;
 }
 
+static int riscv_fpr_get(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 void *kbuf, void __user *ubuf)
+{
+	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0, -1);
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
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0, -1);
+	return ret;
+}
 
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
@@ -64,6 +85,14 @@ static const struct user_regset riscv_user_regset[] = {
 		.get = &riscv_gpr_get,
 		.set = &riscv_gpr_set,
 	},
+	[REGSET_F] = {
+		.core_note_type = NT_PRFPREG,
+		.n = ELF_NGREG+1,
+		.size = sizeof(elf_greg_t),
+		.align = sizeof(elf_greg_t),
+		.get = &riscv_fpr_get,
+		.set = &riscv_fpr_set,
+	},
 };
 
 static const struct user_regset_view riscv_user_native_view = {
-- 
2.19.0.rc0
