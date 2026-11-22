Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B137606A68B
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 23:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kGcwmvvT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kiEA06J3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YBorLS3H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=U/qWux+WrxHvVgjfe2pIFepdaq9MOBQoOEqK1m96Y/w=; b=kGcwmvvT0JHb98f8sBDdsDylag
	DjvRltKUNV+H8l9GcmFTjPjUhMB3j9V+WqQPpmus+EalaVSb27TV+knizUvVEp7PXZFYB15BhctF+
	Ie9y/axNwGUpW8AnVi3cTyRxpb21HlTbcRq6F3n+iWk9C2Cz7bKseKT2Q9OY6a5mufvmMtQLQ2uK8
	YaZgmnEp+8loVfvk79pShd+c5N7UhC2+/ijKbanFO3fd6aMTl0KKK1E9M2O2JAnJShG1kzziM0C0Y
	wPKqMPtOsaqHrcCETjLSJfeWVs+o9tzy2PWcqEBMTzRKzFOqEveaHukLnbWHBkJ2D9GZ8B6b+4NVM
	7RUIvlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHSq-00000001ukL-1GY8;
	Sun, 22 Nov 2026 23:59:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHSl-00000001ug4-2Jb1
	for linux-riscv@bombadil.infradead.org;
	Sun, 22 Nov 2026 23:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cAxELkFDVo0H7iMwg+usnW6750UvO5PdYA7jAmdaF0g=; b=kiEA06J32eVAl+T6iSFWYAPUSr
	qIcFqr09gITXdHQsNzRo9xzVsOhzxq/kHlGsk1lmkA360b4IZpyppkZdmIIqXQKCP4Qr/cwOy5wo3
	1WfRTYcxJRe2DSRM+RPUapPbD5S+1UrNpGxHlE8wi8cEY+uSveTJlivXNg8Qd0YzVCHWk7tyUe3tq
	jnQsxwrOp/HQsLe8FhgOEMLFN1G8lnRpZp+FOHW+QQ+2TzWxCZjeTx/H42hZfB6thon0E6K/Axqno
	gfFcN0nWkzah5NfgMeifi/vS8KVnF8THqF4u3LD5zWJxve/Fc3XjE0zLzlDV1bDV932/mAojS58DP
	JN4PVTzg==;
Received: from mail-dl1-x1246.google.com ([2607:f8b0:4864:20::1246])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHSi-00000002aeq-3XVe
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 23:59:14 +0000
Received: by mail-dl1-x1246.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2493455c88.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 15:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795391950; x=1795996750; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAxELkFDVo0H7iMwg+usnW6750UvO5PdYA7jAmdaF0g=;
        b=YBorLS3HdZ98toNoGPUfQJIlwZdcRa41G+aFPSIIZxaVF2w7QIKyB/TYRM9xjWyDGn
         zQ7j0FARnQwlaYB0HJUdFugLXCgEISvVJzf65EUA6Eo/7JeJFe+yWSF4uQ+r+bjNvnW9
         gE+IRECmJJUzU5eNeymA/7tVPpDpqpG07JUnu5WGMHNYKqeEHExegdx81OeDJ5zyRQS6
         vIrr3z1LIpfWd0ScCU+OLeQEX4vixDVjCCYFNF5JK0yPZakB/BuqtXNSFkGu06U52Afd
         j2IIFfOPruHqzpmJ6+VXBXhLHWkfOmbb2ccHCgXb8vvjbpVOOmdyFDinibg9obRtzbzt
         k/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391950; x=1795996750;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAxELkFDVo0H7iMwg+usnW6750UvO5PdYA7jAmdaF0g=;
        b=eF47KV2YOAVe+3X4/7LHmeG4au8tD7mSw+Iisa9UDYeZ/exeYEUN0R3bvUBD5De/C1
         rexhKHblF/yvx0G092LReNiun9SuJ3d2B+pBlXLmmG73neuij71doolN095m9EDj4ejf
         iNQ1jjR4WsRkz5D2n5Jw6ho5T1ExPihNeV4Q3u6/7O23fl8V6mRnMAXsWAIZzW3EKZlR
         xSoz+v4f+nZsQQC9zaH82c6amH40iTc9ZDPKv/YPFIoFDIsAu+c0WrJWQ3XzH4czyFls
         3yoz7r/xKlOdAnA+Od5ThWqUrdpV+LzaWVJ6BcMFRJwIwtgXNeKpU+v+lWpinFbEK9fo
         X2Uw==
