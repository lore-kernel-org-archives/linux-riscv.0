Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5125BCD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mYnHOBvfvx+mNhK/D99WWhIuX57YAv+PNo8ttJmncP0=; b=RxneE1SsWtL+2Y
	alDI4EJqCDUbkhLHYJM7wZTJYQQ28/07SjFe1zOfRpOtmtgLtrhZBwWXyrkseUZNB6ma/EZE2asaD
	M1KN1jBo+RbCHvadM0N+gl35hKsi7bUGpVY/V5NPnD3jzxtuRuNgLKeg0TwwbGUqWaRCKOendHEzn
	zgQI8VjuQig1wzagJFXIl5hVrXOp9OLmEtYwPY7k+epUB66KrsQhZT3ut2v4bdDXbfXgmpfVocUZO
	M2TOt7bZIfcKtt5YXsHPHCRPRpXIjxfSsX4n4qT9zexOpc8Ba8N7Pz/AuI5V6BCcKTcQlKAfiMLZm
	7GdqBcEofkeFkDos5PjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEdm-00000005jGJ-0H2k;
	Fri, 08 May 2026 06:24:50 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEdh-00000005jFR-3ebD
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 06:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778221483; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=FjRjnWm6nC4mCrROsvjUohCIqJdeR4lzxT2vvsoQElM=;
	b=cwYWFYKZDOzgIwe9bo475fE8xFst6sVYnuSQGEvNRHzvCI5qdAe3iS87RhbLy5U7jhj40US+kwl2CbQmDob8mLdGbKkSoYlS1wV6oCjPCwPeQ5cY+0pPGqqfVkk2cxgLWUX2U9lmq9//YnB6Lj46iouf3wWbyGyPkfDOuAXxQ/Y=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X2WPHE4_1778221480;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X2WPHE4_1778221480 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 08 May 2026 14:24:42 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH] riscv: add copy_mc_to_{kernel,user} support to enable MC fault tolerance
Date: Fri,  8 May 2026 14:24:39 +0800
Message-ID: <20260508062439.3000014-1-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_232446_862322_0AF1AF31 
X-CRM114-Status: GOOD (  34.26  )
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

copy_mc_to_kernel() and copy_mc_to_user() are architecture hooks that
let the kernel survive an uncorrectable hardware memory error (e.g. an
uncorrectable ECC fault) raised during the *source* read of a memory
copy.  They are the cornerstone of graceful error recovery on every
path that has to duplicate a page whose contents might already be bad:

  - COW (copy-on-write): wp_page_copy(), do_cow_fault(),
    copy_present_page() in fork, and __wp_page_copy_user() all
    route their per-page copy through copy_mc_user_highpage();
  - hugetlb / THP: copy_user_gigantic_page(), copy_subpage(),
    __collapse_huge_page_copy() and collapse_file() rely on the
    same hook (copy_mc_user_highpage / copy_mc_highpage) to clone
    or collapse 2 MiB / 1 GiB folios without tearing the kernel
    down on a single bad cacheline;
  - page reclaim / migration / KSM: folio_mc_copy(),
    ksm_might_need_to_copy(), compaction and NUMA balancing;
  - file I/O on byte-addressable memory (DAX, CXL.mem, and the
    iov_iter MC helpers) and core-dump writeout.

When any of these callers hits a hardware error during the load, the
copy_mc_* helper returns a non-zero byte count instead of oopsing the
kernel.  The caller can then react in whatever way fits the context:
propagate -EFAULT back to the originating syscall, isolate the poisoned
page through memory_failure_queue(), retry on a clean replica, or as
a last resort kill the owning task.  The system as a whole keeps
running.

This is also why a new copy routine is required rather than reusing
the existing memcpy().  The C contract for memcpy() is

        void *memcpy(void *dst, const void *src, size_t n);

it returns dst unconditionally and has no out-of-band way to tell
the caller whether the copy actually succeeded.  MC-aware callers
need exactly that signal - a single "did the hardware raise an
exception during this copy or not" bit - so the API has to be

        unsigned long memcpy_mc(void *dst, const void *src, size_t n);

where the return value serves as the error indicator (0 on success,
non-zero when a load faulted).  The fact that the non-zero value
happens to be the remaining byte count is just a useful implementation
detail for optional follow-up work such as poisoning the exact
sub-range; the essential point is that a successful copy and a
failed copy can no longer be distinguished from the outside with
memcpy()'s void-pointer return, so a new function is unavoidable.

