Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC29606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lf1UXwzf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XG+iZer4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=CUXzG4JNLqHWoE9b5U33OK/4Hhd8P9/49gOIJj/5d6A=; b=lf1UXwzfcmkt26lux602ewLaBZ
	oSVFK/QRjELFUFKqD/WzO2H1gfp/5et8L5/H3TSg/yrPVDwtzoby1b4PVBQGoXdBIFrVpEIsEA9Yu
	YDQbmAMGAh800XkPdsqh4ZVj0E6VzBzD0RJET2Vhv3QsFtlCURszAOsar0oU5DQ38JopaBfUJW83a
	t3oou0NcYsGJ9GsetE/c2vMLOw+HIFEk9DaUgirsyPJ0p7KvLxj+NaN7+rpgzO+KM3pgfyshC+vYJ
	fmhVbCQ9awhVTjcaTsUn+qVMnM140uzSc9qjldZm53sulpPUi0fiTr4PxYgz8H05HJnJbgtMSs7KM
	VroqEU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6R7-00000008f6g-2eYR;
	Wed, 25 Nov 2026 06:24:57 +0000
Received: from mail-ua1-x945.google.com ([2607:f8b0:4864:20::945])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6R4-00000008f5s-2ne1
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:24:56 +0000
Received: by mail-ua1-x945.google.com with SMTP id a1e0cc1a2514c-9806756ea40so3311250241.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587893; x=1796192693; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv563tOaT9t1DmnC0tzfAtnqlHlK2h3cFSfEVUiDT5g=;
        b=XG+iZer4pwJdA8daDCL96ozvPbNBBo/VeoCWNs2ihDXy0/wXpbGiKk8kj3qqL3ynAR
         MWMP49akPiJ1f0kTVtJVKIrGCgBp+d9sBkP1Xd7OBF00moqP3Lp+otl88TBk/x8vwRCf
         MlcX4PFHm84diE8oFeceHWWoCmaKsc7igz74MeH6O8PQTs8rT/xQ9lRP8kS9yS7rq+xv
         O1VS27wtZhvKXTdC59REjTcWbjwVPkCw8078esMu1Eh2KtxpM/tBLxddopxaUrPyzqgQ
         ufH3SQjKATuIV0dlW8P+HiCjgNxjR39QtW0qIBJJuiSfZA9sS2djXgTEzxx3pLPxXDEu
         qHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587893; x=1796192693;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gv563tOaT9t1DmnC0tzfAtnqlHlK2h3cFSfEVUiDT5g=;
        b=w+pqfXqytsOiDkJvB/zQhN8qXhhLFR98S12TH5qax37QWuxsAzX53b6jzTisUkJXjy
         5o0PFsmDBFenfrpVPnFPeQCMBDFwzC9m3pF2qHAcjwyOSgZ9N4Tyx25f+3IDNfoY0eCn
         VnJkNfl7nXIUTKgKnHWorwajEaGhvzW6oy/Rf5Y2ke+/+O4cKoFi2OJE+KBhQv6Nx6Tx
         wJwFmKxjjWEz7WFsdf31lql1ay7tHVu12vVdMX2C9Zvw39pCO5s7HRs9zwPg+p3KCn7b
         MEOMfvBP27tuYdxPyp/ExOqAYgKd+WhHaxQUToxEu1UWQbWsjFik2tT6q+deW2W1+7oP
         S/4Q==
X-Forwarded-Encrypted: i=1; AL+hErGCkg6+r/Ph+YU2+ZzwiWMfIEmBobTS1bNBVBFyWdRsf6elAIveeSEDnMAvCCkBEFRfdgl8nmt1BYEi0Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9Ao5LHCyiH6i+R9lfFOJ8m+8sDXb46EXLUmXB4CAV3NdnnorZD
	C8HnxMnumed8yTjArcB8rowTC8Jp7yzCDjYtNrVdtEHJRSRjF8VGlnO8tqKd4I40++S2NzF7AeN
	ComOghrcCMA==
X-Received: from dydz30.prod.google.com ([2002:a05:7300:22de:b0:382:e403:7217])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c696:b0:386:c4bd:7ff0
 with SMTP id 5a478bee46e88-386c4bd8670mr3588594eec.13.1795587393071; Tue, 24
 Nov 2026 22:16:33 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:11 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-19-irogers@google.com>
Subject: [RFC PATCH v2 18/30] riscv: Add DWARF CFI annotations to entry,
 ftrace, rethook, and BPF JIT
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
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_222454_752983_31F382E7 
X-CRM114-Status: GOOD (  15.56  )
X-Spam-Score: -9.5 (---------)
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

