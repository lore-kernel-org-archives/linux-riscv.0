Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F230C64EB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 03:51:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF022145D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 03:51:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uq3xguk0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="y/qgaa9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF022145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqSW/Ojz2Ub40XMmMEdSwXt/XKQcwAINSfCK6cxfNCA=; b=Uq3xguk0GDetXP
	0e70zNl13/yX3vRooO5OVV311MaIm336dM1xHg41hZW7Lh0QItdf2u5JoveaLJgR99f4PNeI0vA9S
	R0mDayw3BLl8reFm+l4znsLWBuHtgUJpeWsPSMZqaFvuoX9FlA21u3fFnEWSjmxbpEWOHo1/3Q6jo
	gxCuPAhPjgOq9uUR+ZvR/Rv92Szpwt2h8+ByQ4yDxDKRKih1xY6To7YHotnrFehUcs5z0FatI04+N
	XoMgw4+9RgX0h9/raEzsXVK7GNaytwWwQi8uBqdSJgZjcK2lq43/4clVBzwWBr86KwaoIMNSawZSH
	F5aE5P4J4ofLdTnlpzxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSZpu-0008TX-Df; Fri, 30 Nov 2018 03:51:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSZpr-0008SX-Qf
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 03:51:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id v6so3887916wrr.12
 for <linux-riscv@lists.infradead.org>; Thu, 29 Nov 2018 19:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8lhCMWWjY4PSZPP76HRw+qL5pnNNtl6anToX7FYQjOI=;
 b=y/qgaa9GTBGYHGAMXMidmAcahb7pX2OZHTN7cxnzeno/z8UjJXYgOyi9DYQaT3A4uC
 guE/SiqQ09NC3E4EYdiwrtv+4Q+rKogPO99cABNsdoTzmjAxKlVTNpuDttWR54fpLlBP
 3lkENKMnEyKobkFysBFjSjv5lKcsDvOZvGucX74wwGbBobkGvAjaRCxYWAr7kPeJGJSx
 nHcd+QEM0LRnWlokEqDjJF/6MO3K52LXMqwIHnkvTEjPRXtBvODkD7TXxVj3UJYEnD+Y
 NEm70c/3eWw8Xtqak+pPz3dzyljkFYcXKooybXfk9upMO5kNEYM+gZe55h1Ds5/IrUH2
 Fnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8lhCMWWjY4PSZPP76HRw+qL5pnNNtl6anToX7FYQjOI=;
 b=i25sFg/0eWPAMaU9YASDvroPFFyC5aa/rtNj6rUm7GU7VOXNMlWsdy4JchyTx0UDGE
 OLedXpGUo+f7hRHwUkc5QMIErkUD+zWU8w4FCeNa8OSk0ENZwo+2t/ZzmpndZFsKiQ3i
 /bZefIVD7hkys6S2irDSSmGFiOEUB332faNn0aiiNmCeE6sF4hinpiF/do6KLQCjHMN5
 er1WxFXJ4Gf3fmmk6SrpPWczqxlTIeYriM9EKrjBS8czQdG4mVYXi6QFfcaEC8lrhY6C
 C1JD4fTs3xVTqW+trANt5vB+rJn8Kc8VAvjHIjbAzbnkgJ9m/0NrrvXFDLJcu4GAExCI
 m8EA==
X-Gm-Message-State: AA+aEWZVaHwT015VmGPTsRbKjBTp4jqQiCkPoleagVpMWGMlnAz2EFNG
 n+medok+v24m7lGQ9PVDjdKafbu3di27bkR3li5IRg==
X-Google-Smtp-Source: AFSGD/UTSNFJv+fO6vV7Abn70OevDKhmucsH1WABRsH0XXzlUxcAnhVS7hYLq7re/4dfAwMU16H5KRWEtKF5Yk5GcDM=
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr3742878wrp.59.1543549871076; 
 Thu, 29 Nov 2018 19:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20181127100317.12809-1-anup@brainfault.org>
 <20181127100317.12809-3-anup@brainfault.org>
 <25c2fafc-a479-911f-a7df-704108da5dc7@wdc.com>
