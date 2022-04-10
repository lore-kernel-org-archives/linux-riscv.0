Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EB6C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 20:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78b0PLgYPqVwhs2Aw/3tdcpmMbCWps/iELbfdlopguU=; b=fNBeMPZNvoxoK7
	X5jrTZAEma4SnfoMMecJeqsnUIo8MRXMFbLfSxwP5X7J0Qla0Cjmn5mW7ORG1RY05d1KYgYbGbwRY
	OMS2Xltu3cw6euMk1ZxBzzkf/3FP558Si2MGl9n0SV/LHN+5412pnKzRvjblNDpHqCXRc9EpOZg4h
	flGcXJSNnYJl2EZJd1/Nkph7v/W5NXXszw0D6clQtTWYUrujF1gSKfItCon7FzWnxbAU9lVX9snMM
	3lrOSiWH3YGCsUoNfGm8q6QxI4DykIrjdelGAZ0lRfWeYAI4slYxNV/cVbZqYoy/N//dVismUm8LZ
	uJBPWnbb5B1uUIgu90MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nddtv-005Pvv-6E; Sun, 10 Apr 2022 20:11:11 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nddtp-005Pv1-QW
 for linux-riscv@lists.infradead.org; Sun, 10 Apr 2022 20:11:10 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1649621461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFZiyRoAkzbPk9Xvd26+tVM4kSwgrt9e2TSeylQenK4=;
 b=qRv5q4FMwx8M4ExgvLlNWs5Qm8N3vPR7Ygnmrx2ov+/OqkpaI0A0ecU01kxDfCmcS8fYLl
 DEx3wul4edO+FhL2wjWKS4gpGXCzY+BwD3P1uFPMOC92cMj4UvBw9tFWyQljWhnmhMVJkX
 9A3MPK3zttKpW/lNI+NW0zDDPklavVUPGXN8prMGhT98k/Aglbv7294K7FGYv4uze1pEk/
 k+7y2SVzlV07pZb1GGY2xNiZtU2KYAlgidkHYIE2jKKJr0qtQo3+lDWujhiYsJKoV247A7
 jBaeu9DceUZrX6QWrwWZKnVwJ4GttHYot4ckrcgY+RTw8BsXXzHLCkF/bVbXzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1649621461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFZiyRoAkzbPk9Xvd26+tVM4kSwgrt9e2TSeylQenK4=;
 b=pyNbIVhNc1r6Uv7vn9aefZj+wTHPs26UmgzeP3aRxEYpceoMrD9ydhW1eAh+cZB2DTbji8
 OBWcQheUTykh5hBg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Marc
 Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 3/7] genirq: Add mechanism to multiplex a single HW IPI
In-Reply-To: <20220324151258.943896-4-apatel@ventanamicro.com>
References: <20220324151258.943896-1-apatel@ventanamicro.com>
 <20220324151258.943896-4-apatel@ventanamicro.com>
Date: Sun, 10 Apr 2022 22:11:01 +0200
Message-ID: <87a6cshf6y.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_131106_234879_2CE42EA0 
X-CRM114-Status: GOOD (  29.99  )
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

Anup,

On Thu, Mar 24 2022 at 20:42, Anup Patel wrote:
> All RISC-V platforms have a single HW IPI provided by the INTC local
> interrupt controller. The HW method to trigger INTC IPI can be through
> external irqchip (e.g. RISC-V AIA), through platform specific device
> (e.g. SiFive CLINT timer), or through firmware (e.g. SBI IPI call).
>
> To support multiple IPIs on RISC-V, we need a generic mechanism to
> create multiple per-CPU vIRQs using a single HW IPI hence this patch.

git grep 'This patch' Documentation/process

> The generic IPI multiplex mechanism added by this patch can also be
> useful to other architectures.

Which ones? Sane architectures have more than one IPI.

> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index 848e1e12c5c6..cdce7eae2f37 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -1248,6 +1248,34 @@ int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
>  int ipi_send_single(unsigned int virq, unsigned int cpu);
>  int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
>  
> +#define IPI_MUX_NR_IRQS		BITS_PER_LONG
> +struct ipi_mux_ops {

This is unreadable. Newlines exist for a reason.

> +	void (*ipi_mux_clear)(unsigned int parent_virq);
> +	void (*ipi_mux_send)(unsigned int parent_virq,
> +			     const struct cpumask *mask);
> +};
> +
> +/* Process multiplexed IPIs */
> +void ipi_mux_process(void);
> +
> +/*
> + * Create multiple IPIs (total IPI_MUX_NR_IRQS) multiplexed on top of a
> + * single parent IPI.
> + *
> + * If the parent IPI > 0 then ipi_mux_process() will be automatically
> + * called via chained handler.
> + *
> + * If the parent IPI <= 0 then it is responsiblity of irqchip drivers
> + * to explicitly call ipi_mux_process() for processing muxed
> + * IPIs.
> + *
> + * Returns first virq of the muxed IPIs upon success or <=0 upon failure
> + */
> +int ipi_mux_create(unsigned int parent_virq, const struct ipi_mux_ops *ops);

