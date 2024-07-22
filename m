Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E3C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFwsq5t7Zndp9sI6KNrNzRdKJnJj1KwPxG+WYGhpMI0=; b=DVAWmf4UBC51Qw
	Wj21j0M6/8wrY4016hu5xKuA0byqrjRIZbqwKb7eSAYWLLyEteMs11NDMw7KrQC3pLSjPtCKmVLAx
	Adt5lRxiFm/bgJvTeovo4LqP4HnGcKgrM+Yik7eI1sSloUpmZ9/5DJxUmUakJyWgXUKTwRddAxQHA
	7S4YMKVWIs+eDfWwEnrPb3dXkM+qraWkeJXpDKnnFXPXMqaNvhAswMgDUvFd2yOOBzWClz0rwWdt9
	QCBmiGym/FDcuzaTgCW8b1ifNSRYnuWD+fHmh2v+ZPueKbRWzgIz623Y3gcPgGpT3M1WMieXNNZcu
	xZGq8w0/TFMQgANPe5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVncK-00000008jS2-05kJ;
	Mon, 22 Jul 2024 07:37:56 +0000
Received: from asrmicro.com ([210.13.118.86] helo=spam.asrmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVncG-00000008jO3-1tiF
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 07:37:54 +0000
Received: from exch02.asrmicro.com (exch02.asrmicro.com [10.1.24.122])
	by spam.asrmicro.com with ESMTPS id 46M7arNH096942
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 22 Jul 2024 15:36:53 +0800 (GMT-8)
	(envelope-from zhengyan@asrmicro.com)
Received: from exch03.asrmicro.com (10.1.24.118) by exch02.asrmicro.com
 (10.1.24.122) with Microsoft SMTP Server (TLS) id 15.0.847.32; Mon, 22 Jul
 2024 15:36:56 +0800
Received: from exch03.asrmicro.com ([::1]) by exch03.asrmicro.com ([::1]) with
 mapi id 15.00.0847.030; Mon, 22 Jul 2024 15:36:56 +0800
From: =?gb2312?B?WWFuIFpoZW5no6jRz9X+o6k=?= <zhengyan@asrmicro.com>
To: Nam Cao <namcao@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "maz@kernel.org" <maz@kernel.org>,
        "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>,
        =?gb2312?B?WmhvdSBRaWFvKNbcx8gp?=
	<qiaozhou@asrmicro.com>,
        "samuel.holland@sifive.com"
	<samuel.holland@sifive.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "Drew Barbier" <drew@sifive.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHYyXSBpcnFjaGlwL3NpZml2ZS1wbGljOiBlbnN1cmUg?=
 =?gb2312?Q?interrupt_is_enable_before_EOI?=
Thread-Topic: [PATCH v2] irqchip/sifive-plic: ensure interrupt is enable
 before EOI
Thread-Index: AQHaxiqeTa4u+1J7Xk6+X8mCqXW5JLHrJCOAgBdizUA=
Date: Mon, 22 Jul 2024 07:36:55 +0000
Message-ID: <b91a0f1223a44e2f8f6849585fa15756@exch03.asrmicro.com>
References: <69174a28eff44ad1b069887aa514971e@exch03.asrmicro.com>
 <20240624113523.23-1-zhengyan@asrmicro.com>
 <20240707182715.L_REw7VC@linutronix.de>
In-Reply-To: <20240707182715.L_REw7VC@linutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.171.53]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: spam.asrmicro.com 46M7arNH096942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_003753_197259_485DA9D0 
X-CRM114-Status: GOOD (  48.89  )
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