In-Reply-To: <25c2fafc-a479-911f-a7df-704108da5dc7@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Nov 2018 09:21:06 +0530
Message-ID: <CAAhSdy2kJD=L=U=uJ0XM5MDtsTJKuH_yU+VZBoFg-jKOXL0yYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] irqchip: sifive-plic: More flexible
 plic_irq_toggle()
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_195123_865369_7068F5CE 
X-CRM114-Status: GOOD (  27.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 30, 2018 at 7:09 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 11/27/18 2:03 AM, Anup Patel wrote:
> > We make plic_irq_toggle() more generic so that we can enable/disable
> > hwirq for given cpumask. This generic plic_irq_toggle() will be
> > eventually used to implement set_affinity for PLIC driver.
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >   drivers/irqchip/irq-sifive-plic.c | 79 +++++++++++++++----------------
> >   1 file changed, 39 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 56fce648a901..95b4b92ca9b8 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -55,19 +55,26 @@
> >   #define     CONTEXT_THRESHOLD               0x00
> >   #define     CONTEXT_CLAIM           0x04
> >
> > -static void __iomem *plic_regs;
> > -
> >   struct plic_handler {
> >       bool                    present;
> > -     int                     ctxid;
> >       void __iomem            *hart_base;
> >       raw_spinlock_t          enable_lock;
> >       void __iomem            *enable_base;
> >   };
> > +
> >   static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
> >
> > -static inline void plic_toggle(struct plic_handler *handler,
> > -                             int hwirq, int enable)
> > +struct plic_hw {
> > +     u32                     nr_irqs;
> > +     u32                     nr_handlers;
> > +     u32                     nr_mapped;
>
> Why these three are moved inside a structure? I don't see them being
> used outside plic_init. Am I missing something ?

Yes, these are not used outside plic_init at the moment but these will be
eventually used to implement pm_suspend() and pm_resume() callbacks.

In general, these details can be used for debug sanity checks as well
since these are critical details about PLIC HW.

>
> > +     void __iomem            *regs;
> > +     struct irq_domain       *irqdomain;
> > +};
> > +
> > +static struct plic_hw plic;
> > +
> > +static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
> >   {
> >       u32 __iomem *reg = handler->enable_base + (hwirq / 32);
> >       u32 hwirq_mask = 1 << (hwirq % 32);
> > @@ -80,27 +87,23 @@ static inline void plic_toggle(struct plic_handler *handler,
> >       raw_spin_unlock(&handler->enable_lock);
> >   }
> >
> > -static inline void plic_irq_toggle(struct irq_data *d, int enable)
> > +static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
> >   {
> >       int cpu;
> >
> > -     writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
> > -     for_each_cpu(cpu, irq_data_get_affinity_mask(d)) {
> > -             struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> > -
> > -             if (handler->present)
> > -                     plic_toggle(handler, d->hwirq, enable);
> > -     }
> > +     writel(enable, plic.regs + PRIORITY_BASE + hwirq * PRIORITY_PER_ID);
> > +     for_each_cpu(cpu, mask)
> > +             plic_toggle(per_cpu_ptr(&plic_handlers, cpu), hwirq, enable);
>
> Any specific reason to remove the handler->present check.
>
> Moreover, only this part matches commit text. Most of the other changes
> looks like cosmetic cleanup because of variable is moved to a structure.
> May be separate patch for those changes if they are are required at all.

Actually, these are two changes:
1. Making plic_irq_toggle() flexible
2. Add struct plic_hw to represent global PLIC HW details

I agree this patch is still a mess. I had broken down one big patch into
a patch series at time of sending to LKML but it seems I did a bad job
of breaking into granular patches.

>
> >   }
> >
> >   static void plic_irq_enable(struct irq_data *d)
> >   {
> > -     plic_irq_toggle(d, 1);
> > +     plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 1);
> >   }
> >
> >   static void plic_irq_disable(struct irq_data *d)
> >   {
> > -     plic_irq_toggle(d, 0);
> > +     plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 0);
> >   }
> >
> >   static struct irq_chip plic_chip = {
> > @@ -127,8 +130,6 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
> >       .xlate          = irq_domain_xlate_onecell,
> >   };
> >
> > -static struct irq_domain *plic_irqdomain;
> > -
> >   /*
> >    * Handling an interrupt is a two-step process: first you claim the interrupt
> >    * by reading the claim register, then you complete the interrupt by writing
> > @@ -145,7 +146,7 @@ static void plic_handle_irq(struct pt_regs *regs)
> >
> >       csr_clear(sie, SIE_SEIE);
> >       while ((hwirq = readl(claim))) {
> > -             int irq = irq_find_mapping(plic_irqdomain, hwirq);
> > +             int irq = irq_find_mapping(plic.irqdomain, hwirq);
> >
> >               if (unlikely(irq <= 0))
> >                       pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
> > @@ -174,36 +175,34 @@ static int plic_find_hart_id(struct device_node *node)
> >   static int __init plic_init(struct device_node *node,
> >               struct device_node *parent)
> >   {
> > -     int error = 0, nr_handlers, nr_mapped = 0, i;
> > -     u32 nr_irqs;
> > +     int error = 0, i;
> >
> > -     if (plic_regs) {
> > +     if (plic.regs) {
> >               pr_warn("PLIC already present.\n");
> >               return -ENXIO;
> >       }
> >
> > -     plic_regs = of_iomap(node, 0);
> > -     if (WARN_ON(!plic_regs))
> > +     plic.regs = of_iomap(node, 0);
> > +     if (WARN_ON(!plic.regs))
> >               return -EIO;
> >
> >       error = -EINVAL;
> > -     of_property_read_u32(node, "riscv,ndev", &nr_irqs);
> > -     if (WARN_ON(!nr_irqs))
> > +     of_property_read_u32(node, "riscv,ndev", &plic.nr_irqs);
> > +     if (WARN_ON(!plic.nr_irqs))
> >               goto out_iounmap;
> >
> > -     nr_handlers = of_irq_count(node);
> > -     if (WARN_ON(!nr_handlers))
> > +     plic.nr_handlers = of_irq_count(node);
> > +     if (WARN_ON(!plic.nr_handlers))
> >               goto out_iounmap;
> > -     if (WARN_ON(nr_handlers < num_possible_cpus()))
> > +     if (WARN_ON(plic.nr_handlers < num_possible_cpus()))
> >               goto out_iounmap;
> >
> > -     error = -ENOMEM;
> > -     plic_irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
> > -                     &plic_irqdomain_ops, NULL);
> > -     if (WARN_ON(!plic_irqdomain))
> > +     plic.irqdomain = irq_domain_add_linear(node, plic.nr_irqs + 1,
> > +                                             &plic_irqdomain_ops, NULL);
> > +     if (WARN_ON(!plic.irqdomain))
> >               goto out_iounmap;
> >
>
> Should we return EINVAL if irq_domain_add_linear fails ? Earlier, it was
> returning ENOMEM.

Sure, I will update this.

>
> > -     for (i = 0; i < nr_handlers; i++) {
> > +     for (i = 0; i < plic.nr_handlers; i++) {
> >               struct of_phandle_args parent;
> >               struct plic_handler *handler;
> >               irq_hw_number_t hwirq;
> > @@ -227,27 +226,27 @@ static int __init plic_init(struct device_node *node,
> >               cpu = riscv_hartid_to_cpuid(hartid);
> >               handler = per_cpu_ptr(&plic_handlers, cpu);
> >               handler->present = true;
> > -             handler->ctxid = i;
>
>
> The previous patch removed all the usage of ctxid. So this line also can
> be included in that patch as well to make it more coherent.

Sure, I will move it to previous patch.

Thanks for the detailed review.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
