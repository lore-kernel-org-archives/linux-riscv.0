From: ldv@altlinux.org (Dmitry V. Levin)
Date: Tue, 20 Nov 2018 03:16:40 +0300
Subject: [PATCH v2 13/15] riscv: define syscall_get_arch()
In-Reply-To: <20181120001128.GA11300@altlinux.org>
Message-ID: <20181120001640.GM11387@altlinux.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

syscall_get_arch() is required to be implemented on all architectures
in order to extend the generic ptrace API with PTRACE_GET_SYSCALL_INFO
request.

Based-on-patch-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
v2: added Reviewed-by to [PATCH 12/13 v2]

 arch/riscv/include/asm/syscall.h | 10 ++++++++++
 include/uapi/linux/audit.h       |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8d25f8904c00..bba3da6ef157 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -18,6 +18,7 @@
 #ifndef _ASM_RISCV_SYSCALL_H
 #define _ASM_RISCV_SYSCALL_H
 
+#include <uapi/linux/audit.h>
 #include <linux/sched.h>
 #include <linux/err.h>
 
@@ -99,4 +100,13 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
 }
 
+static inline int syscall_get_arch(void)
+{
+#ifdef CONFIG_64BIT
+	return AUDIT_ARCH_RISCV64;
+#else
+	return AUDIT_ARCH_RISCV32;
+#endif
+}
+
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 205aa32d81ed..a97a29922de0 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -410,6 +410,8 @@ enum {
 /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
 #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV32	(EM_RISCV|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV64	(EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_S390		(EM_S390)
 #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_SH		(EM_SH)
-- 
ldv