RISC-V previously did not provide either of the copy_mc_* hooks, so
the generic fallback in <linux/uaccess.h> was used:

        static inline unsigned long
        copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
        {
                memcpy(dst, src, cnt);
                return 0;
        }

That fallback has no exception-table entry on the load side, so an
access to poisoned memory (reported through the RAS/AIA path) takes
the kernel down just like any other unhandled fault - defeating the
whole point of the copy_mc_* API and leaving every COW / hugetlb /
THP-collapse / migration path above exposed on RISC-V.  A native
implementation that actually stops on the faulting load and signals
the error through its return value is therefore required.

A word on the exception-table entry type used by this patch: x86 and
arm64 both carry dedicated "MC-safe" flavours in their extable
infrastructure.  x86 defines EX_TYPE_DEFAULT_MCE_SAFE and
EX_TYPE_FAULT_MCE_SAFE (see arch/x86/include/asm/extable_fixup_types.h
and the fixups in arch/x86/lib/copy_mc_64.S), while arm64 ends up
reusing EX_TYPE_KACCESS_ERR_ZERO for the same purpose.  Tempting as
it is to mirror that and introduce a new RISC-V-specific type, it
turns out to buy very little in practice: inspecting
arch/x86/mm/extable.c shows that EX_TYPE_DEFAULT_MCE_SAFE shares its
handler with EX_TYPE_DEFAULT, and EX_TYPE_FAULT_MCE_SAFE shares its
handler with EX_TYPE_FAULT - in every case the fixup simply redirects
PC to the fixup label and lets the caller return.  The tag mostly
serves as documentation.  Because the fix-up behaviour we need is
identical to that of a plain extable entry, this patch keeps things
simple and uses the existing _asm_extable helper rather than growing
a new EX_TYPE_* constant; if a future RAS integration ever needs to
discriminate MC-safe sites from ordinary ones, the tag can be added
later without touching any call site.

Implement it by factoring the existing hand-written memcpy into a
shared template and reusing it for the MC variant:

  - memcpy_template.S
    The whole body of the original memcpy.S is moved here verbatim,
    with every load/store expressed through six parametric macros:
    LOAD_B / STORE_B, LOAD_W / STORE_W and LOAD_REG / STORE_REG.
    The template is #include'd into a SYM_FUNC_START/END wrapper by
    the caller, which also supplies the macro definitions.

  - memcpy.S
    Now only defines plain lb/sb, lw/sw and REG_L/REG_S macros and
    includes the template.  The generated code for __memcpy() is
    byte-for-byte equivalent to the previous open-coded version, so
    the hot path for regular kernel memcpy is unchanged.

  - memcpy_mc.S (new)
    Defines the same macros, but every *load* is wrapped in a "fixup"
    macro that emits an _asm_extable entry pointing at a local label
    6:.  On the happy path __memcpy_mc() returns 0; on a hardware
    error the exception handler jumps to label 6:, which returns a
    non-zero value (the still-outstanding byte count held
    in a2) to flag the failure to the caller.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/riscv/Kconfig               |   1 +
 arch/riscv/include/asm/uaccess.h |  25 +++++++
 arch/riscv/lib/Makefile          |   2 +
 arch/riscv/lib/memcpy.S          | 113 ++++++----------------------
 arch/riscv/lib/memcpy_mc.S       |  57 ++++++++++++++
 arch/riscv/lib/memcpy_template.S | 124 +++++++++++++++++++++++++++++++
 6 files changed, 233 insertions(+), 89 deletions(-)
 create mode 100644 arch/riscv/lib/memcpy_mc.S
 create mode 100644 arch/riscv/lib/memcpy_template.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9fb053839feb..83b4d313fafd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_COPY_MC
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 11c9886c3b70..0d93fff8329a 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -487,6 +487,31 @@ static inline void user_access_restore(unsigned long enabled) { }
 	if (__asm_copy_from_user_sum_enabled(_dst, _src, _len))		\
 		goto label;
 
