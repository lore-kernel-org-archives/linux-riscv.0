Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0347AC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 06:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+WSSluNu4XiZrpBPqiulLCY82wEDjadNbZkDlXRvWM=; b=n4lk+T6CVDgN9p
	bnxWoEVlIqOTh+HSfGBEruYAZQyCNEXQm6hE4v44iE9YrQYyjOX7RkpI8zjevCM6LAJUXAhcs5bNp
	FOQTi+/niDaAWdnwdzUH7egOW3vA5gIAgUSoPBJYuV97xGo2TIhyY8MWK3qdgA0kNqND4QjJ65CiS
	oJNFdxDFz/eLV3aJBIE9OQr0Z0gxVOMaKwykrKsszdrjrha+RVgouEfZLG8i3JCfsV7Y8bAO7AOqq
	AbZx/ExfOhkj+S4uBED7UJ/ERxMMsthzBLxR0ecv7Kf/erOnXM4+PzezuIGU5nWU/ngIefNJ3pd+4
	LEsDDln/8FgqlOasmF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYbV-007CFM-0m;
	Tue, 02 Jan 2024 06:50:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYbR-007CEO-2e
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 06:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59D63CE0BDA;
	Tue,  2 Jan 2024 06:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B069C433CA;
	Tue,  2 Jan 2024 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704178215;
	bh=WRdTVDlAOr21h6vdX62yZArWAQivJDDm8KoIYemBcBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wa8heIs7ON/5Pd+LayIk7L8x/7cxUxcXveLC1B8qu+B6gV+fCp+XftN9pgduwtCis
	 XrGYT7dM6EXTN3wmXKn9f6En4hC55OgduPzwRtSs6ERoRmEk94pILk3N+hgS+YHcwB
	 JVjm2DhQo1bGXKWXtvlBDVNSWfrQD+qaYECrewyYJn/iCR9KSNO7VzLwdProKLvXNk
	 ZLwa2+gZV5xYNAO1/5lhoL7KHue9/XEagnlsEyGULxn/3qwbyWEGfKHoaugTKb7uDU
	 K/a1xka9H8bcR/Un/1EUW8wNKLMUZ7IqII8Opid4MZ/rkUcEPoYpK7rwffzlPjHnRI
	 uFO4tKnU1e0Ag==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerry Shih <jerry.shih@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	hongrong.hsu@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC PATCH 01/13] riscv: Add support for kernel mode vector
Date: Tue,  2 Jan 2024 00:47:27 -0600
Message-ID: <20240102064743.220490-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102064743.220490-1-ebiggers@kernel.org>
References: <20240102064743.220490-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_225018_319547_198BD21C 
X-CRM114-Status: GOOD (  25.85  )
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

From: Greentime Hu <greentime.hu@sifive.com>

Add kernel_vector_begin() and kernel_vector_end() function declarations
and corresponding definitions in kernel_mode_vector.c

These are needed to wrap uses of vector in kernel mode.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/include/asm/processor.h     |  13 ++-
 arch/riscv/include/asm/simd.h          |  44 ++++++++++
 arch/riscv/include/asm/vector.h        |   9 ++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/kernel_mode_vector.c | 116 +++++++++++++++++++++++++
 arch/riscv/kernel/process.c            |   1 +
 6 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/simd.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda549..28d19aea24b1d 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -66,29 +66,40 @@
 #define TASK_UNMAPPED_BASE	PAGE_ALIGN((UL(1) << MMAP_MIN_VA_BITS) / 3)
 #else
 #define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
 #endif
 
 #ifndef __ASSEMBLY__
 
 struct task_struct;
 struct pt_regs;
 
