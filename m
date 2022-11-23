Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEFCC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2VQdz2OFzMhQjrubcw8MSkowJkLCoeiymvSl+3RO1Y=; b=BDPgIRTdYONrsF3DTrbXYbbE2u
	4PHwvEhvKgK0rMCk9w+DH0XR0UlssIo9BpaDSFvzTg5opWAVNAKO/H4C8ubACxOmlvDmiINZQsH9I
	KGeZgARhvISZ6rQ4vVvzR582T/xuajwSoNF46KbBwmi92XzlpE82cVstFiJLU3kxojSLiP6/ovsQX
	C8KyQIPoKydzaCavbD4IYs7POjrZ1AVjfGUa94feXx0Wt1uTHpw+89uaEcfV4YPqZJrlFiKOYkHFJ
	TDF5yyRJQh7qlKyQm8YAjjc2UHUP+991t3DToTrimMuTN/wQetjgOY7qzm6q55rfwwAmTXivbeej9
	GBj1E/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxt9I-0013Ry-8z; Wed, 23 Nov 2022 17:03:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxt9E-0013PW-Js
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 17:02:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 4so17224214pli.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 09:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtW9VVC8Ry6rEP8bZmq8bnNRziAwFnWeXTCQ6xclNuc=;
        b=vs/bCMbK9G+RjRRs+gCpuLqVMrRBwRhZdKbPRvMZmjaSBjiPfozEYv5YjRFiIFJJKb
         9YB9inrWj1a2+QvkL4aCrKoh5lFxtDBZmH9YyKCkbFXRTjBXuDn6KcjLJjrOc2d3PsyF
         xb5qdisDgO/g++1jC+AcCdUfXOi09YAcYZKFJmx9ApyjBBTMMS/wulTrDHBh2iLKOVdh
         CVMwD9tkyJLbJvCSfpCUgO3inTMVJEWFYEnltWUEk27HT4AsIIJA0L03VE+SVfAQWG8w
         RM4VPLkx/g//7y2N/hV5flQrIAvBOhRaSAHNHLrjGzjqTIVsAeokY72x4iU7afA2tGqI
         bjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtW9VVC8Ry6rEP8bZmq8bnNRziAwFnWeXTCQ6xclNuc=;
        b=z7kwWyCnidowz6qu3fy1dEwtX1532ScZs0VUDSut0HzI0SaG2n2nVeasNLvj8AjM4c
         5u4yCdalaeyS1R93MrzAf6RHDmlJ1tbgHidKIKSeNnY7FUHbEstaxiUtDNXsT5yN2yzz
         YAFIUp74EkVJJA/RSmDbNGKDTOcaIVwbJVS5IytyVaj3zRdN/eVrbH9gtoBEmDIAeMeX
         BgwG1VW0eYB2rJlGAdcW4CuBUH9OCINirJC+GXNjnFnvkjIUz69HRKUUFgQaR0WeH/n0
         4MsJDerbMROO/kWTz2E9XF89eH2uk0+c0Nw4IfGV6+5eRy3Z05vf9/MNSU/ahUGz+Okp
         6ROw==
X-Gm-Message-State: ANoB5pkA450Bu023tbevsGmGiO4U3Id83L8/deRAzb4z2kDsZn4FDmL+
	Ijj5QDr6J0zJ/nsg6rYrNALTug==
X-Google-Smtp-Source: AA0mqf7QBn41JsKc0E74UeARJdwT69yD+Nf84EGNKTDQvFbVw6ZlvvxfQEoJBYIA042rqG+qq7FXdA==
X-Received: by 2002:a17:90a:d581:b0:212:b43b:ffe5 with SMTP id v1-20020a17090ad58100b00212b43bffe5mr31841949pju.32.1669222972487;
        Wed, 23 Nov 2022 09:02:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id j5-20020a170903024500b0017849a2b56asm14740970plh.46.2022.11.23.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 09:02:51 -0800 (PST)
