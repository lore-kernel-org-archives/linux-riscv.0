Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6B2C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 04:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVa/jiS4NTvXnRPcbo/zFoGAAxRS3icsuoLBTGvERxM=; b=0ib2d7yR5ju3Ms
	2Xebd8OuZHD1ixg/mJEctqhMmc+YstkiJorLGjQtDdZmm6OOxoQoDDKxJ8Xhm2kdIEizLDbCutgcu
	d/1MNi8BeRgTPRK6agHpZTR91dGicXLm3gpQApOprOSdLMVlGXeAEzqAGJ7TKcAunzpGCD2hPPe96
	2880SaVyspBajydZ2SfJQkQByIWLrw+h8Pli2Y6alEbKLrp1g57vgO2IO+jS06NeN9pyaPbaWHr+b
	vEJGYCZ4l55hQvQb7STBSW0XE06e6pU5sc3KeoukM4XySPguV+esRL6JeQ5WM/hUZ2tAqPMZvMAy3
	/D0bHrdYTW0vb/WZ9HXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nE20E-005tF0-Cx; Sun, 30 Jan 2022 04:39:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE20B-005tEf-Sb
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 04:39:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C6EC60B35
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 04:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B359AC340EE
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 04:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643517586;
 bh=lIqRpPgt5ZOVkSCMuU19p1CNRtGg2YZr+XSa0dYDS+0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NI37Edd5mq8IuZsVED+WhDdLWfGibvSriiMCP9y9naW5dTZSy06iAr2MoPsW8rA90
 KpN4idAM3HCQ0UlGNxXJ3F+viY09XkOSns2AyowHOCdnQhWkvlKGAjE7nGphqLTgbf
 //UqcC0FvwcCwDYrXH2/okvkkI5788n2jYu0btC7ZuoJ3Ssl7WIDqTkPWXG6cuF5l8
 89Z1umkdtPwoR6NybrJ8UdqBoRGYfwxjzTjwjcajqtLVQ8f6LHLBZDuDXbcUvz60Ic
 JtebXv7aNB3XYXwPvos1hu9l4bWbZt+vJMC/XoL15400IpVpDr1Avqklb1coxgRoRZ
 IEcl96KFrwREw==
Received: by mail-vs1-f48.google.com with SMTP id b2so7888466vso.9
 for <linux-riscv@lists.infradead.org>; Sat, 29 Jan 2022 20:39:46 -0800 (PST)
X-Gm-Message-State: AOAM530I9o2K3HmAaegklCjsLEo2nO9t9CooPm04lN6E+bi3Yd9SBM2o
 U+6W1+UG5Hr0eWfgaKyjPo4z8WzpTc+fBFKkr6c=
X-Google-Smtp-Source: ABdhPJw880aHNXeYkhi1jcDRAgJdMZlctpuVQKIFd6cUTVvaQDGDk82PM1yPlru7Wy+sN4aZVSRTzKsi4ZuU+1J/Vxw=
X-Received: by 2002:a67:e947:: with SMTP id p7mr6193021vso.59.1643517585723;
 Sat, 29 Jan 2022 20:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20220129162726.1154501-1-guoren@kernel.org>
 <20220129162726.1154501-3-guoren@kernel.org>
 <87r18qxui9.wl-maz@kernel.org>
 <CAJF2gTTYN0bxnnMtP9L1KvaH0h6ny+Lr3+fC7GP-YWnwjAYd4A@mail.gmail.com>
 <35b1838d-ef80-1816-46f6-9cba7afc813e@sholland.org>
In-Reply-To: <35b1838d-ef80-1816-46f6-9cba7afc813e@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 12:39:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQsi6uT8ea6MTu6oDA-9xsd3fW5ETHAtpzGZxapLpLsWA@mail.gmail.com>
Message-ID: <CAJF2gTQsi6uT8ea6MTu6oDA-9xsd3fW5ETHAtpzGZxapLpLsWA@mail.gmail.com>
Subject: Re: [PATCH V6 2/2] irqchip/sifive-plic: Fixup thead,c900-plic dt
 parse in opensbi
To: Samuel Holland <samuel@sholland.org>
Cc: Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_203948_031233_A4297930 
X-CRM114-Status: GOOD (  35.27  )
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

