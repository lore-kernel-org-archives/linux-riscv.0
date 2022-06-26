Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E54C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 00:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb/q813AIFKM9zZlOSAdYDF/ctdmy/2ibKlAU/a5Z+w=; b=xU2AsNWvwQr+wQ
	8I6yx86aZJEAw0MuYR4UPmPR5YagCwYxxBQrcfeq/cdNpkr3xw72FFOJLGoP/FMFg4f5XghapD1Cb
	WJNz5Ky+U55xMrWpaOqgNOsxRvi0I5Ror2Iel9/9db1spE5frzXGHAyAHD6ugW5Bl7VQvDv3L2r4I
	1OK7tri3GxQHL2OcYUNEU/6P3sWYjOS20fqFS78UDv3LLPT8zr1d+dXsEI6uKkgbgLF8ZbEqK58LT
	shFsPfSBnLodQfMnGfjT9BaMhoiPLEIVQiTt1KsMC/+nGEcgl42e/Up4t5e/wHLygOedjj3ZoUhj2
	A6w9oCHNjdNQ/VPxDW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GFM-008hHq-Un; Sun, 26 Jun 2022 00:35:28 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GFJ-008hGS-LC
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 00:35:27 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id i7so10741710ybe.11
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jun 2022 17:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tj+3/i4dGkG1RXaP0jdbNan4HTbj1pH9ooQb/lBwHwQ=;
        b=U9K3FE1REOBbgp49jyF+b8nZSbECffDmcEL4J6vlgbTZZH65gltGezwnQAGJO/pmFb
         wBG3+WATVcSWEbPZsi4V1fqoOn57w7ZA0EjckhR0PkFfeF+2kB4K45khIhemwEzD/b7F
         8Ekp6AJ2AUJWT3gXPOXOUBZKcAEQeDBkS32quxK7Q6g4d2J0zVmSjvvtQTU95mmfE1wJ
         5DqpkXxmTG0O6tF4dx5svoevZwrtLxjBlH+Nn+LGqiG+LnQuMvDAjELn22ts/y2KLLI2
         SsTY5GPkqkiVHKPgpbN9UnzdcJpEaOzY5uoynrtZVgQKSPAwwEdGnSEZBMTFtI6PP2Dj
         jk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tj+3/i4dGkG1RXaP0jdbNan4HTbj1pH9ooQb/lBwHwQ=;
        b=L0fp5uPipfAvgkI/z3Mo2JGBwVBWeLjColmFqueMwIlIpCmRCDMG9fHDs/9FavVOsn
         Pjei4Of9RvUzPmHgaaoaI/pI6Rx9jrubQOWrl4vvxuLYMDNQO4HF5S2erWunvur94AVS
         +xtyUPgnMr302LZwB5KJeJc2EPhPXX7FQAlMl5u1WEL6hjPde9gqO1gVnbODHVJmXYT6
         1i/wj+4IUTDjRbzmnYHus0Nr7udj40JEQt5kqkfUmLts346MitcYjlB01F23jtXk0g8L
         z83qJ7Jgz9VqQAXZLOlrlLi+9B+EFFuTnE/E4JAV9Hk4teT598uOOZ+PZ1UsRcbnNvrd
         pxpg==
X-Gm-Message-State: AJIora/0QTezqohZwyApssE20QoPRdxeVlEwKrK0kHewFULbFzkGrEpj
	SkpGLE6gzsfONBb0NN4JTQbkpxgR5LWMgq1/rEc=
X-Google-Smtp-Source: AGRyM1vhGlkDaXxjpOuY6+cv3Yq5MQC11xily9cqoQuUATSSWpqv1DbiMdWSIGvLk0CfFwe+4pxZtFp4r5GtKQD86EA=
X-Received: by 2002:a25:1c04:0:b0:660:1ffc:fb9 with SMTP id
 c4-20020a251c04000000b006601ffc0fb9mr6615948ybc.431.1656203724095; Sat, 25
 Jun 2022 17:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220624180311.3007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220624180311.3007-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8735ftf73p.wl-maz@kernel.org> <CA+V-a8ukQsotuWLm6_qR79qO9n_Ffo2e79AitC_=53ocsjZtzA@mail.gmail.com>
 <87h7492c58.wl-maz@kernel.org> <CA+V-a8tFn7aS-1jD6o9TX9kNDQ=4S3xWCXwkww3Es2+Red6vmA@mail.gmail.com>
 <87zgi0eniw.wl-maz@kernel.org>
In-Reply-To: <87zgi0eniw.wl-maz@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 26 Jun 2022 01:34:58 +0100
Message-ID: <CA+V-a8tiU_vkd6Q=ypkJobopZ8fR-NUGftg5JB4nQEb04GLY9w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220625_173525_737843_56037782 
X-CRM114-Status: GOOD (  35.30  )
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

