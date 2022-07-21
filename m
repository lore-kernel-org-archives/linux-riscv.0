Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0344ECCA479
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WM0AGQq2DKD3zjCa8YR1z0c4pwoPQmrJ8uRQlXgpqRc=; b=Ev9MCRyBMh+XN0
	Erbr1/MX4SL8OTr057PoXjpsl67gOeTrJO/K+c2MR6x9jZ688PDAgQt6IlSmHKN8yJJypUHRqvqD6
	hrhFbx4JPTsRoqNw3m8XLd+GNd6RxsposoRXhQfIlq7UhXlAv8VwpwWsisGkb71+R8dff8HtVT9vV
	Jg16+/colG55t+lKRs72hbK1WzoBe2sVKAVG2IT3uZDKio+tDNO/1vix0ZnfADxHYMIz5PZQCbSAD
	XxgnS5ItK6myljwmqWUz4aTO5cRkcJbXEQYX2veLXtTYdu6Okm8+xrMPhQ8JF2KCVKCL2Qp6c3+Co
	ok+o/Z1GsvH9cHtspYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEVG0-006Jyp-Tj; Thu, 21 Jul 2022 12:26:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEVFx-006Jxy-LS
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 12:26:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m17so1741645wrw.7
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Ssu1IEV13fSbTIGvQByVdGLsBitnFztaBL+6LqkfP8=;
        b=nUXp7esk4LKpoFZ2B4rzZMsF1LW3V7kxVzkFc47V7AmcaM+dzVvGPno94duetFB85q
         hV4NO+gygeZYDVvNSoyopjghsXWdyefwFo2uHxtF2I7zARXJACU2wJZCgoQlBuFSaHKq
         SAloAMBhJAYWXFLmFUQEtlsyel6W7YeAgYOoCQfUlBz8cg3maDoj00nZyM85UwZxfl7o
         yR9XdZ1Vt2aVBP3E/Mxz9FR3dDD2/XDk3fXkxvnE8KqOPJoWypDH23+ymZMpb63g5Xd9
         2IeUKJMEY/7NT7LqkVbKKNq8IwsXZa+bQljytiPslLL3H+lfyCiaZn6RTMBu1x5JL/J1
         IFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Ssu1IEV13fSbTIGvQByVdGLsBitnFztaBL+6LqkfP8=;
        b=K3UoQzxsEvRTlbBnetdJ2vbh7XUXWkmm1Q7qhgP8snc6BPl6HJtHdQDl7ogRgmUEVf
         Itgw0x3dHcZceyarLexpA/MW6lp18v84lxghZxcbsH7eKAHLbZloZa489kK313CV0/yG
         guMDSr+EZenPEhyYV4C6NHJXe/TFnw+OuOvD0gAIivyr32Y4rZfjiZY27FY8GmPMojaW
         lgLDXe7zZJ0w4s5evpH/hIcfMt2vV6LG6dmcBIgkGPtp2lbVWtFVcOdr0hAR4NJBUdNH
         1Y9P8jtO2u6W5XIbJr+zOHgquac2TcmDBLdh4Ud23Tm71AlUZS3JAbqFkAQi2BV4V2Xp
         7s+A==
X-Gm-Message-State: AJIora9hwvKPEm2o49bgOfiTkRymlfE8d4/aphiQEmGWXeNpvPY+9/FX
	7YxCBnN9Dt6zlq+tQ3igbmP9fTtbf/+CCp1aXKehCQ==
X-Google-Smtp-Source: AGRyM1ux4UCotgYZMxdaRcSpoXgqe4f2wMo347+yTaZvanpr/E01jtiy1QChRuD1klZJ9XtZScaIfZzwj4dJ15vCNlE=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr35128041wrz.690.1658406375232; Thu, 21
 Jul 2022 05:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220720152348.2889109-1-apatel@ventanamicro.com>
 <20220720152348.2889109-4-apatel@ventanamicro.com> <8735euzq60.wl-maz@kernel.org>
 <CAAhSdy0MsPViOc83rGmDe8FPmUH-cgqf2oz2VoaESRTfd7Ez-g@mail.gmail.com> <5777cae1f73f36316c5e7c09343d8aa7@kernel.org>
