Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E3CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 07:05:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2254861027
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 07:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2254861027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UvwVEODdsK9aMFeRyeHcncI9Yvyt/MRUfysEHrOmLs=; b=PMrRYHYNmjXE7E
	PPJaW1bGizf2HtmRWVzOAwCmOFB1iFuJzgnhLX3frGvDWYQB4m0p4z1QclZoU58U5vY8w7ctpecdU
	wNTMiAbweSeKBwqWWStKMgl7Qdj7RJKgrJ/hwhNwJZCtpFswFWo7A5r7Yc9XPYmbIye7NH1dvALAN
	u4ntvdx3brfmrsp3j2iKdRETHeJW6cm6w6dFbH8mdBdxm7NcW47JKayf+i5PhDglVb+G8+1WOCxq5
	APc5OB0bWCHcduwxYG7tkgB1MV7m0xVLZJBQ8vdFp5jgeIHE6JC3Dqisj6MYC/VRypqRSRjvBAlcF
	1iur/3C6Ga82qIJxyVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcMi8-00EQGS-E1; Mon, 18 Oct 2021 07:05:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcMi5-00EQFt-RZ
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 07:05:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6BD06108E
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 07:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634540724;
 bh=Zm8Ho9eB1/3/Ub8lBLbn/YGxOibWZkDMEC+h7+q0RnQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sLMZpc5vyTAFYwpqZvsu3pxGcZBWIXcfZQnrUtQFCN/Nx/o1euV8Bfh2J3mnNDZWa
 0EbrOZJfPl3HK37opxwowRcF7JkKdANbxafKGywfuuI4y92v8LcBRboDnoSNhaoPtj
 irpmP2eRHCZkLYxumUiSCRY/6G08q2F1z0R1wP0ySG+UQ06h3miY7qyDioctMtTfso
 iEitPAIkYPp2m/yPeBwlmULVlsFMtk4tj1EvIMDP9dCPI2wFwCJmME85YY9b4JbEEl
 IWJz3WJWwNROLQkSF3/8En7iPH0Vi3RWnL1EOsXmUEa6xIXveyZERTIbbDfDT3vo0O
 T4i2po1mS4KIA==
Received: by mail-ua1-f54.google.com with SMTP id h19so9703uax.5
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 00:05:24 -0700 (PDT)
X-Gm-Message-State: AOAM533uolMeSUBH5MSUyTB7r7u55BEDHiqusxMQ85BGq/kjbTYMtIEl
 WQG6sh6uOYMo1hF0LVHxtwCsqlOmyQpros96g04=
X-Google-Smtp-Source: ABdhPJyLENNfKQTvM76ddqJx5TPSGUaAAVd35qI9UQ0ZhKH9bb0iZHVMhlF3L32wUY3JMKctzXGyVIPJF9+5lvh4Izk=
X-Received: by 2002:ab0:3c4d:: with SMTP id u13mr24939921uaw.66.1634540724073; 
 Mon, 18 Oct 2021 00:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
In-Reply-To: <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 18 Oct 2021 15:05:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR1Oo=ERti69_SpcAyGe83PcfbjD5_3D1VrjNLBoftecw@mail.gmail.com>
Message-ID: <CAJF2gTR1Oo=ERti69_SpcAyGe83PcfbjD5_3D1VrjNLBoftecw@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Samuel Holland <samuel@sholland.org>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_000525_986802_7A4D4FAA 
X-CRM114-Status: GOOD (  45.06  )
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

Hi Samuel,