X-Forwarded-Encrypted: i=1; AL+hErFTBjLeMS2E/U7fsHvzfKXEihUCFTlZ/ysA/hd2z+wybdN9MRK5YkGJF8u5lmtBuVQk0PeZBLrNP4es1g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+qao8rqEyUYlv44J3C+G0LAbtjk1poNMeGGNrubeOfYFRQDltj
	GhlYwvobFSDg2ftNuZKwuMdShf6rXi/Cy8Usiorg+bw0uXnP6s9vwfQ8XaF2bLhy3pHYP0fJveV
	hjFunAAMKhw==
X-Received: from dltt13.prod.google.com ([2002:a05:701a:c96d:b0:18f:4e29:3ddd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4196:b0:1b2:3b5b:b80b
 with SMTP id a92af1059eb24-1b55689ee3amr15827553c88.8.1795391949713; Sun, 22
 Nov 2026 15:59:09 -0800 (PST)
Date: Sun, 22 Nov 2026 15:57:52 -0800
In-Reply-To: <20261122235757.3456048-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122235757.3456048-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122235757.3456048-7-irogers@google.com>
Subject: [RFC PATCH v1 06/11] arm64: unwind_user: Support Minimal DWARF CFI
 and FP user unwinding
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, ardb@kernel.org, 
	linux-efi@vger.kernel.org, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	indu.bhagat@oracle.com, jremus@linux.ibm.com, wnliu@google.com, 
	dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235912_826575_AAE42D29 
X-CRM114-Status: GOOD (  18.48  )
X-Spam-Score: -7.6 (-------)
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
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wire up CONFIG_HAVE_UNWIND_USER_CFI and CONFIG_HAVE_UNWIND_USER_FP on
arm64 by providing arch/arm64/include/asm/unwind_user.h and
unwind_user_sigreturn():

 - Populate DWARF CFI register mappings for both 64-bit AArch64
   (ws=8, sp=31, fp=29, lr=30) and 32-bit AArch32 compat tasks
   (ws=4, sp=13, fp=11, lr=14).
 - Expose the user frame pointer (x29 / compat_fp) and link register
   (x30 / compat_lr) via unwind_user_frame_pointer() and
   unwind_user_link_register() so leaf functions with DW_CFA_same_value
   on LR unwind accurately before falling back to stack-saved return
   addresses.
 - Implement unwind_user_sigreturn() in arch/arm64/kernel/signal.c to
   recover pc, sp, x29, and x30 directly from rt_sigframe.uc.uc_mcontext
   at __kernel_rt_sigreturn (which intentionally omits .eh_frame in the
   arm64 vDSO), preserving interrupted leaf functions and SA_ONSTACK
   alternate signal stacks.
 - Strip user-space pointer authentication codes via
   ptrauth_strip_user_insn_pac() in unwind_user_strip_pac(), and define
   ARCH_INIT_USER_FP_FRAME for both 64-bit AArch64 PCS frame records and
   32-bit AArch32 compat_frame_tail layouts.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/arm64/Kconfig                   |   2 +
 arch/arm64/include/asm/unwind_user.h | 126 +++++++++++++++++++++++++++
 arch/arm64/kernel/signal.c           |  54 ++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 arch/arm64/include/asm/unwind_user.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ee0f263f477d..918d7e278f7d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -228,6 +228,8 @@ config ARM64
 	select HAVE_STACKPROTECTOR
 	select HAVE_STATIC_CALL if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_UNWIND_USER_CFI
+	select HAVE_UNWIND_USER_FP
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
diff --git a/arch/arm64/include/asm/unwind_user.h b/arch/arm64/include/asm/unwind_user.h
new file mode 100644
index 000000000000..38d0641ae554
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_user.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ARM64_UNWIND_USER_H
+#define __ASM_ARM64_UNWIND_USER_H
+
+#ifdef CONFIG_UNWIND_USER
+
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+#include <linux/unwind_dwarf_cfi.h>
+#include <linux/unwind_user_types.h>
+#include <asm/compiler.h>
+#include <asm/ptrace.h>
+
+/**
+ * unwind_user_word_size() - Return the user-space word size in bytes on arm64
+ * @regs: User-mode register state.
+ *
+ * Return: 4 for AArch32 compat user mode, or 8 for AArch64 user mode.
+ */
+static inline int unwind_user_word_size(struct pt_regs *regs)
+{
+	return compat_user_mode(regs) ? 4 : 8;
+}
+
+/**
+ * unwind_user_frame_pointer() - Fetch the user frame pointer from @regs
+ * @regs: User-mode register state.
+ *
+ * Return: r11 (compat_fp) for AArch32 compat tasks, or x29 for AArch64 tasks.
+ */
+static inline unsigned long unwind_user_frame_pointer(struct pt_regs *regs)
+{
+	return compat_user_mode(regs) ? regs->compat_fp : frame_pointer(regs);
+}
+#define unwind_user_frame_pointer unwind_user_frame_pointer
+
+/**
+ * unwind_user_link_register() - Fetch the user link register from @regs
+ * @regs: User-mode register state.
+ * @ra: Output link register value (r14 for AArch32 compat, x30 for AArch64).
+ *
+ * Return: Always true on arm64 because a link register is architecturally
+ * present in both AArch64 and AArch32 execution states.
+ */
+static inline bool unwind_user_link_register(struct pt_regs *regs,
+					     unsigned long *ra)
+{
+	if (compat_user_mode(regs))
+		*ra = regs->compat_lr;
+	else
+		*ra = procedure_link_pointer(regs);
+	return true;
+}
+#define unwind_user_link_register unwind_user_link_register
+
+/**
+ * unwind_user_strip_pac() - Strip user pointer authentication bits on arm64
+ * @ip: Recovered user return address.
+ * @ra_signed: Whether CFI marked the return address as PAC-signed (unused;
+ *             arm64 strips user instruction PAC bits unconditionally via the
+ *             task's configured pointer authentication mask).
+ *
+ * Return: @ip unchanged for AArch32 compat tasks, or @ip with user instruction
+ * PAC bits stripped for AArch64 tasks.
+ */
+static inline unsigned long unwind_user_strip_pac(unsigned long ip,
+						  bool ra_signed)
+{
+	if (IS_ENABLED(CONFIG_COMPAT) &&
+	    compat_user_mode(task_pt_regs(current)))
+		return ip;
+	return ptrauth_strip_user_insn_pac(ip);
+}
+#define unwind_user_strip_pac unwind_user_strip_pac
+
+/**
+ * unwind_user_cfi_arch() - Populate AArch64/AArch32 DWARF register numbers
+ * @ws: User word size in bytes (8 for AArch64, 4 for AArch32 compat).
+ * @arch: Output DWARF CFI architecture descriptor.
+ *
+ * Return: true if @ws is 4 or 8, false otherwise.
+ */
+static inline bool unwind_user_cfi_arch(unsigned int ws,
+					struct dwarf_cfi_arch *arch)
+{
+	if (ws == 8) {
+		*arch = (struct dwarf_cfi_arch){
+			.ws	= 8,
+			.sp_reg	= 31,	/* sp */
+			.fp_reg	= 29,	/* x29 */
+			.ra_reg	= 30,	/* x30 (lr) */
+		};
+		return true;
+	}
+	if (ws == 4) {
+		*arch = (struct dwarf_cfi_arch){
+			.ws	= 4,
+			.sp_reg	= 13,	/* r13 (sp) */
+			.fp_reg	= 11,	/* r11 (fp) */
+			.ra_reg	= 14,	/* r14 (lr) */
+		};
+		return true;
+	}
+	return false;
+}
+
+bool unwind_user_sigreturn(struct unwind_user_state *state);
+#define unwind_user_sigreturn unwind_user_sigreturn
+
+#endif /* CONFIG_UNWIND_USER */
+
+#ifdef CONFIG_HAVE_UNWIND_USER_FP
+
+/*
+ * AArch64 PCS stores {fp, lr} at [fp, fp + 16), while 32-bit AArch32 compat
+ * APCS stores struct compat_frame_tail {fp, sp, lr} at [compat_fp - 12, compat_fp).
+ */
+#define ARCH_INIT_USER_FP_FRAME(ws)			\
+	.cfa_off	= (ws) == 8 ? 2 * (ws) : 0,	\
+	.ra_off		= -1 * (ws),			\
+	.fp_off		= (ws) == 8 ? -2 * (ws) : -3 * (ws), \
+	.use_fp		= true,
+
+#endif /* CONFIG_HAVE_UNWIND_USER_FP */
+
+#endif /* __ASM_ARM64_UNWIND_USER_H */
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 80398ac83c3b..41dfbfcc1d2e 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -21,6 +21,7 @@
 #include <linux/rseq.h>
 #include <linux/syscalls.h>
 #include <linux/pkeys.h>
+#include <linux/unwind_user.h>
 
 #include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
@@ -1705,6 +1706,59 @@ void __init minsigstksz_setup(void)
 		16; /* max alignment padding */
 }
 
+#ifdef CONFIG_UNWIND_USER
+/**
+ * unwind_user_sigreturn() - Unwind an AArch64 vDSO rt_sigreturn signal frame
+ * @state: Current user unwind state.
+ *
+ * __kernel_rt_sigreturn intentionally omits .eh_frame directives in the arm64
+ * vDSO so libgcc uses its sigcontext fallback path, and the synthetic
+ * user->next_frame FP record skips the interrupted PC. Recover the interrupted
+ * PC, SP, x29, and x30 directly from &rt_sigframe.uc.uc_mcontext so leaf
+ * functions, -fomit-frame-pointer code, and alternate signal stacks unwind
+ * accurately.
+ *
+ * Return: true if @state was at __kernel_rt_sigreturn and advanced to the
+ * interrupted user context, false otherwise.
+ */
+bool unwind_user_sigreturn(struct unwind_user_state *state)
+{
+	struct mm_struct *mm = current->mm;
+	struct rt_sigframe __user *sf;
+	unsigned long sigtramp;
+	u64 fp_lr[2], sp_pc[2];
+
+	if (!mm || state->ws != 8 || !mm->context.vdso)
+		return false;
+
+	sigtramp = (unsigned long)VDSO_SYMBOL(mm->context.vdso, sigtramp);
+	if (state->ip != sigtramp &&
+	    !(state->topmost && state->ip == sigtramp + 4))
+		return false;
+
+	if (state->sp & 0xfUL)
+		return false;
+
+	sf = (struct rt_sigframe __user *)state->sp;
+	if (copy_from_user(fp_lr, &sf->uc.uc_mcontext.regs[29], sizeof(fp_lr)) ||
+	    copy_from_user(sp_pc, &sf->uc.uc_mcontext.sp, sizeof(sp_pc)))
+		return false;
+
+	sp_pc[1] = ptrauth_strip_user_insn_pac(sp_pc[1]);
+	if ((sp_pc[0] & 7ULL) || !sp_pc[1])
+		return false;
+
+	state->fp = fp_lr[0];
+	state->ra = ptrauth_strip_user_insn_pac(fp_lr[1]);
+	state->sp = sp_pc[0];
+	state->ip = sp_pc[1];
+	state->ra_valid = true;
+	state->signal = true;
+	state->topmost = false;
+	return true;
+}
+#endif
+
 /*
  * Compile-time assertions for siginfo_t offsets. Check NSIG* as well, as
  * changes likely come with new fields that should be added below.
-- 
2.56.1.750.gf70dc682cf-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
