Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5C60A5BC1
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 01:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hff4nKZy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PqX2zGek
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URa0SwHwTb+2lNqNeDB5hVpvMs6OHaEoXDbZkWi2jBg=; b=hff4nKZysnSCJ/F8y9wIS3cOHH
	vHAwl4EzetRfn/pXRHpnBqAbr2m580tQIM2C5jcL0ZSy/SlK59tGAPCQnkKtAO+TKUIEGwEZR5Nvx
	mfCa1E70pIEfPnPpT8hqvxnHKN9NDzTLIFDNDrLCZs8k6ta7a7bv7+fmdqfhPxVRXS+qmvbZrcZ0j
	yXrCe8fTkORvLe4ZInLAwqSO7eD5GgweuYC0iFxrEkP01iR18Wj4EvEBI79PrbKfp/Q97Cz9BFZSv
	ftgNPxUIMy3clI6ZIRmzcaqsCJRz8aB4wMjL7GdIHr7k0eDTbC7odE9mBY6xyvcOt5veuEIl+yYlX
	OXfnOzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoR-000000026GD-1MqV;
	Tue, 10 Nov 2026 01:38:15 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoK-000000026DZ-09v5
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 01:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794274686; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=bl05AHd8lXj5uTUhb7PE0e37e78DTriDIlQtiWpc5E8=;
	b=PqX2zGekd5C0lgvbt4fgIHrW4ur5+fV31YtqyewtKxoewnDprsQXxd2tv6o+1QMAeIcFOihefxdj2xKnQTwo0uy2e0ZsPa1K8oHhPzqTuUaLORgJrcdCoWc/ef4btHPjenDSNW7a5iCNX/S1K8y9B9fxTl9U3DvoleE19QDY6yw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0XETOX4X_1794274682;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XETOX4X_1794274682 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 09:38:04 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	oleg@redhat.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	mpdesouza@suse.com,
	martin@kaiser.cx,
	kmehltretter@gmail.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 04/10] riscv: stacktrace: Add frame record metadata