On Sun, Jan 30, 2022 at 10:50 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 1/29/22 8:08 PM, Guo Ren wrote:
> > On Sun, Jan 30, 2022 at 2:32 AM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On Sat, 29 Jan 2022 16:27:26 +0000,
> >> guoren@kernel.org wrote:
> >>>
> >>> From: Guo Ren <guoren@linux.alibaba.com>
> >>>
> >>> The thead,c900-plic has been used in opensbi to distinguish
> >>> PLIC [1]. Although PLICs have the same behaviors in Linux,
> >>> they are different hardware with some custom initializing in
> >>> firmware(opensbi).
> >>>
> >>> [1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6
> >>>
> >>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >>> Cc: Anup Patel <anup@brainfault.org>
> >>> Cc: Marc Zyngier <maz@kernel.org>
> >>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >>> Cc: Samuel Holland <samuel@sholland.org>
> >>> Cc: Thomas Gleixner <tglx@linutronix.de>
> >>> ---
> >>>  drivers/irqchip/irq-sifive-plic.c | 25 +++++++++++++++++++++++--
> >>>  1 file changed, 23 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> >>> index 259065d271ef..245655928076 100644
> >>> --- a/drivers/irqchip/irq-sifive-plic.c
> >>> +++ b/drivers/irqchip/irq-sifive-plic.c
> >>> @@ -172,7 +172,7 @@ static void plic_irq_eoi(struct irq_data *d)
> >>>       }
> >>>  }
> >>>
> >>> -static struct irq_chip plic_chip = {
> >>> +static struct irq_chip sifive_plic_chip = {
> >>>       .name           = "SiFive PLIC",
> >>>       .irq_mask       = plic_irq_mask,
> >>>       .irq_unmask     = plic_irq_unmask,
> >>> @@ -182,12 +182,24 @@ static struct irq_chip plic_chip = {
> >>>  #endif
> >>>  };
> >>>
> >>> +static struct irq_chip thead_plic_chip = {
> >>> +     .name           = "T-Head PLIC",
> >>> +     .irq_mask       = plic_irq_mask,
> >>> +     .irq_unmask     = plic_irq_unmask,
> >>> +     .irq_eoi        = plic_irq_eoi,
> >>> +#ifdef CONFIG_SMP
> >>> +     .irq_set_affinity = plic_set_affinity,
> >>> +#endif
> >>> +};
> >>
> >> For pure entertainment, let's compare the two structures:
> >>
> >> static struct irq_chip plic_chip = {
> >>         .name           = "SiFive PLIC",
> >>         .irq_mask       = plic_irq_mask,
> >>         .irq_unmask     = plic_irq_unmask,
> >>         .irq_eoi        = plic_irq_eoi,
> >> #ifdef CONFIG_SMP
> >>         .irq_set_affinity = plic_set_affinity,
> >> #endif
> >> };
> >>
> >> Oh wait: a string. Must be really important. Not.
> > No, pls see below comment.
> >
> >>
> >>> +
> >>> +static struct irq_chip *def_plic_chip = &sifive_plic_chip;
> >>> +
> >>>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> >>>                             irq_hw_number_t hwirq)
> >>>  {
> >>>       struct plic_priv *priv = d->host_data;
> >>>
> >>> -     irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> >>> +     irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
> >>>                           handle_fasteoi_irq, NULL, NULL);
> >>>       irq_set_noprobe(irq);
> >>>       irq_set_affinity(irq, &priv->lmask);
> >>> @@ -396,5 +408,14 @@ static int __init plic_init(struct device_node *node,
> >>>       return error;
> >>>  }
> >>>
> >>> +static int __init thead_c900_plic_init(struct device_node *node,
> >>> +             struct device_node *parent)
> >>> +{
> >>> +     def_plic_chip = &thead_plic_chip;
> >>> +
> >>> +     return plic_init(node, parent);
> >>> +}
> >>> +
> >>>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
> >>>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> >>> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> >>
> >> Sorry, but I can't see any point to this patch.
> > You didn't see the link I've put in the patch. In that opensbi patch:
> >
> >                 intc: interrupt-controller@10000000 {
> >                         #interrupt-cells = <1>;
> > -                       compatible = "riscv,plic0";
> > +                       compatible = "allwinner,sun20i-d1-plic",
> > +                                    "thead,c900-plic";
> >
> > +#define THEAD_PLIC_CTRL_REG 0x1ffffc
> > +
> > +static void thead_plic_plat_init(struct plic_data *pd)
> > +{
> > +       writel_relaxed(BIT(0), (void *)pd->addr + THEAD_PLIC_CTRL_REG);
> > +}
> > +
> >  static const struct fdt_match irqchip_plic_match[] = {
> >         { .compatible = "riscv,plic0" },
> >         { .compatible = "sifive,plic-1.0.0" },
> > +       { .compatible = "thead,c900-plic",
> > +         .data = thead_plic_plat_init },
> >         { },
> >  };
> >
> > We've changed the compatible name for thead,c900-plic, and there is no
> > riscv,plic0 / sifive,plic-1.0.0 in dts. Without the patch, the newest
> > opensbi + newest Linux would be broken in the Allwinner D1 dev board.
>
> Yes, some patch is still necessary, because the hardware is indeed incompatible
> with riscv,plic0. However, this driver does not care about the difference. So
> all you need to do is hook up the existing code to the new compatible:
>
> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init);
I think we should give clear info in /proc/interrupts. I hope we could
keep thead_plic_init.

>
> Regards,
> Samuel



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
