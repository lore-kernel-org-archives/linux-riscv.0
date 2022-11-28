Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D36C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8puIMMXio+CmyPihIaj56iqaqFN33fpRCNsYH+cvH/0=; b=Tllxa6bufMDvi5
	62Ct+0TwS9yX7l7nx23vWP6y1McMpAX+T1o0H0nm4XJZN+4K4LMnOf66jbMIjIiss+a6o4uELOTkC
	+xqXM2LHMOBaIH8LtYlnVFeJTdJZDoZ9tg6QB4YK7OswGsv5CTfxHzYodlftiUJUzzPV8c3mjwK53
	0FRT39/HQksF1+kW3Mh2IrJ0zuDdT6SK3Cu2j9UBC57TCOKf02x7AWB1ZNYN5WsPGKd7figLB1Uk/
	AkpTaNzmBLsRpFeydvk+3XNIonr5SJlHCJL4fgHcK95/jtpq9uQO2HnWNWYNmF3OCdcZIWz6FMzuY
	PrLXFJgoxMZLi7VzF2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc53-001D0V-Qc; Mon, 28 Nov 2022 11:13:45 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc50-001Cym-Nj
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 11:13:44 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-14279410bf4so12542298fac.8
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 03:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eRGejjm0+pzR27fOj63h8GuuUuQdNDZ09q1cyoJZjvU=;
        b=oxkIXd8O1uS5hawFzC6uleSOyXgK1vrVTTVYmYXOKPcRUvQ+O4fZLQgm4FbKpjTWUz
         gZ1lyRx1Hav31chRUOdoxBororp1vlDdXUEZgkDwb0HF8s0VFadSf6epiEU+De2kTVL4
         sBqID9PBpgrfzLx6ICB1GC+doT+U0pXxDgDcVYj7fqpj0hhHlxj2/Yy8HPErVL+uBZ/X
         dlj9aD93v0EJJNA1Mjj2wBBdBu3I5xO0GhRiI/ueUUCos1DPcAbri/ldbf98pINEn3jy
         hcOZceL1EraP+BKVmrvn4vOh3Tf/BmaxfxPJW1An2Se3QHKp8IHqIQs+ZR+4N9hRpOhA
         ZBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRGejjm0+pzR27fOj63h8GuuUuQdNDZ09q1cyoJZjvU=;
        b=bo8M/a8tssfIY/vdRPUX8M/dMc2QU/552gJwvNYePHiBhKpgzmntFy34d5Svomv0kn
         LEwAlrUbcIU49s9CRe4tTC7xHLN4y5qaRNtpPZpuuhlmag9rg7ijM/LQDrIllHvw9mgg
         MAFxvWi+eoci5pliFRZ2JigOq40+1etaF7wTKK3F0VM/ok2qGoC6EYwRA+qZi93rILc1
         CKi06nm5Tw5Fz8qgzlSeIiQhZUMCAW/U78jMLMqYLdRAiAD0OlASmfuhP8Gp9AwAlh21
         XNIRDxerr/SvAQldSqSGecQXFAGQERnNuOOJKx5wtdNLGW/jrep0V9sLxBepeiJr5809
         PsIQ==
X-Gm-Message-State: ANoB5pnfhmxXmeHDsq+F5BR+KrnqpqeVdlNEQX67RbRs7p2GxIm11AaY
	9zwm+VafCw0X2yrv0i/HiTaWkmvzOYaTqV48Oi7wErPkMGeHUw==
X-Google-Smtp-Source: AA0mqf57aNjaMzbA1A3hp0lx7EVe/jF4ht/jwBT9SyKkxTl31AJBC+9AHsk9T4NrnxxUd3XSkBHkNOwzastc6uYu8XE=
X-Received: by 2002:a05:6870:9d8b:b0:143:cbc:ac46 with SMTP id
 pv11-20020a0568709d8b00b001430cbcac46mr16097915oab.271.1669634020738; Mon, 28
 Nov 2022 03:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20221126173453.306088-1-apatel@ventanamicro.com>
 <20221126173453.306088-4-apatel@ventanamicro.com> <86k03fmkox.wl-maz@kernel.org>
In-Reply-To: <86k03fmkox.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Nov 2022 16:43:30 +0530
Message-ID: <CAK9=C2Un8vH-OM8PRGgU-OijnNjmEOXya_gC=2BUMBDuhpjWPQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] genirq: Add mechanism to multiplex a single HW IPI
To: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_031342_805126_B224FDD6 
X-CRM114-Status: GOOD (  51.97  )
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

