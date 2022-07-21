Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BA6C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUkvXHbmeeG1hH8epWroOtKzVzcULKPZYQYgtE0xHzI=; b=LPyJ3zYVV+GOhQR3UC7QHq3lA1
	JHUq0bGz6zHc8p6NrNm0g0AIHU3RuresWE1EepRadUL0gMjb8jkAHsGja9xjtodBZTptMtMt7avjC
	4X+ziK16HaWIljoWlCuNr2T9MioMGPwFdmz8shX2XzOxHy/ez/885TIAvpzWHt5a8+7PHDlv6hwDm
	+s8/1ynyjNMKl+6B63/q59dSO9vgRiKZzkIamDhGW5ylDXKfvpq7KZC4vsagsKaWrGlHOVDZBUSGP
	6SwLHaEZa/VVIZtnEsRYNT6WASQonBzAHzQwXl6L93aBnlzdSSiXCYxhfH/hSWXmRK0OFV2j4qLFr
	5rrF+PRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEUzi-0069Lc-Qq; Thu, 21 Jul 2022 12:09:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEUzf-0069CC-NE
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 12:09:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9843361D4E;
	Thu, 21 Jul 2022 12:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D53C341C0;
	Thu, 21 Jul 2022 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658405366;
	bh=JBsSm8+XjDU/x7OEaGYyuNf0I9mHppieezR8MXL82Aw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PNMTBGvdhlU9dtZWA7uxSRPO+BG023WkwJCMULoDNREVkuLVjOr40Ok6z1fCgcpLu
	 GA/OvIrmcblr/hCJmaWLcPQZGcrDmfjqlo7vy9eQyFMvN2Nyx5H3+qDcAyH4rP639N
	 Q8H2pIxotf3E9ibDD2m58BOEF88HJl87M/2sBtGKw8nEbTCWhQcTKAsidaGOgcr+AI
	 NE6Pq4SjvYYj6yvIUNv5qSYfXC54hnJ8t1Wtovr2z3S/2jcMygS1uc+mFgPKssVdnc
	 KyuE3KmRH3dwWoPcdH7AO/BogcdCggL8GzByE6X7bkzm6sW6cj/t15/mLmd2Q1WlhK
	 /2jMv7LJb3UJg==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1oEUzb-00948O-LI;
	Thu, 21 Jul 2022 13:09:23 +0100
MIME-Version: 1.0
Date: Thu, 21 Jul 2022 13:09:23 +0100
From: Marc Zyngier <maz@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atishp@atishpatra.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 3/7] genirq: Add mechanism to multiplex a single HW IPI
In-Reply-To: <CAAhSdy0MsPViOc83rGmDe8FPmUH-cgqf2oz2VoaESRTfd7Ez-g@mail.gmail.com>
References: <20220720152348.2889109-1-apatel@ventanamicro.com>
 <20220720152348.2889109-4-apatel@ventanamicro.com>
 <8735euzq60.wl-maz@kernel.org>
 <CAAhSdy0MsPViOc83rGmDe8FPmUH-cgqf2oz2VoaESRTfd7Ez-g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5777cae1f73f36316c5e7c09343d8aa7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: anup@brainfault.org, apatel@ventanamicro.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de, daniel.lezcano@linaro.org, atishp@atishpatra.org, Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_050927_876624_FABA4E57 
