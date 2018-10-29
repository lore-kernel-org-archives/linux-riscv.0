From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 29 Oct 2018 13:15:16 +0100
Subject: [PATCH] riscv: fix trace_sys_exit hook
Message-ID: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Depends on:
http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html

Why we don't have HAVE_SYSCALL_TRACEPOINTS in arch/riscv/Kconfig?

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..9db7d0076375 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -120,6 +120,6 @@ void do_syscall_trace_exit(struct pt_regs *regs)
 
 #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_exit(regs, regs->regs[0]);
+		trace_sys_exit(regs, regs_return_value(regs));
 #endif
 }
-- 
2.17.2