On Mon, Oct 18, 2021 at 1:17 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 10/15/21 10:21 PM, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > 1) The irq_mask/unmask() is used by handle_fasteoi_irq() is mostly
> > for ONESHOT irqs and there is no limitation in the RISC-V PLIC driver
> > due to use of irq_mask/unmask() callbacks. In fact, a lot of irqchip
> > drivers using handle_fasteoi_irq() also implement irq_mask/unmask().
> >
> > 2) The C9xx PLIC does not comply with the interrupt claim/completion
> > process defined by the RISC-V PLIC specification because C9xx PLIC
> > will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
> > and the IRQ will be unmasked upon completion by PLIC driver (i.e.
> > writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
> > the generic handle_fasteoi_irq() used in the PLIC driver.
> >
> > 3) This patch adds an errata fix for IRQS_ONESHOT handling on
> > C9xx PLIC by using irq_enable/disable() callbacks instead of
> > irq_mask/unmask().
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> >
> > ---
> >
> > Changes since V4:
> >  - Update comment by Anup
> >
> > Changes since V3:
> >  - Rename "c9xx" to "c900"
> >  - Add sifive_plic_chip and thead_plic_chip for difference
> >
> > Changes since V2:
> >  - Add a separate compatible string "thead,c9xx-plic"
> >  - set irq_mask/unmask of "plic_chip" to NULL and point
> >    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
> >  - Add a detailed comment block in plic_init() about the
> >    differences in Claim/Completion process of RISC-V PLIC and C9xx
> >    PLIC.
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 34 +++++++++++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index cf74cfa82045..960b29d02070 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -166,7 +166,7 @@ static void plic_irq_eoi(struct irq_data *d)
> >       writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >  }
> >
> > -static struct irq_chip plic_chip = {
> > +static struct irq_chip sifive_plic_chip = {
> >       .name           = "SiFive PLIC",
> >       .irq_mask       = plic_irq_mask,
> >       .irq_unmask     = plic_irq_unmask,
> > @@ -176,12 +176,32 @@ static struct irq_chip plic_chip = {
> >  #endif
> >  };
> >
> > +/*
> > + * The C9xx PLIC does not comply with the interrupt claim/completion
> > + * process defined by the RISC-V PLIC specification because C9xx PLIC
> > + * will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
> > + * and the IRQ will be unmasked upon completion by PLIC driver (i.e.
> > + * writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
> > + * the generic handle_fasteoi_irq() used in the PLIC driver.
> > + */
> > +static struct irq_chip thead_plic_chip = {
> > +     .name           = "T-Head PLIC",
> > +     .irq_disable    = plic_irq_mask,
> > +     .irq_enable     = plic_irq_unmask,
> > +     .irq_eoi        = plic_irq_eoi,
> > +#ifdef CONFIG_SMP
> > +     .irq_set_affinity = plic_set_affinity,
> > +#endif
> I tested this, and it doesn't work. Without IRQCHIP_EOI_THREADED,
> .irq_eoi is called at the end of the hard IRQ handler. This unmasks the
> IRQ before the irqthread has a chance to run, so it causes an interrupt
> storm for any threaded level IRQ (I saw this happen for sun8i_thermal).
devm_request_threaded_irq(struct device *dev, unsigned int irq,
irq_handler_t handler, irq_handler_t thread_fn

I think you should pull down the IRQ level signal in "handler" and put
the backend progress into "thread_fn".

Could you give out your driver code?

>
> With IRQCHIP_EOI_THREADED, .irq_eoi is delayed until after the irqthread
> runs. This is good. Except that the call to unmask_threaded_irq() is
> inside a check for IRQD_IRQ_MASKED. And IRQD_IRQ_MASKED will never be
> set because .irq_mask is NULL. So the end result is that the IRQ is
> never EOI'd and is masked permanently.
I don't think we should use IRQCHIP_EOI_THREADED because it makes the
IRQ path complex, we need to let the driver separate their "handler" &
"thread_fn" properly.

How do you think?

>
> If you set .flags = IRQCHIP_EOI_THREADED, and additionally set .irq_mask
> and .irq_unmask to a dummy function that does nothing, the IRQ core will
> properly set/unset IRQD_IRQ_MASKED, and the IRQs will flow as expected.
> But adding dummy functions seems not so ideal, so I am not sure if this
> is the best solution.
It's ununderstandable, we need to find a way.

Thx for the test & the question.

>
> Regards,
> Samuel
>
> > +};
> > +
> > +static struct irq_chip *def_plic_chip = &sifive_plic_chip;
> > +
> >  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> >                             irq_hw_number_t hwirq)
> >  {
> >       struct plic_priv *priv = d->host_data;
> >
> > -     irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> > +     irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
> >                           handle_fasteoi_irq, NULL, NULL);
> >       irq_set_noprobe(irq);
> >       irq_set_affinity(irq, &priv->lmask);
> > @@ -390,5 +410,15 @@ static int __init plic_init(struct device_node *node,
> >       return error;
> >  }
> >
> > +static int __init thead_c900_plic_init(struct device_node *node,
> > +             struct device_node *parent)
> > +{
> > +     def_plic_chip = &thead_plic_chip;
> > +
> > +     return plic_init(node, parent);
> > +}
> > +
> >  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
> >  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> > +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> > +IRQCHIP_DECLARE(allwinner_sun20i_d1_plic, "allwinner,sun20i-d1-plic", thead_c900_plic_init);
> >
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
