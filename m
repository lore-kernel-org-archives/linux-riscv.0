Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5DEC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 06:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ru3vyvoArwnGDf2dgASlRyjeyAR+Tl4PGbx5yVNsa7k=; b=cccnwRyAHYu9eo
	unblGL5IW3pV3/Zg+n5biVcj9r/vNr/TpIRTR+vJDHnQzAc77gkucIKswfmD1lGmIYF9JPiBvpa99
	GjkZaGSudJq6nhKJz+/jBIbeYYqxNmilqx99FOPJEItLLrAp85bLNJGL/XZ1Kpl7c13p8RM5s3byl
	oGTI4CBKOdsC6R1mqQdInpd7s1PEwMIaj1qXe79p2eezf03xT2GQc3jLTet4Wu0M5f6yfEXVMQGf2
	Hyv5ySIVOa8ykrEYDuPetpUwKheEVi/5BzZvht/U7jMykYwNv9/QNQXHHnucpvN6i7SGmAZMhHz7D
	hYRFSAmromdPGUT8hORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWsG-0012Tb-BV; Tue, 20 Sep 2022 06:36:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaWsC-0012Rb-N1
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 06:36:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35BC0623F9
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 06:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E7EC4314A
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 06:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663655806;
	bh=UasumqK8JDy4QUm3XOKDPKXpUz8MeHWEZlWpEge7SHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IeT0Ow0e2gryqHF+YZVhz5RDYHB+9l7X0sWxU4OdZ7kVADENteCdIKKy8BgnyDs+g
	 aX98x7IBRoo21LQ3YvCERTFpt2YhZxQRGozW1cMEJTcr3n7deMKW9gvXgNFaU0LBNK
	 VBDFyN+SMs91kM2qpUgFawzOBTibAgIHgio83adRp67LXn+tEB/6HhwWaTne0YsUn+
	 SvyNHbYDkZyJr+Xmg0kZ+/H4SNO+/dzpCIPgpOyLWcJmTbJGuzUvKUiUJNGp+yMODB
	 4PI/UDtE1UvhtdaoPSIYRk0lpzXhlKwwFHZWBSI06BC7EVePaPZsiJt0bCzZsBBMXu
	 Oo/s0hwlUESoQ==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-12b542cb1d3so2781535fac.13
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 23:36:46 -0700 (PDT)
X-Gm-Message-State: ACrzQf2GpvFfkiylgh2wem/2YJe/N3mzGzsSCZHM63RJbJsdMXwNWPUL
	XLSIW6SRCOTKEhDXYWs97xBq17Wb6V5LmWvrD7o=
X-Google-Smtp-Source: AMsMyM6uHFgQjuLTZDoq4Wi16bBED+ipq/0qPmivsB6oIlMREURn4RpqQ/Co7zUtuew7caXA1KRyrH6dB1OH9wPOjsU=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr1178610oao.112.1663655805409; Mon, 19
 Sep 2022 23:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-8-guoren@kernel.org>
 <Yyhv4UUXuSfvMOw+@hirez.programming.kicks-ass.net>
In-Reply-To: <Yyhv4UUXuSfvMOw+@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Sep 2022 14:36:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRdkmemEWsDYhVXb8KD0PS6b1VAPu_MfeZ+Rmf2qEGa6Q@mail.gmail.com>
Message-ID: <CAJF2gTRdkmemEWsDYhVXb8KD0PS6b1VAPu_MfeZ+Rmf2qEGa6Q@mail.gmail.com>
Subject: Re: [PATCH V5 07/11] riscv: convert to generic entry
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, mark.rutland@arm.com, zouyipeng@huawei.com, 
	bigeasy@linutronix.de, David.Laight@aculab.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_233648_838286_2FB2EA8E 
X-CRM114-Status: GOOD (  17.65  )
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

On Mon, Sep 19, 2022 at 9:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, Sep 18, 2022 at 11:52:42AM -0400, guoren@kernel.org wrote:
>
> > @@ -123,18 +126,22 @@ int handle_misaligned_store(struct pt_regs *regs);
> >
> >  asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
> >  {
> > +     irqentry_state_t state = irqentry_enter(regs);
> >       if (!handle_misaligned_load(regs))
> >               return;
> >       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
> >                     "Oops - load address misaligned");
> > +     irqentry_exit(regs, state);
> >  }
> >
> >  asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
> >  {
> > +     irqentry_state_t state = irqentry_enter(regs);
> >       if (!handle_misaligned_store(regs))
> >               return;
> >       do_trap_error(regs, SIGBUS, BUS_ADRALN, regs->epc,
> >                     "Oops - store (or AMO) address misaligned");
> > +     irqentry_exit(regs, state);
> >  }
> >  #endif
> >  DO_ERROR_INFO(do_trap_store_fault,
> > @@ -158,6 +165,8 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
> >
> >  asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
> >  {
> > +     irqentry_state_t state = irqentry_enter(regs);
> > +
> >  #ifdef CONFIG_KPROBES
> >       if (kprobe_single_step_handler(regs))
> >               return;
>
> FWIW; on x86 I've classified many of the 'from-kernel' traps as
> NMI-like, since those traps can happen from any context, including with
> IRQs disabled.
The do_trap_break is for ebreak instruction, not NMI. RISC-V NMI has
separate CSR. ref:

This proposal adds support for resumable non-maskable interrupts
(RNMIs) to RISC-V. The extension adds four new CSRs (`mnepc`,
`mncause`, `mnstatus`, and `mnscratch`) to hold the interrupted state,
and a new instruction to resume from the RNMI handler.

>
> The basic shape of the trap handlers looks a little like:
>
>         if (user_mode(regs)) {
If nmi comes from user_mode, why we using
irqenrty_enter/exit_from/to_user_mode instead of
irqentry_nmi_enter/exit?

>                 irqenrty_enter_from_user_mode(regs);
>                 do_user_trap();
>                 irqentry_exit_to_user_mode(regs);
>         } else {
>                 irqentry_state_t state = irqentry_nmi_enter(regs);
>                 do_kernel_trap();
>                 irqentry_nmi_exit(regs, state);
>         }
>
> Not saying you have to match Risc-V in this patch-set, just something to
> consider.
I think the shape of the riscv NMI handler looks a little like this:

asmlinkage __visible __trap_section void do_trap_nmi(struct pt_regs *regs)
{
                 irqentry_state_t state = irqentry_nmi_enter(regs);
                 do_nmi_trap();
                 irqentry_nmi_exit(regs, state);
}

-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
