Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92B7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 09:43:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A042603E9
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 09:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A042603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRqpcJSVto2dIDIqdefBaAcwrPrrOHKqQIVVh7lDjVo=; b=BRTE33N9pdEJ/B
	LRGdTbFjNW/9d4zZt9BAOLI78FtuLr9AiwGPIKajT7b0WWEWKNCfKRH3qy2w8bdqCDE8UEtk0rfNb
	E/upnR2w5KaxVLPCvDhk25R1XvBIg5g9HwN7QLOTAgdT7vBz4YKB3wbCl7fITzFKfvc7ua/oRquU5
	/6szLIJUy5YsEWCkgXc63WSCUoY/PQ3OdA60a/L84EV5eScAiCp+N8mf3y8g02UIqIoInG7OUmuie
	bQ09sMaq+DMNsHeaIcBgEU9pMgN6EPgt/ea892p97ZotpR+NXWVvsM9EM0qB3p7RUU4iD3dv/kabE
	sA4wa5EgM72ZuXyhDHDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdUbZ-0075m8-1x; Thu, 21 Oct 2021 09:43:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdUbV-0075kk-RH
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 09:43:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C689611F2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634809397;
 bh=nGnXT9Y+tyayDOT1oZALWerJdakuCUP3NgvyY2jkCYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RketB7iJZjFaDcoek/p83fg5zmBQ8C0I/WOdz8Cwkx79OqB/bdtku5QCkQR7RdyC0
 61p4BAiD9Rp9spMbWeiXUSL7Fn96TjqsZu8TdXUQbWX/T5IYYgD2xGNKz+XeYnNBk+
 KT8oJA9usxbb9n9JnJI4FRu1FY8sciy+Sfqq1o2i3j7BAWkHT1zTTFxOpE7dUPwDdp
 VSIhMXPgLJbLKJAghVDerKUHis4OGVzHatMdWzV3aWDEbvXmd8AhIsWDlMy4BUSgdW
 vHo+JeyxU5zw95pRY0EmMzR7cggk/Q5CBH1p1R25j4FGy8MtCRKdKjfKIuO2P3c20b
 L2a2ZTqCgcsuw==
Received: by mail-ua1-f50.google.com with SMTP id e10so33434uab.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 02:43:17 -0700 (PDT)
X-Gm-Message-State: AOAM530nXMy0llzvmP4jTDdFTr5VBK50+ucG8e7oPE40ut+1DHO7LV+F
 CIOlysF1pLEvPq3mVmkn/1HcDw9m2Dx4JV6Y+L4=
X-Google-Smtp-Source: ABdhPJxEaK84MgiQrY6EFgZEMZUyzwOje8910ADj5Aho0+aStfUGmGbH21vzDMQgtirhGIi60c69jylQ4ma/LXOtEQc=
X-Received: by 2002:ab0:728e:: with SMTP id w14mr4750493uao.97.1634809396463; 
 Thu, 21 Oct 2021 02:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
 <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
 <8735oxuxlq.wl-maz@kernel.org>
 <CAJF2gTSmyu9nA5M3QLeR1LdGMkeGb7jE93Z9zjixcpb_freLMw@mail.gmail.com>
 <875ytrddma.wl-maz@kernel.org>
 <CAAhSdy0TwOjv_RDMRsKqcqTE8PSO_A_EttMGBiDbb-0PTRizZg@mail.gmail.com>
 <871r4fd996.wl-maz@kernel.org>
 <CAJF2gTQEx9BJ6bmgrNOc9--CL3DRKBBN=1Fv_waWWmTTGj150A@mail.gmail.com>
 <87v91qbwvr.wl-maz@kernel.org>
In-Reply-To: <87v91qbwvr.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Oct 2021 17:43:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSqhFqPf0h-Z_U6OwU8ioPD6RVSzZg9TPoo5nxqfdgK4g@mail.gmail.com>
Message-ID: <CAJF2gTSqhFqPf0h-Z_U6OwU8ioPD6RVSzZg9TPoo5nxqfdgK4g@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Samuel Holland <samuel@sholland.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_024317_947740_B404015C 
X-CRM114-Status: GOOD (  41.66  )
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

