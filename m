Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75A0C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 16:05:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 778DB60E09
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 16:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 778DB60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFQCjZxSAd9Js08PY++iVc7J/3mJWAmBF8yo9Kf3Qds=; b=wa/liFnr7d9Z7s
	4YvUZLlHBMXBeLUfEHUoTmNAySzjXDolqFW1lIAk5W6i2vhrMizvkj406piYa9E9XTSEs7ngW0JF6
	P1xgbpNjt/XtoOGrYzPlj4gexQ/rxGqeFjTPZ/6MU2z800t60rHZUbL1MZTmDW7uRO+qXOTzfjSVH
	IID7vf5pxijTP/inbYg63tXwx8nQkQrJwuBx/K++OlACJc7cyyz0TCEqxChJEUIFNd21YbySZv7Zp
	oBOoRb/XWi2HX8wVmi4lRhBXq8CTRPIxCvCzlS8GJqloUyiM/Oc9NnPjlh+AKZ+dlvnyAHBN2jL/x
	dBxCWQYz5NKG3QCY5+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m836Y-00BtqJ-4k; Mon, 26 Jul 2021 16:05:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m836U-00Btpi-A3
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 16:05:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 l11-20020a7bc34b0000b029021f84fcaf75so8547665wmj.1
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=44ShJhf/K5DrTcnx1ukbeJoLz6VUL4N4swOkb5P4DBQ=;
 b=SxVLiiw888RohIYA/l/QYXa3Bxz130RuVmFjU+GeQXH0/eulEAqTlv2FNswHHVsxlA
 NKKsQQJrNoQruwMP4v1DuSsbc//iyjnB8WEjqDImiSg6s6m0o/GHbJzQcWdwd+Wz+f/r
 +6WHYDEsbxE/7+TeA75Y1GbUL4QNnA6S8SXM5FT0nQfDd/Qy+v81su1U+6/9HbXX+zpg
 IA+JxPfdQUUnxrvkeMIQl6YXSlZgvhP9DVuDzaQPIhUn3ZOFb/d9HkkzAYycQzqG/a/k
 EFS26AbWiRe7R43WfVwul6XHacRv4qgBagXWqEk9+CUS4pSgNcwIU0NNHxGnatRSnUa2
 8LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44ShJhf/K5DrTcnx1ukbeJoLz6VUL4N4swOkb5P4DBQ=;
 b=qOrlGDewdOsDr1e2ztL06OFWj+WQ+AfE0Wh60bcW2FdtjHkr1Ooggq+hXzbhxKkFkE
 IQK4/ig9a55UK4hUJ8hOmQ0paaLTjcoZe900tL46pdPmMdFz4FAG53GEK/ijX3Z6YeCc
 G3jXB7pDhNhGf1CTFX/hhnswk4BrOaoC5YDwpe9Mq9FhPd4X0Pd9sFRYNI3nOLHb5FP/
 elW+Wr9X8MSkcvwvm7jokHYF0Hu6Bw9eJALsy4XOYpucqFpquCB4dlAiO84BlSo9nO+Y
 ulC62WfRettXrwMN0Eh0ZPxEgURitmkBYBF5ggZUsRuvRzSTM1b7PVW6uws0i1AcF8TH
 H+YA==
X-Gm-Message-State: AOAM530KnMs4eZa9QzDTe9CwkKqjcPAmCfZVCp8sVQG0iiVyUVbpUuGr
 pSIR4o9TwdaCv65Ct8Tq7lxC7Dt+szw4VTKRchWY7g==
X-Google-Smtp-Source: ABdhPJxLlBfoRxxP1o/FODQ3vQhNYpjNKlwuhqvRMXqf6KovDH85HQh1z91Zlb2+pUFdbYgmki6Rf8VFesqPtnb5HQA=
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr7159614wmd.152.1627315516312; 
 Mon, 26 Jul 2021 09:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210618123851.1344518-1-anup.patel@wdc.com>
 <20210618123851.1344518-8-anup.patel@wdc.com>
 <87k0lddue7.wl-maz@kernel.org>
