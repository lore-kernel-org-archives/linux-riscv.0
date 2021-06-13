Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6341AC48BDF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 12:27:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08CCE611CA
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 12:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08CCE611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUVzCTLozRRK8DGGAcez4iTq//c53Xq99qMQydIOk/E=; b=mhPFzb+GBmFyQL
	D7BfnPpm26cCY5AxdS9Kxm0+ySSW1J8MxAcULMJ8IsrYtSeJmuj0WGi//OAVMmUd0rW9qMkbiv+mi
	+Et01TqJchrCajEtNPrGEgbH+ANkgyrGDKoOsV/i19RZ0oQOqhbiebwKz1qoZBr2gqbm/QIaLS6AA
	FpNkpiORIgobvfxukG4lz0K1EFX6SLHEi6K1JjWSV94pXo26fBUAxFIPw47Z75QXC+OR2KlwVl/cv
	Vab0gwqtJU6MnQ3uSRGzj2C0Z9D0tu+hnFe5M9kqpv3bwP9NRIvHF+O0MiV1OguJNDTuDNpuvldx5
	mdWrxcuSOHq+r1IsLOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsPCc-00AQXI-2A; Sun, 13 Jun 2021 12:26:58 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsPCZ-00AQWM-Li
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 12:26:57 +0000
Received: by mail-wr1-f52.google.com with SMTP id c5so11229519wrq.9
 for <linux-riscv@lists.infradead.org>; Sun, 13 Jun 2021 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CedaLyXT/oQOMS44WMwA1Yn1YT5L2Y5mE3WMzvk4Nec=;
 b=Vla22lhlDhwzH0V0tZfAp6lf9GbPOibtjyCE86avoTiKJUDhv/iKq5uS7+Z2R6oS/E
 ojxAKjwtnV3zFi9oF3Rkv36ttg1PvAphuDMbO9aYsd/BjccHkMMln8KmnyUbz8D3chUh
 FVolr8aFA/tKcYo+wivA7yjtcBygiExKTVWTODSmTJzNatkNT3kzWXdpm+4PeSG4aI/2
 cS5Gvv5IJsNtL0t45wig6ohiOF88Cd4TFGjYySzEI6YxtyOZ2/kn0Kvs5X1h6ZRqQ4nQ
 XuXjpilMOt0myPrcJWtDXKWyUaYU6Y671FW5BPBO+AswWsP2ThMs7POZ2Le+0plCLEvZ
 5DPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CedaLyXT/oQOMS44WMwA1Yn1YT5L2Y5mE3WMzvk4Nec=;
 b=TKWxXe9sFBB1hHcjWzPlvXDYRwh2vR9+SvDxQbh2beB5P8RMlrWOvMv5DxJ4wVm1O6
 JDN5RI+sSXvrijo5Mntiag7z71zsIBwC08Jj97Mn+iJblk48KC9mQG9e6gi7nz0hprHo
 bpmO6OI1u8JafCUWtsfsuClzxdBnxaQezP28Tki4cSkeSk7lhUcjwjlTeA9msXou+Yez
 lAzptdu2oCZ2X4b/bHLmaLf253X10mws39w1Kd2+KzNW8X+2Y6oK61uCLW+l4MoO4Nqu
 5ZN4aY2XNj5rZXzo7meADha+L7KkPbHsmrsrMhGELKC27FeEN8lM2DnipEdTzVEgenTs
 EnfA==
X-Gm-Message-State: AOAM530x91j579MI7WNt+xwioIDvpA2MM3Ikq0OiKW8QOlA4yDPDLFLN
 Y9LZAaKgdYocRdVJAUwApUSmrkV+E2SHsVC/ncj0Dw==
X-Google-Smtp-Source: ABdhPJzDZJ0ImBevx9QNHKxBYPkLNodHrbdxR276scCz9w6bcuuS75xFTF3U4ErHLjP4dBXV5OZxpmFB8NV4SwHmj2c=
X-Received: by 2002:a5d:540b:: with SMTP id g11mr14155201wrv.390.1623587151487; 
 Sun, 13 Jun 2021 05:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-6-anup.patel@wdc.com>
 <878s3et831.wl-maz@kernel.org>
In-Reply-To: <878s3et831.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 13 Jun 2021 17:55:40 +0530
Message-ID: <CAAhSdy2e9BsgtTL3ETRC-dvHW9hgKmgRi87Gsk+vUT-kMsJ4NQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 05/10] irqchip: Add ACLINT software interrupt driver
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
X-CRM114-CacheID: sfid-20210613_052655_740994_D77B1838 
X-CRM114-Status: GOOD (  41.96  )
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

