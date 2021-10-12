Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86D6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 03:37:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17176023F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 03:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A17176023F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7p+sH1wjpzLNsqYEARu+T5d1UMPXD5hk2Bo6gc+E+aQ=; b=BBNyuchAU/Cw6F
	e6BGPf9XYWk7iEYF+C+3FvHboZ/FZBhv3PRRCsGA9DYZY1NEaN1osjzIOv4NGG3/gJnhv/H5u6V/+
	ynFp5qnkgE+rrzQKz/v1Apc4fQUBBA2+uWGk55qNJE5Y2e/7KlXlocFeiUjpgmzAsqLrCYfRoTlnB
	pArB3rbAloWVsrlvcWDiDXT4e1FpNgebT37C+rjlljgUUsDrVHmypfzqsJMFGMNJoEmABiS0SXDje
	8Q2KXrEcgaJMl3fZ4XlSLxWBCT54KEOQV8r+jGUYZB8A1sb1F41X7VSgEiloWQh6Y/LipYVUsMgcw
	VyLwkD6vSGxxTnA3LyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma8bA-00BLrN-Ak; Tue, 12 Oct 2021 03:37:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma8b7-00BLol-1p
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 03:37:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r7so62371652wrc.10
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 20:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JuvToQE2pzz75Z6mV3+4rwEHXYU4rgHbvxUO/deSKSQ=;
 b=b+8RCLaoAX3uyQUw+mzgTguFgb7Ep+UKcuwYzNI8xo8dqA2GhU8vE5SttpSsj6IX8i
 /bTZJcGJ0UZM9BHIOWlGPiT+WnDL64Anc6uYsyyxQj752nUjGzM7WH1gPV1YUgubT+tI
 4lLSvYHRtQolk+NvhowMujsS3SVRWr9xKITQzVZHDbGBqwyEskKN/+E0+HeaYdK2I09o
 hd9Dj5h4d8+31vdF8HQ+vRS3vlDJZYtanEQS1UZnl63lvx6rBraba8m+NxbBhSz/R2ME
 5rMBWwrkG7Tca0DozrKwvEb5pZ1080hMptINV8XrSqwqHR/UOK+3XT4XSXWP/9yfv7gS
 qFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JuvToQE2pzz75Z6mV3+4rwEHXYU4rgHbvxUO/deSKSQ=;
 b=ylyaJ9DCyDT8ZwgOQtrMzV4X2K8i3RxrSl1WAV4QhHOYeNrIDrFKonrhQhGnempy8d
 UpqEKUwmmmD0ao+X7Ffr21ASIE1uXODNoVWXP1jcXrp0v7ChZ2kKXur8bnfpe45U9PWs
 Sc+XdQn2HgLjB/yB3vNWVNMIjmBh3l0Bp982Mxli4zbwhDxZutL4JGuTxC7M1SnIQ+yj
 aZvdRaY8CJwolLLfga74ZvVPEvDmmOTZzhsnl9RR9aY0GaHseZMGjtVXuGyUAyv+ZbWu
 6f77//eTqqiLZfP5k9I0684PklcKnBUAdxTJf1tBYhGmS0JSKvPpxH13yIruFie1s0P2
 szLA==
X-Gm-Message-State: AOAM533luISM//kdZmeFbPHq5e3Wa+nYhe8iMLHBs9Ub4Gtf2JyXg6+d
 HznFspWot2Hy3L3CkjjuChfcHeS+NTR/vqTdZDy9jA==
X-Google-Smtp-Source: ABdhPJwSrIvFQyniN97IqB3E7peZT1NXyIftXBjn0f/I+k3k5Lq/V4Idq/LVAQIgggzcQXzQbp/8X+XnlwytQ+Tg7gk=
X-Received: by 2002:a5d:6dce:: with SMTP id d14mr29707283wrz.363.1634009818402; 
 Mon, 11 Oct 2021 20:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211011132431.2792797-1-guoren@kernel.org>
 <CAAhSdy1xjRE0TJ_Nd9fdz4RAK2J5FskQYbWDVXO7jhfcZsFm_g@mail.gmail.com>
 <CAJF2gTRUSyyaniW6mcLSuO5td8ih8O0YOFbbY2EwVqgmzX+0nQ@mail.gmail.com>
In-Reply-To: <CAJF2gTRUSyyaniW6mcLSuO5td8ih8O0YOFbbY2EwVqgmzX+0nQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Oct 2021 09:06:46 +0530
Message-ID: <CAAhSdy1Gb8nTNxCYsSnp820wCVQGS=m7+11jnCgvfPx9dZ6=vQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Fix duplicate mask/unmask for
 claim/complete
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_203701_170915_EF49BC7B 
X-CRM114-Status: GOOD (  37.29  )
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

On Tue, Oct 12, 2021 at 6:52 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Mon, Oct 11, 2021 at 11:02 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Oct 11, 2021 at 6:54 PM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > PLIC only has enable-registers not mask/unmask registers. Mixing
> > > mask/unmask with irq_eoi is wrong, because readl(claim) could mask
> >
> > This is an incorrect assumption about readl(claim). When SW does
> > read(claim) the HW updates internal state that IRQ has been claimed.
> > The HW can still get same (already claimed) IRQ again before
> > writel(claim) which will be delivered after writel(claim).
> Our hw would mask IRQ with readl(claim), so it's unnecessary for our
> board. I agree some hardware won't mask IRQ after readl(claim), so I
> put DT-bool to control it.

