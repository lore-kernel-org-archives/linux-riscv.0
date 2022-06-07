Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1179C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 12:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrm3C7dfclfWqjY0AGyK6Q7WpWRIABAel+5AI2g99/U=; b=EsAFXJ83gBy+08
	nVGPidic2ofSMg8UQlO05Jfq1qsp55k88IiKw2AWvSZEgb8LVYKm/r0KcEsHjYahugAPX5AVQxbZp
	URODcAPl7Oxk3S4HIMyU/efVc/wGgkudnsWW64qL5fzjbuoHEmLAc8wGFmcOMCbQ6bZSHnBo4lD+j
	5oZ0Z4MjttCDMjZKknF0PxmIeABAIXlEgpz4piVKCaSitMTckvpg5FtOQanCHmHL7hUVL/dVK6MhQ
	eeG3+e6cLLiqN9OPg555cFcu0BimfqaVN3LVyiXbV3koWt0jGwrOf7Gp8Yj9XyIZs3rCI2aV4Z1BZ
	i/iF87/eDLKdtQsjVDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYXw-007Q4B-R5; Tue, 07 Jun 2022 12:42:56 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyYWo-007PKB-Kx
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 12:41:48 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-30c143c41e5so173999897b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=imu3RAy17O3xYzLzj29191Uurx3QbXXQ67LBoXgR1Ss=;
        b=GYjKq01x7+sad07xx8Ceb64jKJzc+op9gTL5tI/tHOFKpwr2FveRdU2xCwrgCtW8aM
         ZWxVLWwI219sDRARMit+S0FpI/ZkHohtZbY3jv5LNZWrWq+B4q9gwd1Yw3sfMV1Os3I6
         U71+WxuNQlEPL3uhtZyJEQNo3mifSD8qaKdwfZnzM0hS3MxnG3mvEV61F6eU/zaH89OG
         f4yD+KYcPXaiRSn5QRTVRzJ26UQoUhFN7vCBVNI+mIr6tH0LeVF3criKWWp3aYww8flI
         B7/HzeDPnzZRPgUR6UohXs8NSHwiPksJtYwarMfSHMv5cBjAx5rEuc3zChWGZBcbyig4
         47Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=imu3RAy17O3xYzLzj29191Uurx3QbXXQ67LBoXgR1Ss=;
        b=trwIjS7LpyGvkGHcHYXafWWB1vNadY8vf2JpGFFhSdsjIdxvrJWJ1jnBlhsNXNmpl7
         QgDECr6hHB8jCNnKeY9aoQ/3VZIBv1SCWKD0nFisT4W7gmUr1IwIJK1jByXgQanNpAPS
         vCfgI+QDLD3M7P4dRIKlXf9zRsBHCKn/AIF/j1/FtVxjBMsnq/FwEJ1Hk9fZI09Fn68l
         JPR5w6cmBjWKxEV8ippsYiwZHgfqOXqsjdwzyrZaG+bTpEaNJ4MFYqSOp79+EmBeA5G7
         6jDrhxjWOm+IwYAPn0wYEED9Mfbzn9plSEWxbqc6fuTi+XX7DFPehH28PAmmEvv95C8g
         Ae9A==
X-Gm-Message-State: AOAM533uaAE9toz99bF3bqHO+yzjUYH+gmhT3EChZmg0+Ech469Harbf
	grMMfiQdzd9t3oNKGyIgHNXP8kpvJSSVxgHpX74=
X-Google-Smtp-Source: ABdhPJw2njVFVWdRIpcT95AAL06Uur0AIIRAASfMMVkezO+AcAdLA5sbw2VKoaUirhLjUWv8kuJ/ps4qfmiwWwyTq2o=
X-Received: by 2002:a81:6d89:0:b0:313:43b6:e9aa with SMTP id
 i131-20020a816d89000000b0031343b6e9aamr2418963ywc.119.1654605702912; Tue, 07
 Jun 2022 05:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vfzsB55YdFmtx3eim617b=WCYJu+Tm3SO9c1QCB3i0Lw@mail.gmail.com> <87r1414x5f.wl-maz@kernel.org>