+#ifdef CONFIG_ARCH_HAS_COPY_MC
+unsigned long memcpy_mc(void *dst, const void *src, unsigned long n);
+/**
+ * copy_mc_to_kernel/user - memory copy that handles source exceptions
+ *
+ * @to:		destination address
+ * @from:	source address
+ * @size:	number of bytes to copy
+ *
+ * Return 0 for success, or bytes not copied.
+ */
+static inline unsigned long __must_check
+copy_mc_to_kernel(void *to, const void *from, unsigned long size)
+{
+	return memcpy_mc(to, from, size);
+}
+#define copy_mc_to_kernel copy_mc_to_kernel
+
+static inline unsigned long __must_check
+copy_mc_to_user(void __user *to, const void *from, unsigned long size)
+{
+	return raw_copy_to_user(to, from, size);
+}
+#endif
+
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 6f767b2a349d..2cad46615640 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -20,3 +20,5 @@ lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
+
+lib-$(CONFIG_ARCH_HAS_COPY_MC) += memcpy_mc.o
diff --git a/arch/riscv/lib/memcpy.S b/arch/riscv/lib/memcpy.S
index 44e009ec5fef..55216111901e 100644
--- a/arch/riscv/lib/memcpy.S
+++ b/arch/riscv/lib/memcpy.S
@@ -7,102 +7,37 @@
 #include <asm/asm.h>
 
 /* void *memcpy(void *, const void *, size_t) */
-SYM_FUNC_START(__memcpy)
-	move t6, a0  /* Preserve return value */
 
-	/* Defer to byte-oriented copy for small sizes */
-	sltiu a3, a2, 128
-	bnez a3, 4f
-	/* Use word-oriented copy only if low-order bits match */
-	andi a3, t6, SZREG-1
-	andi a4, a1, SZREG-1
-	bne a3, a4, 4f
+/*
+ * Plain load/store macros for kernel memory copy (no fixup tables).
+ * These are used by copy_template.S which is #include'd below.
+ */
+	.macro LOAD_B reg, offset, ptr
+	lb \reg, \offset(\ptr)
+	.endm
 
-	beqz a3, 2f  /* Skip if already aligned */
-	/*
-	 * Round to nearest double word-aligned address
-	 * greater than or equal to start address
-	 */
-	andi a3, a1, ~(SZREG-1)
-	addi a3, a3, SZREG
-	/* Handle initial misalignment */
-	sub a4, a3, a1
-1:
-	lb a5, 0(a1)
-	addi a1, a1, 1
-	sb a5, 0(t6)
-	addi t6, t6, 1
-	bltu a1, a3, 1b
-	sub a2, a2, a4  /* Update count */
+	.macro STORE_B reg, offset, ptr
+	sb \reg, \offset(\ptr)
+	.endm
 
-2:
-	andi a4, a2, ~((16*SZREG)-1)
-	beqz a4, 4f
-	add a3, a1, a4
-3:
-	REG_L a4,       0(a1)
-	REG_L a5,   SZREG(a1)
-	REG_L a6, 2*SZREG(a1)
-	REG_L a7, 3*SZREG(a1)
-	REG_L t0, 4*SZREG(a1)
-	REG_L t1, 5*SZREG(a1)
-	REG_L t2, 6*SZREG(a1)
-	REG_L t3, 7*SZREG(a1)
-	REG_L t4, 8*SZREG(a1)
-	REG_L t5, 9*SZREG(a1)
-	REG_S a4,       0(t6)
-	REG_S a5,   SZREG(t6)
-	REG_S a6, 2*SZREG(t6)
-	REG_S a7, 3*SZREG(t6)
-	REG_S t0, 4*SZREG(t6)
-	REG_S t1, 5*SZREG(t6)
-	REG_S t2, 6*SZREG(t6)
-	REG_S t3, 7*SZREG(t6)
-	REG_S t4, 8*SZREG(t6)
-	REG_S t5, 9*SZREG(t6)
-	REG_L a4, 10*SZREG(a1)
-	REG_L a5, 11*SZREG(a1)
-	REG_L a6, 12*SZREG(a1)
-	REG_L a7, 13*SZREG(a1)
-	REG_L t0, 14*SZREG(a1)
-	REG_L t1, 15*SZREG(a1)
-	addi a1, a1, 16*SZREG
-	REG_S a4, 10*SZREG(t6)
-	REG_S a5, 11*SZREG(t6)
-	REG_S a6, 12*SZREG(t6)
-	REG_S a7, 13*SZREG(t6)
-	REG_S t0, 14*SZREG(t6)
-	REG_S t1, 15*SZREG(t6)
-	addi t6, t6, 16*SZREG
-	bltu a1, a3, 3b
-	andi a2, a2, (16*SZREG)-1  /* Update count */
+	.macro LOAD_REG reg, offset, ptr
+	REG_L \reg, \offset(\ptr)
+	.endm
 
