Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA09C46467
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6meJGzcmTpMfBpAK0ds+x9io5poNx60dcTI/pQng/s=; b=MVHxXrAnYjODOd
	ymkUhvFjTF59u2humvAlD9E5aFgoqdWRkljTuGjkrg5032LLFPqOTlYKDYeyG+KCf8g9EMcKUmihH
	jRuUyHSpWzWZg2h5spWDumtmoJoEli4yzrTeeNg8Z2nRgi85qU7SX7w2qVZTb9aPTxfaEkpqk1GKM
	UhqreeMlCBkp8aIB3bxtady+qLBwmQBM3bIi39ko/DJtOy8g/gFpeyu1/JfSXyKJ94VsnMkgeYwXi
	q8+ryHP5HVjfkudTk6Ai62ULBz4MMUTOGrLqwgJNa1RkffvoEeyJsyaqDKYt+0G7mRsme/0RQ4b9B
	CUO7WLQNwn3zPB52YtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE9NJ-005Kw8-Jp; Sat, 07 Jan 2023 13:36:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE9N1-005KnU-4C
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 13:36:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F74FB810AA;
	Sat,  7 Jan 2023 13:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE971C433EF;
	Sat,  7 Jan 2023 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673098580;
	bh=vaFSHeHQPEAUKur+0M+Oaldaw07VO0iR8N5JlPCyEHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rB09wA9uo3sfMx+1/Y4WQz+jgp+IqHpfm3fCBAQ35XVlBKgBfkRGCoW+JzJC97+sK
	 elaYV+SuctfUNPXLk1ewyZ7/rW0cUn8lNDa4vMvukhoZIzO3SqCGyzjTqhVM9A3oYm
	 uMg+B2pH4j7apaomji7ShNcmaKu9Zci1CHREU89ALri8St7T59WBoW09yhhjMywTAN
	 DiSCPBbymerhmwZKfHAnxUJ2zfNPPbZEVHJy7PSsqxq7dl9upkTC4GkceX/CJbVKr9
	 4tXInouzbkXbM3+n0g7jHENpe/E1cKLnuWJ09Uj9zt+DwRWd2tR3DRyCHxa/Pq6BAT
	 EdNJ0hnOH9tRw==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com,
	e.shatokhin@yadro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V6 3/7] riscv: ftrace: Reduce the detour code size to half
