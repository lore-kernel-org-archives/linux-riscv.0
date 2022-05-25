Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54875C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjmpbABQD/zocw41ICnlvJ67LpKDTriZ9gpbjIofsFE=; b=v/TxWYbQ7zNAzT
	aso0RCp1j7CMup7zliY24pyiNqbhB+s/gkOFQqe0EQCLUykD+/hvrDOHmXuKNPiBtTpVJOouJsD38
	rfdLUqV/hdlHXdgqLY/W7uQzNmHOtql0iCDyPA4pamgEzYLfZRyGFr6EtsZ+F22SM2Z5vA7rt/w9L
	51c+Cxd5b8U06tnNZtuKmJn40uzQVJeoxD27YxYazL7Z7Yj2OpmLu3vmQpPIA7Uo4HvNK8LhzNZtT
	n+NAtoz35j8zC7AmF4AtVAJm20Ddb3tSwKzJOR9VAlJ2B8U+ZgKtXdSC1Zp+TemJF2D8NboQktNsB
	bHu6xhVgeqFjhZfU633A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntlxF-00AGMa-6H; Wed, 25 May 2022 08:01:17 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntlxB-00AGLI-FB
 for linux-riscv@lists.infradead.org; Wed, 25 May 2022 08:01:15 +0000
Received: by mail-qk1-f180.google.com with SMTP id t2so12564997qkb.12
 for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 01:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rlhkBuzRG2HpsdoImNR9zGgXgfkVtL8VEEmP1MsIdp4=;
 b=4TwFFC7qigz9nwAGcjyz6s9vvJQMT+6ZFN/Q6g0G4uGbJz3Ev+fS0sOkzFoVVaWxIr
 ubf4ujIXzqDjiZjUf72ZiYCf7y+0BDrt5liqgUvgwQCQH0ISaMQVmcDIoBpTa6yeqp1i
 lwiGeVCpPJkaoarCsPYOiiJT156Sa45QraPTogJ5Thvcs1f27I9OFnVnwU+H47JZM2pr
 VEe7epLZDufr3EbDqNoEyDmubJgBPGZ6jsyPXOyvG3R6ea3PsS6kzkeSLL811UPkNWAm
 ILiN3PICwdH5AZSNFiZq3k05y9sjasltveBHo2mcdYnQ4caRInl8JGEyZQUCCco3ZsZU
 QjTg==
X-Gm-Message-State: AOAM533KomhVvfC72Co5uVLzMTZ/+5oimlcWy7iNQyGkIdClgfHBwSUY
 On8NViKV9Bdyo0UiyAlZ1lBh9jEKSrMcYQ==
X-Google-Smtp-Source: ABdhPJwiG5uEoKwzAT/xOKHU1pk4ojm4LSEoaSFv78ubUoTH0GiNZYEopdkRDkpkqW1LrryYjs+I/A==
X-Received: by 2002:a37:80c3:0:b0:6a3:6e57:ec58 with SMTP id
 b186-20020a3780c3000000b006a36e57ec58mr11772339qkd.398.1653465671760; 
 Wed, 25 May 2022 01:01:11 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 i185-20020a3754c2000000b0069fc13ce23esm842568qkb.111.2022.05.25.01.01.09
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 01:01:10 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2ff90e0937aso131572277b3.4
 for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 01:01:09 -0700 (PDT)
X-Received: by 2002:a81:ad11:0:b0:2fe:fb00:a759 with SMTP id
 l17-20020a81ad11000000b002fefb00a759mr32321342ywh.283.1653465668841; Wed, 25
 May 2022 01:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220524172214.5104-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 May 2022 10:00:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0pqr8pmbX8OfUyTeEwiFGSG5uyP4nLG1LPy7_zzLPbQ@mail.gmail.com>
Message-ID: <CAMuHMdX0pqr8pmbX8OfUyTeEwiFGSG5uyP4nLG1LPy7_zzLPbQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Phil Edworthy <phil.edworthy@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_010113_547740_C1C1F563 
X-CRM114-Status: GOOD (  45.38  )
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

Hi Prabhakar,

