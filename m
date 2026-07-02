Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D83CC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AP9/8zAf+8uK9XiVxrenHWAl5wzCGgVnmV45LkYXHg=; b=1i44ySViHHLP5k
	Tpt4IkfdHBEzPaPVTsx4crgyGyJzT5r9mUGOlwxkYbbpe3EtiJ6pNJQAkR5FFBmVgTaaf42uPghcX
	BQzljS6jSqsROWheE6wBkKznZiwYY4VFY0sHlh7vpjpjxP1Qjb5g8CA+QI/0TlplH9i44MrUyhoXL
	DFGDNht0znjkl5XYV37KGJLzvT2oGwgprGfzDejLkw6C/enrwHSm49v4b3dGWJKorSDV9v5rhH2WK
	coNZQhgooniQcKsSeS0P8P3LJL4aHCSpV+LU4JmhlvfHYpfcHazYnT3cJuGpokZhOHujCljrfMV+o
	sL8ci/jkxgtCH4nWR+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZC-00000004Wwc-07Ig;
	Thu, 02 Jul 2026 13:34:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZ9-00000004Wug-2Fmw
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 13:34:57 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782999292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMjClHn/8cEWQWugP6itDhUfqWQrphI4vG3IqvzfW3k=;
	b=pkt36yvU2FXWp6ULPFMTtOYopzWG2dsTfWrEN12vNonUtI2o9TM+c/s6HyzqbO9FpQvCR3
	LsIpCmzFgdv43HA9ld3Vnl7jySUxG7frYen48Iko7CD5EDUWXOB05Sj9OLqICejUhpNS+r
	iVyxck6X4z7rFD3QkM2k7T+Yn0GCNB0tYUamyKX8Fogz+nniSN5VQZrNFF664TXckPyYQW
	alNrep3UCoy5nr6SuEmNMKdrdtKWG1ds2w2h+jiwt2AyqhxGkEV74qrhL5Lz6D/5amjS8E
	cHs4Yn2GjUskDHKW8+YXmw4IkXJIAvmX/qnCbagdkb2KJ5Yw0Cv/DSR0q0c1kw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782999292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMjClHn/8cEWQWugP6itDhUfqWQrphI4vG3IqvzfW3k=;
	b=oUQQhheySnCawGj3aeU5ZoXPvRA9LfKEgho/m0aM/lHOelrGNUXvFqGP7UYJGy3QItP/GF
	sjlL/13RYfbW+pCg==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 5/5] riscv: vdso: Implement __vdso_futex_robust_try_unlock()
Date: Thu,  2 Jul 2026 15:34:41 +0200
Message-ID: <31f6f5aa99f8be329d326005c4be2aa6f6bab43c.1782998849.git.namcao@linutronix.de>
In-Reply-To: <cover.1782998849.git.namcao@linutronix.de>
References: <cover.1782998849.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063455_864466_853D0A8B 
X-CRM114-Status: GOOD (  32.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is the RISC-V port for __vdso_futex_robust_try_unlock(). It is based
on the x86's implementation in commit 61cfc8e372d1 ("x86/vdso: Prepare for
robust futex unlock support") and commit a2274cc0091e ("x86/vdso: Implement
__vdso_futex_robust_try_unlock()").

When the FUTEX_ROBUST_UNLOCK mechanism is used for unlocking (PI-)futexes,
the unlock sequence in userspace looks like this:

  1)    robust_list_set_op_pending(mutex);
  2)    robust_list_remove(mutex);

        lval = gettid();
  3)    if (atomic_try_cmpxchg(&mutex->lock, lval, 0))
  4)            robust_list_clear_op_pending();
        else
  5)            sys_futex(OP,...FUTEX_ROBUST_UNLOCK);

That still leaves a minimal race window between #3 and #4 where the mutex
could be acquired by some other task which observes that it is the last
user and:

  1) unmaps the mutex memory
  2) maps a different file, which ends up covering the same address

When then the original task exits before reaching #4 then the kernel robust
list handling observes the pending op entry and tries to fix up user space.

In case that the newly mapped data contains the TID of the exiting thread
at the address of the mutex/futex the kernel will set the owner died bit in
that memory and therefore corrupt unrelated data.

Provide a VDSO function which exposes the critical section window in the
VDSO symbol table. The resulting addresses are updated in the task's mm
when the VDSO is (re)map()'ed.

