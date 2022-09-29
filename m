Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7DAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kws5JaTPIYZHXZuTA/KtKWoAAYknkwNWzxnjBqqX820=; b=JAtGLXvyC8Z52h
	bBSF3a5UiWoNA/2eM4PPO8CMhdKtGe+5AcmYoEkf74joZgUPDcUPY85V3/Q7rT6D59hZAIonNADOE
	5/kXGq4y9ia/gPO6yBGSGudWKfw1Jd1VRLnYBPsiYxIND2jSuPU7vMbTCjU3tzUGkv0iSC9SonKdx
	QNvhWeerJUDnbiJLDM4r8pQhf52QzEB43+BjOd0uklitKa6LQiI4AUOxM7l55sxFIbXTc4taMOo6d
	so9Fg+w04noEpIfUNO8VOtm0FstFSPRweVP+oqoEPztOZ+wauoF2hBnaXGSK0TDr4TpgLhWDEiVAT
	PuSYxuakXVEtEFQx2YrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwO0-004AbV-1E; Thu, 29 Sep 2022 16:27:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwNw-004AXy-F3
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 16:27:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 853F561AB8;
	Thu, 29 Sep 2022 16:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD83C433C1;
	Thu, 29 Sep 2022 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664468858;
	bh=zcRIiDMZOhjLCgp1CslgmZqWSDLMvCCHimAqZwZ4VWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naV80iJNZfqdUu1/Hrsqf7xBYeQcjycv6V3g8u91Cg/TXVulheKC9ZOmA+m1cslRa
	 5C14/QlYOpBFmSDne8VmjCgiYlktA75OyW3/DzCIAIbWBbSIhYmp1LmGecTJhpJtfO
	 +mq5hRbn18RKxPfYeqYJrMMEOjVzPdYufviuvneJseF3RR8oHI+HuyLWFvMQb1eDbY
	 6TklMRbAVDLn2FrgSM1a4V+ltW/qX6LmDN2YGARxPHsz0i8xjqNOewnzNlAi+PiCPt
	 rAVYoHq8BbIZ0o6ik9uYfFEH+cOoGjEPE43B/ilHpyPtbWvsgM2caVY9eOZxtTgMeQ
	 OQ4yzrGeE4OeQ==
Date: Fri, 30 Sep 2022 00:18:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/4] riscv: fix race when vmap stack overflow and
 remove shadow_stack
Message-ID: <YzXFQeyktIK5IQ7C@xhacker>
References: <20220928162007.3791-1-jszhang@kernel.org>
 <20220928162007.3791-4-jszhang@kernel.org>
 <YzR8OUFuV+R1i1Y6@xhacker>
 <CAJF2gTSaCGeMG06xrRxjkk2UnjqcgrRTwdch9Ug_TyH-9LsP4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSaCGeMG06xrRxjkk2UnjqcgrRTwdch9Ug_TyH-9LsP4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_092741_134449_4C92E4FD 
X-CRM114-Status: GOOD (  34.59  )
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