On Tue, May 24, 2022 at 7:22 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> edge until the previous completion message has been received and
> NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> interrupts if not acknowledged in time.
>
> So the workaround for edge-triggered interrupts to be handled correctly
> and without losing is that it needs to be acknowledged first and then
> handler must be run so that we don't miss on the next edge-triggered
> interrupt.
>
> This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> support to change interrupt flow based on the interrupt type. It also
> implements irq_ack and irq_set_type callbacks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -60,10 +60,13 @@
>  #define        PLIC_DISABLE_THRESHOLD          0x7
>  #define        PLIC_ENABLE_THRESHOLD           0
>
> +#define RENESAS_R9A07G043_PLIC         1
> +
>  struct plic_priv {
>         struct cpumask lmask;
>         struct irq_domain *irqdomain;
>         void __iomem *regs;
> +       u8 of_data;

Usually it's cleaner to use feature bits instead of enum types.

>  };
>
>  struct plic_handler {
> @@ -163,10 +166,31 @@ static int plic_set_affinity(struct irq_data *d,
>  }
>  #endif
>
> +static void plic_irq_ack(struct irq_data *d)
> +{
> +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +

No check for RZ/Five or irq type?
.irq_ack() seems to be called for level interrupts, too
(from handle_level_irq() through mask_ack_irq()).

> +       if (irqd_irq_masked(d)) {
> +               plic_irq_unmask(d);
> +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +               plic_irq_mask(d);
> +       } else {
> +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> +       }
> +}

The above is identical to the old plic_irq_eoi()...

> +
>  static void plic_irq_eoi(struct irq_data *d)
>  {
>         struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
>
> +       /*
> +        * For Renesas R9A07G043 SoC if the interrupt type is EDGE
> +        * we have already acknowledged it in ack callback.
> +        */
> +       if (handler->priv->of_data == RENESAS_R9A07G043_PLIC &&
> +           !irqd_is_level_type(d))
> +               return;
> +

... so you can just call into plic_irq_ack() here?

>         if (irqd_irq_masked(d)) {
>                 plic_irq_unmask(d);
>                 writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> @@ -176,11 +200,37 @@ static void plic_irq_eoi(struct irq_data *d)
>         }
>  }
>
> +static int plic_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +
> +       if (handler->priv->of_data != RENESAS_R9A07G043_PLIC)
> +               return 0;
> +
> +       switch (type) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               irq_set_handler_locked(d, handle_fasteoi_irq);
> +               break;
> +
> +       case IRQ_TYPE_EDGE_RISING:
> +               irq_set_handler_locked(d, handle_fasteoi_ack_irq);
> +               break;
> +
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
>  static struct irq_chip plic_chip = {

I think this can be const.

>         .name           = "SiFive PLIC",
>         .irq_mask       = plic_irq_mask,
>         .irq_unmask     = plic_irq_unmask,
> +       .irq_ack        = plic_irq_ack,

This causes extra processing on non-affected PLICs.
Perhaps use a separate irq_chip instance?

>         .irq_eoi        = plic_irq_eoi,
> +       .irq_set_type   = plic_irq_set_type,
> +
>  #ifdef CONFIG_SMP
>         .irq_set_affinity = plic_set_affinity,
>  #endif
> @@ -198,6 +248,19 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>         return 0;
>  }
>
> +static int plic_irq_domain_translate(struct irq_domain *d,
> +                                    struct irq_fwspec *fwspec,
> +                                    unsigned long *hwirq,
> +                                    unsigned int *type)
> +{
> +       struct plic_priv *priv = d->host_data;
> +
> +       if (priv->of_data == RENESAS_R9A07G043_PLIC)
> +               return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +
> +       return irq_domain_translate_onecell(d, fwspec, hwirq, type);

This one clearly shows the discerning feature: onecell or twocell...

> +}
> +
>  static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>                                  unsigned int nr_irqs, void *arg)
>  {

> @@ -293,6 +356,9 @@ static int __init plic_init(struct device_node *node,
>         if (!priv)
>                 return -ENOMEM;
>
> +       if (of_device_is_compatible(node, "renesas-r9a07g043-plic"))
> +               priv->of_data = RENESAS_R9A07G043_PLIC;
> +

So perhaps instead just look at #interrupt-cells, and use the onecell
or twocell irq_chip/irq_domain_ops based on that?

>         priv->regs = of_iomap(node, 0);
>         if (WARN_ON(!priv->regs)) {
>                 error = -EIO;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