Date: Wed, 23 Nov 2022 09:02:50 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/4] riscv: fix race when vmap stack overflow and remove
 shadow_stack
Message-ID: <20221123170250.GA2855837@debug.ba.rivosinc.com>
References: <20220925175356.681-1-jszhang@kernel.org>
 <20220925175356.681-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925175356.681-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_090256_921956_33926D75 
X-CRM114-Status: GOOD (  17.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 26, 2022 at 01:53:55AM +0800, Jisheng Zhang wrote:
>Currently, when detecting vmap stack overflow, riscv firstly switches
>to the so called shadow stack, then use this shadow stack to call the
>get_overflow_stack() to get the overflow stack. However, there's
>a race here if two or more harts use the same shadow stack at the same
>time.
>
>To solve this race, we rely on two facts:
>1. the kernel thread pointer I.E "tp" register can still be gotten from
>the CSR_SCRATCH register, thus we can clobber tp under the condition
>that we restore tp from CSR_SCRATCH later.
>
>2. Once vmap stack overflow happen, panic is coming soon, no
>performance concern at all, so we don't need to define the overflow
>stack as percpu var, we can simplify it into an array.
>
>Thus we can use tp as a tmp register to get the cpu id to calculate
>the offset of overflow stack for each cpu w/o shadow stack any more.
>Thus the race condition is removed as side effect.
>
>NOTE: we can use similar mechanism to let each cpu use different shadow
>stack to fix the race codition, but if we can remove shadow stack usage
>totally, why not.

I've a different patch to solve the same problem.
Using an asm macro which allows obtaining per cpu symbols.
Thus we can switch to overflow_stack directly from entry.S
Patch coming soon.

>
>Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
>---
> arch/riscv/include/asm/asm-prototypes.h |  1 -
> arch/riscv/include/asm/thread_info.h    |  4 +-
> arch/riscv/kernel/asm-offsets.c         |  1 +
> arch/riscv/kernel/entry.S               | 54 ++++---------------------
> arch/riscv/kernel/traps.c               | 15 +------
> 5 files changed, 11 insertions(+), 64 deletions(-)
>
>diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
>index ef386fcf3939..4a06fa0f6493 100644
>--- a/arch/riscv/include/asm/asm-prototypes.h
>+++ b/arch/riscv/include/asm/asm-prototypes.h
>@@ -25,7 +25,6 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> DECLARE_DO_ERROR_INFO(do_trap_break);
>
>-asmlinkage unsigned long get_overflow_stack(void);
> asmlinkage void handle_bad_stack(struct pt_regs *regs);
>
> #endif /* _ASM_RISCV_PROTOTYPES_H */
>diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>index c970d41dc4c6..c604a5212a73 100644
>--- a/arch/riscv/include/asm/thread_info.h
>+++ b/arch/riscv/include/asm/thread_info.h
>@@ -28,14 +28,12 @@
>
> #define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
> #define OVERFLOW_STACK_SIZE     SZ_4K
>-#define SHADOW_OVERFLOW_STACK_SIZE (1024)
>+#define OVERFLOW_STACK_SHIFT	12
>
> #define IRQ_STACK_SIZE		THREAD_SIZE
>
> #ifndef __ASSEMBLY__
>
>-extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
>-
> #include <asm/processor.h>
> #include <asm/csr.h>
>
>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>index df9444397908..62bf3bacc322 100644
>--- a/arch/riscv/kernel/asm-offsets.c
>+++ b/arch/riscv/kernel/asm-offsets.c
>@@ -37,6 +37,7 @@ void asm_offsets(void)
> 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
> 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>
> 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>index a3e1ed2fa2ac..442d93beffcf 100644
>--- a/arch/riscv/kernel/entry.S
>+++ b/arch/riscv/kernel/entry.S
>@@ -223,54 +223,14 @@ END(ret_from_exception)
>
> #ifdef CONFIG_VMAP_STACK
> ENTRY(handle_kernel_stack_overflow)
>-	la sp, shadow_stack
>-	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>-
>-	//save caller register to shadow stack
>-	addi sp, sp, -(PT_SIZE_ON_STACK)
>-	REG_S x1,  PT_RA(sp)
>-	REG_S x5,  PT_T0(sp)
>-	REG_S x6,  PT_T1(sp)
>-	REG_S x7,  PT_T2(sp)
>-	REG_S x10, PT_A0(sp)
>-	REG_S x11, PT_A1(sp)
>-	REG_S x12, PT_A2(sp)
>-	REG_S x13, PT_A3(sp)
>-	REG_S x14, PT_A4(sp)
>-	REG_S x15, PT_A5(sp)
>-	REG_S x16, PT_A6(sp)
>-	REG_S x17, PT_A7(sp)
>-	REG_S x28, PT_T3(sp)
>-	REG_S x29, PT_T4(sp)
>-	REG_S x30, PT_T5(sp)
>-	REG_S x31, PT_T6(sp)
>-
>-	la ra, restore_caller_reg
>-	tail get_overflow_stack
>-
>-restore_caller_reg:
>-	//save per-cpu overflow stack
>-	REG_S a0, -8(sp)
>-	//restore caller register from shadow_stack
>-	REG_L x1,  PT_RA(sp)
>-	REG_L x5,  PT_T0(sp)
>-	REG_L x6,  PT_T1(sp)
>-	REG_L x7,  PT_T2(sp)
>-	REG_L x10, PT_A0(sp)
>-	REG_L x11, PT_A1(sp)
>-	REG_L x12, PT_A2(sp)
>-	REG_L x13, PT_A3(sp)
>-	REG_L x14, PT_A4(sp)
>-	REG_L x15, PT_A5(sp)
>-	REG_L x16, PT_A6(sp)
>-	REG_L x17, PT_A7(sp)
>-	REG_L x28, PT_T3(sp)
>-	REG_L x29, PT_T4(sp)
>-	REG_L x30, PT_T5(sp)
>-	REG_L x31, PT_T6(sp)
>+	la sp, overflow_stack
>+	/* use tp as tmp register since we can restore it from CSR_SCRATCH */
>+	REG_L tp, TASK_TI_CPU(tp)
>+	addi tp, tp, 1
>+	slli tp, tp, OVERFLOW_STACK_SHIFT
>+	add sp, sp, tp
>+	csrr tp, CSR_SCRATCH
>
>-	//load per-cpu overflow stack
>-	REG_L sp, -8(sp)
> 	addi sp, sp, -(PT_SIZE_ON_STACK)
>
> 	//save context to overflow stack
>diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>index 73f06cd149d9..2a2a977c1eff 100644
>--- a/arch/riscv/kernel/traps.c
>+++ b/arch/riscv/kernel/traps.c
>@@ -216,23 +216,12 @@ int is_valid_bugaddr(unsigned long pc)
> #endif /* CONFIG_GENERIC_BUG */
>
> #ifdef CONFIG_VMAP_STACK
>-static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>-		overflow_stack)__aligned(16);
>-/*
>- * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
>- * to get per-cpu overflow stack(get_overflow_stack).
>- */
>-long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
>-asmlinkage unsigned long get_overflow_stack(void)
>-{
>-	return (unsigned long)this_cpu_ptr(overflow_stack) +
>-		OVERFLOW_STACK_SIZE;
>-}
>+unsigned long overflow_stack[NR_CPUS][OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>
> asmlinkage void handle_bad_stack(struct pt_regs *regs)
> {
> 	unsigned long tsk_stk = (unsigned long)current->stack;
>-	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>+	unsigned long ovf_stk = (unsigned long)overflow_stack[raw_smp_processor_id()];
>
> 	console_verbose();
>
>-- 
>2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
