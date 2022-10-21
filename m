Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72857C43219
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oOi/0L05UJzeILqaMNAth9PCz2CVQoMWF87KNr5QH8=; b=pQ3JC1qMpAaaH7
	YqdK0tXvY/v5B48Rn5J+Ydl+49bI68bNwuTYY/SULxSjkxaKgzwX0U8yLVvHVcS9MXat2zUPsEI/Y
	MkOA081y79oy3s67CmMP293eXV7EhhtL8fPWwzzbFyprUkdH0Gh/GdzpIIjS1wTQG/DtRCtf4Q2Au
	mLLdcbklHVi/NotJboTSmaBBrDb6X0cUTn3LzmfilyWtamGCgn/yvxOoGWxNS8x5t6/ta2OeTqKXR
	V6+Hv54ojc2ZEw9v+W3yOHsSk+gkcvbCjryQWCARUcQrkJDee8aPGeu7IHINp2pvkfv3Esr2MwDbK
	j047RH5jwcvi29j2sO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgZg-003PcC-Da; Fri, 21 Oct 2022 01:11:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgZd-003PZw-7R
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 01:11:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 43F80CE2844
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 01:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7ACC4314D
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 01:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666314696;
	bh=zj2R2EeuAoIlK9K+n2SHRBjvUH7ZW6esdrFQXcc7cGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W+nbWPleYa3gGCafB/dPPTJTwwZRQ3Rgaw5ZF/e6QxmEIds6cP1O1m0xnfrc7DSci
	 fjv8Ipun4cosyte1N1OZ/BMAEk1vgbuEK8RLnVkb71T61XXKShcqveIL+YXOkg/C85
	 M9ySX+e2CBsdX3XGyvROfCBgHrNWNWzPxu28q94lr1YyxtC0kmo0coWNGyCE9ZIYIN
	 dXi6GyUjf5ec+yIB2eOFt8RJQLNuYG8x69PnJ+3Ov1LV07+4+snLF2a5KfjokKW903
	 Wz6GaViL3ywcOSvu1goZiaMHYgN7ZohLhjGH1sObFFzZfrg5kzW/EG1gYfBhCAkb8c
	 xuY1C1mF7mydw==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso1736163fac.6
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 18:11:36 -0700 (PDT)
X-Gm-Message-State: ACrzQf2TBs8jXeSfDCxIyHE4Qfj2L9EeWmOTdMDSHXfXeOpPKiDI3gRv
	GJUikRJwlWKCYPivqiw6q/rTt+kZJhYrUoZFqYM=
X-Google-Smtp-Source: AMsMyM41rqetlYAfk04Uk64NiYfIAaeUDKaVUvjDO2wwlkmVIwyeXpVrBv3cP7g7+Gx+G9zIXVmNjKz3tu3FLRIlkqk=
X-Received: by 2002:a05:6871:b0d:b0:13b:b91:dc94 with SMTP id
 fq13-20020a0568710b0d00b0013b0b91dc94mr2649194oab.112.1666314695632; Thu, 20
 Oct 2022 18:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221019154727.2395-1-jszhang@kernel.org> <Y1HZFcBo21SQzXVj@andrea>
In-Reply-To: <Y1HZFcBo21SQzXVj@andrea>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Oct 2022 09:11:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
Message-ID: <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_181145_666685_D77873FB 
X-CRM114-Status: GOOD (  21.87  )
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

On Fri, Oct 21, 2022 at 7:26 AM Andrea Parri <parri.andrea@gmail.com> wrote:
>
> Hi Jisheng,
>
> On Wed, Oct 19, 2022 at 11:47:27PM +0800, Jisheng Zhang wrote:
> > Currently, when detecting vmap stack overflow, riscv firstly switches
> > to the so called shadow stack, then use this shadow stack to call the
> > get_overflow_stack() to get the overflow stack. However, there's
> > a race here if two or more harts use the same shadow stack at the same
> > time.
> >
> > To solve this race, we introduce spin_shadow_stack atomic var, which
> > will make the shadow stack usage serialized.
> >
> > Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Suggested-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/kernel/entry.S | 4 ++++
> >  arch/riscv/kernel/traps.c | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index b9eda3fcbd6d..7b924b16792b 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
> >
> >  #ifdef CONFIG_VMAP_STACK
> >  handle_kernel_stack_overflow:
> > +1:   la sp, spin_shadow_stack
> > +     amoswap.w sp, sp, (sp)
> > +     bnez sp, 1b
> > +
> >       la sp, shadow_stack
> >       addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
> >
> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > index f3e96d60a2ff..88a54947dffb 100644
> > --- a/arch/riscv/kernel/traps.c
> > +++ b/arch/riscv/kernel/traps.c
> > @@ -221,11 +221,15 @@ asmlinkage unsigned long get_overflow_stack(void)
> >               OVERFLOW_STACK_SIZE;
> >  }
> >
> > +atomic_t spin_shadow_stack;
> > +
> >  asmlinkage void handle_bad_stack(struct pt_regs *regs)
> >  {
> >       unsigned long tsk_stk = (unsigned long)current->stack;
> >       unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
> >
> > +     atomic_set_release(&spin_shadow_stack, 0);
> > +
>
> Have not really looked the details: should there be a matching acquire?

I use atomic_set_release here, because I need earlier memory
operations finished to make sure the sp is ready then set the spin
flag.

The following memory operations order is not important, because we
just care about sp value.

Also, we use relax amoswap before, because sp has naturelly
dependency. But giving them RCsc is okay here, because we don't care
about performance here.
eg:
 handle_kernel_stack_overflow:
+1:     la sp, spin_shadow_stack
+       amoswap.w.aqrl sp, sp, (sp)
+       bnez sp, 1b
+
....
+     smp_store_release(&spin_shadow_stack, 0);
+     smp_mb();

>
>   Andrea
>
>
> >       console_verbose();
> >
> >       pr_emerg("Insufficient stack space to handle exception!\n");
> > --
> > 2.37.2
> >



--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
