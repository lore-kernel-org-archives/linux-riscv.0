Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBC7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62B9161212
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62B9161212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTboBQkc74YIKDDZvnUeIVO3Qq9IHiG3+IB14FKAZg8=; b=0Zgb+hoQCMX6f8
	4x7OmUuW3+KSupPdCi/k9K7pJppLj0k7c4jCH7elP3jRYph3USr0WdayQyBFAdghCAOgW5K5WcK6g
	sQXp2gw9eG15dko/RZbW94aoWlm7yJSM+5bGddza/RpGe5NsYxqmYq6thMQt/Rtbce9HeuoQ9kzsG
	D9+xr4nE11Wye63A5yrukWqxV6RGkvgBEV8eGyUT4jOb0APfnAYXOu5w/UySrLqvOEk0uOIM5+bgs
	1Z7NJeYCxAxniJU7kEMfjEtw2d8m8E6ljuU/V/dWkUHNJHTkvcIVPHrTtNBoHjzAHui33CyjGjHtU
	szI9C55ApBnNauXcxHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclVV-000fut-Ef; Tue, 19 Oct 2021 09:34:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclVS-000fuH-Jv
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 09:34:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D206961212
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634636041;
 bh=3UNbOyr82bSSOSjxWwdVdgEz10NAQFkIbzyWwjJ+ZNI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YF29Jl/oZPhaXtGBXbLN51d768SoHd7O+cUTu0b1182vASo8A3ARMvxWH5o9tvMwY
 Lv1EC4Oykasz1GEFHNBXRTHOazzH4YZ/vQBQbrWyf+uAtN9AuxBhZgQOAUQR1EsVvg
 /uBCeoEz2Oxm9sq00OKpK22xGhJ3DGXaa6tGlKgqmJ80+TrKR+JErxJpR9Lvemp+Ws
 EQI/A7hmLSDNQykoKy41dda2KmRkrBK2pkvlBd9sx60GqmQtyGpJSwqGzPqTbfvvR1
 PJ393rpYrIJZNkdrgW6LxFDRtQYGeN770gPMQLGITqr8qpMkkj1qNEb0aORaK7ygnv
 ROIQ3V6AMQJbA==
Received: by mail-vk1-f177.google.com with SMTP id n201so9954151vkn.12
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 02:34:01 -0700 (PDT)
X-Gm-Message-State: AOAM532fgnY9QChsyep7cRzVv04wFnapunU7GGHjAHF+TKmilL8D18lK
 aY7G3GMC77ZOMJZzmG9AwIuBGaYo6JOsUi1/6xU=
X-Google-Smtp-Source: ABdhPJxJIEctK2xe5aGxfFxMurhpHqGuhiAs2vy2gnKDcHNh3DSmK9px66KXu2nNWAp4/Ns/xrWpfIhBY33Z72BvAwo=
X-Received: by 2002:a05:6122:788:: with SMTP id
 k8mr26064612vkr.8.1634636040949; 
 Tue, 19 Oct 2021 02:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
 <f850af365f2ac77af79ec59f92e6434a@kernel.org>
In-Reply-To: <f850af365f2ac77af79ec59f92e6434a@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Oct 2021 17:33:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
Message-ID: <CAJF2gTShT8Tvk0z6B52zKEi0vq_toc-7mAKWFKj3j-zg=OhpYQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
To: Marc Zyngier <maz@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_023402_717088_8162AF4E 
X-CRM114-Status: GOOD (  54.40  )
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

Thx Marc,

On Mon, Oct 18, 2021 at 3:21 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-10-18 06:17, Samuel Holland wrote:
> > On 10/15/21 10:21 PM, guoren@kernel.org wrote:
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> 1) The irq_mask/unmask() is used by handle_fasteoi_irq() is mostly
>
> Drop this useless numbering.
Okay

>
> >> for ONESHOT irqs and there is no limitation in the RISC-V PLIC driver
> >> due to use of irq_mask/unmask() callbacks. In fact, a lot of irqchip
> >> drivers using handle_fasteoi_irq() also implement irq_mask/unmask().
>
> This paragraph doesn't provide any useful information in the context
> of this patch. That's at best cover-letter material.
Okay. I would reconstruct the sentence.

>
> >> 2) The C9xx PLIC does not comply with the interrupt claim/completion
> >> process defined by the RISC-V PLIC specification because C9xx PLIC
> >> will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
> >> and the IRQ will be unmasked upon completion by PLIC driver (i.e.
> >> writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
> >> the generic handle_fasteoi_irq() used in the PLIC driver.
> >>
> >> 3) This patch adds an errata fix for IRQS_ONESHOT handling on
>
> s/fix/workaround/
Okay

>
> >> C9xx PLIC by using irq_enable/disable() callbacks instead of
> >> irq_mask/unmask().
>
>  From Documentation/process/submitting-patches.rst:
>
> <quote>
> Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour.
> </quote>
I would try the style in the next version of the patch.