X-CRM114-Status: GOOD (  30.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-07-21 12:44, Anup Patel wrote:
> On Thu, Jul 21, 2022 at 4:30 PM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On Wed, 20 Jul 2022 16:23:44 +0100,
>> Anup Patel <apatel@ventanamicro.com> wrote:
>> >
>> > All RISC-V platforms have a single HW IPI provided by the INTC local
>> > interrupt controller. The HW method to trigger INTC IPI can be through
>> > external irqchip (e.g. RISC-V AIA), through platform specific device
>> > (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
>> >
>> > To support multiple IPIs on RISC-V, we add a generic IPI multiplexing
>> > mechanism which help us create multiple virtual IPIs using a single
>> > HW IPI. This generic IPI multiplexing is shared among various RISC-V
>> > irqchip drivers.
>> >
>> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> > ---
>> >  include/linux/irq.h  |  16 ++++
>> >  kernel/irq/Kconfig   |   4 +
>> >  kernel/irq/Makefile  |   1 +
>> >  kernel/irq/ipi-mux.c | 199 +++++++++++++++++++++++++++++++++++++++++++
>> >  4 files changed, 220 insertions(+)
>> >  create mode 100644 kernel/irq/ipi-mux.c
>> >
>> > diff --git a/include/linux/irq.h b/include/linux/irq.h
>> > index 505308253d23..a97bf13a8965 100644
>> > --- a/include/linux/irq.h
>> > +++ b/include/linux/irq.h
>> > @@ -1249,6 +1249,22 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
>> >  int ipi_send_single(unsigned int virq, unsigned int cpu);
>> >  int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
>> >
>> > +/**
>> > + * struct ipi_mux_ops - IPI multiplex operations
>> > + *
>> > + * @ipi_mux_clear:   Optional function to clear parent IPI
>> > + * @ipi_mux_send:    Trigger parent IPI on target CPUs
>> > + */
>> > +struct ipi_mux_ops {
>> > +     void (*ipi_mux_clear)(unsigned int parent_virq);
>> > +     void (*ipi_mux_send)(unsigned int parent_virq,
>> > +                          const struct cpumask *mask);
>> > +};
>> > +
>> > +void ipi_mux_process(void);
>> > +int ipi_mux_create(unsigned int parent_virq, unsigned int nr_ipi,
>> > +                const struct ipi_mux_ops *ops);
>> > +
>> >  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
>> >  /*
>> >   * Registers a generic IRQ handling function as the top-level IRQ handler in
>> > diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
>> > index 10929eda9825..2388e7d40ed3 100644
>> > --- a/kernel/irq/Kconfig
>> > +++ b/kernel/irq/Kconfig
>> > @@ -84,6 +84,10 @@ config GENERIC_IRQ_IPI
>> >       bool
>> >       select IRQ_DOMAIN_HIERARCHY
>> >
>> > +# Generic IRQ IPI Mux support
>> > +config GENERIC_IRQ_IPI_MUX
>> > +     bool
>> > +
>> >  # Generic MSI interrupt support
>> >  config GENERIC_MSI_IRQ
>> >       bool
>> > diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
>> > index b4f53717d143..f19d3080bf11 100644
>> > --- a/kernel/irq/Makefile
>> > +++ b/kernel/irq/Makefile
>> > @@ -15,6 +15,7 @@ obj-$(CONFIG_GENERIC_IRQ_MIGRATION) += cpuhotplug.o
>> >  obj-$(CONFIG_PM_SLEEP) += pm.o
>> >  obj-$(CONFIG_GENERIC_MSI_IRQ) += msi.o
>> >  obj-$(CONFIG_GENERIC_IRQ_IPI) += ipi.o
>> > +obj-$(CONFIG_GENERIC_IRQ_IPI_MUX) += ipi-mux.o
>> >  obj-$(CONFIG_SMP) += affinity.o
>> >  obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
>> >  obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
>> > diff --git a/kernel/irq/ipi-mux.c b/kernel/irq/ipi-mux.c
>> > new file mode 100644
>> > index 000000000000..bd6b31ca588b
>> > --- /dev/null
>> > +++ b/kernel/irq/ipi-mux.c
>> > @@ -0,0 +1,199 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +/*
>> > + * Multiplex several virtual IPIs over a single HW IPI.
>> > + *
>> > + * Copyright (c) 2022 Ventana Micro Systems Inc.
>> > + */
>> > +
>> > +#define pr_fmt(fmt) "ipi-mux: " fmt
>> > +#include <linux/cpu.h>
>> > +#include <linux/init.h>
>> > +#include <linux/irq.h>
>> > +#include <linux/irqchip.h>
>> > +#include <linux/irqchip/chained_irq.h>
>> > +#include <linux/irqdomain.h>
>> > +#include <linux/smp.h>
>> > +
>> > +static unsigned int ipi_mux_nr;
>> > +static unsigned int ipi_mux_parent_virq;
>> > +static struct irq_domain *ipi_mux_domain;
>> > +static const struct  ipi_mux_ops *ipi_mux_ops;
>> > +static DEFINE_PER_CPU(unsigned long, ipi_mux_bits);
>> > +
>> > +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
>> > +{
>> > +     int cpu;
>> > +
>> > +     /* Barrier before doing atomic bit update to IPI bits */
>> > +     smp_mb__before_atomic();
>> > +
>> > +     for_each_cpu(cpu, mask)
>> > +             set_bit(d->hwirq, per_cpu_ptr(&ipi_mux_bits, cpu));
>> > +
>> > +     /* Barrier after doing atomic bit update to IPI bits */
>> > +     smp_mb__after_atomic();
>> > +
>> > +     /* Trigger the parent IPI */
>> > +     ipi_mux_ops->ipi_mux_send(ipi_mux_parent_virq, mask);
>> > +}
>> > +
>> > +static const struct irq_chip ipi_mux_chip = {
>> > +     .name           = "IPI Mux",
>> > +     .ipi_send_mask  = ipi_mux_send_mask,
>> 
>> I've given this a bit more though, and I came to the conclusion that
>> we really should have the full masking semantics here, even if Linux
>> currently doesn't really use it.
>> 
>> It makes the handling a bit more complex, and unmasking a pending IPI
>> must be handled gracefully, but we already have implemented most of
>> that code in the irq-apple-aic driver.
>> 
>> And if we go down this road, such a driver should be very easy to move
>> over this infrastructure, making the change a lot more palatable.
> 
> Sounds good.
> 
> I will send v8 of ipi-mux which can be easily adapted for irq-apple-aic 
> driver
> and it will have masking semantics as well.

Thanks. No hurry though, as I'm closing the queue for 5.20 (fixes
only until -rc1).

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
