Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55768C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:49:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197B460EB4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 00:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 197B460EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wj1pUu5sSDXGPJz7jHZY9EDe+eyFRe6a22fLw1L87zM=; b=qrQp9b6XpHlRYx
	Il5Or7YhseEXQ2b+cXFfw1Y2HOp4fpWauFbHRh2KceIrBZix68PV94BwehgwDLTNNPAOwADXPRRtg
	dsTyO0/mxWFmfc1AFN27JJYbif6BMSnGfpaq9/voK5MHRk5f1N5fSirMxcVSvx/dqOcP0l+VMIDP6
	1yqJ/+ccfVbkrrMlSxJbFi/iiVzuVqTmAgFNBQBso7pJ85yu7l7h97Zbx/qX4yIKPYE/ngjP63QmP
	ZLNJj1DFSFrgluT0p2+I6Kkr96karfPoUTLMP5kXJtIODiJBGwhwt0nnv9+e/2Q7y2/xnHJRfIWd/
	a7SUPdMwaKXfN0PNkKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSRq-00EPvK-Ok; Wed, 13 Oct 2021 00:48:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSRo-00EPuI-17
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 00:48:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA91B60EDF
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 00:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634086123;
 bh=Kbv/rHFna/0Axvw8OiuTxul21mQUIZgn9kqs0WcnFpw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=REIdUY56wkstG2cUg5plCACNHr7fl9slIshXF+9EU2VrzK5ptrsUr9jfrR3BMtspu
 lG1KKTllRC5jKeO4w0o19sJ214mbrdoZg9mPgSEk+Vyh7sxZHt+Z7oEt/aHqso9Jxz
 KIaLcAvAvSSdvM97epDJOyHM4miERaTY4sDAV37QokyYjf1O1Jj8H7alpOTqjpdP1i
 LwRdJ/BeeHXzqFRNB2btmd3AG6ERftjK/D3b1dfEfnjvbB+xgRfbXj7NS4+Zf6uV45
 ObbcUkWCYJ00YYiTU70mJefnwYjrBb1onmr/XTU1aMe6pqaHE6AJcRH1oh0lTJeJzo
 qlH/qr/7ud+1Q==
Received: by mail-vk1-f169.google.com with SMTP id s137so792712vke.11
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 17:48:43 -0700 (PDT)
X-Gm-Message-State: AOAM533V8Br75dWz9o0wuT11vJsn+fIS3mdiAQ2OQQ/ao3Wliv6FX7CG
 ytCrfS0Lw1MSykUru6WuQjCdKkTPvlg0nsNljrA=
X-Google-Smtp-Source: ABdhPJyU0BzpFlToBC3ztDGY3guFLaVJQqyQsSaArHBjwR3YgO1KL43j8F8oD47xmnJyXo8Z7rP10Fe8sj3kOMTl27Y=
X-Received: by 2002:ab0:5a93:: with SMTP id w19mr12761590uae.58.1634086122886; 
 Tue, 12 Oct 2021 17:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211012153432.2817285-1-guoren@kernel.org>
 <20211012153432.2817285-2-guoren@kernel.org>
 <CAAhSdy32wkwH5k3iwdUNDsXjUNX8icQwcz_h2E6UixH7ZmD5KQ@mail.gmail.com>
In-Reply-To: <CAAhSdy32wkwH5k3iwdUNDsXjUNX8icQwcz_h2E6UixH7ZmD5KQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Oct 2021 08:48:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQBnd7GhQeK1jJb_UNNUHMqN1ZNAG2bekZHPu3Lkfg+ew@mail.gmail.com>
Message-ID: <CAJF2gTQBnd7GhQeK1jJb_UNNUHMqN1ZNAG2bekZHPu3Lkfg+ew@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] irqchip/sifive-plic: Add thead,c9xx-plic support
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_174844_128121_3FC43106 
X-CRM114-Status: GOOD (  27.30  )
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

On Wed, Oct 13, 2021 at 12:40 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Oct 12, 2021 at 9:04 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > thead,c9xx-plic would mask IRQ with readl(claim), so it needn't
> > mask/unmask which needed in RISC-V PLIC.
> >
> > When in IRQS_ONESHOT & IRQCHIP_EOI_THREADED path, unnecessary mask
> > operation would cause a blocking irq bug in thead,c9xx-plic. Because
> > when IRQ is disabled in c9xx, writel(hwirq, claim) would be invalid.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> >
> > ---
> >
> > Changes since V2:
> >  - Add a separate compatible string "thead,c9xx-plic"
> >  - set irq_mask/unmask of "plic_chip" to NULL and point
> >    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
> >  - Add a detailed comment block in plic_init() about the
> >    differences in Claim/Completion process of RISC-V PLIC and C9xx
> >    PLIC.
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index cf74cfa82045..3756b1c147c3 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -79,6 +79,7 @@ struct plic_handler {
> >  };
> >  static int plic_parent_irq __ro_after_init;
> >  static bool plic_cpuhp_setup_done __ro_after_init;
> > +static bool disable_mask_unmask __ro_after_init;
> >  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
> >
> >  static inline void plic_toggle(struct plic_handler *handler,
> > @@ -181,6 +182,13 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
> >  {
> >         struct plic_priv *priv = d->host_data;
> >
> > +       if (disable_mask_unmask) {
> > +               plic_chip.irq_mask      = NULL;
> > +               plic_chip.irq_unmask    = NULL;
> > +               plic_chip.irq_enable    = plic_irq_unmask;
> > +               plic_chip.irq_disable   = plic_irq_mask;
> > +       }
> > +
> >         irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> >                             handle_fasteoi_irq, NULL, NULL);
> >         irq_set_noprobe(irq);
> > @@ -390,5 +398,14 @@ static int __init plic_init(struct device_node *node,
> >         return error;
> >  }
> >
> > +static int __init thead_c9xx_plic_init(struct device_node *node,
> > +               struct device_node *parent)
> > +{
> > +       disable_mask_unmask = true;
>
> The plic_irqdomain_map() is called for each irq so "plic_chip"
> will be updated multiple times.
>
> You can drop the disable_mask_unmask variable and instead
> directly update "plic_chip" here.
Good advice, better than mine.

>
> > +
> > +       return plic_init(node, parent);
> > +}
> > +
> >  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
> >  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> > +IRQCHIP_DECLARE(thead_c9xx_plic, "thead,c9xx-plic", thead_c9xx_plic_init);
> > --
> > 2.25.1
> >
>
> Regards,
> Anup



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
