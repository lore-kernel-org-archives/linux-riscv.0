Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C44C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOpWinxLCyDF9C6NgzqPGry4rKpNBFS8LXzdAwFppfw=; b=W1Mb8yipAPUww1
	ScgDVNo//+c+8HOPQWl4xbRv9UgQye493NJ5egIeQJHsguoqqFxFpVPF+BfScCooVGBCRuouXezbv
	8waqGaim3Gw5yLT5H54GkrtQG2GsKbeakLma1vIu3XQKALHZ+uXoN4LohWoE9ZN1TFeEGWQTRNcfB
	lKdfj5eWqUBYCwdIo4VALXApQ5cHRo4XJJXbCshAzjU7T+AA2CMNk/LT321tmvVN3a0CbSR2ABeA1
	mKveWEpLR45CkfWbc7wPx6CWuIwjKkceeK11SHftm3/CqgnotrVeiovcmX6U7tjqRrJtALv8RRBK6
	RvQO/K1fqp4S6FnKZf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf02s-0000000DbpI-2Y1X;
	Fri, 16 Aug 2024 16:43:22 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf02o-0000000Dbor-3I4m
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 16:43:20 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-39b3cae5675so6270745ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 09:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723826597; x=1724431397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MfQcLd63ii/bmjsa/lyPKgdDyOlZYmQpscvNUj55Ss=;
        b=FKpBLWF5H5QXN3Pe0nht4ZezMv0fHQmStMmKnkcWEtmNcMggYialJz2fGBpTQvtlse
         tItJepgA7CqOdOryRCBYzezuBY3xpatYu3pyKnVJQH4WWcw3mNqesAR98p/iPgANa+rZ
         Sn+bTgIco5avzMcaIL1/pCMbAtX4UOeIMMbaHFtZOyxnX1UfB/lwlyE1bBu9n5c78+Ii
         TsC9p1zKX5L/1TKaJVwPGeDZVbP0anIpD+FBVDLGDeEj+/f+QUDbydXgWg+M40R6GDli
         yIK4beqp2NRdqdeu+iB6zajCHzV3CYR20tBb2tFd928tBxh1Kq1D0zS37imCfe/wsgFW
         1cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723826597; x=1724431397;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MfQcLd63ii/bmjsa/lyPKgdDyOlZYmQpscvNUj55Ss=;
        b=hkbvYpwFyl+SIsyskbNmE/hhydOEgqdp9URR/Q/1I0mxVeHADTNvExD6EIHsx18zap
         a/wQsaw8xtCUFVYmfMQYqZAA0/DsKJU/oruKoHJ9aYxLnwLO25VLlBAWAMN8hvKdM5Wa
         EGB+ItrYNB1gEx6iVhy6WRWlvf3HO6qx4sSnOzxlMnZ4CavaSUlo+o4HgMZrESq0xAQo
         bB0uYBr+Ff4zHMdqVFT81YKSRTU4jbGIUR8P3CsfQgtBodzBfSfP+2H7TA/D2ny+zgVY
         X+QFio9QSeYW3geaJn181oXd+lYdFx6zAJaQj56Jg9kDu0ilsj1FMY9IznjL1uEO2WgD
         +E0w==
X-Forwarded-Encrypted: i=1; AJvYcCU8rPClMc2FaFN8MJLstTJCzJN/lF04WAf2tJT+60hr8Sk/gTDXZK1+Wr/XwMXqW66/+Hy4bnVtnpCEjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7+8fGcaZc0YvMmRyyjbBSvVH0opXyePuQh6PbqgVyF8lbQoSw
	UmRyRS9fjiDyl9YhLyoCtBsATc5Fr2Dz+y+xMT9kRGkx27bA5JySH1zVlp9PsVSD6YC9GBAbYrC
	i
X-Google-Smtp-Source: AGHT+IFk+XDd8A9igBqIFs8RPUhycOEUMUGBOuAMj+7DbWe1oCt7fVrW62zHBAfJWKkF1owZ/3KRKA==
X-Received: by 2002:a05:6e02:5ab:b0:39d:24af:aff8 with SMTP id e9e14a558f8ab-39d24afb1a5mr40168145ab.7.1723826597081;
        Fri, 16 Aug 2024 09:43:17 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39d1ead5447sm14669585ab.18.2024.08.16.09.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 09:43:16 -0700 (PDT)