Date: Sat,  7 Jan 2023 08:35:45 -0500
Message-Id: <20230107133549.4192639-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230107133549.4192639-1-guoren@kernel.org>
References: <20230107133549.4192639-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_053634_554577_D95140D6 
X-CRM114-Status: GOOD (  23.24  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Use a temporary register to reduce the size of detour code from 16 bytes to
8 bytes. The previous implementation is from 'commit afc76b8b8011 ("riscv:
Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")'.

Before the patch:
<func_prolog>:
 0: REG_S  ra, -SZREG(sp)
 4: auipc  ra, ?
 8: jalr   ?(ra)
12: REG_L  ra, -SZREG(sp)
 (func_boddy)

After the patch:
<func_prolog>:
 0: auipc  t0, ?
 4: jalr   t0, ?(t0)
 (func_boddy)

This patch not just reduces the size of detour code, but also fixes an
important issue:

An Ftrace callback registered with FTRACE_OPS_FL_IPMODIFY flag can
actually change the instruction pointer, e.g. to "replace" the given
kernel function with a new one, which is needed for livepatching, etc.

In this case, the trampoline (ftrace_regs_caller) would not return to
<func_prolog+12> but would rather jump to the new function. So, "REG_L
ra, -SZREG(sp)" would not run and the original return address would not
be restored. The kernel is likely to hang or crash as a result.

This can be easily demonstrated if one tries to "replace", say,
cmdline_proc_show() with a new function with the same signature using
instruction_pointer_set(&fregs->regs, new_func_addr) in the Ftrace
callback.

Link: https://lore.kernel.org/linux-riscv/20221122075440.1165172-1-suagrfillet@gmail.com/
Link: https://lore.kernel.org/linux-riscv/d7d5730b-ebef-68e5-5046-e763e1ee6164@yadro.com/
Co-developed-by: Song Shuai <suagrfillet@gmail.com>
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Evgenii Shatokhin <e.shatokhin@yadro.com>
---
 arch/riscv/Makefile             |  4 +-
 arch/riscv/include/asm/ftrace.h | 50 +++++++++++++++++++------
 arch/riscv/kernel/ftrace.c      | 65 ++++++++++-----------------------
 arch/riscv/kernel/mcount-dyn.S  | 43 +++++++++-------------
 4 files changed, 76 insertions(+), 86 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index ea5a91da6897..3c9aaf67ed79 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -12,9 +12,9 @@ ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
 ifeq ($(CONFIG_RISCV_ISA_C),y)
-	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
-else
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
+else
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=2
 endif
 endif
 
diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 04dad3380041..9e73922e1e2e 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -42,6 +42,14 @@ struct dyn_arch_ftrace {
  * 2) jalr: setting low-12 offset to ra, jump to ra, and set ra to
  *          return address (original pc + 4)
  *
+ *<ftrace enable>:
+ * 0: auipc  t0/ra, 0x?
+ * 4: jalr   t0/ra, ?(t0/ra)
+ *
+ *<ftrace disable>:
+ * 0: nop
+ * 4: nop
+ *
  * Dynamic ftrace generates probes to call sites, so we must deal with
  * both auipc and jalr at the same time.
  */
@@ -52,25 +60,43 @@ struct dyn_arch_ftrace {
 #define AUIPC_OFFSET_MASK	(0xfffff000)
 #define AUIPC_PAD		(0x00001000)
 #define JALR_SHIFT		20
-#define JALR_BASIC		(0x000080e7)
-#define AUIPC_BASIC		(0x00000097)
+#define JALR_RA			(0x000080e7)
+#define AUIPC_RA		(0x00000097)
+#define JALR_T0			(0x000282e7)
+#define AUIPC_T0		(0x00000297)
 #define NOP4			(0x00000013)
 
-#define make_call(caller, callee, call)					\
+#define to_jalr_t0(offset)						\
+	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_T0)
+
+#define to_auipc_t0(offset)						\
+	((offset & JALR_SIGN_MASK) ?					\
+	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_T0) :	\
+	((offset & AUIPC_OFFSET_MASK) | AUIPC_T0))
+
+#define make_call_t0(caller, callee, call)				\
 do {									\
-	call[0] = to_auipc_insn((unsigned int)((unsigned long)callee -	\
-				(unsigned long)caller));		\
-	call[1] = to_jalr_insn((unsigned int)((unsigned long)callee -	\
-			       (unsigned long)caller));			\
+	unsigned int offset =						\
+		(unsigned long) callee - (unsigned long) caller;	\
+	call[0] = to_auipc_t0(offset);					\
+	call[1] = to_jalr_t0(offset);					\
 } while (0)
 
-#define to_jalr_insn(offset)						\
-	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_BASIC)
+#define to_jalr_ra(offset)						\
+	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_RA)
 
-#define to_auipc_insn(offset)						\
+#define to_auipc_ra(offset)						\
 	((offset & JALR_SIGN_MASK) ?					\
-	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :	\
-	((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
+	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_RA) :	\
+	((offset & AUIPC_OFFSET_MASK) | AUIPC_RA))
+
+#define make_call_ra(caller, callee, call)				\
+do {									\
+	unsigned int offset =						\
+		(unsigned long) callee - (unsigned long) caller;	\
+	call[0] = to_auipc_ra(offset);					\
+	call[1] = to_jalr_ra(offset);					\
+} while (0)
 
 /*
  * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2086f6585773..5bff37af4770 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -55,12 +55,15 @@ static int ftrace_check_current_call(unsigned long hook_pos,
 }
 
 static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
-				bool enable)
+				bool enable, bool ra)
 {
 	unsigned int call[2];
 	unsigned int nops[2] = {NOP4, NOP4};
 
-	make_call(hook_pos, target, call);
+	if (ra)
+		make_call_ra(hook_pos, target, call);
+	else
+		make_call_t0(hook_pos, target, call);
 
 	/* Replace the auipc-jalr pair at once. Return -EPERM on write error. */
 	if (patch_text_nosync
@@ -70,42 +73,13 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
 	return 0;
 }
 
-/*
- * Put 5 instructions with 16 bytes at the front of function within
- * patchable function entry nops' area.
- *
- * 0: REG_S  ra, -SZREG(sp)
- * 1: auipc  ra, 0x?
- * 2: jalr   -?(ra)
- * 3: REG_L  ra, -SZREG(sp)
- *
- * So the opcodes is:
- * 0: 0xfe113c23 (sd)/0xfe112e23 (sw)
- * 1: 0x???????? -> auipc
- * 2: 0x???????? -> jalr
- * 3: 0xff813083 (ld)/0xffc12083 (lw)
- */
-#if __riscv_xlen == 64
-#define INSN0	0xfe113c23
-#define INSN3	0xff813083
-#elif __riscv_xlen == 32
-#define INSN0	0xfe112e23
-#define INSN3	0xffc12083
-#endif
-
-#define FUNC_ENTRY_SIZE	16
-#define FUNC_ENTRY_JMP	4
-
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int call[4] = {INSN0, 0, 0, INSN3};
-	unsigned long target = addr;
-	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
+	unsigned int call[2];
 
-	call[1] = to_auipc_insn((unsigned int)(target - caller));
-	call[2] = to_jalr_insn((unsigned int)(target - caller));
+	make_call_t0(rec->ip, addr, call);
 
-	if (patch_text_nosync((void *)rec->ip, call, FUNC_ENTRY_SIZE))
+	if (patch_text_nosync((void *)rec->ip, call, MCOUNT_INSN_SIZE))
 		return -EPERM;
 
 	return 0;
@@ -114,15 +88,14 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
 		    unsigned long addr)
 {
-	unsigned int nops[4] = {NOP4, NOP4, NOP4, NOP4};
+	unsigned int nops[2] = {NOP4, NOP4};
 
-	if (patch_text_nosync((void *)rec->ip, nops, FUNC_ENTRY_SIZE))
+	if (patch_text_nosync((void *)rec->ip, nops, MCOUNT_INSN_SIZE))
 		return -EPERM;
 
 	return 0;
 }
 
