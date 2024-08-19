Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88AEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wi85R7VjE2bo5FKdVbTiB2GlxbpOefyMSuEhuiaIpNM=; b=kX1/xAQLq6H9piHWMHM8ScynZv
	f0T7YCxKsTHK1a9HJjBDUBnuW2jhpPU+iXFCx2fgDHvr5zBF4/Ar/L1+KSH4v6ZcYKObOROR8pVFK
	EyhklkyIip78qzLZK9LuVJ402zpLWIwHDxlYDcbGVE4FNpsGTqsBr7PXLomINxrI2GU8dEH6Tg1Uz
	icQX8RbQifCyFMtKotY9oVmKI2klVT4eIBK4AVrYcdHQJAEHWtLAr882BBQmCr23PStISmNwGF+mv
	uhZUcimEkTFGjy8Ld+wKIUbcL3nyLpIZxeMPZ3+Y9i58oSGKYv+M2COq5GM7KoUykshXbw+mAgwmQ
	k2mQv1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfwKY-00000000Z5j-0FpN;
	Mon, 19 Aug 2024 06:57:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfwKT-00000000Z5L-3Sfn
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 06:57:28 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1C4F045969
	for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1724050641;
	bh=w8L5CFHCyutNw4jBovw3yNQlJyyC7H3ApazpWmsE09Y=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=u5z02DLQXWf0Zit70yerupGaoikYE62HEGzV+h+3O8R/XeJrK9sPtcVOlg4Oua1Lf
	 uyrAUGvFErm+4QPANQGnLJU00bIVikbfTEo/qnCbwR54mkNsIEmzTC5rxveuYBlbch
	 yUL1PPpXU+i7J4wdum99bvq6elpGfpqy2L0E24zihdiR2+d0FYcd2q77uc6DiIg4W9
	 5Fio8HMtDv7ev8Fw9cB/Av0rgqTR2nIFHeeaeNhzW/ifif7okl5LNzYjYgCQpZUI33
	 qRhgbb860hiVV4aYnxGy0TL+/iphW3FIgIeMXYylR5yWsAHMAlw3vqDa7Ouk63YYuE
	 sAXD/5ACsB88Q==
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6bf7a4ff102so61493596d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Aug 2024 23:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724050640; x=1724655440;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8L5CFHCyutNw4jBovw3yNQlJyyC7H3ApazpWmsE09Y=;
        b=jP7vmvhE17iasEdh2fj+JpfEeXkhKxHYCAH4rgZdQ8216BawEo6VhxtxY8ovHnsE6B
         kdEt+/jIUwXiKhljgc+fNhhWUjQCAznQyEt0/TBAmM3Yr837GBFZmS7lecoKSC6QL6X0
         IcHCkKmJK7UXDX/SBmWAXRAnSf2lwwz0iFKnkpv65s9eHUzrLIxwAc7Kx34k+Y0nZ4vo
         Hnw74PHsLN6qFEALz83sruVUvQjh370R7Ot4cBOlptY5EpszKUp049kCljwZpHABJcAu
         Was7RNuanyhhxEmz6dX41/+20MPFa3IH+y1krwBVb0O6VSTzyEpUIjxQbt3rPCyNDClY
         EFrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU//cd4H3na+xISAgJGQ7LDRhzRNTJ2G9L5ZJXcqJIEe7uqcJ3jHL0LMIPtM4hxlIyWKJ3sJsMgzhBR4WxsomhwSszm2utUK/TqWfRJ2kMY
X-Gm-Message-State: AOJu0YwRC3r+wmekF1qWOGkBInaFStQltOH0ctLWH8Cc3+6eeqgx3S8h
	JrLzHCvwfPrdINy26X0RdxGNfd4SytQvYajmXJ6G8ekp7I1WebiN7uu4Mh6I32pxdTf/AylTVcT
	p2GxJtX3tcAVqB8idYkFJ9GmOtnlgaNKn3RkND4fQCZYqxUcdFFTh2Ya+NrO2jwDd2fkjPVUEdG
	Fbu27j2mm04tqRx9VbeDIh0iv2Ra02t4S5Ny0yvwNxuDmPzbfWzDNRVduJ