Message-ID: <a13e8ddc-20d2-4d4d-8975-4352c38bbe69@sifive.com>
Date: Fri, 16 Aug 2024 11:43:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/sifive-plic: Probe plic driver early for
 Allwinner D1 platform
To: Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20240816161828.2979143-1-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240816161828.2979143-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_094319_032619_D6C40FD5 
X-CRM114-Status: GOOD (  37.60  )
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
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On 2024-08-16 11:18 AM, Anup Patel wrote:
> The latest Linux RISC-V no longer boots on the Allwinner D1 platform
> because the sun4i_timer driver fails to get an interrupt from PLIC.
> 
> The real fix requires enabling the SBI time extension in the platform
> firmware (OpenSBI) and convert sun4i_timer into platform driver.
> Unfortunately, the real fix involves changing multiple places and
> can't be achieved in a short duration.
> 
> As a work-around, retrofit plic probing such that plic is probed
> early only for the Allwinner D1 platform and probed as a regular
> platform driver for rest of the RISC-V platforms. In the process,
> partially revert some of the previous patches because PLIC device
> pointer is not available in all probing paths.
> 
> More detailed discussion can found here:
> https://lore.kernel.org/lkml/20240814145642.344485-1-emil.renner.berthing@canonical.com/
> 
> Fixes: e306a894bd51 ("irqchip/sifive-plic: Chain to parent IRQ after handlers are ready")
> Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 128 +++++++++++++++++++-----------
>  1 file changed, 80 insertions(+), 48 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>

v6.11-rc3 + this patch boots on D1 without CLINT in the devicetree:

[    0.000000][    T0] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000][    T0] riscv-intc: 64 local interrupts mapped
[    0.000000][    T0] riscv-plic: interrupt-controller@10000000: mapped 175 interrupts with 1 handlers for 2 contexts.
[    0.000000][    T0] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000][    T0] clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns
[    0.000000][    T0] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000001][    T0] sched_clock: 64 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.009362][    T0] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=96000)

> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 9e22f7e378f5..357d25662718 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2017 SiFive
>   * Copyright (C) 2018 Christoph Hellwig
>   */
> +#define pr_fmt(fmt) "riscv-plic: " fmt
>  #include <linux/cpu.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -63,7 +64,7 @@
>  #define PLIC_QUIRK_EDGE_INTERRUPT	0
>  
>  struct plic_priv {
> -	struct device *dev;
> +	struct fwnode_handle *fwnode;
>  	struct cpumask lmask;
>  	struct irq_domain *irqdomain;
>  	void __iomem *regs;
> @@ -378,8 +379,8 @@ static void plic_handle_irq(struct irq_desc *desc)
>  		int err = generic_handle_domain_irq(handler->priv->irqdomain,
>  						    hwirq);
>  		if (unlikely(err)) {
> -			dev_warn_ratelimited(handler->priv->dev,
> -					     "can't find mapping for hwirq %lu\n", hwirq);
> +			pr_warn_ratelimited("%pfwP: can't find mapping for hwirq %lu\n",
> +					    handler->priv->fwnode, hwirq);
>  		}
>  	}
>  
> @@ -408,15 +409,14 @@ static int plic_starting_cpu(unsigned int cpu)
>  		enable_percpu_irq(plic_parent_irq,
>  				  irq_get_trigger_type(plic_parent_irq));
>  	else
> -		dev_warn(handler->priv->dev, "cpu%d: parent irq not available\n", cpu);
> +		pr_warn("%pfwP: cpu%d: parent irq not available\n",
> +			handler->priv->fwnode, cpu);
>  	plic_set_threshold(handler, PLIC_ENABLE_THRESHOLD);
>  
>  	return 0;
>  }
>  
> -static const struct of_device_id plic_match[] = {
> -	{ .compatible = "sifive,plic-1.0.0" },
> -	{ .compatible = "riscv,plic0" },
> +static const struct of_device_id plic_quirks_match[] = {
>  	{ .compatible = "andestech,nceplic100",
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>  	{ .compatible = "thead,c900-plic",
> @@ -424,38 +424,36 @@ static const struct of_device_id plic_match[] = {
>  	{}
>  };
>  
> -static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
> +static int plic_parse_nr_irqs_and_contexts(struct fwnode_handle *fwnode,
>  					   u32 *nr_irqs, u32 *nr_contexts)
>  {
> -	struct device *dev = &pdev->dev;
>  	int rc;
>  
>  	/*
>  	 * Currently, only OF fwnode is supported so extend this
>  	 * function for ACPI support.
>  	 */
> -	if (!is_of_node(dev->fwnode))
> +	if (!is_of_node(fwnode))
>  		return -EINVAL;
>  
> -	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", nr_irqs);
> +	rc = of_property_read_u32(to_of_node(fwnode), "riscv,ndev", nr_irqs);
>  	if (rc) {
> -		dev_err(dev, "riscv,ndev property not available\n");
> +		pr_err("%pfwP: riscv,ndev property not available\n", fwnode);
>  		return rc;
>  	}
>  
> -	*nr_contexts = of_irq_count(to_of_node(dev->fwnode));
> +	*nr_contexts = of_irq_count(to_of_node(fwnode));
>  	if (WARN_ON(!(*nr_contexts))) {
> -		dev_err(dev, "no PLIC context available\n");
> +		pr_err("%pfwP: no PLIC context available\n", fwnode);
>  		return -EINVAL;
>  	}
>  
>  	return 0;
>  }
>  
> -static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
> +static int plic_parse_context_parent(struct fwnode_handle *fwnode, u32 context,
>  				     u32 *parent_hwirq, int *parent_cpu)
>  {
> -	struct device *dev = &pdev->dev;
>  	struct of_phandle_args parent;
>  	unsigned long hartid;
>  	int rc;
> @@ -464,10 +462,10 @@ static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
>  	 * Currently, only OF fwnode is supported so extend this
>  	 * function for ACPI support.
>  	 */
> -	if (!is_of_node(dev->fwnode))
> +	if (!is_of_node(fwnode))
>  		return -EINVAL;
>  
> -	rc = of_irq_parse_one(to_of_node(dev->fwnode), context, &parent);
> +	rc = of_irq_parse_one(to_of_node(fwnode), context, &parent);
>  	if (rc)
>  		return rc;
>  
> @@ -480,48 +478,55 @@ static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
>  	return 0;
>  }
>  
> -static int plic_probe(struct platform_device *pdev)
> +static int plic_probe(struct fwnode_handle *fwnode)
>  {
>  	int error = 0, nr_contexts, nr_handlers = 0, cpu, i;
> -	struct device *dev = &pdev->dev;
>  	unsigned long plic_quirks = 0;
>  	struct plic_handler *handler;
>  	u32 nr_irqs, parent_hwirq;
>  	struct plic_priv *priv;
>  	irq_hw_number_t hwirq;
> +	void __iomem *regs;
>  
> -	if (is_of_node(dev->fwnode)) {
> +	if (is_of_node(fwnode)) {
>  		const struct of_device_id *id;
>  
> -		id = of_match_node(plic_match, to_of_node(dev->fwnode));
> +		id = of_match_node(plic_quirks_match, to_of_node(fwnode));
>  		if (id)
>  			plic_quirks = (unsigned long)id->data;
> +
> +		regs = of_iomap(to_of_node(fwnode), 0);
> +		if (!regs)
> +			return -ENOMEM;
> +	} else {
> +		return -ENODEV;
>  	}
>  
> -	error = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts);
> +	error = plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts);
>  	if (error)
> -		return error;
> +		goto fail_free_regs;
>  
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		error = -ENOMEM;
> +		goto fail_free_regs;
> +	}
>  
> -	priv->dev = dev;
> +	priv->fwnode = fwnode;
>  	priv->plic_quirks = plic_quirks;
>  	priv->nr_irqs = nr_irqs;
> +	priv->regs = regs;
>  
> -	priv->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (WARN_ON(!priv->regs))
> -		return -EIO;
> -
> -	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
> -	if (!priv->prio_save)
> -		return -ENOMEM;
> +	priv->prio_save = bitmap_zalloc(nr_irqs, GFP_KERNEL);
> +	if (!priv->prio_save) {
> +		error = -ENOMEM;
> +		goto fail_free_priv;
> +	}
>  
>  	for (i = 0; i < nr_contexts; i++) {
> -		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu);
> +		error = plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu);
>  		if (error) {
> -			dev_warn(dev, "hwirq for context%d not found\n", i);
> +			pr_warn("%pfwP: hwirq for context%d not found\n", fwnode, i);
>  			continue;
>  		}
>  
> @@ -543,7 +548,7 @@ static int plic_probe(struct platform_device *pdev)
>  		}
>  
>  		if (cpu < 0) {
> -			dev_warn(dev, "Invalid cpuid for context %d\n", i);
> +			pr_warn("%pfwP: Invalid cpuid for context %d\n", fwnode, i);
>  			continue;
>  		}
>  
> @@ -554,7 +559,8 @@ static int plic_probe(struct platform_device *pdev)
>  		 */
>  		handler = per_cpu_ptr(&plic_handlers, cpu);
>  		if (handler->present) {
> -			dev_warn(dev, "handler already present for context %d.\n", i);
> +			pr_warn("%pfwP: handler already present for context %d.\n",
> +				fwnode, i);
>  			plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
>  			goto done;
>  		}
> @@ -568,8 +574,8 @@ static int plic_probe(struct platform_device *pdev)
>  			i * CONTEXT_ENABLE_SIZE;
>  		handler->priv = priv;
>  
> -		handler->enable_save = devm_kcalloc(dev, DIV_ROUND_UP(nr_irqs, 32),
> -						    sizeof(*handler->enable_save), GFP_KERNEL);
> +		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
> +					       sizeof(*handler->enable_save), GFP_KERNEL);
>  		if (!handler->enable_save)
>  			goto fail_cleanup_contexts;
>  done:
> @@ -581,7 +587,7 @@ static int plic_probe(struct platform_device *pdev)
>  		nr_handlers++;
>  	}
>  
> -	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
> +	priv->irqdomain = irq_domain_add_linear(to_of_node(fwnode), nr_irqs + 1,
>  						&plic_irqdomain_ops, priv);
>  	if (WARN_ON(!priv->irqdomain))
>  		goto fail_cleanup_contexts;
> @@ -619,13 +625,13 @@ static int plic_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
> -		 nr_irqs, nr_handlers, nr_contexts);
> +	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d contexts.\n",
> +		fwnode, nr_irqs, nr_handlers, nr_contexts);
>  	return 0;
>  
>  fail_cleanup_contexts:
>  	for (i = 0; i < nr_contexts; i++) {
> -		if (plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu))
> +		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu))
>  			continue;
>  		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
>  			continue;
> @@ -634,17 +640,43 @@ static int plic_probe(struct platform_device *pdev)
>  		handler->present = false;
>  		handler->hart_base = NULL;
>  		handler->enable_base = NULL;
> +		kfree(handler->enable_save);
>  		handler->enable_save = NULL;
>  		handler->priv = NULL;
>  	}
> -	return -ENOMEM;
> +	bitmap_free(priv->prio_save);
> +fail_free_priv:
> +	kfree(priv);
> +fail_free_regs:
> +	iounmap(regs);
> +	return error;
> +}
> +
> +static int plic_platform_probe(struct platform_device *pdev)
> +{
> +	return plic_probe(pdev->dev.fwnode);
>  }
>  
> +static const struct of_device_id plic_platform_match[] = {
> +	{ .compatible = "sifive,plic-1.0.0" },
> +	{ .compatible = "riscv,plic0" },
> +	{ .compatible = "andestech,nceplic100" },
> +	{}
> +};
> +
>  static struct platform_driver plic_driver = {
>  	.driver = {
>  		.name		= "riscv-plic",
> -		.of_match_table	= plic_match,
> +		.of_match_table	= plic_platform_match,
>  	},
> -	.probe = plic_probe,
> +	.probe = plic_platform_probe,
>  };
>  builtin_platform_driver(plic_driver);

FWIW, we should probably use the IRQCHIP_PLATFORM_DRIVER_* helpers to get
.suppress_bind_attrs = true, since we no longer use devres for cleanup.

Regards,
Samuel

> +
> +static int __init plic_early_probe(struct device_node *node,
> +				   struct device_node *parent)
> +{
> +	return plic_probe(&node->fwnode);
> +}
> +
> +IRQCHIP_DECLARE(riscv, "thead,c900-plic", plic_early_probe);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