+/*
+ * We use a flag to track in-kernel Vector context. Currently the flag has the
+ * following meaning:
+ *
+ *  - bit 0: indicates whether the in-kernel Vector context is active. The
+ *    activation of this state disables the preemption. Currently only 0 and 1
+ *    are valid value for this field. Other values are reserved for future uses.
+ */
+#define RISCV_KERNEL_MODE_V	0x1
+
 /* CPU-specific state of a task */
 struct thread_struct {
 	/* Callee-saved registers */
 	unsigned long ra;
 	unsigned long sp;	/* Kernel mode stack */
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
-	unsigned long vstate_ctrl;
+	u32 riscv_v_flags;
+	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
 static inline void arch_thread_struct_whitelist(unsigned long *offset,
 						unsigned long *size)
 {
 	*offset = offsetof(struct thread_struct, fstate);
 	*size = sizeof_field(struct thread_struct, fstate);
diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
new file mode 100644
index 0000000000000..ef8af413a9fc7
--- /dev/null
+++ b/arch/riscv/include/asm/simd.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef __ASM_SIMD_H
+#define __ASM_SIMD_H
+
+#include <linux/compiler.h>
+#include <linux/irqflags.h>
+#include <linux/percpu.h>
+#include <linux/preempt.h>
+#include <linux/types.h>
+
+#include <asm/vector.h>
+
+#ifdef CONFIG_RISCV_ISA_V
+/*
+ * may_use_simd - whether it is allowable at this time to issue vector
+ *                instructions or access the vector register file
+ *
+ * Callers must not assume that the result remains true beyond the next
+ * preempt_enable() or return from softirq context.
+ */
+static __must_check inline bool may_use_simd(void)
+{
+	/*
+	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
+	 * and is clear whenever preemption is enabled.
+	 */
+	return !in_hardirq() && !in_nmi() && !(riscv_v_flags() & RISCV_KERNEL_MODE_V);
+}
+
+#else /* ! CONFIG_RISCV_ISA_V */
+
+static __must_check inline bool may_use_simd(void)
+{
+	return false;
+}
+
+#endif /* ! CONFIG_RISCV_ISA_V */
+
+#endif
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 87aaef656257c..71af3404fda14 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -15,20 +15,29 @@
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 #include <asm/ptrace.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/asm.h>
 
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool riscv_v_first_use_handler(struct pt_regs *regs);
+void kernel_vector_begin(void);
+void kernel_vector_end(void);
+void get_cpu_vector_context(void);
+void put_cpu_vector_context(void);
+
+static inline u32 riscv_v_flags(void)
+{
+	return current->thread.riscv_v_flags;
+}
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
 }
 
 static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
 {
 	regs->status = (regs->status & ~SR_VS) | SR_VS_CLEAN;
 }
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fee22a3d1b534..8c58595696b32 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -56,20 +56,21 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
 obj-y	+= probes/
 obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
+obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
 
 obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
 obj-$(CONFIG_MODULES)		+= module.o
 obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
 
 obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
 obj-$(CONFIG_HIBERNATION)	+= hibernate.o hibernate-asm.o
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
new file mode 100644
index 0000000000000..114cf4f0a0eb6
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Author: Catalin Marinas <catalin.marinas@arm.com>
+ * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
+ * Copyright (C) 2021 SiFive
+ */
+#include <linux/compiler.h>
+#include <linux/irqflags.h>
+#include <linux/percpu.h>
+#include <linux/preempt.h>
+#include <linux/types.h>
+
+#include <asm/vector.h>
+#include <asm/switch_to.h>
+#include <asm/simd.h>
+
+static inline void riscv_v_flags_set(u32 flags)
+{
+	current->thread.riscv_v_flags = flags;
+}
+
+static inline void riscv_v_start(u32 flags)
+{
+	int orig;
+
+	orig = riscv_v_flags();
+	BUG_ON((orig & flags) != 0);
+	riscv_v_flags_set(orig | flags);
+}
+
+static inline void riscv_v_stop(u32 flags)
+{
+	int orig;
+
+	orig = riscv_v_flags();
+	BUG_ON((orig & flags) == 0);
+	riscv_v_flags_set(orig & ~flags);
+}
+
+/*
+ * Claim ownership of the CPU vector context for use by the calling context.
+ *
+ * The caller may freely manipulate the vector context metadata until
+ * put_cpu_vector_context() is called.
+ */
+void get_cpu_vector_context(void)
+{
+	preempt_disable();
+
+	riscv_v_start(RISCV_KERNEL_MODE_V);
+}
+
+/*
+ * Release the CPU vector context.
+ *
+ * Must be called from a context in which get_cpu_vector_context() was
+ * previously called, with no call to put_cpu_vector_context() in the
+ * meantime.
+ */
+void put_cpu_vector_context(void)
+{
+	riscv_v_stop(RISCV_KERNEL_MODE_V);
+
+	preempt_enable();
+}
+
+/*
+ * kernel_vector_begin(): obtain the CPU vector registers for use by the calling
+ * context
+ *
+ * Must not be called unless may_use_simd() returns true.
+ * Task context in the vector registers is saved back to memory as necessary.
+ *
+ * A matching call to kernel_vector_end() must be made before returning from the
+ * calling context.
+ *
+ * The caller may freely use the vector registers until kernel_vector_end() is
+ * called.
+ */
+void kernel_vector_begin(void)
+{
+	if (WARN_ON(!has_vector()))
+		return;
+
+	BUG_ON(!may_use_simd());
+
+	get_cpu_vector_context();
+
+	riscv_v_vstate_save(current, task_pt_regs(current));
+
+	riscv_v_enable();
+}
+EXPORT_SYMBOL_GPL(kernel_vector_begin);
+
+/*
+ * kernel_vector_end(): give the CPU vector registers back to the current task
+ *
+ * Must be called from a context in which kernel_vector_begin() was previously
+ * called, with no call to kernel_vector_end() in the meantime.
+ *
+ * The caller must not use the vector registers after this function is called,
+ * unless kernel_vector_begin() is called again in the meantime.
+ */
+void kernel_vector_end(void)
+{
+	if (WARN_ON(!has_vector()))
+		return;
+
+	riscv_v_vstate_restore(current, task_pt_regs(current));
+
+	riscv_v_disable();
+
+	put_cpu_vector_context();
+}
+EXPORT_SYMBOL_GPL(kernel_vector_end);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4f21d970a1292..4a1275db11460 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -214,14 +214,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		*childregs = *(current_pt_regs());
 		/* Turn off status.VS */
 		riscv_v_vstate_off(childregs);
 		if (usp) /* User fork */
 			childregs->sp = usp;
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
 		p->thread.s[0] = 0;
 	}
+	p->thread.riscv_v_flags = 0;
 	p->thread.ra = (unsigned long)ret_from_fork;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