Prepare RISC-V assembly, probe trampolines, and RV64 BPF JIT prologues
for runtime Minimal DWARF CFI kernel unwinding:
 - Export end labels for ret_from_fork_user_asm, call_on_irq_stack, and
   ftrace_caller save/restore boundaries, and save s0 in ftrace_caller
   under CONFIG_UNWINDER_DWARF_CFI.
 - Annotate return_to_handler() and arch_rethook_trampoline() with
   .cfi_* directives and key rethook shadow stacks on entry SP (CFA)
   under CONFIG_UNWINDER_DWARF_CFI.
 - Save RV_REG_RA unconditionally in RV64 BPF JIT prologues under
   CONFIG_UNWINDER_DWARF_CFI so leaf BPF programs unwind into frameless C
   callers.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/riscv/kernel/entry.S                     |  2 ++
 arch/riscv/kernel/mcount-dyn.S                |  6 ++--
 arch/riscv/kernel/mcount.S                    | 34 +++++++++++++++++--
 arch/riscv/kernel/probes/rethook.c            | 13 +++++--
 arch/riscv/kernel/probes/rethook_trampoline.S | 30 ++++++++++++++++
 arch/riscv/net/bpf_jit_comp64.c               |  6 ++--
 6 files changed, 81 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..0a37ac12128c 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -374,6 +374,7 @@ SYM_CODE_START(ret_from_fork_user_asm)
 	move a0, sp /* pt_regs */
 	call ret_from_fork_user
 	j ret_from_exception
+SYM_INNER_LABEL(ret_from_fork_asm_end, SYM_L_GLOBAL)
 SYM_CODE_END(ret_from_fork_user_asm)
 
 #ifdef CONFIG_IRQ_STACKS
@@ -410,6 +411,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
 
 	ret
+SYM_INNER_LABEL(call_on_irq_stack_end, SYM_L_GLOBAL)
 SYM_FUNC_END(call_on_irq_stack)
 #endif /* CONFIG_IRQ_STACKS */
 
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 082fe0b0e3c0..06c26725a830 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -85,7 +85,7 @@
 	addi	sp, sp, -FREGS_SIZE_ON_STACK
 	REG_S	t0,  FREGS_EPC(sp)
 	REG_S	x1,  FREGS_RA(sp)
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+#if defined(HAVE_FUNCTION_GRAPH_FP_TEST) || defined(CONFIG_UNWINDER_DWARF_CFI)
 	REG_S	x8,  FREGS_S0(sp)
 #endif
 	REG_S	x6,  FREGS_T1(sp)
@@ -113,7 +113,7 @@
 	.macro RESTORE_ABI_REGS
 	REG_L	t0, FREGS_EPC(sp)
 	REG_L	x1, FREGS_RA(sp)
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
+#if defined(HAVE_FUNCTION_GRAPH_FP_TEST) || defined(CONFIG_UNWINDER_DWARF_CFI)
 	REG_L	x8, FREGS_S0(sp)
 #endif
 	REG_L	x6,  FREGS_T1(sp)
@@ -183,6 +183,7 @@ SYM_FUNC_START(ftrace_caller)
 #endif
 #endif
 	SAVE_ABI_REGS
+SYM_INNER_LABEL(ftrace_caller_saved, SYM_L_GLOBAL)
 	PREPARE_ARGS
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
@@ -193,6 +194,7 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	jalr	ra, 0(ra)
 #endif
 	RESTORE_ABI_REGS
+SYM_INNER_LABEL(ftrace_caller_restore, SYM_L_GLOBAL)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	bnez	t1, ftrace_caller_direct
 #endif
diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index da4a4000e57e..c13aa07cdb04 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -27,8 +27,17 @@
 	 */
 	.macro SAVE_RET_ABI_STATE
 	addi	sp, sp, -FREGS_SIZE_ON_STACK
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset FREGS_SIZE_ON_STACK
+#endif
 	REG_S	ra, FREGS_RA(sp)
 	REG_S	s0, FREGS_S0(sp)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_offset s0, FREGS_S0 - FREGS_SIZE_ON_STACK
+	la	t0, return_to_handler
+	REG_S	t0, FREGS_EPC(sp)
+	.cfi_offset ra, FREGS_EPC - FREGS_SIZE_ON_STACK
+#endif
 	REG_S	a0, FREGS_A0(sp)
 	REG_S	a1, FREGS_A1(sp)
 	addi	s0, sp, FREGS_SIZE_ON_STACK
@@ -41,11 +50,16 @@
 	.endm
 
 	.macro RESTORE_RET_ABI_STATE
-	REG_L	ra, FREGS_RA(sp)
 	REG_L	s0, FREGS_S0(sp)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_restore s0
+#endif
 	REG_L	a0, FREGS_A0(sp)
 	REG_L	a1, FREGS_A1(sp)
 	addi	sp, sp, FREGS_SIZE_ON_STACK
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 0
+#endif
 	.endm
 
 SYM_TYPED_FUNC_START(ftrace_stub)
@@ -69,13 +83,27 @@ SYM_FUNC_START(return_to_handler)
  *
  * So alternatively we check the *old* frame pointer position, that is, the
  * value stored in -16(s0) on entry, and the s0 on return.
+ *
+ * Under CONFIG_UNWINDER_DWARF_CFI, FREGS_EPC(sp) is seeded with
+ * &return_to_handler before ftrace_return_to_handler() overwrites fregs->epc
+ * with the popped caller PC, allowing walk_stackframe_cfi() to unwind cleanly
+ * both before and after current->curr_ret_stack is decremented.
  */
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_startproc
+#endif
 	SAVE_RET_ABI_STATE
 	mv	a0, sp
 	call	ftrace_return_to_handler
