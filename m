Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80202C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXXJQg8HfsylhlT9B6FPJMUGqz2LlOW9vDiScICFZeE=; b=tTgKnvGe2bkncb
	Sj3rqWfNiUWM3h2vh4sPuSYnWKbxua5Y9QzlmMNakxW0KYobOnz7oi29uj812JKbGgOEjusNzCTaz
	aEc/WG1dg2ewaSD6zNHaWZkhc8JudTeD78bnSKyHMbf8BoXi1o1fHBrNi/NI0JTsVZdR5nxK4PC5H
	j/BgSibtGIwUSSO4+3Rds+wmE9vYB0xZJF0SQ91hG760reYrQNVxuABSStIYPa+DbEUHzyPHuI2y6
	abAzSBg2UUr+w4HCfphmrPIHNKdNXJUnkVvWD7p3bVzdLtGhOSWSDED76IcWVHqHFD2ee2+WfUZph
	0Pl95FSQt0zmaZ56Bh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5OjA-00AwUW-9Q; Sun, 26 Jun 2022 09:38:48 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5Oj7-00AwT4-Lc
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 09:38:47 +0000
Received: by mail-yb1-xb31.google.com with SMTP id i7so11865126ybe.11
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jun 2022 02:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IrM8fmr9I0h54joG6BsHjIRR3lQUddnSZFNyk9j4QG4=;
        b=VIbd3IoqOjQ7kptkvw8VpO/Ck4M3JFTFDFvSfVpu4sVCn9Z5yr6JUFEc+wVx5N8J/4
         umaqV7Cw9xMiuDU5LKqvMfltci1x6uTEexYtgNY8XPV8nGPGra1rVfxbSlH18/I1P0HN
         Fgoghf6rlkFQuCG2W2/dq7ZaH+65nGU1HUDJjwDCkw1YJjlf7B0rCABhNtu0voHVAvf/
         nJ/Vc4aLeWIZdyepaStSlzpJ1o+7seFnTPjrU1+9LyADwEyi09AM5zGzC6rbzQaf/nb+
         BFRLSWFZdI2nFrIDSW0xCCDnn6Qlr9aUMAZY2PM8/58tWA/owCIi25c1Nz1hRMWMASfE
         gPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IrM8fmr9I0h54joG6BsHjIRR3lQUddnSZFNyk9j4QG4=;
        b=HqytmXd/QW6KRLu87aLANpbb41BNGsy1l/L7Y7JdWahacRlfXPhndOiQwMwLZ6bNIX
         Dq/3mWxdeXYgELoi9gah7bNmtzlRTGhtDS4KotqWK8shfBe+CKNOqozUzb7AZQexnzvc
         70NzNQr+6dUA+t2Pm58oDi+xkvIhDlJ/ko/ckyRDA8yMTeLJMeMSoIYA4inwwsSR50bd
         l2l23zZV/1MBMPUF/Z1wYIn/43jI8eUJSECkQfW2rreXzmcxYYYiExx5jfkEhcNrRi/j
         hrVfsDyB+98+VfZO7J9kkC05X0T6CdhQTQfiR5ooT56b6UbeyRA57af53W3/liWh5mcK
         p/vA==
X-Gm-Message-State: AJIora/e0NuGzghjl/5DXUa1oNm6amVz0w6mdLg+AzjAmcqgTznH661A
	Mh1L41mfcogiz1xTd2OWbM7+Sbslq+W6WxmqWMw=
X-Google-Smtp-Source: AGRyM1tZBKCNypkn3sLco2bO7U3aW6bsdf7VDZcN1ireIxS0m1ONqgAohIha7ZFF/SwBKOwt+mUqHn8nmyPXWpLHpz4=
X-Received: by 2002:a25:5f50:0:b0:66c:ae4c:264d with SMTP id
 h16-20020a255f50000000b0066cae4c264dmr1451655ybm.417.1656236323869; Sun, 26
 Jun 2022 02:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <87wnd3erab.wl-maz@kernel.org>
In-Reply-To: <87wnd3erab.wl-maz@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 26 Jun 2022 10:38:18 +0100
Message-ID: <CA+V-a8tcxj_N0sBHhgAZAN8WSJ12JnDzAvUUnCXto3wHLqNVwg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
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
X-CRM114-CacheID: sfid-20220626_023845_765921_592E028F 
X-CRM114-Status: GOOD (  37.81  )
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

On Sun, Jun 26, 2022 at 9:56 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 26 Jun 2022 01:43:26 +0100,
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
> > This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> > support to change interrupt flow based on the interrupt type. It also
> > implements irq_ack and irq_set_type callbacks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > * Implemented IRQ flow as suggested by Marc
> >
> > RFC-->v1:
> > * Fixed review comments pointed by Geert
> > * Dropped handle_fasteoi_ack_irq support as for the PLIC we need to
> > claim the interrupt by reading the register and then acknowledge it.
> > * Add a new chained handler for RZ/Five SoC.
> > ---
> >  drivers/irqchip/Kconfig           |  1 +
> >  drivers/irqchip/irq-sifive-plic.c | 73 ++++++++++++++++++++++++++++++-
> >  2 files changed, 72 insertions(+), 2 deletions(-)
>
> [...]
>
> >
> > +static int plic_irq_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +     struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> > +
> > +     if (handler->priv->of_data != RENESAS_R9A07G043_PLIC)
> > +             return 0;
> > +
> > +     switch (type) {
> > +     case IRQ_TYPE_LEVEL_HIGH:
> > +             irq_set_chip_handler_name_locked(d, &renesas_rzfive_edge_plic_chip,
> > +                                              handle_fasteoi_ack_irq,
> > +                                              "Edge");
> > +             break;
> > +
> > +     case IRQ_TYPE_EDGE_RISING:
> > +             irq_set_chip_handler_name_locked(d, &plic_chip,
> > +                                              handle_fasteoi_irq,
> > +                                              "Level");
> > +             break;
>
> Really? Have you even tested this?
>
Ouch my bad, while rebasing I did swap this up!

> > +
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> >                             irq_hw_number_t hwirq)
> >  {
> > @@ -198,6 +248,19 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
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
> > +     if (priv->of_data == RENESAS_R9A07G043_PLIC)
> > +             return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> > +
> > +     return irq_domain_translate_onecell(d, fwspec, hwirq, type);
> > +}
> > +
> >  static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >                                unsigned int nr_irqs, void *arg)
> >  {
> > @@ -206,7 +269,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >       unsigned int type;
> >       struct irq_fwspec *fwspec = arg;
> >
> > -     ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
> > +     ret = plic_irq_domain_translate(domain, fwspec, &hwirq, &type);
> >       if (ret)
> >               return ret;
> >
> > @@ -220,7 +283,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> >  }
> >
> >  static const struct irq_domain_ops plic_irqdomain_ops = {
> > -     .translate      = irq_domain_translate_onecell,
> > +     .translate      = plic_irq_domain_translate,
> >       .alloc          = plic_irq_domain_alloc,
> >       .free           = irq_domain_free_irqs_top,
> >  };
> > @@ -293,6 +356,11 @@ static int __init plic_init(struct device_node *node,
> >       if (!priv)
> >               return -ENOMEM;
> >
> > +     if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
> > +             priv->of_data = RENESAS_R9A07G043_PLIC;
> > +             plic_chip.name = "Renesas RZ/Five PLIC";
>
> NAK. The irq_chip structure isn't the place for platform marketing.
> This is way too long anyway (and same for the edge version), and you
> even sent me a patch to make that structure const...
>
My bad will drop this.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