Date: Tue, 10 Nov 2026 09:37:44 +0800
Message-Id: <20261110013750.36800-5-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261110013750.36800-1-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_173808_779077_70F90EF8 
X-CRM114-Status: GOOD (  25.95  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wang Han <wanghan@linux.alibaba.com>

Reliable frame-pointer unwinding needs an explicit way to identify
exception boundaries and the final entry frame. The existing unwinder
infers those boundaries from return addresses, which is too loose for a
future reliable unwinder.

Add a small metadata frame record to pt_regs and initialize it on
exception entry, kernel stack overflow, kernel thread fork, user fork,
and early idle task setup. The record uses a zero {fp, ra} sentinel plus
a type field so a later unwinder can distinguish a final user-to-kernel
boundary from a nested kernel pt_regs boundary.

This follows the arm64 metadata frame-record model, adapted to the
RISC-V {fp, ra} frame record convention.

The metadata is established at the RISC-V entry boundaries that need an
explicit unwind marker:

  * exception entry clears the metadata {fp, ra} pair and uses SPP
    (or MPP in M-mode) to record whether the pt_regs frame is the final
    user-to-kernel boundary or a nested kernel boundary;
  * the kernel stack overflow path builds a nested pt_regs metadata
    record on the overflow stack so an unwinder can resume from the
    pre-overflow s0 saved in PT_S0;
  * _start_kernel builds the init task's final metadata record, while
    the secondary CPU path sets up s0 before smp_callin() so idle-task
    unwinding does not inherit an undefined caller frame;
  * copy_thread creates matching final metadata records for new kernel
    and user tasks, and keeps s0 available for the frame-pointer chain.

Keep the embedded metadata-record field offsets distinct from the
s0-relative STACKFRAME_* offsets used by call_on_irq_stack(), because
the latter describe a frame record relative to s0 rather than to the
record base.

These changes keep s0 reserved for the frame-pointer chain at task and
exception boundaries.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Martin Kaiser <martin@kaiser.cx>
Tested-by: Martin Kaiser <martin@kaiser.cx>
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 arch/riscv/include/asm/ptrace.h           |  9 ++++
 arch/riscv/include/asm/stacktrace/frame.h | 53 +++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c           |  6 +++
 arch/riscv/kernel/entry.S                 | 39 ++++++++++++++++-
 arch/riscv/kernel/head.S                  | 23 ++++++++++
 arch/riscv/kernel/process.c               | 33 +++++++++++++-
 6 files changed, 159 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace/frame.h

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index addc8188152f..4b9b0f279214 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -8,6 +8,7 @@
 
 #include <uapi/asm/ptrace.h>
 #include <asm/csr.h>
+#include <asm/stacktrace/frame.h>
 #include <linux/compiler.h>
 
 #ifndef __ASSEMBLER__
@@ -53,6 +54,14 @@ struct pt_regs {
 	unsigned long cause;
 	/* a0 value before the syscall */
 	unsigned long orig_a0;
+
+	/*
+	 * This frame record is entirely zeroed on exception entry, allowing the
+	 * unwinder to identify exception boundaries. The type field encodes
+	 * whether the exception was taken from user (FINAL) or kernel (PT_REGS)
+	 * mode.
+	 */
+	struct frame_record_meta stackframe;
 };
 
 #define PTRACE_SYSEMU			0x1f
diff --git a/arch/riscv/include/asm/stacktrace/frame.h b/arch/riscv/include/asm/stacktrace/frame.h
new file mode 100644
index 000000000000..5720a6c65fe8
--- /dev/null
+++ b/arch/riscv/include/asm/stacktrace/frame.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_STACKTRACE_FRAME_H
+#define __ASM_RISCV_STACKTRACE_FRAME_H
+
+/*
+ * See: arch/arm64/include/asm/stacktrace/frame.h for the reference
+ * implementation.
+ */
+
+/*
+ * - FRAME_META_TYPE_NONE
+ *
+ *   This value is reserved.
+ *
+ * - FRAME_META_TYPE_FINAL
+ *
+ *   The record is the last entry on the stack.
+ *   Unwinding should terminate successfully.
+ *
+ * - FRAME_META_TYPE_PT_REGS
+ *
+ *   The record is embedded within a struct pt_regs, recording the registers at
+ *   an arbitrary point in time.
+ *   Unwinding should consume pt_regs::epc, followed by pt_regs::ra.
+ *
+ * Note: all other values are reserved and should result in unwinding
+ * terminating with an error.
+ */
+#define FRAME_META_TYPE_NONE		0
+#define FRAME_META_TYPE_FINAL		1
+#define FRAME_META_TYPE_PT_REGS		2
+
+#ifndef __ASSEMBLER__
+/*
+ * A standard RISC-V frame record.
+ */
+struct frame_record {
+	unsigned long fp;
+	unsigned long ra;
+};
+
+/*
+ * A metadata frame record indicating a special unwind.
+ * The record::{fp,ra} fields must be zero to indicate the presence of
+ * metadata.
+ */
+struct frame_record_meta {
+	struct frame_record record;
+	unsigned long type;
+};
+#endif /* __ASSEMBLER__ */
+
+#endif /* __ASM_RISCV_STACKTRACE_FRAME_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9..d0eaf2c902fb 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -131,6 +131,9 @@ void asm_offsets(void)
 	OFFSET(PT_BADADDR, pt_regs, badaddr);
 	OFFSET(PT_CAUSE, pt_regs, cause);
 
+	DEFINE(S_STACKFRAME,		offsetof(struct pt_regs, stackframe));
+	DEFINE(S_STACKFRAME_TYPE,	offsetof(struct pt_regs, stackframe.type));
+
 	OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
 
 	OFFSET(HIBERN_PBE_ADDR, pbe, address);
@@ -503,6 +506,9 @@ void asm_offsets(void)
 	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
 	DEFINE(STACKFRAME_FP, offsetof(struct stackframe, fp) - sizeof(struct stackframe));
 	DEFINE(STACKFRAME_RA, offsetof(struct stackframe, ra) - sizeof(struct stackframe));
+	DEFINE(STACKFRAME_RECORD_SIZE, sizeof(struct frame_record));
+	OFFSET(FRAME_RECORD_FP, frame_record, fp);
+	OFFSET(FRAME_RECORD_RA, frame_record, ra);
 #ifdef CONFIG_FUNCTION_TRACER
 	DEFINE(FTRACE_OPS_FUNC,		offsetof(struct ftrace_ops, func));
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..4c69132d5978 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -11,6 +11,7 @@
 #include <asm/asm.h>
 #include <asm/csr.h>
 #include <asm/scs.h>
+#include <asm/stacktrace/frame.h>
 #include <asm/unistd.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -198,6 +199,27 @@ SYM_CODE_START(handle_exception)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 
+	/*
+	 * Create a metadata frame record. The unwinder will use this to
+	 * identify and unwind exception boundaries.
+	 */
+	REG_S zero, (S_STACKFRAME + FRAME_RECORD_FP)(sp) /* stackframe.record.fp = 0 */
+	REG_S zero, (S_STACKFRAME + FRAME_RECORD_RA)(sp) /* stackframe.record.ra = 0 */
+#ifdef CONFIG_RISCV_M_MODE
+	li t0, SR_MPP
+	and t0, s1, t0
+#else
+	andi t0, s1, SR_SPP
+#endif
+	bnez t0, 1f
+	li t0, FRAME_META_TYPE_FINAL
+	j 2f
+1:
+	li t0, FRAME_META_TYPE_PT_REGS
+2:
+	REG_S t0, S_STACKFRAME_TYPE(sp)
+	addi s0, sp, S_STACKFRAME + STACKFRAME_RECORD_SIZE
+
 	/*
 	 * Set the scratch register to 0, so that if a recursive exception
 	 * occurs, the exception vector knows it came from the kernel
@@ -354,6 +376,19 @@ SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	REG_S s3, PT_BADADDR(sp)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
+
+	/*
+	 * Create a metadata frame record for the overflow pt_regs. The
+	 * overflow path is entered from kernel context, so this is a nested
+	 * pt_regs boundary and the unwinder can resume from the pre-overflow
+	 * frame pointer saved in PT_S0.
+	 */
+	REG_S zero, (S_STACKFRAME + FRAME_RECORD_FP)(sp)
+	REG_S zero, (S_STACKFRAME + FRAME_RECORD_RA)(sp)
+	li t0, FRAME_META_TYPE_PT_REGS
+	REG_S t0, S_STACKFRAME_TYPE(sp)
+	addi s0, sp, S_STACKFRAME + STACKFRAME_RECORD_SIZE
+
 	move a0, sp
 	tail handle_bad_stack
 SYM_CODE_END(handle_kernel_stack_overflow)
@@ -362,8 +397,8 @@ ASM_NOKPROBE(handle_kernel_stack_overflow)
 
 SYM_CODE_START(ret_from_fork_kernel_asm)
 	call schedule_tail
-	move a0, s1 /* fn_arg */
-	move a1, s0 /* fn */
+	move a0, s3 /* fn_arg */
+	move a1, s2 /* fn */
 	move a2, sp /* pt_regs */
 	call ret_from_fork_kernel
 	j ret_from_exception
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1631fd6bc786..887483b52d33 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -14,6 +14,7 @@
 #include <asm/hwcap.h>
 #include <asm/image.h>
 #include <asm/scs.h>
+#include <asm/stacktrace/frame.h>
 #include <asm/usercfi.h>
 #include <asm/alternative.h>
 #include <asm/errata_list.h>
@@ -179,6 +180,14 @@ secondary_start_sbi:
 	REG_S a0, (a1)
 1:
 #endif
+
+	/*
+	 * Set up the frame pointer for the secondary idle task so reliable
+	 * stack unwinding terminates at the metadata frame in task_pt_regs().
+	 * Without this, the first frame records can inherit an undefined caller
+	 * fp and unwind past smp_callin() into .Lsecondary_park.
+	 */
+	addi s0, sp, S_STACKFRAME + STACKFRAME_RECORD_SIZE
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -307,6 +316,20 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+
+	/*
+	 * Set up a metadata frame record for the init task so that
+	 * the unwinder can identify the outermost frame by its
+	 * {fp, ra} = {0, 0} sentinel at the bottom of pt_regs.
+	 * fp/s0 points above the metadata record (RISC-V
+	 * convention).
+	 */
+	REG_S zero, (S_STACKFRAME + FRAME_RECORD_FP)(sp)
+	REG_S zero, (S_STACKFRAME + FRAME_RECORD_RA)(sp)
+	li t0, FRAME_META_TYPE_FINAL
+	REG_S t0, S_STACKFRAME_TYPE(sp)
+	addi s0, sp, S_STACKFRAME + STACKFRAME_RECORD_SIZE
+
 #if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
 	li a7, SBI_EXT_FWFT
 	li a6, SBI_EXT_FWFT_SET
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1ca..223e851914d0 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -258,8 +258,23 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
-		p->thread.s[0] = (unsigned long)args->fn;
-		p->thread.s[1] = (unsigned long)args->fn_arg;
+		/*
+		 * Set up a metadata frame record at the bottom of the
+		 * stack for the unwinder. Use FRAME_META_TYPE_FINAL
+		 * since this is the outermost kernel entry for the new
+		 * task. The frame_record::{fp,ra} are already zero from
+		 * memset().
+		 *
+		 * fp/s0 points above the metadata record (RISC-V
+		 * convention). fn and fn_arg are passed via s2/s3,
+		 * keeping s0 available for the frame pointer chain.
+		 */
+		childregs->stackframe.type = FRAME_META_TYPE_FINAL;
+
+		p->thread.s[0] = (unsigned long)(&childregs->stackframe)
+				+ sizeof(struct frame_record);
+		p->thread.s[2] = (unsigned long)args->fn;
+		p->thread.s[3] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
 	} else {
 		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
@@ -278,6 +293,20 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
+
+		/*
+		 * Set up the unwind boundary: ensure the metadata
+		 * frame record has its {fp,ra} sentinel zeroed and
+		 * point fp/s0 above the metadata record. Mark it as
+		 * FINAL since this is the outermost kernel entry for
+		 * the new task.
+		 */
+		childregs->stackframe.record.fp = 0;
+		childregs->stackframe.record.ra = 0;
+		childregs->stackframe.type = FRAME_META_TYPE_FINAL;
+		p->thread.s[0] = (unsigned long)(&childregs->stackframe)
+				+ sizeof(struct frame_record);
+
 		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
 	}
 	p->thread.riscv_v_flags = 0;
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