In-Reply-To: <87k0lddue7.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jul 2021 21:35:04 +0530
Message-ID: <CAAhSdy1-AdQ84Q1mdj7cSemmMdKr3vKBHDug_fm=nkKLtVW7qg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/11] irqchip: Add ACLINT software interrupt driver
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_090518_423155_54F07B87 
X-CRM114-Status: GOOD (  49.03  )
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

On Mon, Jul 26, 2021 at 7:55 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 18 Jun 2021 13:38:47 +0100,
> Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The RISC-V ACLINT provides MSWI and SSWI devices for M-mode and
> > S-mode software interrupts respectively. We add irqchip driver
> > which provide IPI operations based on ACLINT [M|S]SWI devices
> > to the Linux RISC-V kernel.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  drivers/irqchip/Kconfig          |  11 ++
> >  drivers/irqchip/Makefile         |   1 +
> >  drivers/irqchip/irq-aclint-swi.c | 271 +++++++++++++++++++++++++++++++
> >  3 files changed, 283 insertions(+)
> >  create mode 100644 drivers/irqchip/irq-aclint-swi.c
> >
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 62543a4eccc0..2010d493b03b 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -508,6 +508,17 @@ config RISCV_INTC
> >
> >          If you don't know what to do here, say Y.
> >
> > +config RISCV_ACLINT_SWI
> > +     bool "RISC-V Advanced Core Local Interruptor Software Interrupts"
> > +     depends on RISCV
> > +     help
> > +        This enables support for software interrupts using the Advanced
> > +        Core Local Interruptor (ACLINT) found in RISC-V systems.  The
> > +        RISC-V ACLINT provides devices for inter-process interrupt and
> > +        timer functionality.
> > +
> > +        If you don't know what to do here, say Y.
>
> Let's face it, nobody knows what to say. So instead of asking the
> question, how about selecting it from the platform support config
> instead?

Yes, this will be mostly selected by platform support config. In fact,
the PATCH8 already selects it for the virt machine.

Let me remove this last line.