While it is kinda sensible to have the documentation near the
declaration, I prefer it to be near the code because thats where it
matters and also has a higher chance to be updated when the code
changes.

Please use proper kernel doc while at it.

> +static unsigned int ipi_mux_parent_virq;
> +static struct irq_domain *ipi_mux_domain;
> +static const struct  ipi_mux_ops *ipi_mux_ops;
> +static DEFINE_PER_CPU(unsigned long, ipi_mux_bits);
> +
> +static void ipi_mux_dummy(struct irq_data *d)
> +{
> +}
> +
> +static void ipi_mux_send_mask(struct irq_data *d, const struct cpumask *mask)
> +{
> +	int cpu;
> +
> +	/* Barrier before doing atomic bit update to IPI bits */
> +	smp_mb__before_atomic();
> +
> +	for_each_cpu(cpu, mask)
> +		set_bit(d->hwirq, per_cpu_ptr(&ipi_mux_bits, cpu));
> +
> +	/* Barrier after doing atomic bit update to IPI bits */
> +	smp_mb__after_atomic();
> +
> +	/* Trigger the parent IPI */
> +	ipi_mux_ops->ipi_mux_send(ipi_mux_parent_virq, mask);
> +}
> +
> +static struct irq_chip ipi_mux_chip = {
> +	.name		= "RISC-V IPI Mux",

RISC-V IPI Mux is a truly generic name :)

> +	.irq_mask	= ipi_mux_dummy,
> +	.irq_unmask	= ipi_mux_dummy,
> +	.ipi_send_mask	= ipi_mux_send_mask,
> +};
> +
> +static int ipi_mux_domain_map(struct irq_domain *d, unsigned int irq,
> +			      irq_hw_number_t hwirq)
> +{
> +	irq_set_percpu_devid(irq);
> +	irq_domain_set_info(d, irq, hwirq, &ipi_mux_chip, d->host_data,
> +			    handle_percpu_devid_irq, NULL, NULL);
> +
> +	return 0;
> +}
> +
> +static int ipi_mux_domain_alloc(struct irq_domain *d, unsigned int virq,
> +				unsigned int nr_irqs, void *arg)
> +{
> +	int i, ret;
> +	irq_hw_number_t hwirq;
> +	unsigned int type = IRQ_TYPE_NONE;
> +	struct irq_fwspec *fwspec = arg;

  Documentation/process/maintainer-tip.rst #coding-style-notes

> +	ret = irq_domain_translate_onecell(d, fwspec, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		ret = ipi_mux_domain_map(d, virq + i, hwirq + i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops ipi_mux_domain_ops = {
> +	.translate	= irq_domain_translate_onecell,
> +	.alloc		= ipi_mux_domain_alloc,
> +	.free		= irq_domain_free_irqs_top,
> +};
> +
> +void ipi_mux_process(void)
> +{
> +	int err;
> +	unsigned long irqs, *bits = this_cpu_ptr(&ipi_mux_bits);
> +	irq_hw_number_t hwirq;
> +
> +	while (true) {
> +		/* Clear the parent IPI */
> +		ipi_mux_ops->ipi_mux_clear(ipi_mux_parent_virq);

This being in a loop smells fishy at least without a comment. And the
more I read all of this the less I'm convinced that this code can be
used by anything else than RISCV.

> +		/* Order bit clearing and data access. */
> +		mb();

This mb() pairs with what? Memory barriers have a counterpart and it's
mandatory to document that in the comment.

> +		irqs = xchg(bits, 0);
> +		if (!irqs)
> +			break;
> +
> +		for_each_set_bit(hwirq, &irqs, IPI_MUX_NR_IRQS) {
> +			err = generic_handle_domain_irq(ipi_mux_domain,
> +							hwirq);
> +			if (unlikely(err))
> +				pr_warn_ratelimited(
> +					"can't find mapping for hwirq %lu\n",
> +					hwirq);
> +		}
> +	}
> +}
> +
> +
> +void ipi_mux_destroy(void)

Seriously? You provide a function to rip the IPI mechanism out in a
running system? What's that for?

> +{
> +	if (!ipi_mux_domain)
> +		return;
> +
> +	irq_domain_remove(ipi_mux_domain);
> +	ipi_mux_domain = NULL;
> +	ipi_mux_parent_virq = 0;

If it would be useful, then this would leak the hotplug callbacks, but
the good news is that after tearing down the IPI domain hotplug does not
work anymore :)

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
