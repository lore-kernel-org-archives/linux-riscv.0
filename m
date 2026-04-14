Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8B2ED7B96
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kDX2LuCt9ZCHc6vX2WgP+TdzSMg56GQb/+/pYyft/7Y=; b=RkmamiLjh3fvma
	1Bgj/B9xhmp1ElH+IWaE9u+h7iY99Wo4cy1000flT4Rx5zcpq8FTK7hQS5cXGNyKUih2svcqovc7/
	/RqiHQfaf7BT1DOyaaaEAF8zrbG1WA/cLi/EceyQS5syOdUPufkpP+m86vru1d9Yss19rNH7nWquB
	g0xCwgZUorbpqsj0ufaPu79r+TEsC3QVTnIgqwT1sEWKCwttw0BemZbGI0LVW7GWJaZOZ9HrECt7Y
	7aFgsBqKonrB/G1MN75khAkkyZKrZ7ZUAb42/kF+K6SGwnCsJ5n0UNM1VMueUGQ5XY1Q7YQEGIvWo
	7JMHYQ2ha+YhlfQGAzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaaP-0000000H6Bs-0Jun;
	Tue, 14 Apr 2026 10:01:37 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCaaK-0000000H6BX-1qXI
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 10:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776160888; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qLoUE5+i9ubbp9cm1W8g/dAHBSN+XEPjebX3emKaxeM=;
	b=SuGcNzyIBnrsb3sbTzPKhamLN1rVQ8U+2ml5JDaQTkaL17/+M5iV5ts5SkiiC12L1nj9+ZLYYgfnhA97umToauW7GVNTnCCDAYA9JfMKPUoEkQ5LDfPlvLEEl4mYQd+4G5/TlPACCzlEugcVciBz431PlsqmxmwYyiyhly5GaCg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X11DCxU_1776160878;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X11DCxU_1776160878 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Apr 2026 18:01:22 +0800
From: cp0613@linux.alibaba.com
To: wangruikang@iscas.ac.cn,
	pjw@kernel.org,
	alex@ghiti.fr,
	cleger@rivosinc.com,
	alexghiti@rivosinc.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH v2] riscv: mm: Implement arch_within_stack_frames() for HARDENED_USERCOPY
Date: Tue, 14 Apr 2026 18:01:10 +0800
Message-ID: <20260414100111.99567-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_030133_379252_64BBD305 
X-CRM114-Status: GOOD (  14.45  )
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

Per the RISC-V ELF psABI Frame Pointer Convention [1], with
-fno-omit-frame-pointer (implied by CONFIG_FRAME_POINTER), the RISC-V
ABI places the saved frame pointer (fp/s0) and return address (ra) at
the top of each frame:

  high addr
    +------------------+  <--- fp (s0) -- frame pointer register
    |   saved ra       |      fp - 1*sizeof(void*) (return address)
    |   saved fp       |      fp - 2*sizeof(void*) (caller's frame pointer)
    +------------------+
    |   local variables|
    |   spilled args   |
    +------------------+  <--- sp
  low addr

The allowed usercopy region within one frame is
[prev_fp, fp-2*sizeof(void*)), covering local variables but excluding
the saved fp/ra slots.

The frame chain is walked from __builtin_frame_address(0), with prev_fp
initialized to current_stack_pointer rather than the thread stack base.
This ensures objects in already-returned frames are correctly detected
as BAD_STACK, since no live frame will cover that region.

[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

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

Changes in v2:
 - Simplify commit messages.
 - Drop the redundant #ifdef CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES.
 - Corrected RISC-V stack frame layout description for RV32 compatibility.
 - Add a reference link to the RISC-V ELF psABI Frame Pointer Convention.
 - Fix potential out-of-bounds read when fp is too close to the stack bottom.

 arch/riscv/Kconfig                   |  1 +
 arch/riscv/include/asm/thread_info.h | 68 ++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..f5e31130eb17 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -150,6 +150,7 @@ config RISCV
 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
 	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
+	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 36918c9200c9..5899877c2a49 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -101,6 +101,74 @@ struct thread_info {
 void arch_release_task_struct(struct task_struct *tsk);
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
+/*
+ * RISC-V stack frame layout (with frame pointer enabled).
+ *
+ * Reference: RISC-V ELF psABI, Frame Pointer Convention
+ *   https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/
+ *   riscv-cc.adoc#frame-pointer-convention
+ *
+ * high addr
+ *   +------------------+  <--- fp (s0) points here
+ *   |   saved ra       |  fp - 1*sizeof(void*) (return address)
+ *   |   saved fp       |  fp - 2*sizeof(void*) (previous frame pointer)
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
+	while (stack + 2 * sizeof(void *) <= fp && fp < stackend) {
+		const void *frame_vars_end = (const char *)fp - 2 * sizeof(void *);
+
+		if (obj + len <= frame_vars_end) {
+			if (obj >= prev_fp)
+				return GOOD_FRAME;
+			return BAD_STACK;
+		}
+		prev_fp = fp;
+		fp = *(const void * const *)frame_vars_end;
+	}
+	return BAD_STACK;
+#else
+	return NOT_STACK;
+#endif
+}
+
 #endif /* !__ASSEMBLER__ */
 
 /*
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
