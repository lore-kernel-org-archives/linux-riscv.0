From: jimw@sifive.com (Jim Wilson)
Date: Fri, 12 Oct 2018 13:03:50 -0700
Subject: [PATCH] RISC-V: Add futex support.
Message-ID: <20181012200350.5258-1-jimw@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Here is an attempt to add the missing futex support.  I started with the MIPS
version of futex.h and modified it until I got it working.  I tested it on
a HiFive Unleashed running Fedora Core 29 using the fc29 4.15 version of the
kernel.  This was tested against the glibc testsuite, where it fixes 14 nptl
related testsuite failures.  That unfortunately only tests the cmpxchg support,
so I also used the testcase at the end of
   https://lwn.net/Articles/148830/
which tests the atomic_op functionality, except that it doesn't verify that
the operations are atomic, which they obviously are.  This testcase runs
successfully with the patch and fails without it.

I'm not a kernel expert, so there could be details I got wrong here.  I wasn't
sure about the memory model support, so I used aqrl which seemed safest, and
didn't add fences which seemed unnecessary.  I'm not sure about the copyright
statements, I left in Ralf Baechle's line because I started with his code.
Checkpatch reports some style problems, but it is the same style as the MIPS
futex.h, and the uses of ENOSYS appear correct even though it complains about
them.  I don't know if any of that matters.

Jim

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/include/asm/futex.h | 129 +++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 arch/riscv/include/asm/futex.h

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
new file mode 100644
index 000000000000..f36ccceda762
--- /dev/null
+++ b/arch/riscv/include/asm/futex.h
@@ -0,0 +1,129 @@
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Copyright (c) 2006  Ralf Baechle (ralf at linux-mips.org)
+ * Copyright (c) 2018  Jim Wilson (jimw at sifive.com)
+ */
+#ifndef _ASM_FUTEX_H
+#define _ASM_FUTEX_H
+
+#ifdef __KERNEL__
+
+#include <linux/futex.h>
+#include <linux/uaccess.h>
+#include <asm/errno.h>
+#include <asm/asm.h>
+
+#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)		\
+{									\
+	uintptr_t __tmp;						\
+	if (__riscv_atomic) {						\
+		__enable_user_access();					\
+		__asm__ __volatile__ (					\
+		"1:	" insn "				\n"	\
+		"2:						\n"	\
+		"	.section .fixup,\"ax\"			\n"	\
+		"	.balign 4				\n"	\
+		"3:	li %0,%5				\n"	\
+		"	jump 2b,%3				\n"	\
+		"	.previous				\n"	\
+		"	.section __ex_table,\"a\"		\n"	\
+		"	.balign " RISCV_SZPTR "			\n"	\
+		"	" RISCV_PTR " 1b, 3b			\n"	\
+		"	.previous				\n"	\
+		: "+r" (ret), "=&r" (oldval),				\
+		  "+m" (*uaddr), "=&r" (__tmp)				\
+		: "Jr" (oparg), "i" (-EFAULT)				\
+		: "memory");						\
+		__disable_user_access();				\
+	} else {							\
+		ret = -ENOSYS;						\
+	}								\
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
+		__futex_atomic_op("amoswap.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ADD:
+		__futex_atomic_op("amoadd.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_OR:
+		__futex_atomic_op("amoor.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, oparg);
+		break;
+	case FUTEX_OP_ANDN:
+		__futex_atomic_op("amoand.w.aqrl %1,%z4,%2",
+				  ret, oldval, uaddr, ~oparg);
+		break;
+	case FUTEX_OP_XOR:
+		__futex_atomic_op("amoxor.w.aqrl %1,%z4,%2",
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
+	uintptr_t __tmp;
+
+	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(u32)))
+		return -EFAULT;
+
+	if (__riscv_atomic) {
+		__enable_user_access();
+		__asm__ __volatile__ (
+		"1:	lr.w.aqrl %1,%4				\n"
+		"	bne %1,%z5,3f				\n"
+		"2:	sc.w.aqrl %3,%z6,%2			\n"
+		"	bnez %3,1b				\n"
+		"3:						\n"
+		"	.section .fixup,\"ax\"			\n"
+		"	.balign 4				\n"
+		"4:	li %0,%7				\n"
+		"	jump 3b,%3				\n"
+		"	.previous				\n"
+		"	.section __ex_table,\"a\"		\n"
+		"	.balign " RISCV_SZPTR "			\n"
+		"	" RISCV_PTR " 1b, 4b			\n"
+		"	" RISCV_PTR " 2b, 4b			\n"
+		"	.previous				\n"
+		: "+r" (ret), "=&r" (val), "=m" (*uaddr), "=&r" (__tmp)
+		: "m" (*uaddr), "Jr" (oldval), "Jr" (newval),
+		  "i" (-EFAULT)
+		: "memory");
+		__disable_user_access();
+	} else {
+		ret = -ENOSYS;
+	}
+
+	*uval = val;
+	return ret;
+}
+
+#endif
+#endif /* _ASM_FUTEX_H */
-- 
2.19.0.rc0