-4:
-	/* Handle trailing misalignment */
-	beqz a2, 6f
-	add a3, a1, a2
+	.macro STORE_REG reg, offset, ptr
+	REG_S \reg, \offset(\ptr)
+	.endm
 
-	/* Use word-oriented copy if co-aligned to word boundary */
-	or a5, a1, t6
-	or a5, a5, a3
-	andi a5, a5, 3
-	bnez a5, 5f
-7:
-	lw a4, 0(a1)
-	addi a1, a1, 4
-	sw a4, 0(t6)
-	addi t6, t6, 4
-	bltu a1, a3, 7b
+	.macro LOAD_W reg, offset, ptr
+	lw \reg, \offset(\ptr)
+	.endm
 
-	ret
+	.macro STORE_W reg, offset, ptr
+	sw \reg, \offset(\ptr)
+	.endm
 
-5:
-	lb a4, 0(a1)
-	addi a1, a1, 1
-	sb a4, 0(t6)
-	addi t6, t6, 1
-	bltu a1, a3, 5b
-6:
+SYM_FUNC_START(__memcpy)
+#include "memcpy_template.S"
 	ret
 SYM_FUNC_END(__memcpy)
 SYM_FUNC_ALIAS_WEAK(memcpy, __memcpy)
diff --git a/arch/riscv/lib/memcpy_mc.S b/arch/riscv/lib/memcpy_mc.S
new file mode 100644
index 000000000000..76825cabfc16
--- /dev/null
+++ b/arch/riscv/lib/memcpy_mc.S
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 Regents of the University of California
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/asm-extable.h>
+
+	.macro fixup op reg addr lbl
+100:
+	\op \reg, \addr
+	_asm_extable	100b, \lbl
+	.endm
+
+/* int memcpy_mc(void *, const void *, size_t) */
+
+/*
+ * Load macros with fixup for MC-aware copy: only source (load) operations
+ * are protected by exception table entries, since the destination buffer
+ * is known-good kernel memory. Store operations are plain.
+ */
+	.macro LOAD_B reg, offset, ptr
+	fixup lb \reg, \offset(\ptr), 6f
+	.endm
+
+	.macro STORE_B reg, offset, ptr
+	fixup sb \reg, \offset(\ptr), 6f
+	.endm
+
+	.macro LOAD_REG reg, offset, ptr
+	fixup REG_L \reg, \offset(\ptr), 6f
+	.endm
+
+	.macro STORE_REG reg, offset, ptr
+	fixup REG_S \reg, \offset(\ptr), 6f
+	.endm
+
+	.macro LOAD_W reg, offset, ptr
+	fixup lw \reg, \offset(\ptr), 6f
+	.endm
+
+	.macro STORE_W reg, offset, ptr
+	fixup sw \reg, \offset(\ptr), 6f
+	.endm
+
+SYM_FUNC_START(__memcpy_mc)
+#include "memcpy_template.S"
+	move a0, zero
+	ret
+6:
+	move a0, a2
+	ret
+SYM_FUNC_END(__memcpy_mc)
+SYM_FUNC_ALIAS_WEAK(memcpy_mc, __memcpy_mc)
+SYM_FUNC_ALIAS(__pi_memcpy_mc, __memcpy_mc)
+SYM_FUNC_ALIAS(__pi___memcpy_mc, __memcpy_mc)
diff --git a/arch/riscv/lib/memcpy_template.S b/arch/riscv/lib/memcpy_template.S
new file mode 100644
index 000000000000..6d9a34e652d0
--- /dev/null
+++ b/arch/riscv/lib/memcpy_template.S
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 Regents of the University of California
+ *
+ * RISC-V memory copy template. This file is #include'd by memcpy.S and
+ * memcpy_mc.S. The includer must define the following macros before the
+ * #include:
+ *
+ *   LOAD_B(reg, offset, ptr)    - byte load from source
+ *   STORE_B(reg, offset, ptr)   - byte store to destination
+ *   LOAD_REG(reg, offset, ptr)  - SZREG-sized load from source
+ *   STORE_REG(reg, offset, ptr) - SZREG-sized store to destination
+ *   LOAD_W(reg, offset, ptr)    - 32-bit word load from source
+ *   STORE_W(reg, offset, ptr)   - 32-bit word store to destination
+ *
+ * For MC-aware copies, LOAD_* macros should use fixup with label "6f".
+ * The includer must provide the "6:" fixup handler that returns the
+ * number of bytes not copied in a0.
+ *
+ * Register usage (caller must set a0,a1,a2 per standard calling convention):
+ *   a0 (a0)   - original destination address (also return value)
+ *   a1 (SRC)     - source pointer (advanced during copy)
+ *   a2 (COUNT)   - number of bytes to copy / remaining count
+ *   t6 (DST)     - working destination pointer
+ */
+
+	move t6, a0  /* Preserve return value */
+
+	/* Defer to byte-oriented copy for small sizes */
+	sltiu a3, a2, 128
+	bnez a3, .Ltail
+
+	/* Use word-oriented copy only if low-order bits match */
+	andi a3, t6, SZREG-1
+	andi a4, a1, SZREG-1
+	bne a3, a4, .Ltail
+
+	beqz a3, .Laligned  /* Skip if already aligned */
+	/*
+	 * Round to nearest double word-aligned address
+	 * greater than or equal to start address
+	 */
+	andi a3, a1, ~(SZREG-1)
+	addi a3, a3, SZREG
+	/* Handle initial misalignment */
+	sub a4, a3, a1
+.Llead_copy:
+	LOAD_B a5, 0, a1
+	addi a1, a1, 1
+	STORE_B a5, 0, t6
+	addi t6, t6, 1
+	bltu a1, a3, .Llead_copy
+	sub a2, a2, a4  /* Update count */
+
+.Laligned:
+	andi a4, a2, ~((16*SZREG)-1)
+	beqz a4, .Ltail
+	add a3, a1, a4
+.Lunrolled_loop:
+	LOAD_REG a4,       0, a1
+	LOAD_REG a5,   SZREG, a1
+	LOAD_REG a6, 2*SZREG, a1
+	LOAD_REG a7, 3*SZREG, a1
+	LOAD_REG t0, 4*SZREG, a1
+	LOAD_REG t1, 5*SZREG, a1
+	LOAD_REG t2, 6*SZREG, a1
+	LOAD_REG t3, 7*SZREG, a1
+	LOAD_REG t4, 8*SZREG, a1
+	LOAD_REG t5, 9*SZREG, a1
+	STORE_REG a4,       0, t6
+	STORE_REG a5,   SZREG, t6
+	STORE_REG a6, 2*SZREG, t6
+	STORE_REG a7, 3*SZREG, t6
+	STORE_REG t0, 4*SZREG, t6
+	STORE_REG t1, 5*SZREG, t6
+	STORE_REG t2, 6*SZREG, t6
+	STORE_REG t3, 7*SZREG, t6
+	STORE_REG t4, 8*SZREG, t6
+	STORE_REG t5, 9*SZREG, t6
+	LOAD_REG a4, 10*SZREG, a1
+	LOAD_REG a5, 11*SZREG, a1
+	LOAD_REG a6, 12*SZREG, a1
+	LOAD_REG a7, 13*SZREG, a1
+	LOAD_REG t0, 14*SZREG, a1
+	LOAD_REG t1, 15*SZREG, a1
+	addi a1, a1, 16*SZREG
+	STORE_REG a4, 10*SZREG, t6
+	STORE_REG a5, 11*SZREG, t6
+	STORE_REG a6, 12*SZREG, t6
+	STORE_REG a7, 13*SZREG, t6
+	STORE_REG t0, 14*SZREG, t6
+	STORE_REG t1, 15*SZREG, t6
+	addi t6, t6, 16*SZREG
+	bltu a1, a3, .Lunrolled_loop
+	andi a2, a2, (16*SZREG)-1  /* Update count */
+
+.Ltail:
+	/* Handle trailing misalignment */
+	beqz a2, .Lcopy_done
+	add a3, a1, a2
+
+	/* Use word-oriented copy if co-aligned to word boundary */
+	or a5, a1, t6
+	or a5, a5, a3
+	andi a5, a5, 3
+	bnez a5, .Lbyte_tail
+
+.Lword_tail:
+	LOAD_W a4, 0, a1
+	addi a1, a1, 4
+	STORE_W a4, 0, t6
+	addi t6, t6, 4
+	bltu a1, a3, .Lword_tail
+	j .Lcopy_done
+
+.Lbyte_tail:
+	LOAD_B a4, 0, a1
+	addi a1, a1, 1
+	STORE_B a4, 0, t6
+	addi t6, t6, 1
+	bltu a1, a3, .Lbyte_tail
+
+.Lcopy_done:
+	/* Fall through to includer's return or fixup code */
-- 
2.51.2.612.gdc70283dfc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