On Thu, Oct 21, 2021 at 4:33 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 21 Oct 2021 03:00:43 +0100,
> Guo Ren <guoren@kernel.org> wrote:
> >
> > On Wed, Oct 20, 2021 at 11:08 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Wed, 20 Oct 2021 15:33:49 +0100,
> > > Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Wed, Oct 20, 2021 at 7:04 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > On Tue, 19 Oct 2021 14:27:02 +0100,
> > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, Oct 19, 2021 at 6:18 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > >
> > > > > > > On Tue, 19 Oct 2021 10:33:49 +0100,
> > > > > > > Guo Ren <guoren@kernel.org> wrote:
> > > > > > >
> > > > > > > > > If you have an 'automask' behavior and yet the HW doesn't record this
> > > > > > > > > in a separate bit, then you need to track this by yourself in the
> > > > > > > > > irq_eoi() callback instead. I guess that you would skip the write to
> > > > > > > > > the CLAIM register in this case, though I have no idea whether this
> > > > > > > > > breaks
> > > > > > > > > the HW interrupt state or not.
> > > > > > > > The problem is when enable bit is 0 for that irq_number,
> > > > > > > > "writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
> > > > > > > > the hw state machine. Then this irq would enter in ack state and no
> > > > > > > > continues irqs could come in.
> > > > > > >
> > > > > > > Really? This means that you cannot mask an interrupt while it is being
> > > > > > > handled? How great...
> > > > > > If the completion ID does not match an interrupt source that is
> > > > > > currently enabled for the target, the completion is silently ignored.
> > > > > > So, C9xx completion depends on enable-bit.
> > > > >
> > > > > Is that what the PLIC spec says? Or what your implementation does? I
> > > > > can understand that one implementation would be broken, but if the
> > > > > PLIC architecture itself is broken, that's far more concerning.
> > > >
> > > > Yes, we are dealing with a broken/non-compliant PLIC
> > > > implementation.
> > > >
> > > > The RISC-V PLIC spec defines a very different behaviour for the
> > > > interrupt claim (i.e. readl(claim)) and interrupt completion (i.e.
> > > > writel(claim)). The T-HEAD PLIC implementation does things
> > > > different from what the RISC-V PLIC spec says because it will
> > > > mask an interrupt upon interrupt claim whereas PLIC spec says
> > > > it should only clear the interrupt pending bit (not mask the interrupt).
> > > >
> > > > Quoting interrupt claim process (chapter 9) from PLIC spec:
> > > > "The PLIC can perform an interrupt claim by reading the claim/complete
> > > > register, which returns the ID of the highest priority pending interrupt or
> > > > zero if there is no pending interrupt. A successful claim will also atomically
> > > > clear the corresponding pending bit on the interrupt source."
> > > >
> > > > Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
> > >
> > > That's not the point I'm making. According to Guo, the PLIC (any
> > > implementation of it) will ignore a write to claim on a masked
> > > interrupt.
> > >
> > > If that's indeed correct, then a sequence such as:
> > >
> > > (1) irq = read(claim)
> > > (2) mask from the interrupt handler with the right flags so that it
> > > isn't done lazily
> > > (3) write(irq, claim)
> >
> > How about letting the IRQ chip change?
> >
> > diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> > index a98bcfc4be7b..ed6ace1058ac 100644
> > --- a/kernel/irq/chip.c
> > +++ b/kernel/irq/chip.c
> > @@ -444,10 +444,10 @@ void unmask_threaded_irq(struct irq_desc *desc)
> >  {
> >         struct irq_chip *chip = desc->irq_data.chip;
> >
> > +       unmask_irq(desc);
> > +
> >         if (chip->flags & IRQCHIP_EOI_THREADED)
> >                 chip->irq_eoi(&desc->irq_data);
> > -
> > -       unmask_irq(desc);
> >  }
> >
> >  /*
> > @@ -673,8 +673,8 @@ static void cond_unmask_eoi_irq(struct irq_desc
> > *desc, struct irq_chip *chip)
> >          */
> >         if (!irqd_irq_disabled(&desc->irq_data) &&
> >             irqd_irq_masked(&desc->irq_data) && !desc->threads_oneshot) {
> > -               chip->irq_eoi(&desc->irq_data);
> >                 unmask_irq(desc);
> > +               chip->irq_eoi(&desc->irq_data);
> >         } else if (!(chip->flags & IRQCHIP_EOI_THREADED)) {
> >                 chip->irq_eoi(&desc->irq_data);
> >         }
>
> No, I don't think that's acceptable, and I strongly suspect that other
> irqchips have the opposite requirement. You'll have to keep the
> workaround in the PLIC code and track the EOI vs unmask to do the
> right thing in both callbacks.
Okay...

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