The core code detects when a task was interrupted within the critical
section and is about to deliver a signal. It then invokes an architecture
specific function which determines whether the pending op pointer has to be
cleared or not. The unlock assembly sequence on 64-bit is:

        mv      a5, a0           ; move LOCK to a5
    .Lretry
        lr.w    a0, (a5)         ; load *LOCK
        bne     a0, a1, 24 .Lend ; if (*LOCK != TID) then exit
        sc.w.rl t0, zero, (a5)   ; try changing *LOCK from TID to zero
    .Lstart
        bnez    t0, .Lretry      ; retry if store-conditional failed
        sd      zero, 0(a2)      ; clear POP
    .Lend
        sext.w	a0,a0
        ret

So if the kernel sees that the user task is between .Lstart and .Lend,
t0 can be checked to determine if the pending op pointer (POP) should
be cleared.

When the kernel is built with ZACAS, another unlock assembly sequence
is provided using ZACAS instructions. If the CPU supports ZACAS, that
alternative sequence is used and the critical section is also changed
to that.

There are two entry points to handle the different robust list pending op
pointer sizes:

        __vdso_futex_robust_list64_try_unlock()
        __vdso_futex_robust_list32_try_unlock()

The 32-bit VDSO and compat VDSO provides
__vdso_futex_robust_list32_try_unlock().

Unlike x86, the RISC-V 64-bit VDSO provides only provides
__vdso_futex_robust_list64_try_unlock(). Because RISC-V threads can
only have one list_op_pending pointer type.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2:
  - Do not register the critical session range of compat vdso for
    native tasks and vice versa [Sashiko]
  - Correctly use amocas.w.rl for 32-bit lock pointer
---
 arch/riscv/Kconfig                         |  1 +
 arch/riscv/include/asm/cpufeature-macros.h |  2 +
 arch/riscv/include/asm/futex_robust.h      | 16 +++++
 arch/riscv/include/asm/vdso/futex.h        |  9 +++
 arch/riscv/kernel/compat_vdso/Makefile     |  7 +-
 arch/riscv/kernel/compat_vdso/futex.c      |  3 +
 arch/riscv/kernel/vdso.c                   | 57 +++++++++++++++
 arch/riscv/kernel/vdso/Makefile            | 14 +++-
 arch/riscv/kernel/vdso/futex.c             | 84 ++++++++++++++++++++++
 arch/riscv/kernel/vdso/vdso.lds.S          |  8 +++
 10 files changed, 199 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/futex_robust.h
 create mode 100644 arch/riscv/include/asm/vdso/futex.h
 create mode 100644 arch/riscv/kernel/compat_vdso/futex.c
 create mode 100644 arch/riscv/kernel/vdso/futex.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cb3d85abf595..0bf1f27f51f8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -166,6 +166,7 @@ config RISCV
 	select HAVE_FUNCTION_GRAPH_TRACER if HAVE_DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_TRACER if HAVE_DYNAMIC_FTRACE
+	select HAVE_FUTEX_ROBUST_UNLOCK
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_GENERIC_TIF_BITS
 	select HAVE_GUP_FAST if MMU
diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
index a8103edbf51f..f522c6c3cd97 100644
--- a/arch/riscv/include/asm/cpufeature-macros.h
+++ b/arch/riscv/include/asm/cpufeature-macros.h
@@ -6,6 +6,8 @@
 #ifndef _ASM_CPUFEATURE_MACROS_H
 #define _ASM_CPUFEATURE_MACROS_H
 
+#include <linux/types.h>
+
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 
diff --git a/arch/riscv/include/asm/futex_robust.h b/arch/riscv/include/asm/futex_robust.h
new file mode 100644
index 000000000000..16ec58e925c8
--- /dev/null
+++ b/arch/riscv/include/asm/futex_robust.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_FUTEX_ROBUST_H
+#define _ASM_RISCV_FUTEX_ROBUST_H
+
+#include <asm/ptrace.h>
+#include <asm/vdso/futex.h>
+
+static inline void __user *arch_futex_robust_unlock_get_pop(struct pt_regs *regs)
+{
+	if (cpu_supports_zacas())
+		return (regs->a0 == regs->a1) ? (void __user *)regs->a2 : NULL;
+	else
+		return (regs->t0 == 0) ? (void __user *)regs->a2 : NULL;
+}
+
+#endif /* _ASM_RISCV_FUTEX_ROBUST_H */
diff --git a/arch/riscv/include/asm/vdso/futex.h b/arch/riscv/include/asm/vdso/futex.h
new file mode 100644
index 000000000000..89a8c425994b
--- /dev/null
+++ b/arch/riscv/include/asm/vdso/futex.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm/cpufeature-macros.h>
+
+static inline bool cpu_supports_zacas(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS);
+}
diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index ffbf84aeb081..5736297e6281 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -31,7 +31,12 @@ COMPAT_CC_FLAGS += $(call cc-option,-mno-riscv-attribute)
 COMPAT_CC_FLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
 
 # Files to link into the compat_vdso