X-Received: by 2002:ad4:596d:0:b0:6b7:9a53:70e9 with SMTP id 6a1803df08f44-6bf6de31f99mr160766786d6.17.1724050639699;
        Sun, 18 Aug 2024 23:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaF/xIrPgZ8pAIE3XH+9zs5sEhJ/82RgdDvwuO1jCjg0IkvwTPoMxKwAi1AFGhN9X6ZpuuEH+zJUUsk/I1LJI=
X-Received: by 2002:ad4:596d:0:b0:6b7:9a53:70e9 with SMTP id
 6a1803df08f44-6bf6de31f99mr160766536d6.17.1724050639169; Sun, 18 Aug 2024
 23:57:19 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Aug 2024 02:57:18 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240817081218.2985171-1-apatel@ventanamicro.com>
References: <20240817081218.2985171-1-apatel@ventanamicro.com>
Mime-Version: 1.0
Date: Mon, 19 Aug 2024 02:57:18 -0400
Message-ID: <CAJM55Z9_7WsqXT5hNuwB9jt31Aayk3kqOV5FDZ9tdcLYhwHTFg@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/sifive-plic: Probe plic driver early for
 Allwinner D1 platform
To: Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_235726_411313_F0385731 
X-CRM114-Status: GOOD (  36.93  )
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

Anup Patel wrote:
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
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> Changes since v1:
>  - Set suppress_bind_attrs for PLIC platform driver
> ---
>  drivers/irqchip/irq-sifive-plic.c | 128 +++++++++++++++++++-----------
>  1 file changed, 80 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 9e22f7e378f5..33395c5a9b5b 100644
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

This driver never worked with ACPI anyways?

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
> @@ -554,7 +559,7 @@ static int plic_probe(struct platform_device *pdev)
>  		 */
>  		handler = per_cpu_ptr(&plic_handlers, cpu);
>  		if (handler->present) {
> -			dev_warn(dev, "handler already present for context %d.\n", i);
> +			pr_warn("%pfwP: handler already present for context %d.\n", fwnode, i);
>  			plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
>  			goto done;
>  		}
> @@ -568,8 +573,8 @@ static int plic_probe(struct platform_device *pdev)
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
> @@ -581,7 +586,7 @@ static int plic_probe(struct platform_device *pdev)
>  		nr_handlers++;
>  	}
>
> -	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
> +	priv->irqdomain = irq_domain_add_linear(to_of_node(fwnode), nr_irqs + 1,
>  						&plic_irqdomain_ops, priv);
>  	if (WARN_ON(!priv->irqdomain))
>  		goto fail_cleanup_contexts;
> @@ -619,13 +624,13 @@ static int plic_probe(struct platform_device *pdev)
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
> @@ -634,17 +639,44 @@ static int plic_probe(struct platform_device *pdev)
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
> +		.suppress_bind_attrs = true,
>  	},
> -	.probe = plic_probe,
> +	.probe = plic_platform_probe,
>  };
>  builtin_platform_driver(plic_driver);
> +
> +static int __init plic_early_probe(struct device_node *node,
> +				   struct device_node *parent)
> +{
> +	return plic_probe(&node->fwnode);
> +}
> +
> +IRQCHIP_DECLARE(riscv, "thead,c900-plic", plic_early_probe);

If this is only needed on the Allwinner D1 maybe this should only match the
more specific "allwinner,sun20i-d1-plic"?

In any case this works by itself, but not with Samuel's patch[1] applied, so
Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

[1]: https://lore.kernel.org/r/20240312192519.1602493-1-samuel.holland@sifive.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