In-Reply-To: <87r1414x5f.wl-maz@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 7 Jun 2022 13:41:16 +0100
Message-ID: <CA+V-a8sRW7oUmwOmzBx8cpk+n=cRofh3vT1cmroH_ESHN+Z3YA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: Marc Zyngier <maz@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_054146_727398_DCDA93E0 
X-CRM114-Status: GOOD (  42.34  )
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

On Mon, Jun 6, 2022 at 4:41 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 27 May 2022 12:05:38 +0100,
> "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi,
> >
> > On Tue, May 24, 2022 at 6:22 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > >
> > > The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> > > NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> > > case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> > > edge until the previous completion message has been received and
> > > NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> > > interrupts if not acknowledged in time.
> > >
> > > So the workaround for edge-triggered interrupts to be handled correctly
> > > and without losing is that it needs to be acknowledged first and then
> > > handler must be run so that we don't miss on the next edge-triggered
> > > interrupt.
> > >
> > > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> > > support to change interrupt flow based on the interrupt type. It also
> > > implements irq_ack and irq_set_type callbacks.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/irqchip/Kconfig           |  1 +
> > >  drivers/irqchip/irq-sifive-plic.c | 71 ++++++++++++++++++++++++++++++-
> > >  2 files changed, 70 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > > index f3d071422f3b..aea0e4e7e547 100644
> > > --- a/drivers/irqchip/Kconfig
> > > +++ b/drivers/irqchip/Kconfig
> > > @@ -537,6 +537,7 @@ config SIFIVE_PLIC
> > >         bool "SiFive Platform-Level Interrupt Controller"
> > >         depends on RISCV
> > >         select IRQ_DOMAIN_HIERARCHY
> > > +       select IRQ_FASTEOI_HIERARCHY_HANDLERS
> > >         help
> > >            This enables support for the PLIC chip found in SiFive (and
> > >            potentially other) RISC-V systems.  The PLIC controls devices
> > > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > index bb87e4c3b88e..abffce48e69c 100644
> > > --- a/drivers/irqchip/irq-sifive-plic.c
> > > +++ b/drivers/irqchip/irq-sifive-plic.c
> > > @@ -60,10 +60,13 @@
> > >  #define        PLIC_DISABLE_THRESHOLD          0x7
> > >  #define        PLIC_ENABLE_THRESHOLD           0
> > >
> > > +#define RENESAS_R9A07G043_PLIC         1
> > > +
> > >  struct plic_priv {
> > >         struct cpumask lmask;
> > >         struct irq_domain *irqdomain;
> > >         void __iomem *regs;
> > > +       u8 of_data;
> > >  };
> > >
> > >  struct plic_handler {
> > > @@ -163,10 +166,31 @@ static int plic_set_affinity(struct irq_data *d,
> > >  }
> > >  #endif
> > >
> > > +static void plic_irq_ack(struct irq_data *d)
> > > +{
> > > +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > > +
> > > +       if (irqd_irq_masked(d)) {
> > > +               plic_irq_unmask(d);
> > > +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > > +               plic_irq_mask(d);
> > > +       } else {
> > > +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > > +       }
> > > +}
> > > +
> > I sometimes still see an interrupt miss!
> >
> > As per [0], we first need to claim the interrupt by reading the claim
> > register which needs to be done in the ack callback (which should be
> > doable) for edge interrupts, but the problem arises in the chained
> > handler callback where it does claim the interrupt by reading the
> > claim register.
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
> > I was thinking I would get around by getting the irqdata in
> > plic_handle_irq() callback using the irq_desc (struct irq_data *d =
> > &desc->irq_data;) and check the d->hwirq but this will be always 9.
> >
> >         plic: interrupt-controller@12c00000 {
> >             compatible = "renesas-r9a07g043-plic";
> >             #interrupt-cells = <2>;
> >             #address-cells = <0>;
> >             riscv,ndev = <543>;
> >             interrupt-controller;
> >             reg = <0x0 0x12c00000 0 0x400000>;
> >             clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> >             clock-names = "plic100ss";
> >             power-domains = <&cpg>;
> >             resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> >             interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
> >         };
> >
> > Any pointers on how this could be done sanely.
>
> Why doesn't the chained interrupt also get the ack-aware irq_chip?
>
Sorry for being naive, could you please elaborate on this.

Cheers,
Prabhakar

>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
