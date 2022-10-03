Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9036FC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08fwxNPj1tX2JmOzNH4djlH2jp2N0Z8hUH2yLVMdDe0=; b=39jpkZXA470eJ7
	Y5v7mb7AxVID0Ofsj6XtdVOzTnDrKh6UszqCrpGrXCj7MndUxKO1lGZZ78UARkm/cw7Q/mZITmpib
	s3edC3sUHgsO6iYM6OpM2/VRz9K2Sixkj9Ruh6gt1JKG4hRtiQURm0ddLdJJ83ToFcUPfOOFVnwA8
	od9dvDi7gk2ZGAwMcERGg2JjjPCYZjtIap9TlVeTAf3xYxND8kZ39qpjN2dS3VEhm/P5tcche00KZ
	LuDQk73AfsCvJDSu1slOCMf8RfX598ZvPzWl/Ab+hNUbdDAeaSmLyKF1YkpXJlkELuAxMeEtnu2GW
	HC9TohJPrgll3OOOtHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIql-005KqU-7Z; Mon, 03 Oct 2022 10:39:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIqg-005Knp-M9
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 10:39:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42F1761030;
	Mon,  3 Oct 2022 10:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCC9C43141;
	Mon,  3 Oct 2022 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664793537;
	bh=IKiDPx28Nqicnl0QtLd5sCtYnZ9BfdaTV6QNxzNd+Es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbLJhSqrdlkkxkdVgsV6sWnGtCM5TpPSOHjF7DBzu6PWs6INY91Ilq0Hr0msNCy+X
	 yxcytS3F5Wx0B/LAsH3ZtYM9+XFBGmpNBxf0ew4yETP3n63d4ZkTQivySTS4LOGGAE
	 oGIQlx8fRVEOXNKzW0eTSzfcNYne7WwzqMcUJ4RBtR2d0Qkcw4fOsR0rpouoBXtZVG
	 4PmuzAS55C6838sg/UBnq6j+KxLGYaFrIGJqHgZWwgR8Ay9+6lkbNSJX2lOAR42MWx
	 D5ZGUkHVB+xOIb4lsUHbmNko05OvcqHlcbLmT5cXfF2ahYl+dRNq2/hVFvTUG/DFh7
	 /kIeDLcGH0XYg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] riscv: fix race when vmap stack overflow and remove shadow_stack
Date: Mon,  3 Oct 2022 18:29:20 +0800
Message-Id: <20221003102921.3973-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221003102921.3973-1-jszhang@kernel.org>
References: <20221003102921.3973-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_033858_823738_A0C540C8 
X-CRM114-Status: GOOD (  19.92  )
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

Currently, when detecting vmap stack overflow, riscv firstly switches
to the so called shadow stack, then use this shadow stack to call the
get_overflow_stack() to get the overflow stack. However, there's
a race here if two or more harts use the same shadow stack at the same
time.

To solve this race, we rely on two facts:
1. the content of kernel thread pointer I.E "tp" register can still
be gotten from the CSR_SCRATCH register, thus we can clobber tp
under the condition that we restore tp from CSR_SCRATCH later.

2. Once vmap stack overflow happen, panic is coming soon, no
performance concern at all, so we don't need to define the overflow
stack as percpu var, we can simplify it into a pointer array which
points to allocated pages.

Thus we can use tp as a tmp register to get the cpu id to calculate
the offset of overflow stack pointer array for each cpu w/o shadow
stack any more. Thus the race condition is removed as a side effect.

NOTE: we can use similar mechanism to let each cpu use different shadow
stack to fix the race codition, but if we can remove shadow stack usage
totally, why not.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
---
 arch/riscv/include/asm/asm-prototypes.h |  1 -
 arch/riscv/include/asm/thread_info.h    |  3 --
 arch/riscv/kernel/asm-offsets.c         |  1 +
 arch/riscv/kernel/entry.S               | 56 ++++---------------------
 arch/riscv/kernel/traps.c               | 32 +++++++-------
 5 files changed, 28 insertions(+), 65 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index ef386fcf3939..4a06fa0f6493 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -25,7 +25,6 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
 
-asmlinkage unsigned long get_overflow_stack(void);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 
 #endif /* _ASM_RISCV_PROTOTYPES_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index c970d41dc4c6..26d3de62aab0 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -28,14 +28,11 @@
 
 #define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
 #define OVERFLOW_STACK_SIZE     SZ_4K
