Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB5CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLZRGED4z9iSSNDOg7MyeEBe1H3/orC+Up7+NbTUe2U=; b=YMP+ocoB13lNGt
	d5Lx6IalSZFn0aY+zVjv89sW9jok/CmXNQinbNERVP8+qLWgWrkrZ0TgsWXsIrgzUIJ5MoS9JOcfo
	xfNv9EC6ZRTjVbI8TAwrQgXIs1socyiBsY75JxCMPkpQ3/nOscsAG+rYUCnbh7NBLGQtgjoiQ27fO
	4Oy5tKQs9XDC2SCPpCrLUeM/dxDTgUfUx/r0z2A7H/T3YWkDjFRsemJSJMUOIr2dEWdmGKq7MmIIk
	Vrz1t+0JEfPvr+uVO1NmnD1RxyHplnOESXRlH5/0TnzdazwM7C6nKaBf6WHNajJLjhd/ZKHc95t99
	I6E7aoA4kIV6YHEVnhYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8haM-0000000GxMv-3KKT;
	Tue, 14 Oct 2025 16:09:14 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8haJ-0000000GxMa-3XTV
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 16:09:13 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-4291359714eso47067085ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 09:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760458151; x=1761062951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/56Sp040rDsPp3z3aaVtrpaepoT3obZVyIP0xy0kutY=;
        b=njWXlZKRdzSFfd8xRkBOKagt/YXTj286IayjIh9LlGziZ5a+XqrAYWBAK5Li/B4te8
         JY16g36PlFSKBDldhSNeIlB68O81z8S+iLthzmYZBr842TBTA8utr+HXQNeABfhh/EIi
         eHdRt0AsU+LoNMJXXRlZMdJGCB4Q9LZAA8vJMhAJP5qehAiPfbMOIBhFbDefQXeAx33Z
         X8FUQ1yuW53aTSK7PXyYMlijmNyDgTq+vZTHSusqrKvoMubXOZs4vv/b6mjRq2RHQhle
         PR78QtQdxVArZgKcEXeKwtJpm4Iwu9oCGxexmZZQVWJmPabo6KQ/d88BUNbSu+DBp0Q2
         7RnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760458151; x=1761062951;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/56Sp040rDsPp3z3aaVtrpaepoT3obZVyIP0xy0kutY=;
        b=vdw+xUavy+KeuM664G3Qt3JSLCTejoRgcG4RaOEYOQK86ChAIo1yVGP9VFy4nQD3p0
         FWGLcyl6TyAwAXf2DZ0Aw1u9wNY9zA/oVRUFbpNNUSrPl03rCsXY+eA60XHyLWnoOF1v
         aOUKWTt48a2CTehm9PbZikjoQZ5CTpyXjqn2DcXBAIswkp1L4sSwVV8p9joHts7kwLfN
         BdOjwnkClj59pH+EOxAQHt0hXdclV6txj0RxZVxEVUyokpKQW82P7lUsqhj5QjtlcDtd
         3+aa8F63/xAcJt42E6miqz6n6ALkl5ODjKw3NhohvkwgE5h8XNATOwEq1KBa1uFX4LN+
         +y4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXubv3/cDRZJPu62OVJfk7f3MM1dIbPmScXcxrq98FeujHIgIyr/lMYpHldmZeaxsUmd3sMZhhGlSGcvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZrPF+Gao8N10mK/yXj5IIGdkveBTTxwCmRObRvNlfS3WIwSIB
	wfez5JBgyaqK0bXCUwOs0ClIOiY8wmxxc8NlU1wYXduHgoeyZLCvUsgOyIXagAdG7ec=
X-Gm-Gg: ASbGncuz6htnUzReMRsIyvvM2CCMmb+D7/U3CnlJj3FQef7zg0X185GoEZwr85UpDBu
	gcwL5eNpWxMio+R6lqKqjTt5KuNNPTs8BMvRb5o+pzSVUqsh1GykKKRWqQhkdnExGbVaWtDkLWg
	vLfTzUP1xLN0kvWR2VdRga5NLIeMUrO9zfDLNb/nx15rB8/+coCBH3bbxfbFVzgF8U1v0EsRp0z
	fqRujMHcndFsd3O33TKixRYVpLfTeJdloVNT9ezxRO1LzwSlTcsUSJix9NK8W+2ud2ttUU2Boqq
	++RUdLcCVyom5xXMeGWnjPk0Ifo+DcgazXgc3yy2Mhr0NBzZVA5zlhWoMBtz4wickl3YJkgujFP
	J6E2xvKZBewHIt6W8uMEjpcYmLKCxTSoihY3BI+PwHBeYjQ12YYJWYGcJVCu/di05PpmR