On Mon, Nov 28, 2022 at 4:04 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Sat, 26 Nov 2022 17:34:49 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > All RISC-V platforms have a single HW IPI provided by the INTC local
> > interrupt controller. The HW method to trigger INTC IPI can be through
> > external irqchip (e.g. RISC-V AIA), through platform specific device
> > (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
> >
> > To support multiple IPIs on RISC-V, we add a generic IPI multiplexing
> > mechanism which help us create multiple virtual IPIs using a single
> > HW IPI. This generic IPI multiplexing is inspired from the Apple AIC
> > irqchip driver and it is shared by various RISC-V irqchip drivers.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  include/linux/irq.h  |   4 +
> >  kernel/irq/Kconfig   |   5 ++
> >  kernel/irq/Makefile  |   1 +
> >  kernel/irq/ipi-mux.c | 210 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 220 insertions(+)
> >  create mode 100644 kernel/irq/ipi-mux.c
> >
> > diff --git a/include/linux/irq.h b/include/linux/irq.h
> > index c3eb89606c2b..6024e1ee1257 100644
> > --- a/include/linux/irq.h
> > +++ b/include/linux/irq.h
> > @@ -1266,6 +1266,10 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
> >  int ipi_send_single(unsigned int virq, unsigned int cpu);
> >  int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
> >
> > +void ipi_mux_process(void);
> > +int ipi_mux_create(unsigned int nr_ipi,
> > +                void (*mux_send)(const struct cpumask *));
> > +
> >  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
> >  /*
> >   * Registers a generic IRQ handling function as the top-level IRQ handler in
> > diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
> > index db3d174c53d4..df17dbc54b02 100644
> > --- a/kernel/irq/Kconfig
> > +++ b/kernel/irq/Kconfig
> > @@ -86,6 +86,11 @@ config GENERIC_IRQ_IPI
> >       depends on SMP
> >       select IRQ_DOMAIN_HIERARCHY
> >
> > +# Generic IRQ IPI Mux support
> > +config GENERIC_IRQ_IPI_MUX
> > +     bool
> > +     depends on SMP
> > +
> >  # Generic MSI interrupt support
> >  config GENERIC_MSI_IRQ
> >       bool
> > diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
> > index b4f53717d143..f19d3080bf11 100644
> > --- a/kernel/irq/Makefile
> > +++ b/kernel/irq/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_GENERIC_IRQ_MIGRATION) += cpuhotplug.o
> >  obj-$(CONFIG_PM_SLEEP) += pm.o
> >  obj-$(CONFIG_GENERIC_MSI_IRQ) += msi.o
> >  obj-$(CONFIG_GENERIC_IRQ_IPI) += ipi.o
> > +obj-$(CONFIG_GENERIC_IRQ_IPI_MUX) += ipi-mux.o
> >  obj-$(CONFIG_SMP) += affinity.o
> >  obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
> >  obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
> > diff --git a/kernel/irq/ipi-mux.c b/kernel/irq/ipi-mux.c
> > new file mode 100644
> > index 000000000000..366d8cd5320b
> > --- /dev/null
> > +++ b/kernel/irq/ipi-mux.c
> > @@ -0,0 +1,210 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Multiplex several virtual IPIs over a single HW IPI.
> > + *
> > + * Copyright The Asahi Linux Contributors
> > + * Copyright (c) 2022 Ventana Micro Systems Inc.
> > + */
> > +
> > +#define pr_fmt(fmt) "ipi-mux: " fmt
> > +#include <linux/cpu.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/jump_label.h>
> > +#include <linux/percpu.h>
> > +#include <linux/smp.h>
> > +
> > +struct ipi_mux_cpu {
> > +     atomic_t                        enable;
> > +     atomic_t                        bits;
> > +     struct cpumask                  send_mask;
> > +};
> > +
> > +static struct ipi_mux_cpu __percpu *ipi_mux_pcpu;
> > +static struct irq_domain *ipi_mux_domain;
> > +static void (*ipi_mux_send)(const struct cpumask *mask);
> > +
> > +static void ipi_mux_mask(struct irq_data *d)
> > +{
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > +
> > +     atomic_andnot(BIT(irqd_to_hwirq(d)), &icpu->enable);
> > +}
> > +
> > +static void ipi_mux_unmask(struct irq_data *d)
> > +{
> > +     u32 ibit = BIT(irqd_to_hwirq(d));
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > +
> > +     atomic_or(ibit, &icpu->enable);
> > +
> > +     /*
> > +      * The atomic_or() above must complete before the atomic_read()
> > +      * below to avoid racing ipi_mux_send_mask().
> > +      */
> > +     smp_mb__after_atomic();
> > +
> > +     /* If a pending IPI was unmasked, raise a parent IPI immediately. */
> > +     if (atomic_read(&icpu->bits) & ibit)
> > +             ipi_mux_send(cpumask_of(smp_processor_id()));
> > +}
> > +
> > +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
> > +{
> > +     u32 ibit = BIT(irqd_to_hwirq(d));
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > +     struct cpumask *send_mask = &icpu->send_mask;
> > +     unsigned long flags;
> > +     int cpu;
> > +
> > +     /*
> > +      * We use send_mask as a per-CPU variable so disable local
> > +      * interrupts to avoid being preempted.
> > +      */
> > +     local_irq_save(flags);
>
> The correct way to avoid preemption is to use preempt_disable(), which
> is a lot cheaper than disabling interrupt on most architectures.

Okay, I will update.

>
> > +
> > +     cpumask_clear(send_mask);
>
> This thing is likely to be unnecessarily expensive on very large
> systems, as it is proportional to the number of CPUs.
>
> > +
> > +     for_each_cpu(cpu, mask) {
> > +             icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
> > +             atomic_or(ibit, &icpu->bits);
>
> The original code had an atomic_fetch_or_release() to allow eliding
> the IPI if the target interrupt was already pending. Why is that code
> gone? This is a pretty cheap and efficient optimisation.

That optimization is causing RCU stalls on QEMU RISC-V virt
machine with large number of CPUs.

>
> > +
> > +             /*
> > +              * The atomic_or() above must complete before
> > +              * the atomic_read() below to avoid racing with
> > +              * ipi_mux_unmask().
> > +              */
> > +             smp_mb__after_atomic();
> > +
> > +             if (atomic_read(&icpu->enable) & ibit)
> > +                     cpumask_set_cpu(cpu, send_mask);
> > +     }
> > +
> > +     /* Trigger the parent IPI */
> > +     ipi_mux_send(send_mask);
>
> IPIs are very rarely made pending on more than a single CPU at a
> time. The overwhelming majority of them are targeting a single CPU. So
> accumulating bits to avoid doing two or more "send" actions only
> penalises the generic case.
>
> My conclusion is that this "send_mask" can probably be removed,
> together with the preemption fiddling.

So, we should call ipi_mux_send() for one target CPU at a time ?

>
> > +
> > +     local_irq_restore(flags);
> > +}
> > +
> > +static const struct irq_chip ipi_mux_chip = {
> > +     .name           = "IPI Mux",
> > +     .irq_mask       = ipi_mux_mask,
> > +     .irq_unmask     = ipi_mux_unmask,
> > +     .ipi_send_mask  = ipi_mux_send_mask,
> > +};
>
> OK, you have now dropped the superfluous pre/post handlers. But the
> need still exists. Case in point, the aic_handle_ipi() prologue and
> epilogue to the interrupt handling. I have suggested last time that
> the driver could provide the actual struct irq_chip in order to
> provide the callbacks it requires.

The aic_handle_ipi() can simply call ipi_mux_process() between
the prologue and epilogue.

>
> Please realise that I will not take this patch if this cannot be made
> to work with the single existing in-tree instance of an IPI MUX. 90%
> of the code having been lifted from there, I think this is a pretty
> fair ask.

Only the muxing part of AIC has been factored out. All the register
programming of AIC will remain in the AIA irqchip driver without any
change in sequence.

>
> > +
> > +static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
> > +                             unsigned int nr_irqs, void *arg)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < nr_irqs; i++) {
> > +             irq_set_percpu_devid(virq + i);
> > +             irq_domain_set_info(d, virq + i, i,
> > +                                 &ipi_mux_chip, d->host_data,
>
> What does d->host_data represent here?

It's always NULL so we don't need to pass it. I will update.

>
> > +                                 handle_percpu_devid_irq, NULL, NULL);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct irq_domain_ops ipi_mux_domain_ops = {
> > +     .alloc          = ipi_mux_domain_alloc,
> > +     .free           = irq_domain_free_irqs_top,
> > +};
> > +
> > +/**
> > + * ipi_mux_process - Process multiplexed virtual IPIs
> > + */
> > +void ipi_mux_process(void)
> > +{
> > +     struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> > +     irq_hw_number_t hwirq;
> > +     unsigned long ipis;
> > +     unsigned int en;
> > +
> > +     /*
> > +      * Reading enable mask does not need to be ordered as long as
> > +      * this function called from interrupt handler because only
> > +      * the CPU itself can change it's own enable mask.
> > +      */
> > +     en = atomic_read(&icpu->enable);
> > +
> > +     /*
> > +      * Clear the IPIs we are about to handle. This pairs with the
> > +      * atomic_fetch_or_release() in ipi_mux_send_mask().
> > +      */
> > +     ipis = atomic_fetch_andnot(en, &icpu->bits) & en;
> > +
> > +     for_each_set_bit(hwirq, &ipis, BITS_PER_LONG)
>
> BITS_PER_LONG...

Argh, I should have used BITS_PER_TYPE(int) here. I will update.

>
> > +             generic_handle_domain_irq(ipi_mux_domain, hwirq);
> > +}
> > +
> > +/**
> > + * ipi_mux_create - Create virtual IPIs multiplexed on top of a single
> > + * parent IPI.
> > + * @nr_ipi:          number of virtual IPIs to create. This should
> > + *                   be <= BITS_PER_TYPE(int)
> > + * @mux_send:                callback to trigger parent IPI
> > + *
> > + * Returns first virq of the newly created virtual IPIs upon success
> > + * or <=0 upon failure
> > + */
> > +int ipi_mux_create(unsigned int nr_ipi,
> > +                void (*mux_send)(const struct cpumask *))
> > +{
> > +     struct fwnode_handle *fwnode;
> > +     struct irq_domain *domain;
> > +     int rc;
> > +
> > +     if (ipi_mux_domain)
> > +             return -EEXIST;
> > +
> > +     if (BITS_PER_TYPE(int) < nr_ipi || !mux_send)
>
> ... vs BITS_PER_TYPE(int) ...
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
