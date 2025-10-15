Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EC2CCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TM/O5PqIWTlhFyIi/X3bSXTqFAvuiLOKkREE7f9aEk=; b=wjS8CVVc8IBVij
	uabdc3IsIUQ20dLsy3MA7OEitKU0jepQaiqXByLdpk1NG1F556bh6/dyqJDH9YTXdezZKCuor8Ntn
	3GT/UBq/x51FeIsP4lYJqaK5TLSsqX3uAMcWBJ+CsFLMHnFVQMArh+BetQq9LiKRbVf7/m0SK3XIt
	cvyKGcGMpSfwsL4YHmm/w3YI55cKR2LzcT2uCNAT6J1ep/aPm0X+dZNntT6uB001tzM79i0QvpFly
	iLT76lBRnGS7sCIRucrrqN41BSimRvU+kfhhK4pPsykadtxbsJlLzLs1LNyC6m1Qs1pNSEd7P8YVh
	psKN1Ht/ZTYl24Q1hSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Qg-00000002dY3-30hH;
	Wed, 15 Oct 2025 18:40:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Qd-00000002dWu-3eur
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:40:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760553648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+uP+eUWmeV1AcOzpTFqHijqsFbONeijvS4FICr7ALx0=;
	b=UOuBuEb3B/deBdCKfzYKnZIv2IFCw47QVB1rB9Y5sQHMYA+c3VxT+e2bSU32O3lP319r+E
	t1Rit1EJ/f6KLl67lVV4PNtcL6K1nQflR65zafd5wymcBVREUIPxgUU7KW3A7mqtJRx31y
	3rg15l7/ICCsPuplfWLOBp6GXUeyCah+0B6FlzBJLr90J6H6tiOBh0x1k2Q0W+vQ6ih6+d
	QM8i/pcTOrSwkI18KlKjQXkKKCnFq/HxIAXijjZXELxg21GkNQnI+KoC5Mkhl1IvG2gacs
	c+gMgZYIM6Akpa9ZVhyVRBv5SpN3xt0TKERYMGsKDNR1BzixXp2mibw+FhajJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760553648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+uP+eUWmeV1AcOzpTFqHijqsFbONeijvS4FICr7ALx0=;
	b=UYfg96jVV87s4/TO5Vuc6hNOWjzMJp5IqRYwlMW4j71Ncv1gUmSo08Rx6c6uwktqSx9/6i
	D/+JC7X2WVknTiCg==
To: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian
 Wang <dramforever@live.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Zhang Xincheng
 <zhangxincheng@ultrarisc.com>, Lucas Zampieri <lzampier@redhat.com>
Subject: Re: [PATCH v4 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
In-Reply-To: <20251015143108.441291-4-lzampier@redhat.com>
References: <20251015143108.441291-1-lzampier@redhat.com>
 <20251015143108.441291-4-lzampier@redhat.com>
Date: Wed, 15 Oct 2025 20:40:47 +0200
Message-ID: <87y0pc100g.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_114052_052509_3E2594F6 
X-CRM114-Status: GOOD (  19.52  )
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

On Wed, Oct 15 2025 at 15:31, Lucas Zampieri wrote:
> +static bool cp100_isolate_pending_irq(int nr_irq_groups, u32 ie[],
> +				       void __iomem *pending,
> +				       void __iomem *enable)
> +{
> +	u32 pending_irqs = 0;
> +	int i, j;
> +
> +	/* Look for first pending interrupt */
> +	for (i = 0; i < nr_irq_groups; i++) {
> +		pending_irqs = ie[i] & readl_relaxed(pending + i * sizeof(u32));
> +		if (pending_irqs)
> +			break;
> +	}
> +
> +	if (!pending_irqs)
> +		return false;
> +
> +	/* Disable all interrupts but the first pending one */
> +	for (j = 0; j < nr_irq_groups; j++) {
> +		u32 new_mask = 0;
> +
> +		if (j == i)
> +			/* Extract mask with lowest set bit */
> +			new_mask = (pending_irqs & -pending_irqs);

Please add brackets around the conditional as it's not a true single
line.

> +static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler,
> +					void __iomem *claim)
> +{
> +	void __iomem *enable = handler->enable_base;
> +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
> +	int nr_irqs = handler->priv->nr_irqs;
> +	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
> +	int i;
> +	irq_hw_number_t hwirq = 0;

Please use reverse fir tree ordering:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

> +
> +	raw_spin_lock(&handler->enable_lock);

Please use

       guard(raw_spinlock)(&handler->....);

which gets rid of the goto and you can just return instead.

> +	/* Save current interrupt enable state */
> +	for (i = 0; i < nr_irq_groups; i++)
> +		handler->enable_save[i] = readl_relaxed(enable + i * sizeof(u32));
> +
> +	if (!cp100_isolate_pending_irq(nr_irq_groups, handler->enable_save, pending, enable))
> +		goto out;
> +
> +	hwirq = readl(claim);
> +
> +	/* Restore previous state */
> +	for (i = 0; i < nr_irq_groups; i++)
> +		writel_relaxed(handler->enable_save[i], enable + i * sizeof(u32));
> +out:
> +	raw_spin_unlock(&handler->enable_lock);
> +	return hwirq;
> +}
> +
> +static void plic_handle_irq_cp100(struct irq_desc *desc)
> +{
> +	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
> +	irq_hw_number_t hwirq;
> +
> +	WARN_ON_ONCE(!handler->present);
> +
> +	chained_irq_enter(chip, desc);
> +
> +	while ((hwirq = cp100_get_hwirq(handler, claim))) {
> +		int err = generic_handle_domain_irq(handler->priv->irqdomain,
> +						    hwirq);

Let it stick out, you have 100 characters

> +		if (unlikely(err)) {
> +			pr_warn_ratelimited("%pfwP: can't find mapping for hwirq %lu\n",
> +					    handler->priv->fwnode, hwirq);
> +		}
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
>  static void plic_set_threshold(struct plic_handler *handler, u32 threshold)
>  {
>  	/* priority must be > threshold to trigger an interrupt */
> @@ -430,6 +516,8 @@ static const struct of_device_id plic_match[] = {
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>  	{ .compatible = "thead,c900-plic",
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> +	{ .compatible = "ultrarisc,cp100-plic",
> +	  .data = (const void *)BIT(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM) },
>  	{}
>  };
>  
> @@ -664,12 +752,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
>  		}
>  
>  		if (global_setup) {
> +			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;

Lacks a newline between variable declaration and code.

> +			if (test_bit(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM, &handler->priv->plic_quirks))
> +				handler_fn = plic_handle_irq_cp100;
> +
>  			/* Find parent domain and register chained handler */
>  			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
>  			if (domain)
>  				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
>  			if (plic_parent_irq)
> -				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
> +				irq_set_chained_handler(plic_parent_irq, handler_fn);
>  
>  			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
>  					  "irqchip/sifive/plic:starting",

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
