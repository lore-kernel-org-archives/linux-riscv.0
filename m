Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF340C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9w84R34ibf+weyhcuiqyMGwb4evS/BMOJxqm4mtGsbE=; b=D6e2gefG9CFDc5
	KdvvVZpuhz80uCis97v8bc1lRQelxGey7L9rC3yoUcJB8CwPCU3LA59A7Wz0ZPV70jwj26d1OnAnu
	B0V1nWyVimP1dAmwzX5NL58+gAB9gXDfnmmX7qEIRyQ+OBXx7uP1jOZRWGcUEYaBkJHCmpRGVognr
	uBvBoUWP/kJ6w3iFTMeIaNzf1P01Qgx1qEYiiWgHk94PWwdGwFDiMeXtfJveDc8OVZEQPWd8mXf6U
	65wCI2PJXVrA7g6M3F/aP255kwIoHMD2t3hxkvGUtt8T+BEFIl3fUhRhIrv0vM2RzuMq/NgwJSidV
	WLdmcKgYz03Ykd4ubolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o52Va-005QCq-U6; Sat, 25 Jun 2022 09:55:18 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o52VU-005Q9C-W5
	for linux-riscv@lists.infradead.org; Sat, 25 Jun 2022 09:55:15 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id x184so5754088ybg.12
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jun 2022 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5SGBBRtvDDw9v0PZXVt8Gwutt86lOTCl5Ukr3glNCU=;
        b=OyHZ+T0/I6uNQH5NIAmPAwPj0fjMXHzKAeAZPN8/6Ac970Xke6oIlqS79gFjhDIv5K
         jpJa2b3FxRkXpOX5Lpmt0RP1PP51wr2Hv5Ow3cLZwNHAr1hPqXVmiJ3T5Smvb/6VqHcY
         JdpcVLXvRdfat6mzPeOqwpeCdwEY9d3e1fAhXf5e0YjvYzhu3ZL5V/doVcZKyU/6vaUR
         yz8qlmaVXBtIoOIU/rnkTJgCrI5FbJLnxadKgCMEdMwGUHUa+TYtWc8ZnYAP4d/6ckvD
         Eg4nXSOAlkh0Q1UmXrv9dAeAcPm4OzZUslNTZQQBgChqT1rodwLbAS82Isk+99Uo+cMb
         hn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5SGBBRtvDDw9v0PZXVt8Gwutt86lOTCl5Ukr3glNCU=;
        b=dxSOJajiNPSE/gF9Lo2BjHkAfdCX995eEoIA79YN/tuMfAQbcpyCQhaGTHaK+HTmvD
         0He9p7jEO5i2AsYKk2WSn627f0eLhh1+wcfbcfcmBnFP3SX4GC47kWqG3kfZrhvuk9ZL
         /173s22VkuDgYFdEz+SqzD3FGdvQ339e6Mk95tYHDaj1rusZm6aFjHJQNKP0zaUdib8m
         p6SbanfPooFbs3OK6nn2KhCVgIEKYOxMnbpcgCGg+VPQxePk+suXvbFV3wULmwur5Umc
         3ZPAMmIlvgC4yBw/ry267gNpbqrM90+ObN8DFbZx7t9mFvFjZUDs/CLOhMHn8lLMLWlY
         LmPQ==
X-Gm-Message-State: AJIora/vnYZ/4lU8X9EkLUhNGRlJ7OnRm6Y6jPt4IJM7PHX7BlgGH+cE
	y81JtNJ1ASyMUEZvFAH+qdt0Q+9c5vwNd28TgTg=
X-Google-Smtp-Source: AGRyM1sSf7pxbaBz+XGvqwZjDETlB0fXORYharWW6zKWf8qLVOyJLCJ/oYS60aaeI6cnDlVpfqjVdnGXgRJ+C/sczqw=
X-Received: by 2002:a25:380a:0:b0:668:a62e:de85 with SMTP id
 f10-20020a25380a000000b00668a62ede85mr3595377yba.218.1656150911591; Sat, 25
 Jun 2022 02:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220624180311.3007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220624180311.3007-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <8735ftf73p.wl-maz@kernel.org>
In-Reply-To: <8735ftf73p.wl-maz@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 25 Jun 2022 10:54:44 +0100
Message-ID: <CA+V-a8ukQsotuWLm6_qR79qO9n_Ffo2e79AitC_=53ocsjZtzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] irqchip/sifive-plic: Add support for Renesas RZ/Five SoC
To: Marc Zyngier <maz@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_025513_145247_36C6008A 
X-CRM114-Status: GOOD (  56.82  )
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

