Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6038FC352A1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 01:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJ3sRErapZ/k1loEJCyLyHxQZxmtQOBEjgr0OPmmtkY=; b=QqF0eA945hPk8g
	f/6Rpu1uYTzjuz8GgyRP1jX0nkaXvnkG+HwS11ccfNeuxkE0kVPpyVoiotw64d7UXI0ivVnbr6xJk
	1ee8AMQllhQFhaCJqb+i1KYpKSrhoDwe/5CZKqciPGFAOVRALVOlBVfKdCEdQA23e9pAUSYK5U0VB
	tevtBdlQYgN258bdFAG4lzaBwiR/qzWDVXSI5QuRahE1dpvtO7Ja7vc0/gUQdZoG9BatcnIT5hRLj
	fIn+JXxYUCem4yKoXJpTn0GH6Eiw11w4fWpc0XMJD165R2r992Ht+pDZ1Dqf9+ca7I3vHFbZ0SxdV
	W1EorIb7uGgdXJhBxcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YCf-003lJF-4J; Thu, 01 Dec 2022 01:17:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YCb-003lID-As
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 01:17:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1601B81DA0
	for <linux-riscv@lists.infradead.org>; Thu,  1 Dec 2022 01:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0A6C433B5
	for <linux-riscv@lists.infradead.org>; Thu,  1 Dec 2022 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669857442;
	bh=myVISEgQPICcTtw6geOyGVidGo/WDYOXviUTQMLOP4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cXNoJu2IJJDpi/bwzWorZpPEtXSV8+OWvz6fjFv3yMg5eVPYZYSNK34kFuF0Fd6t9
	 f3hM74tktNh2XbjyxnFF6h6bNbFtmmvxvcxZ8DYri50ThnNct1wO1WO4Md36UfpMJN
	 /NdIM4oFeIK5xWwewozQNt3uTLsXCPsAI2UddA/MquvwmcCK2ntr8uxkiGXDKh+AA1
	 0Hu/vf1AJ8fDBXOzQEF7MzoZxEhDroSdJ32rcsDIh8ckTE9GtU/WvMI1FQEb5bFVpv
	 3GP8yVH5+LRjUXr70BK29S+eYdTakjMFeNiGdsgrPtTwprNhTCDLIqvVWNM2x+mmQy
	 KuItm3QwO+pdw==
Received: by mail-ed1-f52.google.com with SMTP id b8so372063edf.11
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 17:17:21 -0800 (PST)
X-Gm-Message-State: ANoB5pm0CMeaxTv8E8+2qHzNqIXa0EleDvMZtb4UX5HM5GHx15UplA1B
	nR+2OEqpIi2Hj+mr4flC6Cx/fXSJYzkzND3LMLU=
X-Google-Smtp-Source: AA0mqf6qW/O6MuNLq8Q3suQDIZ7MTPFUAbg0n/ut2l1kl8azfaMDA47Aj9YIvCarSXlRTn/0Tl1SYUL1HCja5jIvabE=
X-Received: by 2002:aa7:d912:0:b0:46b:2b37:ffa9 with SMTP id
 a18-20020aa7d912000000b0046b2b37ffa9mr15191818edr.79.1669857439770; Wed, 30
 Nov 2022 17:17:19 -0800 (PST)
MIME-Version: 1.0
References: <CAJF2gTQ0xuJo6uzB+8SudZOFiZ2_o1sLB=Hn5XuCw6g2tXUtkQ@mail.gmail.com>
 <mhng-72408cf8-cbde-489b-9042-379b5aa8624f@palmer-ri-x1c9>
In-Reply-To: <mhng-72408cf8-cbde-489b-9042-379b5aa8624f@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Dec 2022 09:17:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ2=Ew76-=93WKAiLJzw+Wp4v7g=yyeeVZ5M5q88YsRLg@mail.gmail.com>
Message-ID: <CAJF2gTQ2=Ew76-=93WKAiLJzw+Wp4v7g=yyeeVZ5M5q88YsRLg@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: fix race when vmap stack overflow
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Andrea Parri <andrea@rivosinc.com>, jszhang@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_171725_693529_8C60CBAE 
X-CRM114-Status: GOOD (  37.75  )
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

