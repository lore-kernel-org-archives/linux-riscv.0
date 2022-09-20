Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF7DECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TUP3xZA04Pnd/Wq7foDJQ9IMjI4p+WoDxdy30NaC14=; b=Jn/uW4fZ2dazPp
	38zrDytL8Rs6K2Jj8um09UZvzyyIRJhujVyjEt3WEH5lPdVnQoQCxzKq9xYXzZmaPcnJB+/lG2X9Y
	DdXg7OkrH68WOWYHeUQTcmsMjvXyK8pr0tOci9uBl8rVvqiXL1DJDMUW7jN0bWpYJwv2XvD5+Zqs+
	Fr7Z/uFYixyN5Q0Ybsmbi9dxcDhjVB+soxBZE7+RErDHU7dy90Ajnog7NxZpXUZo27hdtGdCpuECx
	0d2ipOCnIL/c9ACRujusV/4Sb5tH86tUpumtigYsq0IIbVzwxvOThM2bwEepWaKhdGFoJKMy1Kiiq
	URm9CO38kpXM3DLXLldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaXb0-001KVW-Qh; Tue, 20 Sep 2022 07:23:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaXay-001KUs-Ui
	for linux-riscv@bombadil.infradead.org; Tue, 20 Sep 2022 07:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IKJaeDScRrK+JIC8Gbrvn6nNvLhPVYznUfIuOJ7G4Ds=; b=jhPn6HiiENFLg2SFmJ30AuSqoC
	n0UXjZX8nUjjPdJyhdMc3l6m4xaDuHk2DNFEEJBge5OsdKEDKncMdSqmzUhr63k0lWu0hqsOGgkED
	ItaA2kVSLRXIqMPBgNi60QXOnUkIWgXYDQDCRopZO3MX0wNNG8N2zfzAqVV+KrvlbkPGruxgRAOgH
	rvyr6aWBhnZhv7BbcxKvZa8Cwb/G6lb/9b6hsbO3oDm4uhEINaQgRhsr8Lhos76pNowo9NwzsBwHo
	kAaPYLs3ryTqyBUEYz8Gdu/JdYKNf12aWamFnyRf/8IiNLJsmGxa0RpdoYbVI8ld2gW+0cXYXrQlz
	JaNsv+hA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaXaq-005LcW-AU; Tue, 20 Sep 2022 07:22:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C7061300074;
	Tue, 20 Sep 2022 09:22:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C25E2BAC8466; Tue, 20 Sep 2022 09:22:50 +0200 (CEST)
Date: Tue, 20 Sep 2022 09:22:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, mark.rutland@arm.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 07/11] riscv: convert to generic entry
Message-ID: <YylqSsL6bdhIOMte@hirez.programming.kicks-ass.net>
References: <20220918155246.1203293-1-guoren@kernel.org>
 <20220918155246.1203293-8-guoren@kernel.org>
 <Yyhv4UUXuSfvMOw+@hirez.programming.kicks-ass.net>
 <CAJF2gTRdkmemEWsDYhVXb8KD0PS6b1VAPu_MfeZ+Rmf2qEGa6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRdkmemEWsDYhVXb8KD0PS6b1VAPu_MfeZ+Rmf2qEGa6Q@mail.gmail.com>
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

On Tue, Sep 20, 2022 at 02:36:33PM +0800, Guo Ren wrote:
> On Mon, Sep 19, 2022 at 9:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Sun, Sep 18, 2022 at 11:52:42AM -0400, guoren@kernel.org wrote:
> >
> > > @@ -123,18 +126,22 @@ int handle_misaligned_store(struct pt_regs *regs);
> > >
> > >  asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
> > >  {
> > > +     irqentry_state_t state = irqentry_enter(regs);
> > >       if (!handle_misaligned_load(regs))
> > >               return;
> > >       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
> > >                     "Oops - load address misaligned");
> > > +     irqentry_exit(regs, state);
> > >  }
> > >
> > >  asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
> > >  {
> > > +     irqentry_state_t state = irqentry_enter(regs);
> > >       if (!handle_misaligned_store(regs))
> > >               return;
> > >       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
> > >                     "Oops - store (or AMO) address misaligned");
> > > +     irqentry_exit(regs, state);
> > >  }
> > >  #endif
> > >  DO_ERROR_INFO(do_trap_store_fault,
> > > @@ -158,6 +165,8 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
> > >
> > >  asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
> > >  {
> > > +     irqentry_state_t state = irqentry_enter(regs);
> > > +
> > >  #ifdef CONFIG_KPROBES
> > >       if (kprobe_single_step_handler(regs))
> > >               return;
> >
> > FWIW; on x86 I've classified many of the 'from-kernel' traps as
> > NMI-like, since those traps can happen from any context, including with
> > IRQs disabled.
> The do_trap_break is for ebreak instruction, not NMI. RISC-V NMI has
> separate CSR. ref:
> 
> This proposal adds support for resumable non-maskable interrupts
> (RNMIs) to RISC-V. The extension adds four new CSRs (`mnepc`,
> `mncause`, `mnstatus`, and `mnscratch`) to hold the interrupted state,
> and a new instruction to resume from the RNMI handler.

Yes, but that's not what I'm saying. I'm saying I've classified
'from-kernel' traps as NMI-like.

Consider:

	raw_spin_lock_irq(&foo);
	...
	<trap>

Then you want the trap to behave as if it were an NMI; that is abide by
the rules of NMI (strictly wait-free code).

So yes, they are not NMI, but they nest just like it, so we want the
handlers to abide by the same rules.

Does that make sense?

> >
> > The basic shape of the trap handlers looks a little like:
> >
> >         if (user_mode(regs)) {
> If nmi comes from user_mode, why we using
> irqenrty_enter/exit_from/to_user_mode instead of
> irqentry_nmi_enter/exit?

s/nmi/trap/ because the 'from-user' trap never nests inside kernel code.

Additionally, many 'from-user' traps want to do 'silly' things like send
signals, which is something that requires scheduling.

They're fundamentally different from 'from-kernel' traps, which per the
above, nest most dangerously.

> >                 irqenrty_enter_from_user_mode(regs);
> >                 do_user_trap();
> >                 irqentry_exit_to_user_mode(regs);
> >         } else {
> >                 irqentry_state_t state = irqentry_nmi_enter(regs);
> >                 do_kernel_trap();
> >                 irqentry_nmi_exit(regs, state);
> >         }
> >
> > Not saying you have to match Risc-V in this patch-set, just something to
> > consider.
> I think the shape of the riscv NMI handler looks a little like this:
> 
> asmlinkage __visible __trap_section void do_trap_nmi(struct pt_regs *regs)
> {
>                  irqentry_state_t state = irqentry_nmi_enter(regs);
>                  do_nmi_trap();
>                  irqentry_nmi_exit(regs, state);
> }

That is correct for the NMI handler; but here I'm specifically talking
about traps, like the unalign trap, break trap etc. Those that can
happen *anywhere* in kernel code and nest most unfortunate.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