>
> > +
> >  config SIFIVE_PLIC
> >       bool "SiFive Platform-Level Interrupt Controller"
> >       depends on RISCV
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index f88cbf36a9d2..a6edf6733c1d 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -97,6 +97,7 @@ obj-$(CONFIG_QCOM_PDC)                      += qcom-pdc.o
> >  obj-$(CONFIG_CSKY_MPINTC)            += irq-csky-mpintc.o
> >  obj-$(CONFIG_CSKY_APB_INTC)          += irq-csky-apb-intc.o
> >  obj-$(CONFIG_RISCV_INTC)             += irq-riscv-intc.o
> > +obj-$(CONFIG_RISCV_ACLINT_SWI)               += irq-aclint-swi.o
> >  obj-$(CONFIG_SIFIVE_PLIC)            += irq-sifive-plic.o
> >  obj-$(CONFIG_IMX_IRQSTEER)           += irq-imx-irqsteer.o
> >  obj-$(CONFIG_IMX_INTMUX)             += irq-imx-intmux.o
> > diff --git a/drivers/irqchip/irq-aclint-swi.c b/drivers/irqchip/irq-aclint-swi.c
> > new file mode 100644
> > index 000000000000..a31a7fc504d1
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-aclint-swi.c
> > @@ -0,0 +1,271 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> > + */
> > +
> > +#define pr_fmt(fmt) "aclint-swi: " fmt
> > +#include <linux/cpu.h>
> > +#include <linux/cpumask.h>
> > +#include <linux/io.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/smp.h>
> > +
> > +struct aclint_swi {
> > +     void __iomem *sip_reg;
> > +     unsigned long bits;
> > +};
> > +
> > +static int aclint_swi_parent_irq __ro_after_init;
> > +static struct irq_domain *aclint_swi_domain __ro_after_init;
> > +static DEFINE_PER_CPU(struct aclint_swi, aclint_swis);
> > +
> > +static void aclint_swi_dummy_mask_unmask(struct irq_data *d)
> > +{
> > +}
> > +
> > +static void aclint_swi_send_mask(struct irq_data *d,
> > +                               const struct cpumask *mask)
> > +{
> > +     int cpu;
> > +     struct aclint_swi *swi;
> > +
> > +     /* Barrier before doing atomic bit update to IPI bits */
> > +     smp_mb__before_atomic();
> > +
> > +     for_each_cpu(cpu, mask) {
> > +             swi = per_cpu_ptr(&aclint_swis, cpu);
> > +             set_bit(d->hwirq, &swi->bits);
> > +             writel(1, swi->sip_reg);
> > +     }
> > +
> > +     /* Barrier after doing atomic bit update to IPI bits */
> > +     smp_mb__after_atomic();
> > +}
> > +
> > +static struct irq_chip aclint_swi_chip = {
> > +     .name = "RISC-V ACLINT SWI",
> > +     .irq_mask       = aclint_swi_dummy_mask_unmask,
>
> Please call this function something that doesn't immediately
> contradict the callback it is assigned to.

Okay, I will choose a better name for this callback.

>
> > +     .irq_unmask     = aclint_swi_dummy_mask_unmask,
> > +     .ipi_send_mask  = aclint_swi_send_mask,
> > +};
> > +
> > +static int aclint_swi_domain_map(struct irq_domain *d, unsigned int irq,
> > +                              irq_hw_number_t hwirq)
> > +{
> > +     irq_set_percpu_devid(irq);
> > +     irq_domain_set_info(d, irq, hwirq, &aclint_swi_chip, d->host_data,
> > +                         handle_percpu_devid_irq, NULL, NULL);
> > +
> > +     return 0;
> > +}
> > +
> > +static int aclint_swi_domain_alloc(struct irq_domain *d, unsigned int virq,
> > +                                unsigned int nr_irqs, void *arg)
> > +{
> > +     int i, ret;
> > +     irq_hw_number_t hwirq;
> > +     unsigned int type = IRQ_TYPE_NONE;
> > +     struct irq_fwspec *fwspec = arg;
> > +
> > +     ret = irq_domain_translate_onecell(d, fwspec, &hwirq, &type);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (i = 0; i < nr_irqs; i++) {
> > +             ret = aclint_swi_domain_map(d, virq + i, hwirq + i);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct irq_domain_ops aclint_swi_domain_ops = {
> > +     .translate      = irq_domain_translate_onecell,
> > +     .alloc          = aclint_swi_domain_alloc,
> > +     .free           = irq_domain_free_irqs_top,
> > +};
> > +
> > +static void aclint_swi_handle_irq(struct irq_desc *desc)
> > +{
> > +     int irq;
> > +     unsigned long irqs;
> > +     irq_hw_number_t hwirq;
> > +     struct irq_chip *chip = irq_desc_get_chip(desc);
> > +     struct aclint_swi *swi = this_cpu_ptr(&aclint_swis);
> > +
> > +     chained_irq_enter(chip, desc);
> > +
> > +     writel(0, swi->sip_reg);
> > +
> > +     while (true) {
> > +             /* Order bit clearing and data access. */
> > +             mb();
> > +
> > +             irqs = xchg(&swi->bits, 0);
> > +             if (!irqs)
> > +                     goto done;
> > +
> > +             for (hwirq = 0; hwirq < BITS_PER_LONG; hwirq++) {
> > +                     if (!(BIT(hwirq) & irqs))
> > +                             continue;
>
>                 for_each_set_bit(hwirq, &irqs, BITS_PER_LONG) {

Sure, I will use for_each_set_bit() here.

>
> > +
> > +                     irq = irq_find_mapping(aclint_swi_domain, hwirq);
> > +                     if (unlikely(irq <= 0))
> > +                             pr_warn_ratelimited(
> > +                                     "can't find mapping for hwirq %lu\n",
> > +                                     hwirq);
> > +                     else
> > +                             generic_handle_irq(irq);
>
> You can now convert this over to generic_handle_domain_irq().

Sure, I will use generic_handle_domain_irq().

>
> > +             }
> > +     }
>
> So you can loop here and consume bits forever, but only ack the
> interrupt once? This feels sketchy.

Aargh, I accidently put writel() out of the loop. We should have one
writel() everytime we consume the bits.

I will update this.

>
> > +
> > +done:
> > +     chained_irq_exit(chip, desc);
> > +}
> > +
> > +static int aclint_swi_dying_cpu(unsigned int cpu)
> > +{
> > +     disable_percpu_irq(aclint_swi_parent_irq);
> > +     return 0;
> > +}
> > +
> > +static int aclint_swi_starting_cpu(unsigned int cpu)
> > +{
> > +     enable_percpu_irq(aclint_swi_parent_irq,
> > +                       irq_get_trigger_type(aclint_swi_parent_irq));
> > +     return 0;
> > +}
> > +
> > +static int __init aclint_swi_set_virq(void)
> > +{
> > +     int virq;
> > +     struct irq_fwspec ipi = {
> > +             .fwnode         = aclint_swi_domain->fwnode,
> > +             .param_count    = 1,
> > +             .param[0]       = 0,
> > +     };
> > +
> > +     virq = __irq_domain_alloc_irqs(aclint_swi_domain, -1, BITS_PER_LONG,
> > +                                    NUMA_NO_NODE, &ipi,
> > +                                    false, NULL);
> > +     if (virq <= 0) {
> > +             pr_err("unable to alloc IRQs from SBI IPI IRQ domain\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     riscv_ipi_set_virq_range(virq, BITS_PER_LONG, true);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __init aclint_swi_domain_init(struct device_node *node)
> > +{
> > +     /*
> > +      * We can have multiple ACLINT SWI devices but we only need
> > +      * one IRQ domain for providing per-HART (or per-CPU) IPIs.
> > +      */
> > +     if (aclint_swi_domain)
> > +             return 0;
> > +
> > +     aclint_swi_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> > +                                             &aclint_swi_domain_ops, NULL);
> > +     if (!aclint_swi_domain) {
> > +             pr_err("unable to add ACLINT SWI IRQ domain\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     return aclint_swi_set_virq();
> > +}
> > +
> > +static int __init aclint_swi_init(struct device_node *node,
> > +                               struct device_node *parent)
> > +{
> > +     int rc;
> > +     void __iomem *base;
> > +     struct aclint_swi *swi;
> > +     u32 i, nr_irqs, nr_cpus = 0;
> > +
> > +     /* Map the registers */
> > +     base = of_iomap(node, 0);
> > +     if (!base) {
> > +             pr_err("%pOFP: could not map registers\n", node);
> > +             return -ENODEV;
> > +     }
> > +
> > +     /* Iterarte over each target CPU connected with this ACLINT */
> > +     nr_irqs = of_irq_count(node);
> > +     for (i = 0; i < nr_irqs; i++) {
> > +             struct of_phandle_args parent;
> > +             int cpu, hartid;
> > +
> > +             if (of_irq_parse_one(node, i, &parent)) {
> > +                     pr_err("%pOFP: failed to parse irq %d.\n",
> > +                            node, i);
> > +                     continue;
> > +             }
> > +
> > +             if (parent.args[0] != RV_IRQ_SOFT) {
> > +                     pr_err("%pOFP: invalid irq %d (hwirq %d)\n",
> > +                            node, i, parent.args[0]);
> > +                     continue;
> > +             }
> > +
> > +             hartid = riscv_of_parent_hartid(parent.np);
> > +             if (hartid < 0) {
> > +                     pr_warn("failed to parse hart ID for irq %d.\n", i);
> > +                     continue;
> > +             }
> > +
> > +             cpu = riscv_hartid_to_cpuid(hartid);
> > +             if (cpu < 0) {
> > +                     pr_warn("Invalid cpuid for irq %d\n", i);
> > +                     continue;
> > +             }
> > +
> > +             /* Find parent domain and register chained handler */
> > +             if (!aclint_swi_parent_irq && irq_find_host(parent.np)) {
> > +                     aclint_swi_parent_irq = irq_of_parse_and_map(node, i);
> > +                     if (aclint_swi_parent_irq) {
>
> What is the point of describing all the interrupts for each and every
> CPU if you only need *one* to establish the routing on behalf of all
> CPUs?

The parent interrupt controller for ACLINT is RISC-V local interrupt
controller (INTC) which is within each HART (or CPU). We have one
RISC-V INTC DT node under each CPU DT node so the RISC-V INTC
driver registers a single IRQ domain only for the boot CPU (which could
be HART with any HART ID not necessarily zero).

The RISC-V INTC IRQ domain provides the parent IRQ for the IPI domain
registered by the ACLINT device. The interrupts-extended property of
ACLINT DT node points to a set of CPUs which the given ACLINT device
targets so we loop over all the IRQs to find the RISC-V INTC IRQ domain.
(Note: This is very similar to how SiFive PLIC driver finds parent IRQ
domain using interrupts-extended DT property)

Also, on multi-cluster (or multi-socket) platforms we will have multiple
ACLINT devices where each ACLINT device targets different sets of
CPUs (or HARTs).

Here are ACLINT DT node examples from DT bindings patch:

     // Example 1 (RISC-V MSWI device used by Linux RISC-V NoMMU kernel):

    interrupt-controller@2000000 {
      compatible = "riscv,aclint-mswi";
      interrupts-extended = <&cpu1intc 3 &cpu2intc 3 &cpu3intc 3 &cpu4intc 3>;
      reg = <0x2000000 0x4000>;
      interrupt-controller;
      #interrupt-cells = <0>;
    };

    // Example 2 (RISC-V SSWI device used by Linux RISC-V MMU kernel):

    interrupt-controller@2100000 {
      compatible = "riscv,aclint-sswi";
      interrupts-extended = <&cpu1intc 1 &cpu2intc 1 &cpu3intc 1 &cpu4intc 1>;
      reg = <0x2100000 0x4000>;
      interrupt-controller;
      #interrupt-cells = <0>;
    };

>
> > +                             irq_set_chained_handler(aclint_swi_parent_irq,
> > +                                                     aclint_swi_handle_irq);
> > +                             cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > +                                     "irqchip/riscv/aclint-swi:starting",
> > +                                     aclint_swi_starting_cpu,
> > +                                     aclint_swi_dying_cpu);
> > +                     }
> > +             }
>
> else?
>
> > +
> > +             swi = per_cpu_ptr(&aclint_swis, cpu);
> > +             swi->sip_reg = base + i * sizeof(u32);
> > +             writel(0, swi->sip_reg);
> > +
> > +             nr_cpus++;
> > +     }
> > +
> > +     /* Create the IPI domain for ACLINT SWI device */
> > +     rc = aclint_swi_domain_init(node);
> > +     if (rc)
> > +             return rc;
> > +
> > +     /* Announce the ACLINT SWI device */
> > +     pr_info("%pOFP: providing IPIs for %d CPUs\n", node, nr_cpus);
> > +
> > +     return 0;
> > +}
> > +
> > +#ifdef CONFIG_RISCV_M_MODE
> > +IRQCHIP_DECLARE(riscv_aclint_swi, "riscv,clint0", aclint_swi_init);
> > +IRQCHIP_DECLARE(riscv_aclint_swi1, "sifive,clint0", aclint_swi_init);
> > +IRQCHIP_DECLARE(riscv_aclint_swi2, "riscv,aclint-mswi", aclint_swi_init);
> > +#else
> > +IRQCHIP_DECLARE(riscv_aclint_swi, "riscv,aclint-sswi", aclint_swi_init);
> > +#endif
> > --
> > 2.25.1
> >
> >
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
