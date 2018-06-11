From: jimw@sifive.com (Jim Wilson)
Date: Mon, 11 Jun 2018 14:48:22 -0700
Subject: [PATCH] RISC-V: Fix PTRACE_SETREGSET bug.
Message-ID: <20180611214822.8539-1-jimw@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

In riscv_gpr_set, pass regs instead of &regs to user_regset_copyin to fix
gdb segfault.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index ba3e80712797..9f82a7e34c64 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -50,7 +50,7 @@ static int riscv_gpr_set(struct task_struct *target,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(target);
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &regs, 0, -1);
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, regs, 0, -1);
 	return ret;
 }
 
-- 
2.17.1
