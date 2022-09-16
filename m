Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B9DC54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZygYhYE0w8AnN8G84lSo4PXAZwT3WT9BZ5vohF3WZA=; b=R/a7fK4qwrPLv0
	OV9LDaubkADAnphtcRmrOajvi8MwIKJkOKaDrBwzj9P8h9Te3FFStg0uRTEFdR1QF4s7RnZ6GSa/J
	t54cWxXODT3qb/ZsFCW0olQ/JxW02U3Hw1sX8OTmNc9nvxZc0DKxjWW4P1/c4k2/iqOegHT7IFVOe
	OtWb8vBnskmIPGR2w7DMQEl5s6HNlIZ21ZqSpMEgF5zHt3265xuE6IbVB3QHuz8oZUW/XNqwade9Z
	ldL+6spZiQC/B0XJF/npOwGHqYK7dG/Ap6hG2B1zMzgSnVkVmy94jZCCZA7gMGvly26kQdmk90OSk
	fjgHiAmFzTeR3B4v/BuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8lc-00CGsY-9M; Fri, 16 Sep 2022 10:40:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8kG-00CGHg-3B
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 10:38:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64F6CB825E8;
	Fri, 16 Sep 2022 10:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ACAC433C1;
	Fri, 16 Sep 2022 10:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663324729;
	bh=kL47KPMguqI2L3KF27fbBlhWO4R1JWIXY+6u1ZR4dSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYS/ZfVevAe7v9zvnVPryLFsMR2MryF1Hoo+uX4L3qJ0JnM/g2G0Te9tdsak6NJ3y
	 iDaWAT8cKXoxmhMqSFOW2+Lm+HOh+FXT7Z4t/2dtRHGoMups9h8XqMmP8/2g2rmF+I
	 oH58hH8Ke1VpcyAxpFRCgtygzwA+LoJ4usMDFvTCXHThDJ9bTRW5OnoasSInELGqDQ
	 p6++El6uukwBHQEgykF2EunuK2KIrqluUC30Duzj90Rq1LiaZo/kGyRLQT55SzL4GD
	 cKygP4MHFg4ns9R1ilmSTYMEfWm2Z5mo7GBNid3SuKtt0wmWj8zWgxB5eFgtUO1C0T
	 0BmzvWQmE0WuQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	rostedt@goodmis.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	jrtc27@jrtc27.com,
	mingo@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 3/3] riscv: ftrace: Reduce the detour code size to half
Date: Fri, 16 Sep 2022 06:38:17 -0400
Message-Id: <20220916103817.9490-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220916103817.9490-1-guoren@kernel.org>
References: <20220916103817.9490-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_033852_528596_1FAF31A7 
X-CRM114-Status: GOOD (  20.03  )
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

Use a temporary register to reduce the size of detour code from 16B
to 8B.

Before optimization (16 byte):
<func_prolog>:
 0: REG_S  ra, -SZREG(sp)
 4: auipc  ra, ?
 8: jalr   ?(ra)
12: REG_L  ra, -SZREG(sp)
 (func_boddy)

The previous implementation is from afc76b8b8011 ("riscv: Using
PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")

After optimization (8 byte):
<func_prolog>:
 0: auipc  t0, ?
 4: jalr   t0, ?(t0)
 (func_boddy)

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Makefile             |  4 +-
 arch/riscv/include/asm/ftrace.h | 46 ++++++++++++++++++-----
 arch/riscv/kernel/ftrace.c      | 65 ++++++++++-----------------------
 arch/riscv/kernel/mcount-dyn.S  | 43 +++++++++-------------
 4 files changed, 74 insertions(+), 84 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index f32844f545d6..7b9d4a7cd4bf 100644
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
index 04dad3380041..34b0b523865a 100644
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
+	call[0] = to_auipc_t0((unsigned int)((unsigned long)callee -	\
 				(unsigned long)caller));		\
-	call[1] = to_jalr_insn((unsigned int)((unsigned long)callee -	\
+	call[1] = to_jalr_t0((unsigned int)((unsigned long)callee -	\
 			       (unsigned long)caller));			\
 } while (0)
 
-#define to_jalr_insn(offset)						\
-	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_BASIC)
+#define to_jalr_ra(offset)						\
+	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_RA)
 
-#define to_auipc_insn(offset)						\
+#define to_auipc_ra(offset)					\
 	((offset & JALR_SIGN_MASK) ?					\
-	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_BASIC) :	\
-	((offset & AUIPC_OFFSET_MASK) | AUIPC_BASIC))
+	(((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) | AUIPC_RA) :	\
+	((offset & AUIPC_OFFSET_MASK) | AUIPC_RA))
+
+#define make_call_ra(caller, callee, call)				\
+do {									\
+	call[0] = to_auipc_ra((unsigned int)((unsigned long)callee -	\
+				(unsigned long)caller));		\
+	call[1] = to_jalr_ra((unsigned int)((unsigned long)callee -	\
+			       (unsigned long)caller));			\
+} while (0)
 
 /*
  * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 2086f6585773..8c77f236fc71 100644
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
+	if (patch_text_nosync((void *)rec->ip, call, 8))
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
+	unsigned long caller = rec->ip + 4;
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
index d171eca623b6..64bc79816f5e 100644
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
+	REG_L	a1, PT_RA(sp)
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
