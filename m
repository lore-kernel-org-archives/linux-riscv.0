Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77361C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E117610A6
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E117610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6fXtfBbldu0zbl5QbmDguVfeH6KCpSG29gw5NJAiGE=; b=J/GFW+MG3x4jwo
	ByLiY9JP257mkbcLtjyCnRZvZoqJQzZHL+sTI1vs8P6n9I1BAvBQt3iyyIJYCDACl7xwMgGQK14+n
	OPCukF1CwleR9/l8L7c58A9tD8pXMVuPFP8OO5nADaKODZGhG9dCikZc8I4UA0fPAQxyh0ArhBYca
	/I9jMoEhNp6EXSBC30l3vqi2qRrW225a1g1d2bAmJeIQWN2eEuYMVsigFKOQCW5Q4gTswzaDWZKJF
	hllLOcuJ62VwcEtD6CoJznBG77wMwMf8rsFWsi2R+qVX6DNKEr1kU4n2nyN7RfMALavTD2e7OdrVC
	I04yoYyYmEkQGdwczSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcLON-00EES7-KT; Mon, 18 Oct 2021 05:40:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcLOL-00EERd-9Y
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 05:40:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id o20so39164216wro.3
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 22:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fkjm+Bi8J7T8XPP53sKHr+5Z6akusLIMIB2gr5LylK8=;
 b=XH8txyXBcD2m81F0JjLcNOoKSCUbM9l5xjIgx01Vh8nfKxZM4rZ2D+hAQt9weVfmBD
 VJ1JRJGfebBDKquONUxbWQ58lIw3sPcGQfcIvnlYvU1LspP9xOZoJPfFIZK27G8y+fB0
 cUh2kL4oJcHHImQEvxMHFqzLjo19TAJgRq968GKslv9xLHILB6G0iX/v6lyDvq5M0+2m
 iO+MO3olY0TCeK7aZYtNPY+ZBpL4p/T7ptp26HMmgId2rQaT5M+JYRRlHpezCdcg4vMS
 jXD52xd2it0aJnoYEKTbFX/GWhpRyDGedacsTqk2f+D3R8rEoJ6CxYnqPPrPkA+8QMc6
 aqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fkjm+Bi8J7T8XPP53sKHr+5Z6akusLIMIB2gr5LylK8=;
 b=uOoTujNJs4qb6+qwUk1DSseOoydKoeOw4UGb5xAW617L70/Fp8pZDNC597j3/dl+jL
 Y59Z30Jh66O106VzryF/s59vyb227RWI8gzQXKTiOxy6DreK4O4QE6yRQUqKZqXZP4b+
 C6+KdI7AE3BNQUtXucNtNJrclJesc7V1oR2WEDtidz74DRM7NGBz54Tx4VCqkz3hiUT8
 NDLp2XaQWWU6WE1KJBQn5PUuNf99SBD4exbswTZ9NRiG9CR3TlXtJk9+KQbizS4ofeWa
 +UwHjX7HEAwPxYommNJWXXJVJ5WGf4R8KEDZc4Pq8Oikb2u/fLqXIcwYYaud5oYmw/cl
 nokw==
X-Gm-Message-State: AOAM5319s8askuAc0exDSVrSMa/ztZHX03g01CFEJid0u+KI0To+k+x0
 1WcSWD08fBMO/gB3DNcvzoUlStc4wGNwJP32q84ePliojig=
X-Google-Smtp-Source: ABdhPJxndAGotG5djD0ro2r0O/Id4HcAMckY50cuqrq17tP9BylAH8brMIYKrQaO0whGNHibs3rBxzYUKmDkpJGmPg0=
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr32479015wry.249.1634535655663; 
 Sun, 17 Oct 2021 22:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
In-Reply-To: <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Oct 2021 11:10:44 +0530
Message-ID: <CAAhSdy3J4Q2cQ-xe4oxOXbJVEVnXzhkP8YHRS41QA3L1sY-6bA@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Samuel Holland <samuel@sholland.org>
Cc: Guo Ren <guoren@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_224057_366369_3ABE7521 
X-CRM114-Status: GOOD (  42.82  )
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

On Mon, Oct 18, 2021 at 10:47 AM Samuel Holland <samuel@sholland.org> wrote:
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
>
> With IRQCHIP_EOI_THREADED, .irq_eoi is delayed until after the irqthread
> runs. This is good. Except that the call to unmask_threaded_irq() is
> inside a check for IRQD_IRQ_MASKED. And IRQD_IRQ_MASKED will never be
> set because .irq_mask is NULL. So the end result is that the IRQ is
> never EOI'd and is masked permanently.
>
> If you set .flags = IRQCHIP_EOI_THREADED, and additionally set .irq_mask
> and .irq_unmask to a dummy function that does nothing, the IRQ core will
> properly set/unset IRQD_IRQ_MASKED, and the IRQs will flow as expected.
> But adding dummy functions seems not so ideal, so I am not sure if this
> is the best solution.

This series only tries to optimize a particular case in handle_fasteoi_irq()
for T-HEAD PLIC. I am not sure about this series either.

Although, we do need separate compatible strings for T-HEAD PLIC
because T-HEAD PLIC is not compliant with RISC-V PLIC specification.

Regards,
Anup

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