X-Google-Smtp-Source: AGHT+IF2rM5N57cc9e87vSQgs53jlX3hESnb8bjcQJckI0u09+/PvPrRQAWm3vnphVNgXUCUPAT9Lw==
X-Received: by 2002:a05:6e02:1688:b0:42f:953c:6d59 with SMTP id e9e14a558f8ab-42f953c6db7mr210550045ab.24.1760458150581;
        Tue, 14 Oct 2025 09:09:10 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.208])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430a4b94dbdsm6044085ab.13.2025.10.14.09.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:09:10 -0700 (PDT)
Message-ID: <b58b2705-a1b4-4d71-8b76-e2bba4df6987@sifive.com>
Date: Tue, 14 Oct 2025 11:09:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
To: Lucas Zampieri <lzampier@redhat.com>
Cc: Charles Mirabile <cmirabil@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Zhang Xincheng <zhangxincheng@ultrarisc.com>, linux-kernel@vger.kernel.org
References: <20251014154100.168236-1-lzampier@redhat.com>
 <20251014154100.168236-4-lzampier@redhat.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251014154100.168236-4-lzampier@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_090912_078820_4106D038 
X-CRM114-Status: GOOD (  34.81  )
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

On 2025-10-14 10:40 AM, Lucas Zampieri wrote:
> From: Charles Mirabile <cmirabil@redhat.com>
> 
> Add a new compatible for the plic found in UltraRISC DP1000 with a quirk to
> work around a known hardware bug with IRQ claiming in the UR-CP100 cores.
> 
> When claiming an interrupt on UR-CP100 cores, all other interrupts must be
> disabled before the claim register is accessed to prevent incorrect
> handling of the interrupt. This is a hardware bug in the CP100 core
> implementation, not specific to the DP1000 SoC.
> 
> When the PLIC_QUIRK_CLAIM_REGISTER is present, a specialized handler

You may want to name this something a bit more specific. Every PLIC has a claim
register, so it seems a bit weird saying that this is a quirk :)

Anyway, the code looks good, so:

Acked-by: Samuel Holland <samuel.holland@sifive.com>

> (plic_handle_irq_cp100) saves the enable state of all interrupts, disables
> all interrupts except for the first pending one before reading the claim
> register, and then restores the interrupts before further processing of
> the claimed interrupt continues.
> 
> The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
> SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
> This has no impact on other platforms.
> 
> Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 94 ++++++++++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bf69a4802b71..1d528904b353 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -49,6 +49,8 @@
>  #define CONTEXT_ENABLE_BASE		0x2000
>  #define     CONTEXT_ENABLE_SIZE		0x80
>  
> +#define PENDING_BASE                    0x1000
> +
>  /*
>   * Each hart context has a set of control registers associated with it.  Right
>   * now there's only two: a source priority threshold over which the hart will
> @@ -63,6 +65,7 @@
>  #define	PLIC_ENABLE_THRESHOLD		0
>  
>  #define PLIC_QUIRK_EDGE_INTERRUPT	0
> +#define PLIC_QUIRK_CLAIM_REGISTER	1
>  
>  struct plic_priv {
>  	struct fwnode_handle *fwnode;
> @@ -394,6 +397,89 @@ static void plic_handle_irq(struct irq_desc *desc)
>  	chained_irq_exit(chip, desc);
>  }
>  
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
> +
> +		writel_relaxed(new_mask, enable + j * sizeof(u32));
> +	}
> +
> +	return true;
> +}
> +
> +static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler,
> +					void __iomem *claim)
> +{
> +	void __iomem *enable = handler->enable_base;
> +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
> +	int nr_irqs = handler->priv->nr_irqs;
> +	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
> +	int i;
> +	irq_hw_number_t hwirq = 0;
> +
> +	raw_spin_lock(&handler->enable_lock);
> +
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
> +	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
>  	{}
>  };
>  
> @@ -664,12 +752,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
>  		}
>  
>  		if (global_setup) {
> +			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
> +			if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