On Thu, Sep 29, 2022 at 01:54:25PM +0800, Guo Ren wrote:
> On Thu, Sep 29, 2022 at 1:03 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > On Thu, Sep 29, 2022 at 12:20:06AM +0800, Jisheng Zhang wrote:
> > > Currently, when detecting vmap stack overflow, riscv firstly switches
> > > to the so called shadow stack, then use this shadow stack to call the
> > > get_overflow_stack() to get the overflow stack. However, there's
> > > a race here if two or more harts use the same shadow stack at the same
> > > time.
> > >
> > > To solve this race, we rely on two facts:
> > > 1. the content of kernel thread pointer I.E "tp" register can still
> > > be gotten from the the CSR_SCRATCH register, thus we can clobber tp
> > > under the condtion that we restore tp from CSR_SCRATCH later.
> > >
> > > 2. Once vmap stack overflow happen, panic is comming soon, no
> > > performance concern at all, so we don't need to define the overflow
> > > stack as percpu var, we can simplify it into a pointer array which
> > > points to allocated pages.
> > >
> > > Thus we can use tp as a tmp register to get the cpu id to calculate
> > > the offset of overflow stack pointer array for each cpu w/o shadow
> > > stack any more. Thus the race condition is removed as a side effect.
> > >
> > > NOTE: we can use similar mechanism to let each cpu use different shadow
> > > stack to fix the race codition, but if we can remove shadow stack usage
> > > totally, why not.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> > > ---
> > >  arch/riscv/include/asm/asm-prototypes.h |  1 -
> > >  arch/riscv/include/asm/thread_info.h    |  4 +-
> > >  arch/riscv/kernel/asm-offsets.c         |  1 +
> > >  arch/riscv/kernel/entry.S               | 56 ++++---------------------
> > >  arch/riscv/kernel/traps.c               | 31 ++++++++------
> > >  5 files changed, 29 insertions(+), 64 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> > > index ef386fcf3939..4a06fa0f6493 100644
> > > --- a/arch/riscv/include/asm/asm-prototypes.h
> > > +++ b/arch/riscv/include/asm/asm-prototypes.h
> > > @@ -25,7 +25,6 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> > >  DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> > >  DECLARE_DO_ERROR_INFO(do_trap_break);
> > >
> > > -asmlinkage unsigned long get_overflow_stack(void);
> > >  asmlinkage void handle_bad_stack(struct pt_regs *regs);
> > >
> > >  #endif /* _ASM_RISCV_PROTOTYPES_H */
> > > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > > index c970d41dc4c6..c604a5212a73 100644
> > > --- a/arch/riscv/include/asm/thread_info.h
> > > +++ b/arch/riscv/include/asm/thread_info.h
> > > @@ -28,14 +28,12 @@
> > >
> > >  #define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
> > >  #define OVERFLOW_STACK_SIZE     SZ_4K
> > > -#define SHADOW_OVERFLOW_STACK_SIZE (1024)
> > > +#define OVERFLOW_STACK_SHIFT 12
> >
> > oops, this should be removed, will update it in a newer version after
> > collecting review comments.
> >
> > >
> > >  #define IRQ_STACK_SIZE               THREAD_SIZE
> > >
> > >  #ifndef __ASSEMBLY__
> > >
> > > -extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
> > > -
> > >  #include <asm/processor.h>
> > >  #include <asm/csr.h>
> > >
> > > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> > > index df9444397908..62bf3bacc322 100644
> > > --- a/arch/riscv/kernel/asm-offsets.c
> > > +++ b/arch/riscv/kernel/asm-offsets.c
> > > @@ -37,6 +37,7 @@ void asm_offsets(void)
> > >       OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
> > >       OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> > >       OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> > > +     OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> > >
> > >       OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> > >       OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
> > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > index a3e1ed2fa2ac..5a6171a90d81 100644
> > > --- a/arch/riscv/kernel/entry.S
> > > +++ b/arch/riscv/kernel/entry.S
> > > @@ -223,54 +223,16 @@ END(ret_from_exception)
> > >
> > >  #ifdef CONFIG_VMAP_STACK
> > >  ENTRY(handle_kernel_stack_overflow)
> > > -     la sp, shadow_stack
> > > -     addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
> > > -
> > > -     //save caller register to shadow stack
> > > -     addi sp, sp, -(PT_SIZE_ON_STACK)
> > > -     REG_S x1,  PT_RA(sp)
> > > -     REG_S x5,  PT_T0(sp)
> > > -     REG_S x6,  PT_T1(sp)
> > > -     REG_S x7,  PT_T2(sp)
> > > -     REG_S x10, PT_A0(sp)
> > > -     REG_S x11, PT_A1(sp)
> > > -     REG_S x12, PT_A2(sp)
> > > -     REG_S x13, PT_A3(sp)
> > > -     REG_S x14, PT_A4(sp)
> > > -     REG_S x15, PT_A5(sp)
> > > -     REG_S x16, PT_A6(sp)
> > > -     REG_S x17, PT_A7(sp)
> > > -     REG_S x28, PT_T3(sp)
> > > -     REG_S x29, PT_T4(sp)
> > > -     REG_S x30, PT_T5(sp)
> > > -     REG_S x31, PT_T6(sp)
> > > -
> > > -     la ra, restore_caller_reg
> > > -     tail get_overflow_stack
> > > -
> > > -restore_caller_reg:
> > > -     //save per-cpu overflow stack
> > > -     REG_S a0, -8(sp)
> > > -     //restore caller register from shadow_stack
> > > -     REG_L x1,  PT_RA(sp)
> > > -     REG_L x5,  PT_T0(sp)
> > > -     REG_L x6,  PT_T1(sp)
> > > -     REG_L x7,  PT_T2(sp)
> > > -     REG_L x10, PT_A0(sp)
> > > -     REG_L x11, PT_A1(sp)
> > > -     REG_L x12, PT_A2(sp)
> > > -     REG_L x13, PT_A3(sp)
> > > -     REG_L x14, PT_A4(sp)
> > > -     REG_L x15, PT_A5(sp)
> > > -     REG_L x16, PT_A6(sp)
> > > -     REG_L x17, PT_A7(sp)
> > > -     REG_L x28, PT_T3(sp)
> > > -     REG_L x29, PT_T4(sp)
> > > -     REG_L x30, PT_T5(sp)
> > > -     REG_L x31, PT_T6(sp)
> > > +     la sp, overflow_stack
> > > +     /* use tp as tmp register since we can restore it from CSR_SCRATCH */
> > > +     REG_L tp, TASK_TI_CPU(tp)
> > > +     slli tp, tp, RISCV_LGPTR
> > > +     add tp, sp, tp
> > > +     REG_L sp, 0(tp)
> > > +
> > > +     /* restore tp */
> > > +     csrr tp, CSR_SCRATCH
> > >
> > > -     //load per-cpu overflow stack
> > > -     REG_L sp, -8(sp)
> > >       addi sp, sp, -(PT_SIZE_ON_STACK)
> > >
> > >       //save context to overflow stack
> > > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > > index 73f06cd149d9..b6c64f0fb70f 100644
> > > --- a/arch/riscv/kernel/traps.c
> > > +++ b/arch/riscv/kernel/traps.c
> > > @@ -216,23 +216,12 @@ int is_valid_bugaddr(unsigned long pc)
> > >  #endif /* CONFIG_GENERIC_BUG */
> > >
> > >  #ifdef CONFIG_VMAP_STACK
> > > -static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
> > > -             overflow_stack)__aligned(16);
> > > -/*
> > > - * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> > > - * to get per-cpu overflow stack(get_overflow_stack).
> > > - */
> > > -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> > > -asmlinkage unsigned long get_overflow_stack(void)
> > > -{
> > > -     return (unsigned long)this_cpu_ptr(overflow_stack) +
> > > -             OVERFLOW_STACK_SIZE;
> > > -}
> > > +void *overflow_stack[NR_CPUS] __ro_after_init __aligned(16);
> Er... We've talked NR_CPUS = 8192, even a pointer would cause 64KB wasted.
> 
> I prefer the previous solution with a atomic flag.