-#define SHADOW_OVERFLOW_STACK_SIZE (1024)
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
 
 #ifndef __ASSEMBLY__
 
-extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
-
 #include <asm/processor.h>
 #include <asm/csr.h>
 
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index df9444397908..62bf3bacc322 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -37,6 +37,7 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d227aca7f9d4..48ed1df7a792 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -223,54 +223,16 @@ END(ret_from_exception)
 
 #ifdef CONFIG_VMAP_STACK
 ENTRY(handle_kernel_stack_overflow)
-	la sp, shadow_stack
-	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
-
-	//save caller register to shadow stack
-	addi sp, sp, -(PT_SIZE_ON_STACK)
-	REG_S x1,  PT_RA(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
-
-	la ra, restore_caller_reg
-	tail get_overflow_stack
-
-restore_caller_reg:
-	//save per-cpu overflow stack
-	REG_S a0, -8(sp)
-	//restore caller register from shadow_stack
-	REG_L x1,  PT_RA(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x10, PT_A0(sp)
-	REG_L x11, PT_A1(sp)
-	REG_L x12, PT_A2(sp)
-	REG_L x13, PT_A3(sp)
-	REG_L x14, PT_A4(sp)
-	REG_L x15, PT_A5(sp)
-	REG_L x16, PT_A6(sp)
-	REG_L x17, PT_A7(sp)
-	REG_L x28, PT_T3(sp)
-	REG_L x29, PT_T4(sp)
-	REG_L x30, PT_T5(sp)
-	REG_L x31, PT_T6(sp)
+	la sp, overflow_stack
+	/* use tp as tmp register since we can restore it from CSR_SCRATCH */
+	REG_L tp, TASK_TI_CPU(tp)
+	slli tp, tp, RISCV_LGPTR
+	add tp, sp, tp
+	REG_L sp, 0(tp)
+
+	/* restore tp */
+	csrr tp, CSR_SCRATCH
 
-	//load per-cpu overflow stack
-	REG_L sp, -8(sp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 
 	//save context to overflow stack
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index d20037585c2f..d317429b4097 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -245,23 +245,12 @@ int is_valid_bugaddr(unsigned long pc)
 #endif /* CONFIG_GENERIC_BUG */
 
 #ifdef CONFIG_VMAP_STACK
-static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
-		overflow_stack)__aligned(16);
-/*
- * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
- * to get per-cpu overflow stack(get_overflow_stack).
- */
-long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
-asmlinkage unsigned long get_overflow_stack(void)
-{
-	return (unsigned long)this_cpu_ptr(overflow_stack) +
-		OVERFLOW_STACK_SIZE;
-}
+u8 *overflow_stack[NR_CPUS] __ro_after_init __aligned(16);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
 	unsigned long tsk_stk = (unsigned long)current->stack;
-	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
+	unsigned long ovf_stk = (unsigned long)overflow_stack[raw_smp_processor_id()];
 
 	console_verbose();
 
@@ -269,7 +258,7 @@ asmlinkage void handle_bad_stack(struct pt_regs *regs)
 	pr_emerg("Task stack:     [0x%016lx..0x%016lx]\n",
 			tsk_stk, tsk_stk + THREAD_SIZE);
 	pr_emerg("Overflow stack: [0x%016lx..0x%016lx]\n",
-			ovf_stk, ovf_stk + OVERFLOW_STACK_SIZE);
+			ovf_stk - OVERFLOW_STACK_SIZE, ovf_stk);
 
 	__show_regs(regs);
 	panic("Kernel stack overflow");
@@ -277,4 +266,19 @@ asmlinkage void handle_bad_stack(struct pt_regs *regs)
 	for (;;)
 		wait_for_interrupt();
 }
+
+static int __init alloc_overflow_stacks(void)
+{
+	u8 *s;
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		s = (u8 *)__get_free_pages(GFP_KERNEL, get_order(OVERFLOW_STACK_SIZE));
+		if (WARN_ON(!s))
+			return -ENOMEM;
+		overflow_stack[cpu] = &s[OVERFLOW_STACK_SIZE];
+	}
+	return 0;
+}
+early_initcall(alloc_overflow_stacks);
 #endif
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
