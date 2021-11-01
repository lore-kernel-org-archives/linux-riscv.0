Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E524AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 03:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A538F6008E
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 03:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A538F6008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUMjOUXAZuUeCFleVVn719gjKnmrDncZMENQNyGsKOA=; b=eaOaGI3s5LRns0
	SFnljpJOUtHXUBystF99eNC07V6hIa73JZhyGeNn++YPSIFLUufh/hK0Q/D0+u45So3iKsXbvFBEx
	5Qf0XQcx3J1PwrF3Rr4Pz/EPSIsKDHT+iBNGpYyZ9skw1Rld/BwUBa32twSYHh9RHv608UMYxahUj
	TjhrQbcEcZBGm0vDLqKiuuMxhRrOdLSGSbGWA2YZxlDVXv+aU0B/AI6udWpMpgqW3KmQG2KZ+17jY
	IRAdc3K9NGe06WBI5GKlB9Bm5Hz87oqHC5VseEgDsYXC1AOyX7CTb26d/i4fa0N8mXdUZHBL9FLFB
	hyplL/OijheOMCXCC/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhORk-00FD3Y-4Y; Mon, 01 Nov 2021 03:57:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhORh-00FD1O-7b
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 03:57:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86FCD60FD7
 for <linux-riscv@lists.infradead.org>; Mon,  1 Nov 2021 03:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635739036;
 bh=vD2UwyFwto5xDJ9vPKkwhKHRlIVNNpiJGv601mTK2HE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VzY99RTkpK+PizdpfPHAaJVY0pb1jsCUngE9ibwZkJTJjnudjjoNI30yGpHXt248Z
 VYSmOVgC4T5TNbGCi5kezcwGHHMuD2gPvNjb2w/owqTYalzSPr3D0Iu4mYyJ2A/CK0
 nXGW8L79YGK3sv/kABOyRPMHfxMjRupRMaW9jNI+6XOs8QP4MwweTrGRfQuf26y/Hx
 ACGkxrDZjlXTmu3E/E25NWWcveivmIRCJbrTbHmLEtD9e50i067s566FqwXau0DqSn
 qAKfn2/ejHd67TuIb5TbEefoJ2Oo2lApMyzoWgEbgJ201wBEhH3CaH4wvBlBvUw0vb
 iuujIHIW1DdaA==
Received: by mail-ua1-f43.google.com with SMTP id e10so29607952uab.3
 for <linux-riscv@lists.infradead.org>; Sun, 31 Oct 2021 20:57:16 -0700 (PDT)
X-Gm-Message-State: AOAM530VL18F8fUdabb4Dy7GpSiJKhcrBVWOelj85LV6NEXBj8gzdjOx
 p0GhcDpXTyvg8BNDW3WcFBCcCSC8+Wa5WEljyFQ=
X-Google-Smtp-Source: ABdhPJx8E7EdmetQcQl5APDfBsF8mc6npSChcKidJD53qVVguiTWfZJuI8UMnitBPa9GO1psM2bV7CPNlt9LUuZtf9E=
X-Received: by 2002:a67:fa93:: with SMTP id f19mr26879699vsq.43.1635739035567; 
 Sun, 31 Oct 2021 20:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-4-guoren@kernel.org>
 <87a6ixbcse.wl-maz@kernel.org>
 <20211028135523.5cf4b66b@redslave.neermore.group>
 <87sfwl9oxg.wl-maz@kernel.org>
 <CAJF2gTR3CqtmKZKS3fOQ9mzSLn7_oh7YoSSmWP1YM=ujB_srMw@mail.gmail.com>
 <CAAhSdy1WrxbMsiWkwOXd_76A6wNAh05C1QQ-oFXoE9U-F0akiA@mail.gmail.com>
In-Reply-To: <CAAhSdy1WrxbMsiWkwOXd_76A6wNAh05C1QQ-oFXoE9U-F0akiA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Nov 2021 11:57:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRwi+yH-hQ0SHKDOuUf=OOMfJxQb6Q5m6xRCPjvbYjqaQ@mail.gmail.com>
Message-ID: <CAJF2gTRwi+yH-hQ0SHKDOuUf=OOMfJxQb6Q5m6xRCPjvbYjqaQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] irqchip/sifive-plic: Fixup thead, c900-plic
 request_threaded_irq with ONESHOT
To: Anup Patel <anup@brainfault.org>
Cc: Marc Zyngier <maz@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_205717_337334_2C41FB76 
X-CRM114-Status: GOOD (  44.68  )
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

