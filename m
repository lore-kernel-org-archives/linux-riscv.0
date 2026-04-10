Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9716CF36B97
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 01:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gs+riAt01Np7TjlHobmj7qa53VAZDcSJI3KhrbO14Zs=; b=Lzn3XLgC8u7E/L
	xQxRGFCqod7OxNRZqtaqdsJqj3XSBlcc2o7N4XPnhoDjBD8jnE+gPV7RY5CqvZurkzriU5e/FX1S7
	KULHLdPNSNciDpK1lwXrwpiDaQiae9nr3dWwlfCS79qRtZ5mVMjUWk3dTTuT5eShUgQswsfSjetBq
	X0OMGtkTW15KgE4SymArsaCs2AaTAFoPld9dl/0RtU1dy8A1KNerM3H+/x0SMtDvDfNgkJg4N/inY
	L4y9OC8rsQ5hp2IEauN+dWxjAw+9UFTkVKB8RQykvv8kFocd32atmYMV/o0Ttmu/NtgiSFS3mTsCD
	zJLNWxWhBVeoB6n46FUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB112-0000000BQSR-3xRn;
	Fri, 10 Apr 2026 01:50:36 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB10y-0000000BQS2-3D1e
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 01:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775785828; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=NXvxCUMrD47CHDyDOX9OjDxgp0vOayqZKRFOIlII0Sg=;
	b=mV1SIzQRrIOIEFfhVkiVyKTF5zb6DndzYYGpckSxqkpyRoq5VkuqHJXlemBXuQAAGlPelQ/L3N188k0aK3ntaARNzBacQDhnviLO3W9EqcvM1bEpPsgYabzcBjdYWnazsRoCVzIIYgZkVA/geNxcvGTMP4OmmkL/Eid6kNfk9DM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R521e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X0jZIU3_1775785818;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X0jZIU3_1775785818 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 10 Apr 2026 09:50:21 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org,
	alex@ghiti.fr,
	cleger@rivosinc.com,
	alexghiti@rivosinc.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] riscv: mm: Implement arch_within_stack_frames() for HARDENED_USERCOPY