-
 /*
  * This is called early on, and isn't wrapped by
  * ftrace_arch_code_modify_{prepare,post_process}() and therefor doesn't hold
@@ -144,10 +117,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
-				       (unsigned long)func, true);
+				       (unsigned long)func, true, true);
 	if (!ret) {
 		ret = __ftrace_modify_call((unsigned long)&ftrace_regs_call,
-					   (unsigned long)func, true);
+					   (unsigned long)func, true, true);
 	}
 
 	return ret;
@@ -159,16 +132,16 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		       unsigned long addr)
 {
 	unsigned int call[2];
-	unsigned long caller = rec->ip + FUNC_ENTRY_JMP;
+	unsigned long caller = rec->ip;
 	int ret;
 
-	make_call(caller, old_addr, call);
+	make_call_t0(caller, old_addr, call);
 	ret = ftrace_check_current_call(caller, call);
 
 	if (ret)
 		return ret;
 
-	return __ftrace_modify_call(caller, addr, true);
+	return __ftrace_modify_call(caller, addr, true, false);
 }
 #endif
 
@@ -203,12 +176,12 @@ int ftrace_enable_ftrace_graph_caller(void)
 	int ret;
 
 	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, true);
+				    (unsigned long)&prepare_ftrace_return, true, true);
 	if (ret)
 		return ret;
 
 	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
-				    (unsigned long)&prepare_ftrace_return, true);
+				    (unsigned long)&prepare_ftrace_return, true, true);
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
@@ -216,12 +189,12 @@ int ftrace_disable_ftrace_graph_caller(void)
 	int ret;
 
 	ret = __ftrace_modify_call((unsigned long)&ftrace_graph_call,
-				    (unsigned long)&prepare_ftrace_return, false);
+				    (unsigned long)&prepare_ftrace_return, false, true);
 	if (ret)
 		return ret;
 
 	return __ftrace_modify_call((unsigned long)&ftrace_graph_regs_call,
-				    (unsigned long)&prepare_ftrace_return, false);
+				    (unsigned long)&prepare_ftrace_return, false, true);
 }
 #endif /* CONFIG_DYNAMIC_FTRACE */
 #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index d171eca623b6..b75332ced757 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -13,8 +13,8 @@
 
 	.text
 
-#define FENTRY_RA_OFFSET	12
-#define ABI_SIZE_ON_STACK	72
+#define FENTRY_RA_OFFSET	8
+#define ABI_SIZE_ON_STACK	80
 #define ABI_A0			0
 #define ABI_A1			8
 #define ABI_A2			16
@@ -23,10 +23,10 @@
 #define ABI_A5			40
 #define ABI_A6			48
 #define ABI_A7			56
-#define ABI_RA			64
+#define ABI_T0			64
+#define ABI_RA			72
 
 	.macro SAVE_ABI