Hi Marc,

Thank you for the review.

On Sat, Jun 25, 2022 at 10:03 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 24 Jun 2022 19:03:11 +0100,
> Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> > edge until the previous completion message has been received and
> > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> > interrupts if not acknowledged in time.
> >
> > So the workaround for edge-triggered interrupts to be handled correctly
> > and without losing is that it needs to be acknowledged first and then
> > handler must be run so that we don't miss on the next edge-triggered
> > interrupt.
> >
> > This patch adds a new compatible string for Renesas RZ/Five SoC and
> > changes the chained interrupt haindler for RZ/Five SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC-->v1:
> > * Fixed review comments pointed by Geert
> > * Dropped handle_fasteoi_ack_irq support as for the PLIC we need to
> > claim the interrupt by reading the register and then acknowledge it.
>
> Why? This is exactly what the fasteoi_ack flow gives you, and your
> initial patch was much better that this one in that regard.
>
> > * Add a new chained handler for RZ/Five SoC.
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 95 +++++++++++++++++++++++++++++--
> >  1 file changed, 91 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 173446cc9204..f53dff49e122 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -60,10 +60,13 @@
> >  #define      PLIC_DISABLE_THRESHOLD          0x7
> >  #define      PLIC_ENABLE_THRESHOLD           0
> >
> > +#define PLIC_INTERRUPT_CELL_SIZE2    2
> > +
> >  struct plic_priv {
> >       struct cpumask lmask;
> >       struct irq_domain *irqdomain;
> >       void __iomem *regs;
> > +     u32 intsize;
> >  };
> >
> >  struct plic_handler {
> > @@ -163,7 +166,7 @@ static int plic_set_affinity(struct irq_data *d,
> >  }
> >  #endif
> >
> > -static void plic_irq_eoi(struct irq_data *d)
> > +static void plic_irq_ack(struct irq_data *d)
> >  {
> >       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >
> > @@ -176,6 +179,23 @@ static void plic_irq_eoi(struct irq_data *d)
> >       }
> >  }
> >
> > +static void plic_irq_eoi(struct irq_data *d)
> > +{
> > +     struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > +     unsigned int irq = irq_find_mapping(handler->priv->irqdomain, d->hwirq);
> > +
> > +     /*
> > +      * For Renesas RZ/Five (R9A07G043) SoC if the interrupt type is
> > +      * IRQ_TYPE_EDGE_RISING we have already acknowledged it in the
> > +      * handler.
> > +      */
> > +     if (handler->priv->intsize == PLIC_INTERRUPT_CELL_SIZE2 &&
>
> This costs you an extra two reads on the fast path, which is an
> unnecessary overhead for existing systems that do not suffer from this
> problem. Consider turning it into a static key.
>
Sorry, by static key what did you mean?

> Also, blindly renaming  plic_irq_eoi() to ack() is extremely
> confusing. I really think you should have your own callbacks instead
> of making a mess of the existing one.
>
Ok will do.

> > +         (irq_get_trigger_type(irq) & IRQ_TYPE_EDGE_RISING))
> > +             return;
> > +
> > +     plic_irq_ack(d);
> > +}
> > +
> >  static const struct irq_chip plic_chip = {
> >       .name           = "SiFive PLIC",
> >       .irq_mask       = plic_irq_mask,
> > @@ -198,6 +218,19 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> >       return 0;
> >  }
> >
> > +static int plic_irq_domain_translate(struct irq_domain *d,
> > +                                  struct irq_fwspec *fwspec,
> > +                                  unsigned long *hwirq,
> > +                                  unsigned int *type)
> > +{
> > +     struct plic_priv *priv = d->host_data;
> > +
> > +     if (priv->intsize == PLIC_INTERRUPT_CELL_SIZE2)
> > +             return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> > +
> > +     return irq_domain_translate_onecell(d, fwspec, hwirq, type);
> > +}
> > +
> >  static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >                                unsigned int nr_irqs, void *arg)
> >  {
> > @@ -206,7 +239,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >       unsigned int type;
> >       struct irq_fwspec *fwspec = arg;
> >
> > -     ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
> > +     ret = plic_irq_domain_translate(domain, fwspec, &hwirq, &type);
> >       if (ret)
> >               return ret;
> >
> > @@ -220,11 +253,55 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >  }
> >
> >  static const struct irq_domain_ops plic_irqdomain_ops = {
> > -     .translate      = irq_domain_translate_onecell,
> > +     .translate      = plic_irq_domain_translate,
> >       .alloc          = plic_irq_domain_alloc,
> >       .free           = irq_domain_free_irqs_top,
> >  };
> >
> > +/*
> > + * On Renesas RZ/Five (R9A07G043) SoC IRQ_TYPE_LEVEL_HIGH and
> > + * IRQ_TYPE_EDGE_RISING interrupts are the supported interrupt types.
> > + * If the global interrupt source was edge-triggered NCEPLIC100 (PLIC
> > + * core on Renesas RZ/Five SoC) ignores next edge interrupts until the
> > + * previous completion message is received. NCEPLIC100 on Renesas RZ/Five
> > + * SoC doesn't stack the pending interrupts so in case there is a delay
> > + * in handling the IRQ_TYPE_EDGE_RISING interrupt we lose the subsequent
> > + * interrupts. The workaround for IRQ_TYPE_EDGE_RISING interrupt is to
> > + * first we have to claim the interrupt by reading the claim register,
> > + * then quickly issue an complete interrupt by writing the source ID
> > + * register back to the claim  register and then later run the handler.
> > + */
> > +static void renesas_rzfive_plic_handle_irq(struct irq_desc *desc)
> > +{
> > +     struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > +     struct irq_chip *chip = irq_desc_get_chip(desc);
> > +     void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
> > +     irq_hw_number_t hwirq;
> > +     unsigned int irq;
> > +     int err;
> > +
> > +     WARN_ON_ONCE(!handler->present);
> > +
> > +     chained_irq_enter(chip, desc);
> > +
> > +     while ((hwirq = readl(claim))) {
> > +             irq = irq_find_mapping(handler->priv->irqdomain, hwirq);
> > +             if (!irq) {
> > +                     pr_warn_ratelimited("can't find mapping for hwirq %lu\n", hwirq);
> > +                     break;
> > +             }
> > +
> > +             if (irq_get_trigger_type(irq) & IRQ_TYPE_EDGE_RISING)
> > +                     plic_irq_ack(irq_get_irq_data(irq));
> > +
> > +             err = generic_handle_irq(irq);
>
> No. We're not going back to this sort of constructs. Using the
> fasteoi_ack flow should work if properly configured. Also, looking up
> the interrupt *four* times in various tables/trees is not exactly the
> sort of things I want to see for a driver written in this century.
>
> Please explain why fasteoi_ack doesn't work. It really should work out
> of the box (I asked you to look into debugfs last time, but didn't ear
> anything from you on the subject). And if something is broken, let's
> fix it. But none of the above, please.
>
Handling an interrupt is a two-step process [0] first you claim the
interrupt by reading the claim register, then you complete the
interrupt by writing that source ID back to the same claim register.

Now if we go with fasteoi_ack flow this wont fit as we are first
writing into the claim register (Interrupt completion) and then in the
chained handler we are reading the claim register (claim the
interrupt) and then run the handler (which my RFC patch did).

With this patch I make sure we follow [0] for LEVEL interrupt and and
for EDGE we first claim then issue interrupt completion if EDGE
interrupt and then later run the handler (due to the core issue).

Let me know if my understanding is wrong here.

[0] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#interrupt-flow

> > +             if (err)
> > +                     pr_warn_ratelimited("error handling irq %u\n", irq);
> > +     }
> > +
> > +     chained_irq_exit(chip, desc);
> > +}
> > +
> >  /*
> >   * Handling an interrupt is a two-step process: first you claim the interrupt
> >   * by reading the claim register, then you complete the interrupt by writing
> > @@ -288,11 +365,20 @@ static int __init plic_init(struct device_node *node,
> >       u32 nr_irqs;
> >       struct plic_priv *priv;
> >       struct plic_handler *handler;
> > +     irq_flow_handler_t plic_chanined_handler;
> >
> >       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> >       if (!priv)
> >               return -ENOMEM;
> >
> > +     if (of_property_read_u32(node, "#interrupt-cells", &priv->intsize))
> > +             return -EINVAL;
> > +
> > +     if (priv->intsize == PLIC_INTERRUPT_CELL_SIZE2)
>
> Please gate this on the compatible string, not on the number of cells.
>
Sure will do.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
