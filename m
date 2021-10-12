Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD57C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 01:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8B160FD7
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 01:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D8B160FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijSJwSHdDvdRJjjPctBdKZuzZMp8KVAE/gaMbAKodlw=; b=283ss7AOYbUhkd
	9K1dnj2h04hmlGfyEBqF/YRL1aCLbE8PJcY9XiGUHROnGjToLc4oV1BLmOJ8TxuRJl+DA/jY+bHm6
	GgTAFK8e1Ci6XDB4yW0NanB4O8zgt4nkBpXq/XWD2iCVhKIw8BfNakD6QWNefDL9v3vRFi4zqgUwz
	o16MpyF/x4BcSRlsmFf21C9gYPBY2uVYa8v0QB2tsm8kU3jmjojJzEkW8ezOModo4bRvtiTRW0wXj
	SQVhTA6ZKdgQT12by0P6uN4zwLPl8vAIr8S5qgLy0pPTHcVZssfHDpcIkyjGwNj7ogGs/xZckFk2K
	TQkv8xJhS/WKnMgh+kYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma6VL-00BBV0-W2; Tue, 12 Oct 2021 01:22:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma6VJ-00BBUM-Dq
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 01:22:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D64A960F38
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 01:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634001772;
 bh=XM2NRJccgxND7m0Mlqsxadwo2rATHdUUDllqG1KrA20=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QwQnQ4RnFYQKcqvYv1t6Gs9hNLkhAMsGNat2RbSP85XbaPyLWwvNZEelJrSXN43AT
 7+Wt+k+U9Hk+9gVVswYZUTX/ODtEOzqU/Uq4AgBCceqhAZmsohRbp6SJFYylS5OA6t
 bwW1bVhU+/8ya5i2Mik5BC/2HdgFgOBlDt4lJI4ePJhvAfl0QtL8YkA6FOxslGXYt1
 S/5oUJSndt+ip9HLfgREvI5wWDmMxGkpMAi23TJwSkT97r1j1j1o1zU92ofqZAFfhQ
 w99i53ELNrSJ4dGqHi+EWipuqkwmQgm0gmLglS/KnnsTiVYtMkQUIhX4gzuCTQ+h86
 rKn3kqtVGYW9Q==
Received: by mail-vk1-f173.google.com with SMTP id f126so8676436vke.3
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 18:22:52 -0700 (PDT)
X-Gm-Message-State: AOAM53168CeowyNnWEwvFF6a2FhDLYRdLr+QMKbeHrEX312MKCExhpHV
 eDJQlci2zyHnzcQ7Oaj700SS9Bp/Ij5GeuSu5uE=
X-Google-Smtp-Source: ABdhPJxdfoYYG8Z/5jPPiLI202N0xiC0dHhM75NEkRh/kdaAbP0kEJRLXDusuGmqgJRThSX6aN0AG4r7pbrXSnH4aL0=
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr27488752vsk.11.1634001772006; 
 Mon, 11 Oct 2021 18:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211011132431.2792797-1-guoren@kernel.org>
 <CAAhSdy1xjRE0TJ_Nd9fdz4RAK2J5FskQYbWDVXO7jhfcZsFm_g@mail.gmail.com>
In-Reply-To: <CAAhSdy1xjRE0TJ_Nd9fdz4RAK2J5FskQYbWDVXO7jhfcZsFm_g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Oct 2021 09:22:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRUSyyaniW6mcLSuO5td8ih8O0YOFbbY2EwVqgmzX+0nQ@mail.gmail.com>
Message-ID: <CAJF2gTRUSyyaniW6mcLSuO5td8ih8O0YOFbbY2EwVqgmzX+0nQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Fix duplicate mask/unmask for
 claim/complete
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_182253_530261_38BC55FC 
X-CRM114-Status: GOOD (  30.64  )
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

On Mon, Oct 11, 2021 at 11:02 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Oct 11, 2021 at 6:54 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > PLIC only has enable-registers not mask/unmask registers. Mixing
> > mask/unmask with irq_eoi is wrong, because readl(claim) could mask
>
> This is an incorrect assumption about readl(claim). When SW does
> read(claim) the HW updates internal state that IRQ has been claimed.
> The HW can still get same (already claimed) IRQ again before
> writel(claim) which will be delivered after writel(claim).
Our hw would mask IRQ with readl(claim), so it's unnecessary for our
board. I agree some hardware won't mask IRQ after readl(claim), so I
put DT-bool to control it.

