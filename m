Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413F8C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 02:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COeJfj9ZQZAQ+ArBWCaSQla1fZQvbg5igL4UNGJMiY0=; b=ZH5irf/GkOFB1r
	jaOraKZa1/33hfgI2IiKu7rZIVuiHoMrZ1pAhQKpppW4sHBc1S8mZtSGDwOvt4t7Nn9lnKrAZPxX0
	CrO+hlVBKNAoFov4dePRS2k/n1EFZdboLC3GwxI4GpiPpVW7wVaihfATCTHMgFM/uKnfdCpPcsW0B
	Ur6frRdZWQIwOntPlKNYmyXx8EC/y5rMU1LjdEZ7kQgS4HNozc5duh8y//wIJGJSYDDohC4otJEJr
	zvySPpkfgAQajJYgbgeh+G42gUY+zEwOKJ309hHAUldI0N8aQa24Ju4tdjuS6T/VV1x2evFcTfryE
	/nI/KzpZjTfNY9oS+Qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDzdd-005n9J-2q; Sun, 30 Jan 2022 02:08:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDzdZ-005n8u-QA
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 02:08:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83CACB82866
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 02:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4BBC340EE
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 02:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643508495;
 bh=3V6H56NIZMHAqm9Z0fpKVQ/bU1deS6S7JAioTpvD1M4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OTmBDMWld2fPY0IAjwncgvnEnCf2fO27sbM9PKyGKVmvZGp76Fvkp0Mfq1Bnu5kfZ
 RBKfUWZPecIyhX3i4GX+Fjes8N0dWUxsY0iyWjQb5m8FSRfpn1cPfrofQ8ZNSms4Bg
 910JJs1mtIep46XPfe3+3FG60Ex20dK0R/MTafeM6MJqN3uL7/yJeifJkPo3pWv1Ib
 flm/U6ZxXGkM9TvQDoWo9BKW2oM89YN39aJos2toLKp3kzAjIjRWgZOPgTwq5yabFe
 HtK/pnjZ76MF8+/o8SJ2GVrHexo2IyVEGDDOVUQNWth6jmOsmRLuZWI9X5ZxB1TMYi
 9CzOHqPqK+yuw==
Received: by mail-vk1-f180.google.com with SMTP id w17so6191329vko.9
 for <linux-riscv@lists.infradead.org>; Sat, 29 Jan 2022 18:08:15 -0800 (PST)
X-Gm-Message-State: AOAM531a4tlc4flEO6N5+NT0r3aTy2UAbWTh48ucgJm6vXTM7rGeBYcO
 +CvvKAfCsJfR1IvD5yz149wegqQ9+rGePCv5Fw0=
X-Google-Smtp-Source: ABdhPJxrzpxI8bv+XrH5itD+/Oj5rPfN0In7EL12ZCBIWAt1HX33g0ojST0LIWmJqwh28IscrmfNOC4zwCeOVQJd6ko=
X-Received: by 2002:a1f:640e:: with SMTP id y14mr6389746vkb.2.1643508494202;
 Sat, 29 Jan 2022 18:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20220129162726.1154501-1-guoren@kernel.org>
 <20220129162726.1154501-3-guoren@kernel.org>
 <87r18qxui9.wl-maz@kernel.org>
In-Reply-To: <87r18qxui9.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 10:08:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTYN0bxnnMtP9L1KvaH0h6ny+Lr3+fC7GP-YWnwjAYd4A@mail.gmail.com>
Message-ID: <CAJF2gTTYN0bxnnMtP9L1KvaH0h6ny+Lr3+fC7GP-YWnwjAYd4A@mail.gmail.com>
Subject: Re: [PATCH V6 2/2] irqchip/sifive-plic: Fixup thead,c900-plic dt
 parse in opensbi
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel@sholland.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_180818_151106_1C4D52CA 
X-CRM114-Status: GOOD (  31.22  )
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

On Sun, Jan 30, 2022 at 2:32 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 29 Jan 2022 16:27:26 +0000,
> guoren@kernel.org wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The thead,c900-plic has been used in opensbi to distinguish
> > PLIC [1]. Although PLICs have the same behaviors in Linux,
> > they are different hardware with some custom initializing in
> > firmware(opensbi).
> >
> > [1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Samuel Holland <samuel@sholland.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 25 +++++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 259065d271ef..245655928076 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -172,7 +172,7 @@ static void plic_irq_eoi(struct irq_data *d)
> >       }
> >  }
> >
> > -static struct irq_chip plic_chip = {
> > +static struct irq_chip sifive_plic_chip = {
> >       .name           = "SiFive PLIC",
> >       .irq_mask       = plic_irq_mask,
> >       .irq_unmask     = plic_irq_unmask,
> > @@ -182,12 +182,24 @@ static struct irq_chip plic_chip = {
> >  #endif
> >  };
> >
> > +static struct irq_chip thead_plic_chip = {
> > +     .name           = "T-Head PLIC",
> > +     .irq_mask       = plic_irq_mask,
> > +     .irq_unmask     = plic_irq_unmask,
> > +     .irq_eoi        = plic_irq_eoi,
> > +#ifdef CONFIG_SMP
> > +     .irq_set_affinity = plic_set_affinity,
> > +#endif
> > +};
>
> For pure entertainment, let's compare the two structures:
>
> static struct irq_chip plic_chip = {
>         .name           = "SiFive PLIC",
>         .irq_mask       = plic_irq_mask,
>         .irq_unmask     = plic_irq_unmask,
>         .irq_eoi        = plic_irq_eoi,
> #ifdef CONFIG_SMP
>         .irq_set_affinity = plic_set_affinity,
> #endif
> };
>
> Oh wait: a string. Must be really important. Not.
No, pls see below comment.

>
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
> > @@ -396,5 +408,14 @@ static int __init plic_init(struct device_node *node,
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
>
> Sorry, but I can't see any point to this patch.
You didn't see the link I've put in the patch. In that opensbi patch:

                intc: interrupt-controller@10000000 {
                        #interrupt-cells = <1>;
-                       compatible = "riscv,plic0";
+                       compatible = "allwinner,sun20i-d1-plic",
+                                    "thead,c900-plic";

+#define THEAD_PLIC_CTRL_REG 0x1ffffc
+
+static void thead_plic_plat_init(struct plic_data *pd)
+{
+       writel_relaxed(BIT(0), (void *)pd->addr + THEAD_PLIC_CTRL_REG);
+}
+
 static const struct fdt_match irqchip_plic_match[] = {
        { .compatible = "riscv,plic0" },
        { .compatible = "sifive,plic-1.0.0" },
+       { .compatible = "thead,c900-plic",
+         .data = thead_plic_plat_init },
        { },
 };

We've changed the compatible name for thead,c900-plic, and there is no
riscv,plic0 / sifive,plic-1.0.0 in dts. Without the patch, the newest
opensbi + newest Linux would be broken in the Allwinner D1 dev board.

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
