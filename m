From: jimw@sifive.com (Jim Wilson)
Date: Tue, 16 Oct 2018 14:42:59 -0700
Subject: [PATCH, v2] RISC-V: Add futex support.
Message-ID: <20181016214259.12063-1-jimw@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Updated as per sugestions from Christoph Hellwig.  As before, tested on a
HiFive Unleashed running fedora core 29 with a 4.15 based kernel against the
glibc testsuite and the futex wake_op testcase from
    https://lwn.net/Articles/148830/
14 glibc testcase failures are fixed by the patch, and the wake_op testcase
works with the patch.

This is a patch based off of a 4.19 tree.  The 4.15 patch is trivially
different as arch/riscv/Kconfig changed.  This patch was tested on qemu with
the glibc nptl/tst-cond-except testcase, and the wake_op testcase from above.

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/Kconfig             |   1 +
 arch/riscv/include/asm/Kbuild  |   1 -
 arch/riscv/include/asm/futex.h | 127 +++++++++++++++++++++++++++++++++
 3 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/futex.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980287a5..093361e2298c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -31,6 +31,7 @@ config RISCV
 	select HAVE_MEMBLOCK
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_CONTIGUOUS
+	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_GENERIC_DMA_COHERENT
 	select HAVE_PERF_EVENTS
 	select IRQ_DOMAIN
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index efdbe311e936..6a646d9ea780 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -13,7 +13,6 @@ generic-y += errno.h
 generic-y += exec.h
 generic-y += fb.h
 generic-y += fcntl.h
-generic-y += futex.h
 generic-y += hardirq.h
 generic-y += hash.h
 generic-y += hw_irq.h
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
new file mode 100644
index 000000000000..c594db8fd01c
--- /dev/null
+++ b/arch/riscv/include/asm/futex.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2006  Ralf Baechle (ralf at linux-mips.org)
+ * Copyright (c) 2018  Jim Wilson (jimw at sifive.com)
+ */
+
+#ifndef _ASM_FUTEX_H
+#define _ASM_FUTEX_H
+
+#ifndef CONFIG_RISCV_ISA_A
+/*
+ * Use the generic interrupt disabling versions if the A extension
+ * is not supported.
+ */
+#ifdef CONFIG_SMP
+#error "Can't support generic futex calls without A extension on SMP"
+#endif
+#include <asm-generic/futex.h>
+
+#else /* CONFIG_RISCV_ISA_A */
+
+#include <linux/futex.h>
+#include <linux/uaccess.h>
+#include <linux/errno.h>
+#include <asm/asm.h>
+
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
+{								\
+	uintptr_t tmp;						\
+	__enable_user_access();					\
+	__asm__ __volatile__ (					\
+	"1:	" insn "				\n"	\
+	"2:						\n"	\
+	"	.section .fixup,\"ax\"			\n"	\
+	"	.balign 4				\n"	\
+	"3:	li %[r],%[e]				\n"	\
+	"	jump 2b,%[t]				\n"	\
+	"	.previous				\n"	\
+	"	.section __ex_table,\"a\"		\n"	\
+	"	.balign " RISCV_SZPTR "			\n"	\
+	"	" RISCV_PTR " 1b, 3b			\n"	\
+	"	.previous				\n"	\
+	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
+	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
+	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
+	: "memory");						\
+	__disable_user_access();				\
+}
+
+static inline int
+arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
+{
+	int oldval = 0, ret = 0;
+
+	pagefault_disable();
+
+	switch (op) {
+	case FUTEX_OP_SET:
+		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ADD:
+		__futex_atomic_op("amoadd.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_OR:
+		__futex_atomic_op("amoor.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ANDN:
+		__futex_atomic_op("amoand.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, ~oparg);
+		break;
+	case FUTEX_OP_XOR:
+		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
+				  ret, oldval, uaddr, oparg);
+		break;
+	default:
+		ret = -ENOSYS;
+	}
+
+	pagefault_enable();
+
+	if (!ret)
+		*oval = oldval;
+
+	return ret;
+}
+
+static inline int
+futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
+			      u32 oldval, u32 newval)
+{
+	int ret = 0;
+	u32 val;
+	uintptr_t tmp;
+
+	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(u32)))
+		return -EFAULT;
+
+	__enable_user_access();
+	__asm__ __volatile__ (
+	"1:	lr.w.aqrl %[v],%[u]			\n"
+	"	bne %[v],%z[ov],3f			\n"
+	"2:	sc.w.aqrl %[t],%z[nv],%[u]		\n"
+	"	bnez %[t],1b				\n"
+	"3:						\n"
+	"	.section .fixup,\"ax\"			\n"
+	"	.balign 4				\n"
+	"4:	li %[r],%[e]				\n"
+	"	jump 3b,%[t]				\n"
+	"	.previous				\n"
+	"	.section __ex_table,\"a\"		\n"
+	"	.balign " RISCV_SZPTR "			\n"
+	"	" RISCV_PTR " 1b, 4b			\n"
+	"	" RISCV_PTR " 2b, 4b			\n"
+	"	.previous				\n"
+	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
+	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
+	: "memory");
+	__disable_user_access();
+
+	*uval = val;
+	return ret;
+}
+
+#endif /* CONFIG_RISCV_ISA_A */
+#endif /* _ASM_FUTEX_H */
-- 
2.19.0.rc0
