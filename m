From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 29 Oct 2018 11:48:54 +0100
Subject: [PATCH 2/2] riscv: audit: add audit hook in
 do_syscall_trace_enter/exit()
In-Reply-To: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
References: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
Message-ID: <20181029104854.17432-3-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch adds auditing functions on entry to and exit from every system
call invocation.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..85b0c93f00c6 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -18,6 +18,7 @@
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
+#include <linux/audit.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 #include <linux/regset.h>
@@ -111,10 +112,14 @@ void do_syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, syscall_get_nr(current, regs));
 #endif
+
+	audit_syscall_entry(regs->a7, regs->a0, regs->a1, regs->a2, regs->a3);
 }
 
 void do_syscall_trace_exit(struct pt_regs *regs)
 {
+	audit_syscall_exit(regs);
+
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(regs, 0);
 
-- 
2.17.2