In-Reply-To: <5777cae1f73f36316c5e7c09343d8aa7@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Jul 2022 17:56:02 +0530
Message-ID: <CAAhSdy2Xz6UOBfb11LMMhS9+eZL54M6asZLH0zvhGxy9Mv6yMg@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] genirq: Add mechanism to multiplex a single HW IPI
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_052617_726389_0597EB4F 
X-CRM114-Status: GOOD (  34.91  )
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

On Thu, Jul 21, 2022 at 5:39 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-07-21 12:44, Anup Patel wrote:
> > On Thu, Jul 21, 2022 at 4:30 PM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On Wed, 20 Jul 2022 16:23:44 +0100,
> >> Anup Patel <apatel@ventanamicro.com> wrote:
> >> >
> >> > All RISC-V platforms have a single HW IPI provided by the INTC local
> >> > interrupt controller. The HW method to trigger INTC IPI can be through
> >> > external irqchip (e.g. RISC-V AIA), through platform specific device
> >> > (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
> >> >
> >> > To support multiple IPIs on RISC-V, we add a generic IPI multiplexing
> >> > mechanism which help us create multiple virtual IPIs using a single
> >> > HW IPI. This generic IPI multiplexing is shared among various RISC-V
> >> > irqchip drivers.
> >> >
> >> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >> > ---
> >> >  include/linux/irq.h  |  16 ++++
> >> >  kernel/irq/Kconfig   |   4 +
> >> >  kernel/irq/Makefile  |   1 +
> >> >  kernel/irq/ipi-mux.c | 199 +++++++++++++++++++++++++++++++++++++++++++
> >> >  4 files changed, 220 insertions(+)
> >> >  create mode 100644 kernel/irq/ipi-mux.c
> >> >
> >> > diff --git a/include/linux/irq.h b/include/linux/irq.h
> >> > index 505308253d23..a97bf13a8965 100644
> >> > --- a/include/linux/irq.h
> >> > +++ b/include/linux/irq.h
> >> > @@ -1249,6 +1249,22 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
> >> >  int ipi_send_single(unsigned int virq, unsigned int cpu);
> >> >  int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
> >> >
> >> > +/**
> >> > + * struct ipi_mux_ops - IPI multiplex operations
> >> > + *
> >> > + * @ipi_mux_clear:   Optional function to clear parent IPI
> >> > + * @ipi_mux_send:    Trigger parent IPI on target CPUs
> >> > + */
> >> > +struct ipi_mux_ops {
> >> > +     void (*ipi_mux_clear)(unsigned int parent_virq);
> >> > +     void (*ipi_mux_send)(unsigned int parent_virq,
> >> > +                          const struct cpumask *mask);
> >> > +};
> >> > +
> >> > +void ipi_mux_process(void);
> >> > +int ipi_mux_create(unsigned int parent_virq, unsigned int nr_ipi,
> >> > +                const struct ipi_mux_ops *ops);
> >> > +
> >> >  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
> >> >  /*
> >> >   * Registers a generic IRQ handling function as the top-level IRQ handler in
> >> > diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> >> > index 10929eda9825..2388e7d40ed3 100644
> >> > --- a/kernel/irq/Kconfig
> >> > +++ b/kernel/irq/Kconfig
> >> > @@ -84,6 +84,10 @@ config GENERIC_IRQ_IPI
> >> >       bool
> >> >       select IRQ_DOMAIN_HIERARCHY
> >> >
> >> > +# Generic IRQ IPI Mux support
> >> > +config GENERIC_IRQ_IPI_MUX
> >> > +     bool
> >> > +
> >> >  # Generic MSI interrupt support
> >> >  config GENERIC_MSI_IRQ
> >> >       bool
> >> > diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
> >> > index b4f53717d143..f19d3080bf11 100644
> >> > --- a/kernel/irq/Makefile
> >> > +++ b/kernel/irq/Makefile
> >> > @@ -15,6 +15,7 @@ obj-$(CONFIG_GENERIC_IRQ_MIGRATION) += cpuhotplug.o
> >> >  obj-$(CONFIG_PM_SLEEP) += pm.o
> >> >  obj-$(CONFIG_GENERIC_MSI_IRQ) += msi.o
> >> >  obj-$(CONFIG_GENERIC_IRQ_IPI) += ipi.o
> >> > +obj-$(CONFIG_GENERIC_IRQ_IPI_MUX) += ipi-mux.o
> >> >  obj-$(CONFIG_SMP) += affinity.o
> >> >  obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
> >> >  obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
> >> > diff --git a/kernel/irq/ipi-mux.c b/kernel/irq/ipi-mux.c
> >> > new file mode 100644
> >> > index 000000000000..bd6b31ca588b
> >> > --- /dev/null
> >> > +++ b/kernel/irq/ipi-mux.c
> >> > @@ -0,0 +1,199 @@
> >> > +// SPDX-License-Identifier: GPL-2.0-only
> >> > +/*
> >> > + * Multiplex several virtual IPIs over a single HW IPI.
> >> > + *
> >> > + * Copyright (c) 2022 Ventana Micro Systems Inc.
> >> > + */
> >> > +
> >> > +#define pr_fmt(fmt) "ipi-mux: " fmt
> >> > +#include <linux/cpu.h>
> >> > +#include <linux/init.h>
> >> > +#include <linux/irq.h>
> >> > +#include <linux/irqchip.h>
> >> > +#include <linux/irqchip/chained_irq.h>
> >> > +#include <linux/irqdomain.h>
> >> > +#include <linux/smp.h>
> >> > +
> >> > +static unsigned int ipi_mux_nr;
> >> > +static unsigned int ipi_mux_parent_virq;
> >> > +static struct irq_domain *ipi_mux_domain;
> >> > +static const struct  ipi_mux_ops *ipi_mux_ops;
> >> > +static DEFINE_PER_CPU(unsigned long, ipi_mux_bits);
> >> > +
> >> > +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
> >> > +{
> >> > +     int cpu;
> >> > +
> >> > +     /* Barrier before doing atomic bit update to IPI bits */
> >> > +     smp_mb__before_atomic();
> >> > +
> >> > +     for_each_cpu(cpu, mask)
> >> > +             set_bit(d->hwirq, per_cpu_ptr(&ipi_mux_bits, cpu));
> >> > +
> >> > +     /* Barrier after doing atomic bit update to IPI bits */
> >> > +     smp_mb__after_atomic();
> >> > +
> >> > +     /* Trigger the parent IPI */
> >> > +     ipi_mux_ops->ipi_mux_send(ipi_mux_parent_virq, mask);
> >> > +}
> >> > +
> >> > +static const struct irq_chip ipi_mux_chip = {
> >> > +     .name           = "IPI Mux",
> >> > +     .ipi_send_mask  = ipi_mux_send_mask,
> >>
> >> I've given this a bit more though, and I came to the conclusion that
> >> we really should have the full masking semantics here, even if Linux
> >> currently doesn't really use it.
> >>
> >> It makes the handling a bit more complex, and unmasking a pending IPI
> >> must be handled gracefully, but we already have implemented most of
> >> that code in the irq-apple-aic driver.
> >>
> >> And if we go down this road, such a driver should be very easy to move
> >> over this infrastructure, making the change a lot more palatable.
> >
> > Sounds good.
> >
> > I will send v8 of ipi-mux which can be easily adapted for irq-apple-aic
> > driver
> > and it will have masking semantics as well.
>
> Thanks. No hurry though, as I'm closing the queue for 5.20 (fixes
> only until -rc1).

Okay, I will send after 5.20-rc1.

Regards,
Anup

>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
