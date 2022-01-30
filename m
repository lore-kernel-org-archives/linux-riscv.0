Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F43C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+jCz1XTK6s/q1C2Igl9DwD/HWCUMVlpT6PZilKBOqg=; b=izmrOwM8nflPgH
	MTXpopS4gqBKxHUITfWcbGx/Q0zpgDqBOlCdAhWCaHstUZfUtELhmbfhTYDzgay84QTz9oEGcG/cQ
	dTJbLoDO5vba+uismqF/DdTBKkkcvjPKuoD1bvb12g38sfdrNVccPdaaR+VRveBQAEG7nxSPoklME
	C3TfjzRWHl/sf3fpOrtp1ABV70aMserf7sSsfFloRXmKVFQod/SpWGIVtc9iHwh2beoZ3dwPLY7eD
	WFFCvj27MEpvBR7kgtlJjXw/MFxQasfmOQCDHabikn0NTDzHc4hbkVq0IiZPK7L+kDdJ/53yGTrky
	wG46MCyJA7BojYAfBG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nE9xc-006ZBE-Pd; Sun, 30 Jan 2022 13:09:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nE9xX-006Z9g-MT
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 13:09:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F025611B7
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 13:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1F7C340E8
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643548173;
 bh=IEVaiXWmbvcl7fE6hskN08SZEi8quAo9Gg2OKQQyfEo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DwxFA/cg+r7Cw0WKrj8AMg0whBHb3GMZ5VOw5gu6qc5VBlFwizPp3iyvePS9W8lQ3
 Sp+mDI01a+mIXFiVbQ6eegDbDJsXHS20GzR77b2or++jS87wuaVmnvw9oVBUQV6qcG
 TY/CbFJuJZBnDU4M0hXNEjckWzDg3whhO0Nh6Z5khN7iQy/0+zKhCmnHdQIj/LS/lE
 1+ym1QX+qSyXuPZQiGzhOkG2dfLjk3SMFKrXn7FdxXgbUcfWG6rOhxe/g2vCBYTRsL
 yLAHuvlWND38aJW9RnGvkCB6DWJg3KUpYj2zAupASVgDftnCaJwyRnpXdVOQKYb9VF
 07I0tYoITLyxA==
Received: by mail-vs1-f51.google.com with SMTP id u14so8632552vsg.13
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 05:09:33 -0800 (PST)
X-Gm-Message-State: AOAM532SAmLYYt2FonM/YKdR7fMDElqg0wgyKEqwibMmLFjdizkhPEOf
 Kbf42rsGKl9ykhWwle+mXLJRR/2n/Rc5Pe7yofo=
X-Google-Smtp-Source: ABdhPJz/wqFW6kQRs/KIXn3iRbrlyamat4Ax8X17S8CkP6sb4dqKjGhOyfvgmh80FmQojhLAJAzFpS2GdxSCUhdoyLQ=
X-Received: by 2002:a67:f94e:: with SMTP id u14mr7206294vsq.2.1643548172776;
 Sun, 30 Jan 2022 05:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20220129162726.1154501-1-guoren@kernel.org>
 <20220129162726.1154501-3-guoren@kernel.org>
 <87r18qxui9.wl-maz@kernel.org>
 <CAJF2gTTYN0bxnnMtP9L1KvaH0h6ny+Lr3+fC7GP-YWnwjAYd4A@mail.gmail.com>
 <35b1838d-ef80-1816-46f6-9cba7afc813e@sholland.org>
 <CAJF2gTQsi6uT8ea6MTu6oDA-9xsd3fW5ETHAtpzGZxapLpLsWA@mail.gmail.com>
 <87o83ty0ti.wl-maz@kernel.org>
In-Reply-To: <87o83ty0ti.wl-maz@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 30 Jan 2022 21:09:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR=Gyw33dt36g+uqDSMckqJW+bifpue2N_+FAMEn4NqAQ@mail.gmail.com>
Message-ID: <CAJF2gTR=Gyw33dt36g+uqDSMckqJW+bifpue2N_+FAMEn4NqAQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/2] irqchip/sifive-plic: Fixup thead,c900-plic dt
 parse in opensbi
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_050935_867044_3C1801E6 
X-CRM114-Status: GOOD (  48.25  )
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