-	mv	a2, a0
+	mv	ra, a0
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_same_value ra
+#endif
 	RESTORE_RET_ABI_STATE
-	jalr	a2
+	ret
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_endproc
+#endif
 SYM_FUNC_END(return_to_handler)
 #endif
 
diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/rethook.c
index 5c27c1f50989..1ae3faf48218 100644
--- a/arch/riscv/kernel/probes/rethook.c
+++ b/arch/riscv/kernel/probes/rethook.c
@@ -10,7 +10,10 @@
 /* This is called from arch_rethook_trampoline() */
 unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
 {
-	return rethook_trampoline_handler(regs, regs->s0);
+	unsigned long frame = IS_ENABLED(CONFIG_UNWINDER_DWARF_CFI) ?
+			      regs->sp : regs->s0;
+
+	return rethook_trampoline_handler(regs, frame);
 }
 
 NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
@@ -18,7 +21,13 @@ NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
 void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
 {
 	rhn->ret_addr = regs->ra;
-	rhn->frame = regs->s0;
+	/*
+	 * With -fomit-frame-pointer under CONFIG_UNWINDER_DWARF_CFI, nested
+	 * functions share s0; key the rethook node on the function's entry SP
+	 * (its DWARF CFA), which matches regs->sp at arch_rethook_trampoline.
+	 */
+	rhn->frame = IS_ENABLED(CONFIG_UNWINDER_DWARF_CFI) ?
+		     regs->sp : regs->s0;
 
 	/* replace return addr with trampoline */
 	regs->ra = (unsigned long)arch_rethook_trampoline;
diff --git a/arch/riscv/kernel/probes/rethook_trampoline.S b/arch/riscv/kernel/probes/rethook_trampoline.S
index c3aa8d8cf5af..f632630846de 100644
--- a/arch/riscv/kernel/probes/rethook_trampoline.S
+++ b/arch/riscv/kernel/probes/rethook_trampoline.S
@@ -78,9 +78,27 @@
 	REG_L x31, PT_T6(sp)
 	.endm
 
+/*
+ * Under CONFIG_UNWINDER_DWARF_CFI, PT_EPC(sp) is seeded with
+ * &arch_rethook_trampoline before rethook_trampoline_handler() overwrites
+ * regs->epc with the restored caller PC prior to running rethook handlers,
+ * enabling reliable CFI unwinding across kretprobe return hooks.
+ */
 SYM_CODE_START(arch_rethook_trampoline)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_startproc
+#endif
 	addi sp, sp, -(PT_SIZE_ON_STACK)
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset PT_SIZE_ON_STACK
+#endif
 	save_all_base_regs
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_offset s0, PT_S0 - PT_SIZE_ON_STACK
+	la t0, arch_rethook_trampoline
+	REG_S t0, PT_EPC(sp)
+	.cfi_offset ra, PT_EPC - PT_SIZE_ON_STACK
+#endif
 
 	move a0, sp /* pt_regs */
 
@@ -88,9 +106,21 @@ SYM_CODE_START(arch_rethook_trampoline)
 
 	/* use the result as the return-address */
 	move ra, a0
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_same_value ra
+#endif
 
 	restore_all_base_regs
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_restore s0
+#endif
 	addi sp, sp, PT_SIZE_ON_STACK
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_def_cfa_offset 0
+#endif
 
 	ret
+#ifdef CONFIG_UNWINDER_DWARF_CFI
+	.cfi_endproc
+#endif
 SYM_CODE_END(arch_rethook_trampoline)
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 788fcc21fd5b..fb8cc74cff11 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -201,7 +201,7 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 {
 	int stack_adjust = ctx->stack_size, store_offset = stack_adjust - 8;
 
-	if (seen_reg(RV_REG_RA, ctx)) {
+	if (seen_reg(RV_REG_RA, ctx) || IS_ENABLED(CONFIG_UNWINDER_DWARF_CFI)) {
 		emit_ld(RV_REG_RA, store_offset, RV_REG_SP, ctx);
 		store_offset -= 8;
 	}
@@ -2130,7 +2130,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
-	if (seen_reg(RV_REG_RA, ctx))
+	if (seen_reg(RV_REG_RA, ctx) || IS_ENABLED(CONFIG_UNWINDER_DWARF_CFI))
 		stack_adjust += 8;
 	stack_adjust += 8; /* RV_REG_FP */
 	if (seen_reg(RV_REG_S1, ctx))
@@ -2168,7 +2168,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 
 	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
 
-	if (seen_reg(RV_REG_RA, ctx)) {
+	if (seen_reg(RV_REG_RA, ctx) || IS_ENABLED(CONFIG_UNWINDER_DWARF_CFI)) {
 		emit_sd(RV_REG_SP, store_offset, RV_REG_RA, ctx);
 		store_offset -= 8;
 	}
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