> On Mon, Jun 24, 2024 at 11:35:23AM +0000, zhengyan wrote:
> > RISC-V PLIC cannot "end-of-interrupt" (EOI) disabled interrupts, as
> > explained in the description of Interrupt Completion in the PLIC spec:
> > "The PLIC signals it has completed executing an interrupt handler by
> > writing the interrupt ID it received from the claim to the
> > claim/complete  register. The PLIC does not check whether the
> > completion ID is the same  as the last claim ID for that target. If
> > the completion ID does not match  an interrupt source that *is
> > currently enabled* for the target, the  completion is silently ignored."
> >
> >  Commit 9c92006b896c ("irqchip/sifive-plic: Enable interrupt if needed
> > before EOI")  ensured that EOI is enable when irqd IRQD_IRQ_DISABLED
> > is set, before  EOI
> >
> >  Commit 69ea463021be ("irqchip/sifive-plic: Fixup EOI failed when
> > masked")  ensured that EOI is successful by enabling interrupt first, before
> EOI.
> >
> >  Commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and
> > mask
> >  operations") removed the interrupt enabling code from the previous
> > commit, because it assumes that interrupt should already be enabled at
> > the  point of EOI.
> >
> > However, here still miss a corner case that if SMP is enabled. When
> > someone needs to set affinity from a cpu to another the original cpu
> > when handle the EOI meanwhile the IE is disabled by plic_set_affinity
> >
> > For example, broadcast tick is working,
> > cpu0 is about to response, cpu1 is the next.
> > 1. cpu0 responses the timer irq, read the claim REG, do timer isr event.
> > 2. during the timer isr it will set next event
> > tick_broadcast_set_event -> irq_set_affinity->xxx-> plic_set_affinity
> > -> plic_irq_enable 3. in plic_set_affinity disable cpu0's IE and
> > enable cpu1'IE 4. cpu0 do the write claim to finish this irq, while
> > cpu0's IE is disabled, left an active state in plic.
> >
> > So this patch ensure that won't happened
> >
> > Signed-off-by: zhengyan <zhengyan@asrmicro.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c
> > b/drivers/irqchip/irq-sifive-plic.c
> > index 9e22f7e378f5..815ce8aa28f1 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -149,8 +149,10 @@ static void plic_irq_mask(struct irq_data *d)
> > static void plic_irq_eoi(struct irq_data *d)  {
> >  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > +	void __iomem *reg = handler->enable_base + (d->hwirq / 32) *
> sizeof(u32);
> > +	u32 hwirq_mask = 1 << (d->hwirq % 32);
> >
> > -	if (unlikely(irqd_irq_disabled(d))) {
> > +	if (unlikely((readl(reg) & hwirq_mask) == 0)) {
> >  		plic_toggle(handler, d->hwirq, 1);
> >  		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >  		plic_toggle(handler, d->hwirq, 0);
> 
> I think this patch is fine.
> 
> But, I don't like reading hardware registers in the interrupt hot path. It may
> slow things down. Also this patch doesn't allow moving the if condition out of
> this plic_irq_eoi() function into the enabling function (I have been thinking
> about doing that for some time, but too lazy to get to it).
> 
> I *may* have something better.
> 
> From the specification:
> "The PLIC signals it has completed executing an interrupt handler by writing
> the interrupt ID it received from the claim to the claim/complete register.
> The PLIC **does not check** whether the completion ID is the same as the
> last claim ID for that target. If the completion ID does not match an interrupt
> source that is currently enabled for the target, the completion is silently
> ignored."
> 
> Note what I "highlighed": the irq number written back does not have to
> match the irq number last claimed for the CPU. If I interpret this correctly,
> this means *any* claim/complete register can be used to complete the
> interrupt.
> 
> So, my idea: since irq affinity setting still leaves at least 1 CPU with the
> interrupt enabled; the claim/complete register for that enabled CPU can be
> used for completing interrupt (instead of the original one used for claiming).
> This would avoid some hardware register access in the hot path.
> Also allows another optimization of moving the if condition out of the EOI
> function.
> 
> Something like the patch below. To apply this one cleanly, another patch
> must be applied first:
> https://lore.kernel.org/linux-riscv/20240703072659.1427616-1-
> namcao@linutronix.de/
> 
> What I am still a bit unsure about is whether my interpretation of the
> specification is correct. The patch works for my Visionfive 2 board, so the
> question is whether this patch is relying on "undefined behavior", or this is
> really what the spec means. Drew Barbier <drew@sifive.com> seems to be
> the one who wrote that. Do you mind confirming my interpretation?
> 
> Best regards,
> Nam
> 
I confirm it, It works good on my platform as well. 
Looks like " *any* claim/complete register can be used to complete" is correct.

> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index f30bdb94ceeb..117ff9f1c982 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -69,6 +69,7 @@ struct plic_priv {
>  	void __iomem *regs;
>  	unsigned long plic_quirks;
>  	unsigned int nr_irqs;
> +	void __iomem **complete;
>  	unsigned long *prio_save;
>  };
> 
> @@ -149,13 +150,14 @@ static void plic_irq_mask(struct irq_data *d)  static
> void plic_irq_eoi(struct irq_data *d)  {
>  	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
> 
>  	if (unlikely(irqd_irq_disabled(d))) {
>  		plic_toggle(handler, d->hwirq, 1);
> -		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +		writel(d->hwirq, priv->complete[d->hwirq]);
>  		plic_toggle(handler, d->hwirq, 0);
>  	} else {
> -		writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +		writel(d->hwirq, priv->complete[d->hwirq]);
>  	}
>  }
> 
> @@ -164,6 +166,7 @@ static int plic_set_affinity(struct irq_data *d,
>  			     const struct cpumask *mask_val, bool force)  {
>  	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
> +	struct plic_handler *handler;
>  	struct cpumask new_mask;
> 
>  	cpumask_and(&new_mask, mask_val, &priv->lmask); @@ -180,6
> +183,9 @@ static int plic_set_affinity(struct irq_data *d,
>  	if (!irqd_irq_disabled(d))
>  		plic_irq_enable(d);
> 
> +	handler = per_cpu_ptr(&plic_handlers,
> cpumask_first(&new_mask));
> +	priv->complete[d->hwirq] = handler->hart_base + CONTEXT_CLAIM;
> +
>  	return IRQ_SET_MASK_OK_DONE;
>  }
>  #endif
> @@ -516,6 +522,10 @@ static int plic_probe(struct platform_device *pdev)
>  	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
>  	if (!priv->prio_save)
>  		return -ENOMEM;
> +
> +	priv->complete = devm_kcalloc(dev, 1 + nr_irqs, sizeof(*priv-
> >complete), GFP_KERNEL);
> +	if (!priv->complete)
> +		return -ENOMEM;
> 
>  	for (i = 0; i < nr_contexts; i++) {
>  		error = plic_parse_context_parent(pdev, i, &parent_hwirq,
> &cpu); @@ -577,6 +587,12 @@ static int plic_probe(struct platform_device
> *pdev)
>  			writel(1, priv->regs + PRIORITY_BASE +
>  				  hwirq * PRIORITY_PER_ID);
>  		}
> +
> +		if (!nr_handlers) {
> +			for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> +				priv->complete[hwirq] = handler->hart_base
> + CONTEXT_CLAIM;
> +		}
> +
>  		nr_handlers++;
>  	}
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