>
> > irq by hardware. We only need mask/unmask to fixup the hardware
> > which couldn't claim + mask correctly.
>
> The handle_fasteoi_irq() only calls unmask_irq() mostly when the
> underlying IRQ is threaded. Is there any other case ?
When in handle_fasteoi_irq ONESHOT path, it will call:
        if (desc->istate & IRQS_ONESHOT)
                mask_irq(desc);

mask_irq->plic_irq_mask->"write 0 to PRIORITY & ENABLE_BASE-bit"

In this IRQ context, it wouldn't call unmask_irq with
cond_unmask_eoi_irq when in IRQCHIP_EOI_THREADED. Then the path would
writel(hwirq, claim) with irq disabled.
static void cond_unmask_eoi_irq(struct irq_desc *desc, struct irq_chip *chip)
{
...
        } else if (!(chip->flags & IRQCHIP_EOI_THREADED)) {
                chip->irq_eoi(&desc->irq_data);
        }

When IRQ is disabled in c9xx, writel(hwirq, claim) would be invalid
and cause a blocking irq bug.

>
> Another fact is that all irqchip drivers using handle_fasteoi_irq()
> implement irq_mask/unmask().
C9xx needn't call mask&unmask after readl(claim), because:
1. If hw supports readl(claim) with acquiring irq then the mask/unmask
is unnecessary and causes performance problems.
2. When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED path, unnecessary mask
operation would cause a blocking irq bug.

>
> Regards,
> Anup
>
> >
> > If hardware supports claim + mask, it would cause unnecessary
> > mask/umak operations.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index cf74cfa82045..0fa46912f452 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -64,6 +64,7 @@ struct plic_priv {
> >         struct cpumask lmask;
> >         struct irq_domain *irqdomain;
> >         void __iomem *regs;
> > +       bool claim_mask_support;
> >  };
> >
> >  struct plic_handler {
> > @@ -111,7 +112,7 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
> >         }
> >  }
> >
> > -static void plic_irq_unmask(struct irq_data *d)
> > +static void plic_irq_enable(struct irq_data *d)
> >  {
> >         struct cpumask amask;
> >         unsigned int cpu;
> > @@ -125,7 +126,7 @@ static void plic_irq_unmask(struct irq_data *d)
> >         plic_irq_toggle(cpumask_of(cpu), d, 1);
> >  }
> >
> > -static void plic_irq_mask(struct irq_data *d)
> > +static void plic_irq_disable(struct irq_data *d)
> >  {
> >         struct plic_priv *priv = irq_data_get_irq_chip_data(d);
> >
> > @@ -168,8 +169,8 @@ static void plic_irq_eoi(struct irq_data *d)
> >
> >  static struct irq_chip plic_chip = {
> >         .name           = "SiFive PLIC",
> > -       .irq_mask       = plic_irq_mask,
> > -       .irq_unmask     = plic_irq_unmask,
> > +       .irq_enable     = plic_irq_enable,
> > +       .irq_disable    = plic_irq_disable,
> >         .irq_eoi        = plic_irq_eoi,
> >  #ifdef CONFIG_SMP
> >         .irq_set_affinity = plic_set_affinity,
> > @@ -181,6 +182,11 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> >  {
> >         struct plic_priv *priv = d->host_data;
> >
> > +       if (!priv->claim_mask_support) {
> > +               plic_chip.irq_mask      = plic_irq_disable;
> > +               plic_chip.irq_unmask    = plic_irq_enable;
> > +       }
> > +
> >         irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> >                             handle_fasteoi_irq, NULL, NULL);
> >         irq_set_noprobe(irq);
> > @@ -298,6 +304,8 @@ static int __init plic_init(struct device_node *node,
> >         if (WARN_ON(!nr_contexts))
> >                 goto out_iounmap;
> >
> > +       priv->claim_mask_support = of_property_read_bool(node, "claim-mask-support");
> > +
> >         error = -ENOMEM;
> >         priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
> >                         &plic_irqdomain_ops, priv);
> > --
> > 2.25.1
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