Hi guo,

I see your opinions. Here are my comments:

Now the range of riscv's NR_CPUS is 2~32, given I have removed the 1KB
shadow stack, so this patch saves 768Bytes or more rather than wastes
memory. No mention that I also removed the shadow stack save and
restore code.

From another side, we didn't see such riscv system with huge(8192) CPU
numbers. Even if we do have such system in the future, I belive such
system should be powered by lots of memory, 64KB is trivial comapred
with GBs or TBs memory size.

Given the simplicity of my solution, I still prefer my solution. What
do you think?

Thanks
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 5cbd6684ef52..42a3b14a20ab 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -223,6 +223,9 @@ END(ret_from_exception)
> 
>  #ifdef CONFIG_VMAP_STACK
>  ENTRY(handle_kernel_stack_overflow)
> +1:     la sp, spin_ shadow_stack
> +       amoswap.w sp, sp, (sp)
> +       bnez sp, 1b
>         la sp, shadow_stack
>         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 73f06cd149d9..9058a05cac53 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -229,11 +229,15 @@ asmlinkage unsigned long get_overflow_stack(void)
>                 OVERFLOW_STACK_SIZE;
>  }
> 
> +atomic_t spin_ shadow_stack __section(".sdata");
> +
>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
>  {
>         unsigned long tsk_stk = (unsigned long)current->stack;
>         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
> 
> +       atomic_set_release(spin_ shadow_stack, 0);
> +
>         console_verbose();
> 
>         pr_emerg("Insufficient stack space to handle exception!\n");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
