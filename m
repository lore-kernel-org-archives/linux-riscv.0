Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC72FC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3rAzW5fn/FLbBlDr5F1IsbL7BNqzqry0aq3dPqqP2c=; b=L6g98EA0CzGnRX
	/lhgRfcxYhFX45N3rMVvZ5+yHqlxSOeuVOck4oE69nYFKke5gva9ytOBSNSU6mr3CH+N97HGxmi6a
	egu413GuOnXBm80IcOvmTJQxWxLLvWLfl4KGyHMWwhMvkWPJiIc/VGVQIenm6UqY059iXlLJC6QT0
	605g6r7kEJ9e0NMD1//LWIufGDN9S9hMez07bID/XuVwSkmgzHLeHssp223cbHGfIFYXnOdHSlpE3
	n4ML2a02dfuUiVJjQirMkPVM2es6rIDsP2cZN1aPnrlDC7nvXgdkoFdd7POntozXyuKwoc9PrnHI8
	UvkDpgEs6fNN+k6HPjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nEg-008vkx-OO; Thu, 01 Dec 2022 17:20:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nEd-008vah-To
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:20:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669915226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B7lOeMuth+xu6aZHjHISNWUK+1E+KjPuMo7iAAszHcE=;
	b=YUmF1ICIqyLQWrNX4l9tFqwKwL7Vs7BwGSa2KtIk0LHVnTO1sfyXYNKZ3yQVfHbb1k0yli
	I3YG69dklsEJET/6egPycZ+XEFuiUtU3YwLTPhIeURkD1EVnESMGM1Qx2JDfZ9d5LrlBrS
	bj6S30vUr+m7sZtiERrh5aGOBD9120Mh2OmL2Dz4uwr8uhAL/KMHXSxXosuWB6s5FCOML0
	ZGcKNOy+oNsBOJTqHVmYSFJr4s+RoQYI2yJHq7LwpWN4E2qVkeOeDfH1DxoLSpzUgIoTcd
	OzS1ZvUvkgYoYeSsn2X+T6591oeODXv8XrEJEaFCPMfZOdcohsXVcbtQSYQsMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669915226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B7lOeMuth+xu6aZHjHISNWUK+1E+KjPuMo7iAAszHcE=;
	b=2HGaz1ekG/FGqlKsjIhnA5EofiF88VZ/h7NRv0ZnzaZM/KkU+25X3rOz/wK9c1ELxd+S7c
	kYXXGoqT1kPh/rCg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Marc
 Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v14 3/8] genirq: Add mechanism to multiplex a single HW IPI
In-Reply-To: <20221201130135.1115380-4-apatel@ventanamicro.com>
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
 <20221201130135.1115380-4-apatel@ventanamicro.com>
Date: Thu, 01 Dec 2022 18:20:25 +0100
Message-ID: <87v8mvqbvq.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_092032_307511_68774058 
X-CRM114-Status: GOOD (  21.50  )
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

On Thu, Dec 01 2022 at 18:31, Anup Patel wrote:
> All RISC-V platforms have a single HW IPI provided by the INTC local
> interrupt controller. The HW method to trigger INTC IPI can be through
> external irqchip (e.g. RISC-V AIA), through platform specific device
> (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
>
> To support multiple IPIs on RISC-V, we add a generic IPI multiplexing

s/we//

> mechanism which help us create multiple virtual IPIs using a single
> HW IPI. This generic IPI multiplexing is inspired from the Apple AIC

s/from/by/

> irqchip driver and it is shared by various RISC-V irqchip drivers.

Sure, but now we have two copies of this. One in the Apple AIC and one
here. The obvious thing to do is:

   1) Provide generic infrastructure

   2) Convert AIC to use it

   3) Add RISCV users

No?

> +static void ipi_mux_mask(struct irq_data *d)
> +{
> +	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> +
> +	atomic_andnot(BIT(irqd_to_hwirq(d)), &icpu->enable);
> +}
> +
> +static void ipi_mux_unmask(struct irq_data *d)
> +{
> +	u32 ibit = BIT(irqd_to_hwirq(d));
> +	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);

The AIC code got the variable ordering correct ...

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

> +	atomic_or(ibit, &icpu->enable);
> +
> +	/*
> +	 * The atomic_or() above must complete before the atomic_read()
> +	 * below to avoid racing ipi_mux_send_mask().
> +	 */
> +	smp_mb__after_atomic();
> +
> +	/* If a pending IPI was unmasked, raise a parent IPI immediately. */
> +	if (atomic_read(&icpu->bits) & ibit)
> +		ipi_mux_send(smp_processor_id());
> +}
> +
> +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
> +{
> +	u32 ibit = BIT(irqd_to_hwirq(d));
> +	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> +	unsigned long pending;
> +	int cpu;
> +
> +	for_each_cpu(cpu, mask) {
> +		icpu = per_cpu_ptr(ipi_mux_pcpu, cpu);
> +		pending = atomic_fetch_or_release(ibit, &icpu->bits);
> +
> +		/*
> +		 * The atomic_fetch_or_release() above must complete
> +		 * before the atomic_read() below to avoid racing with
> +		 * ipi_mux_unmask().
> +		 */
> +		smp_mb__after_atomic();
> +
> +		/*
> +		 * The flag writes must complete before the physical IPI is
> +		 * issued to another CPU. This is implied by the control
> +		 * dependency on the result of atomic_read() below, which is
> +		 * itself already ordered after the vIPI flag write.
> +		 */
> +		if (!(pending & ibit) && (atomic_read(&icpu->enable) & ibit))
> +			ipi_mux_send(cpu);
> +	}
> +}
> +
> +static const struct irq_chip ipi_mux_chip = {
> +	.name		= "IPI Mux",
> +	.irq_mask	= ipi_mux_mask,
> +	.irq_unmask	= ipi_mux_unmask,
> +	.ipi_send_mask	= ipi_mux_send_mask,
> +};
> +
> +static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
> +				unsigned int nr_irqs, void *arg)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		irq_set_percpu_devid(virq + i);
> +		irq_domain_set_info(d, virq + i, i, &ipi_mux_chip, NULL,
> +				    handle_percpu_devid_irq, NULL, NULL);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops ipi_mux_domain_ops = {
> +	.alloc		= ipi_mux_domain_alloc,
> +	.free		= irq_domain_free_irqs_top,
> +};
> +
> +/**
> + * ipi_mux_process - Process multiplexed virtual IPIs
> + */
> +void ipi_mux_process(void)
> +{
> +	struct ipi_mux_cpu *icpu = this_cpu_ptr(ipi_mux_pcpu);
> +	irq_hw_number_t hwirq;
> +	unsigned long ipis;
> +	unsigned int en;
> +
> +	/*
> +	 * Reading enable mask does not need to be ordered as long as
> +	 * this function called from interrupt handler because only
> +	 * the CPU itself can change it's own enable mask.
> +	 */
> +	en = atomic_read(&icpu->enable);
> +
> +	/*
> +	 * Clear the IPIs we are about to handle. This pairs with the
> +	 * atomic_fetch_or_release() in ipi_mux_send_mask().

The comments in the AIC code where you copied from are definitely
better...

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