>
> >>
> >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >> Cc: Anup Patel <anup@brainfault.org>
> >> Cc: Thomas Gleixner <tglx@linutronix.de>
> >> Cc: Marc Zyngier <maz@kernel.org>
> >> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> Cc: Atish Patra <atish.patra@wdc.com>
> >>
> >> ---
> >>
> >> Changes since V4:
> >>  - Update comment by Anup
> >>
> >> Changes since V3:
> >>  - Rename "c9xx" to "c900"
> >>  - Add sifive_plic_chip and thead_plic_chip for difference
> >>
> >> Changes since V2:
> >>  - Add a separate compatible string "thead,c9xx-plic"
> >>  - set irq_mask/unmask of "plic_chip" to NULL and point
> >>    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
> >>  - Add a detailed comment block in plic_init() about the
> >>    differences in Claim/Completion process of RISC-V PLIC and C9xx
> >>    PLIC.
> >> ---
> >>  drivers/irqchip/irq-sifive-plic.c | 34
> >> +++++++++++++++++++++++++++++--
> >>  1 file changed, 32 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/irqchip/irq-sifive-plic.c
> >> b/drivers/irqchip/irq-sifive-plic.c
> >> index cf74cfa82045..960b29d02070 100644
> >> --- a/drivers/irqchip/irq-sifive-plic.c
> >> +++ b/drivers/irqchip/irq-sifive-plic.c
> >> @@ -166,7 +166,7 @@ static void plic_irq_eoi(struct irq_data *d)
> >>      writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> >>  }
> >>
> >> -static struct irq_chip plic_chip = {
> >> +static struct irq_chip sifive_plic_chip = {
> >>      .name           = "SiFive PLIC",
> >>      .irq_mask       = plic_irq_mask,
> >>      .irq_unmask     = plic_irq_unmask,
> >> @@ -176,12 +176,32 @@ static struct irq_chip plic_chip = {
> >>  #endif
> >>  };
> >>
> >> +/*
> >> + * The C9xx PLIC does not comply with the interrupt claim/completion
> >> + * process defined by the RISC-V PLIC specification because C9xx PLIC
> >> + * will mask an IRQ when it is claimed by PLIC driver (i.e.
> >> readl(claim)
> >> + * and the IRQ will be unmasked upon completion by PLIC driver (i.e.
> >> + * writel(claim). This behaviour breaks the handling of IRQS_ONESHOT
> >> by
> >> + * the generic handle_fasteoi_irq() used in the PLIC driver.
> >> + */
> >> +static struct irq_chip thead_plic_chip = {
> >> +    .name           = "T-Head PLIC",
> >> +    .irq_disable    = plic_irq_mask,
> >> +    .irq_enable     = plic_irq_unmask,
> >> +    .irq_eoi        = plic_irq_eoi,
> >> +#ifdef CONFIG_SMP
> >> +    .irq_set_affinity = plic_set_affinity,
> >> +#endif
> > I tested this, and it doesn't work. Without IRQCHIP_EOI_THREADED,
> > .irq_eoi is called at the end of the hard IRQ handler. This unmasks the
> > IRQ before the irqthread has a chance to run, so it causes an interrupt
> > storm for any threaded level IRQ (I saw this happen for sun8i_thermal).
> >
> > With IRQCHIP_EOI_THREADED, .irq_eoi is delayed until after the
> > irqthread
> > runs. This is good. Except that the call to unmask_threaded_irq() is
> > inside a check for IRQD_IRQ_MASKED. And IRQD_IRQ_MASKED will never be
> > set because .irq_mask is NULL. So the end result is that the IRQ is
> > never EOI'd and is masked permanently.
> >
> > If you set .flags = IRQCHIP_EOI_THREADED, and additionally set
> > .irq_mask
> > and .irq_unmask to a dummy function that does nothing, the IRQ core
> > will
> > properly set/unset IRQD_IRQ_MASKED, and the IRQs will flow as expected.
> > But adding dummy functions seems not so ideal, so I am not sure if this
> > is the best solution.
>
> This series is totally broken indeed, because it assumes that
> enable/disable are a substitute to mask/unmask. Nothing could be further
> from the truth. mask/unmask must be implemented, and enable/disable
> supplement them if the HW requires something different at startup time.
After re-studying irqchip, I agree that you are right. The csky-mpintc
driver needs to be corrected, I will send patches asap. I hope you can
continue to help review.

handle_fasteoi_irq itself has avoided mask/unmask, so my understanding
is wrong. The mask/unmask design can prevent "rogue interrupts" from
damaging the system. C-SKY guys encountered the thread_irq interrupt
storm problem. The solution at that time was to pull the interrupt
signal in the handler and put the rest in thread_fn. If we implemented
the mask/unmask correctly in csky-mpintc, it was unnecessary.




>
> If you have an 'automask' behavior and yet the HW doesn't record this
> in a separate bit, then you need to track this by yourself in the
> irq_eoi() callback instead. I guess that you would skip the write to
> the CLAIM register in this case, though I have no idea whether this
> breaks
> the HW interrupt state or not.
The problem is when enable bit is 0 for that irq_number,
"writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM)" wouldn't affect
the hw state machine. Then this irq would enter in ack state and no
continues irqs could come in.

>
> There is an example of this in the Apple AIC driver.
Thx for the tip, I think your suggestion is:
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -163,7 +163,12 @@ static void plic_irq_eoi(struct irq_data *d)
 {
        struct plic_handler *handler = this_cpu_ptr(&plic_handlers);

-       writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+       if (irqd_irq_masked(d)) {
+               plic_irq_unmask(d);
+               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+               plic_irq_mask(d);
+       } else {
+               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
+       }
 }

The above could solve the problem, I've tested it on qemu & our hw platform.

>
>          M.
> --
> Jazz is not dead. It just smells funny...

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