On Thu, Dec 1, 2022 at 12:54 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> On Tue, 29 Nov 2022 23:15:40 PST (-0800), guoren@kernel.org wrote:
> > The comment becomes better. Thx.
> >
> > On Wed, Nov 30, 2022 at 10:29 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> >>
> >> From: Jisheng Zhang <jszhang@kernel.org>
> >>
> >> Currently, when detecting vmap stack overflow, riscv firstly switches
> >> to the so called shadow stack, then use this shadow stack to call the
> >> get_overflow_stack() to get the overflow stack. However, there's
> >> a race here if two or more harts use the same shadow stack at the same
> >> time.
> >>
> >> To solve this race, we introduce spin_shadow_stack atomic var, which
> >> will be swap between its own address and 0 in atomic way, when the
> >> var is set, it means the shadow_stack is being used; when the var
> >> is cleared, it means the shadow_stack isn't being used.
> >>
> >> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >> Suggested-by: Guo Ren <guoren@kernel.org>
> >> Reviewed-by: Guo Ren <guoren@kernel.org>
> >> Link: https://lore.kernel.org/r/20221030124517.2370-1-jszhang@kernel.org
> >> [Palmer: Add AQ to the swap, and also some comments.]
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >> ---
> >> Sorry to just re-spin this one without any warning, but I'd read patch a
> >> few times and every time I'd managed to convice myself there was a much
> >> simpler way of doing this.  By the time I'd figured out why that's not
> >> the case it seemed faster to just write the comments.
> >>
> >> I've stashed this, right on top of the offending commit, at
> >> palmer/riscv-fix_vmap_stack.
> >>
> >> Since v3:
> >>  - Add AQ to the swap.
> >>  - Add a bunch of comments.
> >>
> >> Since v2:
> >>  - use REG_AMOSWAP
> >>  - add comment to the purpose of smp_store_release()
> >>
> >> Since v1:
> >>  - use smp_store_release directly
> >>  - use unsigned int instead of atomic_t
> >> ---
> >>  arch/riscv/include/asm/asm.h |  1 +
> >>  arch/riscv/kernel/entry.S    | 13 +++++++++++++
> >>  arch/riscv/kernel/traps.c    | 18 ++++++++++++++++++
> >>  3 files changed, 32 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> >> index 618d7c5af1a2..e15a1c9f1cf8 100644
> >> --- a/arch/riscv/include/asm/asm.h
> >> +++ b/arch/riscv/include/asm/asm.h
> >> @@ -23,6 +23,7 @@
> >>  #define REG_L          __REG_SEL(ld, lw)
> >>  #define REG_S          __REG_SEL(sd, sw)
> >>  #define REG_SC         __REG_SEL(sc.d, sc.w)
> >> +#define REG_AMOSWAP_AQ __REG_SEL(amoswap.d.aq, amoswap.w.aq)
> > Below is the reason why I use the relax version here:
> > https://lore.kernel.org/all/CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com/T/#u
>
> Sorry, I hadn't seen that one.  Adding Andrea.  IMO the acquire/release
> pair is necessary here, with just relaxed the stack stores inside the
> lock could show up on the next hart trying to use the stack.
Don't worry about relaxing amoswap, sp could give WAR & WAW
dependency. You could add acquire here, just for appearance.

>
> >>  #define REG_ASM                __REG_SEL(.dword, .word)
> >>  #define SZREG          __REG_SEL(8, 4)
> >>  #define LGREG          __REG_SEL(3, 2)
> >> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> >> index 98f502654edd..5fdb6ba09600 100644
> >> --- a/arch/riscv/kernel/entry.S
> >> +++ b/arch/riscv/kernel/entry.S
> >> @@ -387,6 +387,19 @@ handle_syscall_trace_exit:
> >>
> >>  #ifdef CONFIG_VMAP_STACK
> >>  handle_kernel_stack_overflow:
> >> +       /*
> >> +        * Takes the psuedo-spinlock for the shadow stack, in case multiple
> >> +        * harts are concurrently overflowing their kernel stacks.  We could
> >> +        * store any value here, but since we're overflowing the kernel stack
> >> +        * already we only have SP to use as a scratch register.  So we just
> >> +        * swap in the address of the spinlock, as that's definately non-zero.
> >> +        *
> >> +        * Pairs with a store_release in handle_bad_stack().
> >> +        */
> >> +1:     la sp, spin_shadow_stack
> >> +       REG_AMOSWAP_AQ sp, sp, (sp)
> >> +       bnez sp, 1b
> >> +
> >>         la sp, shadow_stack
> >>         addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
> >>
> >> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> >> index bb6a450f0ecc..be54ccea8c47 100644
> >> --- a/arch/riscv/kernel/traps.c
> >> +++ b/arch/riscv/kernel/traps.c
> >> @@ -213,11 +213,29 @@ asmlinkage unsigned long get_overflow_stack(void)
> >>                 OVERFLOW_STACK_SIZE;
> >>  }
> >>
> >> +/*
> >> + * A pseudo spinlock to protect the shadow stack from being used by multiple
> >> + * harts concurrently.  This isn't a real spinlock because the lock side must
> >> + * be taken without a valid stack and only a single register, it's only taken
> >> + * while in the process of panicing anyway so the performance and error
> >> + * checking a proper spinlock gives us doesn't matter.
> >> + */
> >> +unsigned long spin_shadow_stack;
> >> +
> >>  asmlinkage void handle_bad_stack(struct pt_regs *regs)
> >>  {
> >>         unsigned long tsk_stk = (unsigned long)current->stack;
> >>         unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
> >>
> >> +       /*
> >> +        * We're done with the shadow stack by this point, as we're on the
> >> +        * overflow stack.  Tell any other concurrent overflowing harts that
> >> +        * they can proceed with panicing by releasing the pseudo-spinlock.
> >> +        *
> >> +        * This pairs with an amoswap.aq in handle_kernel_stack_overflow.
> >> +        */
> >> +       smp_store_release(&spin_shadow_stack, 0);
> >> +
> >>         console_verbose();
> >>
> >>         pr_emerg("Insufficient stack space to handle exception!\n");
> >> --
> >> 2.38.1
> >>



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