-	addi	sp, sp, -SZREG
 	addi	sp, sp, -ABI_SIZE_ON_STACK
 
 	REG_S	a0, ABI_A0(sp)
@@ -37,6 +37,7 @@
 	REG_S	a5, ABI_A5(sp)
 	REG_S	a6, ABI_A6(sp)
 	REG_S	a7, ABI_A7(sp)
+	REG_S	t0, ABI_T0(sp)
 	REG_S	ra, ABI_RA(sp)
 	.endm
 
@@ -49,24 +50,18 @@
 	REG_L	a5, ABI_A5(sp)
 	REG_L	a6, ABI_A6(sp)
 	REG_L	a7, ABI_A7(sp)
+	REG_L	t0, ABI_T0(sp)
 	REG_L	ra, ABI_RA(sp)
 
 	addi	sp, sp, ABI_SIZE_ON_STACK
-	addi	sp, sp, SZREG
 	.endm
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	.macro SAVE_ALL
-	addi	sp, sp, -SZREG
 	addi	sp, sp, -PT_SIZE_ON_STACK
 
-	REG_S x1,  PT_EPC(sp)
-	addi	sp, sp, PT_SIZE_ON_STACK
-	REG_L x1,  (sp)
-	addi	sp, sp, -PT_SIZE_ON_STACK
+	REG_S t0,  PT_EPC(sp)
 	REG_S x1,  PT_RA(sp)
-	REG_L x1,  PT_EPC(sp)
-
 	REG_S x2,  PT_SP(sp)
 	REG_S x3,  PT_GP(sp)
 	REG_S x4,  PT_TP(sp)
@@ -100,11 +95,8 @@
 	.endm
 
 	.macro RESTORE_ALL
+	REG_L t0,  PT_EPC(sp)
 	REG_L x1,  PT_RA(sp)
-	addi	sp, sp, PT_SIZE_ON_STACK
-	REG_S x1,  (sp)
-	addi	sp, sp, -PT_SIZE_ON_STACK
-	REG_L x1,  PT_EPC(sp)
 	REG_L x2,  PT_SP(sp)
 	REG_L x3,  PT_GP(sp)
 	REG_L x4,  PT_TP(sp)
@@ -137,17 +129,16 @@
 	REG_L x31, PT_T6(sp)
 
 	addi	sp, sp, PT_SIZE_ON_STACK
-	addi	sp, sp, SZREG
 	.endm
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
 
 ENTRY(ftrace_caller)
 	SAVE_ABI
 
-	addi	a0, ra, -FENTRY_RA_OFFSET
+	addi	a0, t0, -FENTRY_RA_OFFSET
 	la	a1, function_trace_op
 	REG_L	a2, 0(a1)
-	REG_L	a1, ABI_SIZE_ON_STACK(sp)
+	mv	a1, ra
 	mv	a3, sp
 
 ftrace_call:
@@ -155,8 +146,8 @@ ftrace_call:
 	call	ftrace_stub
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	addi	a0, sp, ABI_SIZE_ON_STACK
-	REG_L	a1, ABI_RA(sp)
+	addi	a0, sp, ABI_RA
+	REG_L	a1, ABI_T0(sp)
 	addi	a1, a1, -FENTRY_RA_OFFSET
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	mv	a2, s0
@@ -166,17 +157,17 @@ ftrace_graph_call:
 	call	ftrace_stub
 #endif
 	RESTORE_ABI
-	ret
+	jr t0
 ENDPROC(ftrace_caller)
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 ENTRY(ftrace_regs_caller)
 	SAVE_ALL
 
-	addi	a0, ra, -FENTRY_RA_OFFSET
+	addi	a0, t0, -FENTRY_RA_OFFSET
 	la	a1, function_trace_op
 	REG_L	a2, 0(a1)
-	REG_L	a1, PT_SIZE_ON_STACK(sp)
+	mv	a1, ra
 	mv	a3, sp
 
 ftrace_regs_call:
@@ -185,7 +176,7 @@ ftrace_regs_call:
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	addi	a0, sp, PT_RA
-	REG_L	a1, PT_EPC(sp)
+	REG_L	a1, PT_T0(sp)
 	addi	a1, a1, -FENTRY_RA_OFFSET
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	mv	a2, s0
@@ -196,6 +187,6 @@ ftrace_graph_regs_call:
 #endif
 
 	RESTORE_ALL
-	ret
+	jr t0
 ENDPROC(ftrace_regs_caller)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