Date: Fri, 10 Apr 2026 09:50:13 +0800
Message-ID: <20260410015013.845-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_185034_064191_0CCFC745 
X-CRM114-Status: GOOD (  17.75  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

Implement arch_within_stack_frames() to enable precise per-frame stack
object validation for CONFIG_HARDENED_USERCOPY on RISC-V.

== Background ==

CONFIG_HARDENED_USERCOPY validates kernel objects passed to copy_to/
from_user(). For stack objects, mm/usercopy.c calls arch_within_stack_
frames() to determine whether the object lies within a valid stack
frame's local variable area. Without an arch-specific implementation,
the generic fallback returns NOT_STACK (0), causing check_stack_object()
to skip frame-level validation and fall through to a coarser depth
check only.

== RISC-V Stack Frame Layout ==

With -fno-omit-frame-pointer (implied by CONFIG_FRAME_POINTER), the
RISC-V ABI places the saved frame pointer (fp/s0) and return address
(ra) at the top of each frame:

  high addr
    +------------------+  <--- fp (s0) -- frame pointer register
    |   saved ra       |      fp - 8  (return address of this function)
    |   saved fp       |      fp - 16 (caller's frame pointer)
    +------------------+
    |   local variables|
    |   spilled args   |
    +------------------+  <--- sp
  low addr

The kernel's struct stackframe { fp; ra } (asm/stacktrace.h) lives at
(fp - sizeof(stackframe)), i.e., saved_fp at fp-16 and saved_ra at
fp-8. Walking the chain: next_fp = *(fp - 16).

This differs from x86, where [saved_bp][saved_ip] are at the frame
bottom and the local area is above them.

== Implementation ==

The allowed usercopy region within one frame is:

  [prev_fp, fp - 2*sizeof(void*))

i.e., from the base of the current frame's locals (prev_fp) up to (but
not including) the saved fp/ra area at the top of the frame.

  - obj entirely within this region -> GOOD_FRAME
  - obj overlapping saved fp/ra or outside any frame -> BAD_STACK
  - CONFIG_FRAME_POINTER not set -> NOT_STACK

The frame chain is walked starting from __builtin_frame_address(0),
with prev_fp initialized to current_stack_pointer (not the thread's
stack base). This ensures objects in already-returned frames (address
below current sp) are correctly detected as BAD_STACK, because no live
frame in the chain will claim that region.

The function is marked __no_kmsan_checks because it reads from another
frame's stack memory, whose KMSAN shadow may not be set up, which would
cause false positive KMSAN reports.

The entire implementation is guarded by #ifndef __ASSEMBLER__ since
this header is included by both C and assembly files, and attributes
like __no_kmsan_checks are not valid in assembler context.

Select HAVE_ARCH_WITHIN_STACK_FRAMES in Kconfig to replace the generic
no-op with the RISC-V implementation.

== Testing ==

Build requirements:
  CONFIG_HARDENED_USERCOPY=y
  CONFIG_FRAME_POINTER=y      (already selected by default on riscv)
  CONFIG_LKDTM=y
  CONFIG_DEBUG_FS=y

Run on QEMU or target board as root:

  # Trigger copy_to_user from a stack frame that has already returned:
  echo USERCOPY_STACK_FRAME_TO > /sys/kernel/debug/provoke-crash/DIRECT

  # Trigger copy_from_user into a stack frame that has already returned:
  echo USERCOPY_STACK_FRAME_FROM > /sys/kernel/debug/provoke-crash/DIRECT

  # Trigger copy beyond current stack bounds:
  echo USERCOPY_STACK_BEYOND > /sys/kernel/debug/provoke-crash/DIRECT

== Kernel test logs ==

  # echo USERCOPY_STACK_FRAME_TO > /sys/kernel/debug/provoke-crash/DIRECT
  lkdtm: Performing direct entry USERCOPY_STACK_FRAME_TO
  lkdtm: good_stack: ff20000000323c98-ff20000000323cb8
  lkdtm: bad_stack : ff20000000323c18-ff20000000323c38
  lkdtm: attempting good copy_to_user of local stack
  lkdtm: attempting bad copy_to_user of distant stack
  usercopy: Kernel memory exposure attempt detected from process stack (offset 38, size 20)!
  ......
  (kernel BUG Call Trace...)
  ......

Without this patch (generic fallback returns NOT_STACK), the "bad
copy_to_user" call above would succeed silently. With this patch,
HARDENED_USERCOPY correctly detects the cross-frame violation and
aborts with BUG().

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/Kconfig                   |  1 +
 arch/riscv/include/asm/thread_info.h | 66 ++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6fe90591a274..4f765ff608d9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -150,6 +150,7 @@ config RISCV
 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
 	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
+	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_CONTEXT_TRACKING_USER
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 36918c9200c9..616a41eb7416 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -101,6 +101,72 @@ struct thread_info {
 void arch_release_task_struct(struct task_struct *tsk);
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
+#ifdef CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES
+/*
+ * RISC-V stack frame layout (with frame pointer enabled):
+ *
+ * high addr
+ *   +------------------+  <--- fp (s0) points here
+ *   |   saved ra       |  fp - 8  (return address)
+ *   |   saved fp       |  fp - 16 (previous frame pointer)
+ *   +------------------+
+ *   |   local vars     |
+ *   |   arguments      |
+ *   +------------------+  <--- sp
+ * low addr
+ *
+ * The struct stackframe { fp, ra } lives at (fp - sizeof(stackframe)),
+ * i.e. fp[-2]=saved_fp and fp[-1]=saved_ra.
+ *
+ * For usercopy safety, we allow copies within [prev_fp, fp - 2*sizeof(void*))
+ * for each frame in the chain, where prev_fp is the fp of the previous
+ * (lower) frame.  This covers local variables and arguments but excludes
+ * the saved ra/fp slots at the top of the frame.
+ *
+ * We walk the frame chain starting from __builtin_frame_address(0) (the
+ * current frame), with prev_fp initialized to current_stack_pointer.
+ * Using current_stack_pointer -- rather than the 'stack' argument (which is
+ * the thread's entire stack base) -- ensures that objects in already-returned
+ * frames (address below current sp) are correctly detected as BAD_STACK,
+ * because no live frame in the chain will claim that region.
+ */
+__no_kmsan_checks
+static inline int arch_within_stack_frames(const void * const stack,
+					   const void * const stackend,
+					   const void *obj, unsigned long len)
+{
+#if defined(CONFIG_FRAME_POINTER)
+	const void *fp = (const void *)__builtin_frame_address(0);
+	const void *prev_fp = (const void *)current_stack_pointer;
+
+	/*
+	 * Walk the frame chain. Each iteration checks whether [obj, obj+len)
+	 * falls within the local-variable area of the current frame:
+	 *
+	 *   [prev_fp, fp - 2*sizeof(void*))
+	 *
+	 * i.e. from the base of this frame (sp of this frame, which equals
+	 * the fp of the frame below) up to (but not including) the saved
+	 * fp/ra area at the top of this frame.
+	 */
+	while (stack <= fp && fp < stackend) {
+		const void *frame_vars_end = (const char *)fp - 2 * sizeof(void *);
+
+		if (obj + len <= frame_vars_end) {
+			if (obj >= prev_fp)
+				return GOOD_FRAME;
+			return BAD_STACK;
+		}
+		prev_fp = fp;
+		fp = *(const void * const *)((const char *)fp - 2 * sizeof(void *));
+	}
+	return BAD_STACK;
+#else
+	return NOT_STACK;
+#endif
+}
+#endif /* CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES */
+
 #endif /* !__ASSEMBLER__ */
 
 /*
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