On Sun, Jun 13, 2021 at 3:11 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 12 Jun 2021 17:04:17 +0100,
> Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The RISC-V ACLINT provides MSWI and SSWI devices for M-mode and
> > S-mode software interrupts respectively. We add irqchip driver
> > which provide IPI operations based on ACLINT [M|S]SWI devices
> > to the Linux RISC-V kernel.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  drivers/irqchip/Kconfig          |  11 +++
> >  drivers/irqchip/Makefile         |   1 +
> >  drivers/irqchip/irq-aclint-swi.c | 122 +++++++++++++++++++++++++++++++
> >  3 files changed, 134 insertions(+)
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
> > index 000000000000..f9607072cc7b
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-aclint-swi.c
> > @@ -0,0 +1,122 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> > + */
> > +
> > +#define pr_fmt(fmt) "aclint-swi: " fmt
> > +#include <linux/cpu.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/smp.h>
> > +
> > +struct aclint_swi {
> > +     void __iomem *sip_reg;
> > +};
> > +static DEFINE_PER_CPU(struct aclint_swi, aclint_swis);
> > +
> > +static void aclint_swi_send_ipi(const struct cpumask *target)
> > +{
> > +     unsigned int cpu;
> > +     struct aclint_swi *swi;
> > +
> > +     for_each_cpu(cpu, target) {
> > +             swi = per_cpu_ptr(&aclint_swis, cpu);
> > +             if (!swi->sip_reg) {
> > +                     pr_warn("%s: CPU%d SIP register not available\n",
> > +                             __func__, cpu);
> > +                     continue;
> > +             }
> > +
> > +             writel(1, swi->sip_reg);
> > +     }
> > +}
> > +
> > +static void aclint_swi_clear_ipi(void)
> > +{
> > +     struct aclint_swi *swi = this_cpu_ptr(&aclint_swis);
> > +
> > +     if (!swi->sip_reg) {
> > +             pr_warn("%s: CPU%d SIP register not available\n",
> > +                     __func__, smp_processor_id());
> > +             return;
> > +     }
> > +
> > +     writel(0, swi->sip_reg);
> > +}
> > +
> > +static struct riscv_ipi_ops aclint_swi_ipi_ops = {
> > +     .name = "ACLINT-SWI",
> > +     .use_for_rfence = true,
> > +     .ipi_inject = aclint_swi_send_ipi,
> > +     .ipi_clear = aclint_swi_clear_ipi,
> > +};
> > +
> > +static int __init aclint_swi_init(struct device_node *node,
> > +                               struct device_node *parent)
> > +{
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
> > +             swi = per_cpu_ptr(&aclint_swis, cpu);
> > +             swi->sip_reg = base + i * sizeof(u32);
> > +             nr_cpus++;
> > +     }
> > +
> > +     /* Announce the ACLINT SWI device */
> > +     pr_info("%pOFP: providing IPIs for %d CPUs\n", node, nr_cpus);
> > +
> > +     /* Register the IPI operations */
> > +     riscv_set_ipi_ops(&aclint_swi_ipi_ops);
> > +
> > +     return 0;
> > +}
> > +
> > +#ifdef CONFIG_RISCV_M_MODE
> > +IRQCHIP_DECLARE(riscv_aclint_swi, "riscv,aclint-mswi", aclint_swi_init);
> > +#else
> > +IRQCHIP_DECLARE(riscv_aclint_swi, "riscv,aclint-sswi", aclint_swi_init);
> > +#endif
>
> I'm sorry, but this really isn't an irqchip driver. This is a piece of
> arch-specific code that uses *none* of the irq subsystem abstractions
> apart from the IRQCHIP_DECLARE() macro.

Yes, I was not sure we can call it IRQCHIP hence the RFC PATCH.

Both ACLINT MSWI and SSWI are special devices providing only IPI
support so I will re-think how to fit this.

>
> If you implemented it on top of the IPI irq_domain abstraction, making
> your IPIs actual IRQs, use the proper interrupt flows and accounting,
> then it would make sense to call it an irqchip driver. But as it
> stands, it has no place in drivers/irqchip.

Okay, let me explore IPI irq_domain if it is suitable for this.

Regards,
Anup

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