On Mon, Nov 1, 2021 at 10:53 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Nov 1, 2021 at 7:50 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Thu, Oct 28, 2021 at 10:58 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Thu, 28 Oct 2021 11:55:23 +0100,
> > > Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> > > >
> > > > Hello Marc and Guo Ren!
> > > >
> > > > On Mon, 25 Oct 2021 11:48:33 +0100
> > > > Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > > On Sun, 24 Oct 2021 02:33:03 +0100,
> > > > > guoren@kernel.org wrote:
> > > > > >
> > > > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > > >
> > > > > > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the
> > > > > > driver, only the first interrupt could be handled, and continue irq
> > > > > > is blocked by hw. Because the thead,c900-plic couldn't complete
> > > > > > masked irq source which has been disabled in enable register. Add
> > > > > > thead_plic_chip which fix up c906-plic irq source completion
> > > > > > problem by unmask/mask wrapper.
> > > > > >
> > > > > > Here is the description of Interrupt Completion in PLIC spec [1]:
> > > > > >
> > > > > > The PLIC signals it has completed executing an interrupt handler by
> > > > > > writing the interrupt ID it received from the claim to the
> > > > > > claim/complete register. The PLIC does not check whether the
> > > > > > completion ID is the same as the last claim ID for that target. If
> > > > > > the completion ID does not match an interrupt source that is
> > > > > > currently enabled for the target, the ^^ ^^^^^^^^^ ^^^^^^^
> > > > > > completion is silently ignored.
> > > > >
> > > > > Given this bit of the spec...
> > > > >
> > > > > > +static void plic_thead_irq_eoi(struct irq_data *d)
> > > > > > +{
> > > > > > + struct plic_handler *handler =
> > > > > > this_cpu_ptr(&plic_handlers); +
> > > > > > + if (irqd_irq_masked(d)) {
> > > > > > +         plic_irq_unmask(d);
> > > > > > +         writel(d->hwirq, handler->hart_base +
> > > > > > CONTEXT_CLAIM);
> > > > > > +         plic_irq_mask(d);
> > > > > > + } else {
> > > > > > +         writel(d->hwirq, handler->hart_base +
> > > > > > CONTEXT_CLAIM);
> > > > > > + }
> > > > > > +}
> > > > > > +
> > > > >
> > > > > ... it isn't obvious to me why this cannot happen on an SiFive PLIC.
> > > >
> > > > This indeed happens with SiFive PLIC. I am currently tinkering with
> > > > da9063 RTC on SiFive Unmatched, and ALARM irq fires only once. However
> > > > with changes proposed by Guo Ren in plic_thead_irq_eoi, everything
> > > > begins to work fine.
> > > >
> > > > May be these change should be propagated to plic_irq_eoi instead of
> > > > making a new function ?
> > >
> > > That's my impression too. I think the T-Head defect is pretty much
> > > immaterial when you consider how 'interesting' the PLIC architecture
> > > is.
> > Which is the "T-Head defect" you mentioned here?
> >  1. Auto masking with claim + complete (I don't think it's a defect,
> > right? May I add a new patch to utilize the feature to decrease a
> > little duplicate mask/unmask operations in the future?)
>
> This is definitely a defect and non-compliance for T-HEAD because
I just agree with non-compliance, but what's the defect of
auto-masking? If somebody could explain, I'm very grateful.

> no sane interrupt controller would mask interrupt upon claim and this
> is not what RISC-V PLIC defines.
>
> >  2. EOI failed when masked
>
> This defect exists for both RISC-V PLIC and T-HEAD PLIC
> because of the way interrupt completion is defined.
>
> >
> > > Conflating EOI and masking really is a misfeature...
> > I think the problem is riscv PLIC reuse enable bit as mask bit. I
> > recommend separating them. That means:
>
> There are no per-interrupt mask bits. We only have per-context
> and per-interrupt enable bits which is used to provide mask/unmask
> functionality expected by the irqchip framework.
>
> I don't see how this is a problem for RISC-V PLIC. The only real
> issue with RISC-V PLIC is the fact the interrupt completion will be
> ignored for a masked interrupt which is what Marc is pointing at.
So you are not considering add per-interrupt mask bits to solve the
above problem, right?

I don't think you would keep below codes in AIA eoi.
 +             plic_irq_unmask(d);
 +             writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
 +             plic_irq_mask(d);

>
> Regards,
> Anup
>
> >  - EOI still depends on enable bit.
> >  - Add mask/unmask bit regs to do the right thing.
>
>
>
> >
> > >
> > >         M.
> > >
> > > --
> > > Without deviation from the norm, progress is not possible.
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