Clearly, the PLIC on C9xx does not comply with RISC-V PLIC because
it is violating the "Interrupt Claim Process" and "Interrupt Completion
Process" defined by the RISC-V PLIC specification.
(Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)

I would suggest you to have a separate compatible string
"thead,c9xx-plic" for C9xx PLIC implementation.

>
> >
> > > irq by hardware. We only need mask/unmask to fixup the hardware
> > > which couldn't claim + mask correctly.
> >
> > The handle_fasteoi_irq() only calls unmask_irq() mostly when the
> > underlying IRQ is threaded. Is there any other case ?
> When in handle_fasteoi_irq ONESHOT path, it will call:
>         if (desc->istate & IRQS_ONESHOT)
>                 mask_irq(desc);
>
> mask_irq->plic_irq_mask->"write 0 to PRIORITY & ENABLE_BASE-bit"
>
> In this IRQ context, it wouldn't call unmask_irq with
> cond_unmask_eoi_irq when in IRQCHIP_EOI_THREADED. Then the path would
> writel(hwirq, claim) with irq disabled.
> static void cond_unmask_eoi_irq(struct irq_desc *desc, struct irq_chip *chip)
> {
> ...
>         } else if (!(chip->flags & IRQCHIP_EOI_THREADED)) {
>                 chip->irq_eoi(&desc->irq_data);
>         }
>
> When IRQ is disabled in c9xx, writel(hwirq, claim) would be invalid
> and cause a blocking irq bug.

Like mentioned above, this is not inline with RISC-V PLIC. You
should call it C9xx PLIC.

>
> >
> > Another fact is that all irqchip drivers using handle_fasteoi_irq()
> > implement irq_mask/unmask().
> C9xx needn't call mask&unmask after readl(claim), because:
> 1. If hw supports readl(claim) with acquiring irq then the mask/unmask
> is unnecessary and causes performance problems.
> 2. When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED path, unnecessary mask
> operation would cause a blocking irq bug.

I would suggest the following:

1) Add a separate compatible string "thead,c9xx-plic" for your PLIC
implementation.

2) In plic_init() when DT node is compatible to "thead,c9xx-plic",
you should set irq_mask/unmask of "plic_chip" to NULL and point
irq_enable/disable of "plic_chip" to plic_irq_mask/unmask.

3) Add a detailed comment block in plic_init() about the differences
in Claim/Completion process of RISC-V PLIC and C9xx PLIC.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > >
> > > If hardware supports claim + mask, it would cause unnecessary
> > > mask/umak operations.
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Atish Patra <atish.patra@wdc.com>
> > > ---
> > >  drivers/irqchip/irq-sifive-plic.c | 16 ++++++++++++----
> > >  1 file changed, 12 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > index cf74cfa82045..0fa46912f452 100644
> > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > +++ b/drivers/irqchip/irq-sifive-plic.c
> > > @@ -64,6 +64,7 @@ struct plic_priv {
> > >         struct cpumask lmask;
> > >         struct irq_domain *irqdomain;
> > >         void __iomem *regs;
> > > +       bool claim_mask_support;
> > >  };
> > >
> > >  struct plic_handler {
> > > @@ -111,7 +112,7 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
> > >         }
> > >  }
> > >
> > > -static void plic_irq_unmask(struct irq_data *d)
> > > +static void plic_irq_enable(struct irq_data *d)
> > >  {
> > >         struct cpumask amask;
> > >         unsigned int cpu;
> > > @@ -125,7 +126,7 @@ static void plic_irq_unmask(struct irq_data *d)
> > >         plic_irq_toggle(cpumask_of(cpu), d, 1);
> > >  }
> > >
> > > -static void plic_irq_mask(struct irq_data *d)
> > > +static void plic_irq_disable(struct irq_data *d)
> > >  {
> > >         struct plic_priv *priv = irq_data_get_irq_chip_data(d);
> > >
> > > @@ -168,8 +169,8 @@ static void plic_irq_eoi(struct irq_data *d)
> > >
> > >  static struct irq_chip plic_chip = {
> > >         .name           = "SiFive PLIC",
> > > -       .irq_mask       = plic_irq_mask,
> > > -       .irq_unmask     = plic_irq_unmask,
> > > +       .irq_enable     = plic_irq_enable,
> > > +       .irq_disable    = plic_irq_disable,
> > >         .irq_eoi        = plic_irq_eoi,
> > >  #ifdef CONFIG_SMP
> > >         .irq_set_affinity = plic_set_affinity,
> > > @@ -181,6 +182,11 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> > >  {
> > >         struct plic_priv *priv = d->host_data;
> > >
> > > +       if (!priv->claim_mask_support) {
> > > +               plic_chip.irq_mask      = plic_irq_disable;
> > > +               plic_chip.irq_unmask    = plic_irq_enable;
> > > +       }
> > > +
> > >         irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> > >                             handle_fasteoi_irq, NULL, NULL);
> > >         irq_set_noprobe(irq);
> > > @@ -298,6 +304,8 @@ static int __init plic_init(struct device_node *node,
> > >         if (WARN_ON(!nr_contexts))
> > >                 goto out_iounmap;
> > >
> > > +       priv->claim_mask_support = of_property_read_bool(node, "claim-mask-support");
> > > +
> > >         error = -ENOMEM;
> > >         priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
> > >                         &plic_irqdomain_ops, priv);
> > > --
> > > 2.25.1
> > >
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