-obj-compat_vdso = $(patsubst %, %.o, $(compat_vdso-syms)) note.o
+obj-compat_vdso := $(patsubst %, %.o, $(compat_vdso-syms)) note.o
+
+ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+compat_vdso-syms += __vdso_futex_robust_list32_try_unlock
+obj-compat_vdso += futex.o
+endif
 
 # Build rules
 targets := $(obj-compat_vdso) compat_vdso.so compat_vdso.so.dbg compat_vdso.lds
diff --git a/arch/riscv/kernel/compat_vdso/futex.c b/arch/riscv/kernel/compat_vdso/futex.c
new file mode 100644
index 000000000000..ad05ded43955
--- /dev/null
+++ b/arch/riscv/kernel/compat_vdso/futex.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "../vdso/futex.c"
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 9c2f5e442338..35db183a050e 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/binfmts.h>
 #include <linux/err.h>
+#include <linux/futex.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
 #include <linux/vdso_datastore.h>
@@ -33,11 +34,65 @@ static struct __vdso_info vdso_info;
 static struct __vdso_info compat_vdso_info;
 #endif
 
+#define _CONCAT3(a, b, c)	a ## b ## c
+#define CONCAT3(a, b, c)	_CONCAT3(a, b, c)
+
+#if defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
+#define FUTEX_CAS_OVERWRITE_VDSO_CS_RANGE(vdso, fd, idx, xlen, symbol)				\
+{												\
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {				\
+		void *start = symbol(vdso, CONCAT3(futex_list, xlen, _try_unlock_cs_cas_start));\
+		void *end   = symbol(vdso, CONCAT3(futex_list, xlen, _try_unlock_cs_cas_end));	\
+												\
+		futex_set_vdso_cs_range(fd, idx, (uintptr_t)start, (uintptr_t)end, xlen == 32);	\
+	}											\
+}
+#else
+#define FUTEX_CAS_OVERWRITE_VDSO_CS_RANGE(...)
+#endif
+
+#define FUTEX_SET_VDSO_CS_RANGE(vdso, fd, idx, xlen, symbol)					\
+{												\
+	void *start = symbol(vdso, CONCAT3(futex_list, xlen, _try_unlock_cs_lrsc_start));	\
+	void *end   = symbol(vdso, CONCAT3(futex_list, xlen, _try_unlock_cs_lrsc_end));		\
+												\
+	futex_set_vdso_cs_range(fd, idx, (uintptr_t)start, (uintptr_t)end, xlen == 32);		\
+												\
+	FUTEX_CAS_OVERWRITE_VDSO_CS_RANGE(vdso, fd, idx, xlen, symbol);				\
+												\
+}
+
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+
+/* Allow parameters to expand first */
+#define __VDSO_SYMBOL(vdso, name)		VDSO_SYMBOL(vdso, name)
+#define __COMPAT_VDSO_SYMBOL(vdso, name)	COMPAT_VDSO_SYMBOL(vdso, name)
+
+static void vdso_futex_robust_unlock_update_ips(void)
+{
+	unsigned long vdso = (unsigned long) current->mm->context.vdso;
+	struct futex_mm_data *fd = &current->mm->futex;
+
+	futex_reset_cs_ranges(fd);
+
+	FUTEX_SET_VDSO_CS_RANGE(vdso, fd, 0, __riscv_xlen, __VDSO_SYMBOL);
+
+#ifdef CONFIG_COMPAT
+	if (is_compat_task())
+		FUTEX_SET_VDSO_CS_RANGE(vdso, fd, 0, 32, __COMPAT_VDSO_SYMBOL);
+#endif
+}
+#else
+static inline void vdso_futex_robust_unlock_update_ips(void) {}
+#endif
+
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		       struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)new_vma->vm_start;
 
+	vdso_futex_robust_unlock_update_ips();
+
 	return 0;
 }
 
@@ -147,6 +202,8 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	if (IS_ERR(ret))
 		goto up_fail;
 
+	vdso_futex_robust_unlock_update_ips();
+
 	return 0;
 
 up_fail:
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index a842dc034571..9602c9172e04 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -27,12 +27,24 @@ asflags-y += -DVDSO_CFI=1
 endif
 
 # Files to link into the vdso
-obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
+obj-vdso := $(patsubst %, %.o, $(vdso-syms)) note.o
 
 ifdef CONFIG_VDSO_GETRANDOM
 obj-vdso += vgetrandom-chacha.o
 endif
 
+ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+
+obj-vdso += futex.o
+
+ifdef CONFIG_64BIT
+vdso-syms += __vdso_futex_robust_list64_try_unlock
+else
+vdso-syms += __vdso_futex_robust_list32_try_unlock
+endif
+
+endif
+
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
 ccflags-y += -fno-builtin
diff --git a/arch/riscv/kernel/vdso/futex.c b/arch/riscv/kernel/vdso/futex.c
new file mode 100644
index 000000000000..7da77e635012
--- /dev/null
+++ b/arch/riscv/kernel/vdso/futex.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/stringify.h>
+#include <vdso/futex.h>
+#include <asm/hwcap.h>
+#include <asm/cpufeature-macros.h>
+#include <asm/vdso/futex.h>
+
+#define LABEL(pop_size, which) __stringify(__vdso_futex_list##pop_size##_try_unlock_cs_##which)
+
+#define futex_robust_try_unlock_cas(pop_size, store_pop, lock, tid, pop)	\
+({										\
+	/*									\
+	 * arch_futex_robust_unlock_get_pop() assumes the variables are in	\
+	 * those registers. So make sure.					\
+	 *									\
+	 * tid and pop are in a1 and a2 at function entry according to the	\
+	 * calling convention, so it likely still works if we remove _tid	\
+	 * and _pop. But technically compiler is allowed to move tid and pop	\
+	 * to different registers, and _tid and _pop do not generate any	\
+	 * extra instructions so it does not hurt to keep them.			\
+	 */									\
+	register __u32  ret asm ("a0") = tid;					\
+	register __u32 _tid asm ("a1") = tid;					\
+	register void *_pop asm ("a2") = pop;					\
+										\
+	asm volatile (								\
+		"	amocas.w.rl	%[ret], zero, (%[lock])\n"		\
+		LABEL(pop_size, cas_start)":"					\
+		"	bne %[ret], %[tid], "LABEL(pop_size, cas_end)"\n"	\
+		"	"store_pop" zero, (%[pop])\n"				\
+		LABEL(pop_size, cas_end)":"					\
+		: [ret]  "+&r" (ret)						\
+		: [tid]  "r"   (_tid),						\
+		  [lock] "r"   (lock),						\
+		  [pop]  "r"   (_pop)						\
+		: "memory"							\
+	);									\
+										\
+	ret;									\
+})
+
+#define futex_robust_try_unlock_lrsc(pop_size, store_pop, lock, tid, pop)	\
+({										\
+	register void *_pop asm ("a2") = pop;					\
+	__u32 ret;								\
+										\
+	asm volatile (								\
+		"1:	lr.w %[ret], (%[lock])\n"				\
+		"	bne %[ret], %[tid], "LABEL(pop_size, lrsc_end)"\n"	\
+		"	sc.w.rl	t0, x0, (%[lock])\n"				\
+		LABEL(pop_size, lrsc_start)":"					\
+		"	bnez t0, 1b\n"						\
+		"	"store_pop" zero, (%[pop])\n"				\
+		LABEL(pop_size, lrsc_end)":"					\
+		: [ret]  "=&r" (ret)						\
+		: [tid]  "r"   (tid),						\
+		  [lock] "r"   (lock),						\
+		  [pop]  "r"   (_pop)						\
+		: "t0", "memory"						\
+	);									\
+										\
+	ret;									\
+})
+
+
+#if __riscv_xlen == 64
+__u32 __vdso_futex_robust_list64_try_unlock(__u32 *lock, __u32 tid, __u64 *pop)
+{
+	if (cpu_supports_zacas())
+		return futex_robust_try_unlock_cas(64, "sd", lock, tid, pop);
+	else
+		return futex_robust_try_unlock_lrsc(64, "sd", lock, tid, pop);
+}
+#endif
+
+#if __riscv_xlen == 32
+__u32 __vdso_futex_robust_list32_try_unlock(__u32 *lock, __u32 tid, __u32 *pop)
+{
+	if (cpu_supports_zacas())
+		return futex_robust_try_unlock_cas(32, "sw", lock, tid, pop);
+	else
+		return futex_robust_try_unlock_lrsc(32, "sw", lock, tid, pop);
+}
+#endif
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index c29ef12a63bb..9acfa9ef5bab 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -82,6 +82,14 @@ VERSION
 #endif
 #if defined(CONFIG_VDSO_GETRANDOM) && !defined(COMPAT_VDSO)
 		__vdso_getrandom;
+#endif
+
+#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
+#if defined(CONFIG_32BIT) || defined(COMPAT_VDSO)
+		__vdso_futex_robust_list32_try_unlock;
+#else
+		__vdso_futex_robust_list64_try_unlock;
+#endif
 #endif
 	local: *;
 	};
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