On Sat, Jun 25, 2022 at 5:05 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 25 Jun 2022 14:03:33 +0100,
> "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> >
> > [1  <text/plain; UTF-8 (7bit)>]
> > Hi Marc,
> >
> > On Sat, Jun 25, 2022 at 12:52 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
>
> [...]
>
> > > You are just reinventing the wheel we are already have, except that
> > > yours is a bit square ;-). What really should happen is that the
> > > set_type method should set the correct flow depending on the trigger
> > > of the interrupt, and *never* have to check the configuration on the
> > > handling path.
> > >
> > A Bit lost here..
> >
> > We have the below chained handler:
> >
> > static void plic_handle_irq(struct irq_desc *desc)
> > {
> >     struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >     struct irq_chip *chip = irq_desc_get_chip(desc);
> >     void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
> >     irq_hw_number_t hwirq;
> >
> >     WARN_ON_ONCE(!handler->present);
> >
> >     chained_irq_enter(chip, desc);
> >
> >     while ((hwirq = readl(claim))) {
> >         int err = generic_handle_domain_irq(handler->priv->irqdomain,
> >                             hwirq);
> >         if (unlikely(err))
> >             pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
> >                     hwirq);
> >     }
> >
> >     chained_irq_exit(chip, desc);
> > }
> >
> > static void plic_irq_eoi(struct irq_data *d)
> > {
> >     struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >
> >     if (irqd_irq_masked(d)) {
> >         plic_irq_unmask(d);
> >         writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >         plic_irq_mask(d);
> >     } else {
> >         writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >     }
> > }
> >
> > Where it's claiming -> handling interrupt -> interrupt completion in
> > eoi which is according to architecture.
> >
> >
> > Now with fasteoi_ack flow If I introduce the below ack callback to
> > issue interrupt completion.
> >
> > static void plic_irq_ack(struct irq_data *d)
> > {
> >     struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >
> >     if (irqd_irq_masked(d)) {
> >         plic_irq_unmask(d);
> >         writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >         plic_irq_mask(d);
> >     } else {
> >         writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >     }
> > }
> >
> > Here we are issuing an interrupt completion first, and later in the
> > handler  plic_handle_irq() we are claiming the interrupt by reading
> > the claim register. With this we are not following [0].
>
> Whatever [0] says doesn't really matter, since the HW is totally
> busted.
>
OK

> > Do you think this flow is OK (interrupt completion -> Interrupt claim
> > -> handle IRQ)?
>
> You keep missing my point. Edge and Level *must* have different flows
> and this also implies different callbacks. You can't just handle both
> at once. You should have something like this (untested):
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bb87e4c3b88e..5e072be32d9f 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -176,16 +176,52 @@ static void plic_irq_eoi(struct irq_data *d)
>         }
>  }
>
> +static int broken_set_type(struct irq_data *d, unsigned int type);
> +
>  static struct irq_chip plic_chip = {
>         .name           = "SiFive PLIC",
>         .irq_mask       = plic_irq_mask,
>         .irq_unmask     = plic_irq_unmask,
>         .irq_eoi        = plic_irq_eoi,
> +       .irq_set_type   = broken_set_type,
> +#ifdef CONFIG_SMP
> +       .irq_set_affinity = plic_set_affinity,
> +#endif
> +};
> +
> +static void broken_eoi(struct irq_data *data) {}
> +
> +static struct irq_chip plic_chip_edge = {
> +       .name           = "Edgy PLIC",
> +       .irq_mask       = plic_irq_mask,
> +       .irq_unmask     = plic_irq_unmask,
> +       .irq_ack        = plic_irq_eoi,
> +       .irq_eoi        = broken_eoi,
> +       .irq_set_type   = broken_set_type,
>  #ifdef CONFIG_SMP
>         .irq_set_affinity = plic_set_affinity,
>  #endif
>  };
>
> +static int broken_set_type(struct irq_data *d, unsigned int type)
> +{
> +       if (!plic_is_totaly_broken())
> +               return 0;
> +
> +       if (type == IRQ_TYPE_EDGE_RISING)
> +               irq_set_chip_handler_name_locked(d, plic_chip_edge,
> +                                                handle_fasteoi_ack_irq,
> +                                                "Edge");
> +       else if (type == IRQ_TYPE_LEVEL_HIGH)
> +               irq_set_chip_handler_name_locked(d, plic_chip,
> +                                                handle_fasteoi_irq,
> +                                                "Level");
> +       else
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>                               irq_hw_number_t hwirq)
>  {
>
> which applies the correct flow and chip depending on the trigger
> information. This also implies that for chained PLICs, the secondary
> PLIC output is handled as a level into the primary PLIC.
>
Agreed, the above chunk does work. I'll re-spin a v2 with the above included.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