On Sun, Jan 30, 2022 at 6:28 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sun, 30 Jan 2022 04:39:34 +0000,
> Guo Ren <guoren@kernel.org> wrote:
> >
> > On Sun, Jan 30, 2022 at 10:50 AM Samuel Holland <samuel@sholland.org> wrote:
> > >
> > > On 1/29/22 8:08 PM, Guo Ren wrote:
> > > > On Sun, Jan 30, 2022 at 2:32 AM Marc Zyngier <maz@kernel.org> wrote:
> > > >>
> > > >> On Sat, 29 Jan 2022 16:27:26 +0000,
> > > >> guoren@kernel.org wrote:
> > > >>>
> > > >>> From: Guo Ren <guoren@linux.alibaba.com>
> > > >>>
> > > >>> The thead,c900-plic has been used in opensbi to distinguish
> > > >>> PLIC [1]. Although PLICs have the same behaviors in Linux,
> > > >>> they are different hardware with some custom initializing in
> > > >>> firmware(opensbi).
> > > >>>
> > > >>> [1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6
> > > >>>
> > > >>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > >>> Cc: Anup Patel <anup@brainfault.org>
> > > >>> Cc: Marc Zyngier <maz@kernel.org>
> > > >>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > >>> Cc: Samuel Holland <samuel@sholland.org>
> > > >>> Cc: Thomas Gleixner <tglx@linutronix.de>
> > > >>> ---
> > > >>>  drivers/irqchip/irq-sifive-plic.c | 25 +++++++++++++++++++++++--
> > > >>>  1 file changed, 23 insertions(+), 2 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > > >>> index 259065d271ef..245655928076 100644
> > > >>> --- a/drivers/irqchip/irq-sifive-plic.c
> > > >>> +++ b/drivers/irqchip/irq-sifive-plic.c
> > > >>> @@ -172,7 +172,7 @@ static void plic_irq_eoi(struct irq_data *d)
> > > >>>       }
> > > >>>  }
> > > >>>
> > > >>> -static struct irq_chip plic_chip = {
> > > >>> +static struct irq_chip sifive_plic_chip = {
> > > >>>       .name           = "SiFive PLIC",
> > > >>>       .irq_mask       = plic_irq_mask,
> > > >>>       .irq_unmask     = plic_irq_unmask,
> > > >>> @@ -182,12 +182,24 @@ static struct irq_chip plic_chip = {
> > > >>>  #endif
> > > >>>  };
> > > >>>
> > > >>> +static struct irq_chip thead_plic_chip = {
> > > >>> +     .name           = "T-Head PLIC",
> > > >>> +     .irq_mask       = plic_irq_mask,
> > > >>> +     .irq_unmask     = plic_irq_unmask,
> > > >>> +     .irq_eoi        = plic_irq_eoi,
> > > >>> +#ifdef CONFIG_SMP
> > > >>> +     .irq_set_affinity = plic_set_affinity,
> > > >>> +#endif
> > > >>> +};
> > > >>
> > > >> For pure entertainment, let's compare the two structures:
> > > >>
> > > >> static struct irq_chip plic_chip = {
> > > >>         .name           = "SiFive PLIC",
> > > >>         .irq_mask       = plic_irq_mask,
> > > >>         .irq_unmask     = plic_irq_unmask,
> > > >>         .irq_eoi        = plic_irq_eoi,
> > > >> #ifdef CONFIG_SMP
> > > >>         .irq_set_affinity = plic_set_affinity,
> > > >> #endif
> > > >> };
> > > >>
> > > >> Oh wait: a string. Must be really important. Not.
> > > > No, pls see below comment.
> > > >
> > > >>
> > > >>> +
> > > >>> +static struct irq_chip *def_plic_chip = &sifive_plic_chip;
> > > >>> +
> > > >>>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> > > >>>                             irq_hw_number_t hwirq)
> > > >>>  {
> > > >>>       struct plic_priv *priv = d->host_data;
> > > >>>
> > > >>> -     irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> > > >>> +     irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
> > > >>>                           handle_fasteoi_irq, NULL, NULL);
> > > >>>       irq_set_noprobe(irq);
> > > >>>       irq_set_affinity(irq, &priv->lmask);
> > > >>> @@ -396,5 +408,14 @@ static int __init plic_init(struct device_node *node,
> > > >>>       return error;
> > > >>>  }
> > > >>>
> > > >>> +static int __init thead_c900_plic_init(struct device_node *node,
> > > >>> +             struct device_node *parent)
> > > >>> +{
> > > >>> +     def_plic_chip = &thead_plic_chip;
> > > >>> +
> > > >>> +     return plic_init(node, parent);
> > > >>> +}
> > > >>> +
> > > >>>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
> > > >>>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> > > >>> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> > > >>
> > > >> Sorry, but I can't see any point to this patch.
> > > > You didn't see the link I've put in the patch. In that opensbi patch:
>
> No. If you can't explain why you need this in the commit message, why
> should I reverse engineer that from some obscure piece of firmware?

I've explaned that in the commit message:

The thead,c900-plic has been used in opensbi to distinguish
PLIC [1]. Although PLICs have the same behaviors in Linux,
they are different hardware with some custom initializing in
firmware(opensbi).

[1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6

If you think the above doesn't satisfy you, please point it out. Then
I can improve the commit-msg.

>
> > > >                 intc: interrupt-controller@10000000 {
> > > >                         #interrupt-cells = <1>;
> > > > -                       compatible = "riscv,plic0";
> > > > +                       compatible = "allwinner,sun20i-d1-plic",
> > > > +                                    "thead,c900-plic";
> > > >
> > > > +#define THEAD_PLIC_CTRL_REG 0x1ffffc
> > > > +
> > > > +static void thead_plic_plat_init(struct plic_data *pd)
> > > > +{
> > > > +       writel_relaxed(BIT(0), (void *)pd->addr + THEAD_PLIC_CTRL_REG);
> > > > +}
> > > > +
> > > >  static const struct fdt_match irqchip_plic_match[] = {
> > > >         { .compatible = "riscv,plic0" },
> > > >         { .compatible = "sifive,plic-1.0.0" },
> > > > +       { .compatible = "thead,c900-plic",
> > > > +         .data = thead_plic_plat_init },
> > > >         { },
> > > >  };
> > > >
> > > > We've changed the compatible name for thead,c900-plic, and there is no
> > > > riscv,plic0 / sifive,plic-1.0.0 in dts. Without the patch, the newest
> > > > opensbi + newest Linux would be broken in the Allwinner D1 dev board.
>
> So the firmware changes things in incompatible ways. Why does it
> matter to Linux?
The opensbi (firmware) reuses dts with the Linux, so PLIC driver
separates into two parts: firmware & linux. For firmware part, we need
another name to distinguish.

>  Why isn't the fix directly applied to the firmware instead?
The opensbi patch commit-msg has explained:
The T-HEAD PLIC implementation requires setting a delegation bit to
allow access from S-mode. Now that the T-HEAD PLIC has its own
compatible string, set this bit automatically from the PLIC driver,
instead of reaching into the PLIC's MMIO space from another driver.

If we can't modify the Linux driver, then we must abandon that patch in opensbi.

>  Why isn't the riscv,plic0 fallback appropriate?
We can't use riscv,plic0 as the tag of thead,plic, because it's
reserved for past.

>
> > > Yes, some patch is still necessary, because the hardware is indeed incompatible
> > > with riscv,plic0. However, this driver does not care about the difference. So
> > > all you need to do is hook up the existing code to the new compatible:
> > >
> > > +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init);
> > I think we should give clear info in /proc/interrupts. I hope we could
> > keep thead_plic_init.
>
> Why? There is no material difference at the driver level, and
> /proc/interrupts won't be the target of a branding exercise (which
> this series seems to be all about).
It's not a branding exercise, the series just correct the broken code
& incorrect /proc/interrupts display.

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
