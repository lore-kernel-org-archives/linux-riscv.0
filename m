From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Oct 2018 13:40:36 -0700
Subject: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <20181024204036.8799-1-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
Message-ID: <20181024204036.8799-3-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: "Wesley W. Terpstra" <wesley@sifive.com>

This is a fairly straight-forward implementation of seccomp for RISC-V
systems.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig                   | 18 ++++++++++++++++++
 arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
 arch/riscv/include/asm/syscall.h     |  6 ++++++
 arch/riscv/include/asm/thread_info.h |  1 +
 include/uapi/linux/audit.h           |  1 +
 5 files changed, 36 insertions(+)
 create mode 100644 arch/riscv/include/asm/seccomp.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..28abe47602a1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -28,6 +28,7 @@ config RISCV
 	select GENERIC_STRNLEN_USER
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
+	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_MEMBLOCK
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_CONTIGUOUS
@@ -214,6 +215,22 @@ menu "Kernel type"
 
 source "kernel/Kconfig.hz"
 
+config SECCOMP
+	bool "Enable seccomp to safely compute untrusted bytecode"
+
+	help
+	  This kernel feature is useful for number crunching applications
+	  that may need to compute untrusted bytecode during their
+	  execution. By using pipes or other transports made available to
+	  the process as file descriptors supporting the read/write
+	  syscalls, it's possible to isolate those applications in
+	  their own address space using seccomp. Once seccomp is
+	  enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
+	  and the task is only allowed to execute a few safe syscalls
+	  defined by each seccomp mode.
+
+	  If unsure, say Y. Only embedded should say N here.
+
 endmenu
 
 menu "Bus support"
@@ -243,3 +260,4 @@ menu "Power management options"
 source kernel/power/Kconfig
 
 endmenu
+
diff --git a/arch/riscv/include/asm/seccomp.h b/arch/riscv/include/asm/seccomp.h
new file mode 100644
index 000000000000..c1b4407f1038
--- /dev/null
+++ b/arch/riscv/include/asm/seccomp.h
@@ -0,0 +1,10 @@
+/* Copyright 2018 SiFive, Inc. */
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_SECCOMP_H
+#define _ASM_RISCV_SECCOMP_H
+
+#include <asm/unistd.h>
+
+#include <asm-generic/seccomp.h>
+
+#endif /* _ASM_RISCV_SECCOMP_H */
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8d25f8904c00..d24f774f39df 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -19,6 +19,7 @@
 #define _ASM_RISCV_SYSCALL_H
 
 #include <linux/sched.h>
+#include <uapi/linux/audit.h>
 #include <linux/err.h>
 
 /* The array of function pointers for syscalls. */
@@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
 }
 
+static inline int syscall_get_arch(void)
+{
+	return AUDIT_ARCH_RISCV;
+}
+
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index f8fa1cd2dad9..374973dc05c6 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -80,6 +80,7 @@ struct thread_info {
 #define TIF_RESTORE_SIGMASK	4	/* restore signal mask in do_signal() */
 #define TIF_MEMDIE		5	/* is terminating due to OOM killer */
 #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
+#define TIF_SECCOMP		7	/* seccomp syscall filtering active */
 
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 818ae690ab79..c16fa1a76659 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -399,6 +399,7 @@ enum {
 /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
 #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV	(EM_RISCV)
 #define AUDIT_ARCH_S390		(EM_S390)
 #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_SH		(EM_SH)
-- 
2.18.1
