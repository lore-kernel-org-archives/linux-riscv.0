Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2A9CCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Btj5YBblLlklNG+8eAZIookHwIMnWxTVd8PseqXk9eQ=; b=PxTtUhQtlyeG1q
	X6l7e+dhN0wQA2pbZ239Gh+GUKgItrcoMAqUBeXUvzXshsT7LRTuvDQjh3c4XnXBWvjGeGQqyjFKn
	LxOBP8QsRxBMlfsOOTKCdWGz1KtpOxP1lIDcWibMvSJV9vvBr787lfSCgGuPNTzJc65OPJ45F/7Kf
	zQ3219q6eH98bsmUGKG8i4qbxyV1IjSUjACslPeFtxZBEv3xa+tTC3Ast2Ct5euTQdxz7h+ywE2cr
	AWBTwzPooSSJGyKLV3PtafPb+FETEVIgd1Gl4uTC7gDhdq4TKg9k3e7ZB1gfc0h9NDOAIQj66dXfC
	eaM98VxGVlufl9RyHhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VT0-00000005z8D-3Ldf;
	Thu, 16 Oct 2025 21:24:58 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VSx-00000005z6C-2Gqc
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 21:24:56 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7811a02316bso901568b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760649895; x=1761254695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zd/3SMts5DKBfe91ys3jWrhKDCgkhqpFgsK5gsCZVIQ=;
        b=i313mYqgrIXZD/KF3dji7DgpXBydrNvxx3rFb9C408mQL89gDs5r9MutPGc6mWx0be
         bWyCkEC3vMlvq4w0UzpF6nQnCP3ID0sNBlq/6nOa70sJ9bIFu3aYTk7ZXUbsS5yaw+lH
         s2Aus/S95eaJ6ZIuHHIy86TIBMmawf0uSn8r6xpyjSlWMVfIk0jdlOEA3zz17ht6JXVp
         SVQAO8xDEOpCkajm0f//86Rkhu4whiOxlvlqpBJvnBV81MkopZOCySv7qINlDGjKV4nu
         amfGT/8sacG1fBCQBN/Oh/IJI0W9AqmNhebZllrhJFVs20nfGT7vYJ+OL2yDTGXaDSn5
         hwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760649895; x=1761254695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zd/3SMts5DKBfe91ys3jWrhKDCgkhqpFgsK5gsCZVIQ=;
        b=YqL+lhbLKPeBFP4XDN6b3T3eOgRzClkBOiQzwVkBeddGmt8POYZEZyjQvSJxp9mEfH
         RZzUXWJ+dDzjgWm9oCaJTuM5ABFLm6HsqiwPj/Imb0X/Er258Eh5kE4ORK+ex2JnqnZA
         cZByqeNAaVF51Bo15sf46pp7amb7VsLPQKY5hJxM+X0s0Kh784O2EfrvvKL0gPbErUs/
         TxV1ZebLfe2X+wKdG4KVavU4Dr8rCczyBpY2qvVpln9rnACLeV8lLy+FKMfUXKtS43ai
         VxCOUChiP6CjVStEvq4BAUkK9YudqnpUPRy96RO9DkRS05k9J3t3wUGG49yvtHnGAcUw
         CUCg==
X-Forwarded-Encrypted: i=1; AJvYcCWL5tIbDURk7DtPO4m5h8bIE5MvpxxangaycWGg1nE4OKQlYUsjw6y6PYcUYlPnRIhptWEyFIGgTZPf+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcGXjUk45P2jRSr12Fnpj2vCnumSb4qLbux0Fs6GL6i/LOHNR
	pc8XJBPsIuHqNEfZzoYfMpPr6mXHmlYrUV/uzH+4stAa6eqMEMNoWFby
X-Gm-Gg: ASbGnctTwamv/g1Fxh3bTTFMAoOvcoqKs4HjQc6iT6zYMQKmY42qO6FPsp9JQC/SaS7
	DHdd0/tHwLbDxlXq1hc2x32Lu1VzEry61cKGFVwVQnFIflOXdJoyOgUNdepbEaxWAefBwLE2M41
	vUYrb/XVXHuVJ7x62DPJSWU7kRJ9axLeu+7HHO83q6TKZoyWfVpgoS6s9CYNlIq39c5j05MBs/S
	7sfqr1tKf7gXhLXifuND1QYdMHQCi2yQhU+BMW49SJhV07fYYlEZr+lUrpm+wIbSEGcICSBUQMl
	v6QUg92hnL0KCT++xeh7I5k3CpYbZTrap5DJk5PldM6VBS6CUDnaEDcePHCFwV2bMafIVYlwhWL
	nIfplOwIc7TZ7TbjIz92wIZYWdE0/LiG15/xaROvkmdp5eK3jHVkKFSXhIqh1YMVGWbXBxmvqJs
	GNtGhQGLAp9ikDGtSLjwSZ7DNW
X-Google-Smtp-Source: AGHT+IFCaV6xglyKst+oFUXgvZM2Y+I/mFeCUZu1bLy7lDUbpg0VgGAYl951jYFBFM2GACulIHnn6Q==
X-Received: by 2002:a05:6a00:130e:b0:781:15d0:8848 with SMTP id d2e1a72fcca58-7a2208eec13mr1621582b3a.13.1760649894512;
        Thu, 16 Oct 2025 14:24:54 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0965c3sm23431038b3a.52.2025.10.16.14.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 14:24:54 -0700 (PDT)
Message-ID: <831744c6-ba89-4029-a035-9a70c3f57465@gmail.com>
Date: Thu, 16 Oct 2025 14:28:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
To: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Zhang Xincheng <zhangxincheng@ultrarisc.com>
References: <20251016084301.27670-1-lzampier@redhat.com>
 <20251016084301.27670-4-lzampier@redhat.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251016084301.27670-4-lzampier@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_142455_596369_C4811829 
X-CRM114-Status: GOOD (  40.72  )
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

Hi Lucas, Charles,

I just realized your last reply and sorry about the messy formatting.
Please disregard the previous one from me and use this one.

On 10/16/25 01:42, Lucas Zampieri wrote:
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
> When the PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM flag is present, a specialized
> handler (plic_handle_irq_cp100) saves the enable state of all interrupts,
> disables all interrupts except for the first pending one before reading the
> claim register, and then restores the interrupts before further processing of
> the claimed interrupt continues.
> 
> The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
> SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
> This has no impact on other platforms.
> 
> Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Acked-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> ---
>   drivers/irqchip/irq-sifive-plic.c | 94 ++++++++++++++++++++++++++++++-
>   1 file changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bf69a4802b71..0428e9f3423d 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -49,6 +49,8 @@
>   #define CONTEXT_ENABLE_BASE		0x2000
>   #define     CONTEXT_ENABLE_SIZE		0x80
>   
> +#define PENDING_BASE                    0x1000
> +
>   /*
>    * Each hart context has a set of control registers associated with it.  Right
>    * now there's only two: a source priority threshold over which the hart will
> @@ -63,6 +65,7 @@
>   #define	PLIC_ENABLE_THRESHOLD		0
>   
>   #define PLIC_QUIRK_EDGE_INTERRUPT	0
> +#define PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM	1
>   
>   struct plic_priv {
>   	struct fwnode_handle *fwnode;
> @@ -394,6 +397,89 @@ static void plic_handle_irq(struct irq_desc *desc)
>   	chained_irq_exit(chip, desc);
>   }
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

No need to start from group 0. Only readl on the group with ie[i] != 0

> +	}
> +
> +	if (!pending_irqs)
> +		return false;
> +
> +	/* Disable all interrupts but the first pending one */
> +	for (j = 0; j < nr_irq_groups; j++) {
> +		u32 new_mask = 0;
> +
> +		if (j == i) {
> +			/* Extract mask with lowest set bit */
> +			new_mask = (pending_irqs & -pending_irqs);
> +		}
> +
> +		writel_relaxed(new_mask, enable + j * sizeof(u32));


There's no need to write the register if the value isn't changing. You can
check new_mask with the value in ie[].

> +	}
> +
> +	return true;
> +}
> +
> +static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler,
> +					void __iomem *claim)
> +{
> +	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);
> +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
> +	void __iomem *enable = handler->enable_base;
> +	irq_hw_number_t hwirq = 0;
> +	int i;
> +
> +	guard(raw_spinlock)(&handler->enable_lock);
> +
> +	/* Save current interrupt enable state */
> +	for (i = 0; i < nr_irq_groups; i++)
> +		handler->enable_save[i] = readl_relaxed(enable + i * sizeof(u32));


I see that you start to use handler->enable_save to track HW in the last reply.
I'm about to suggest that. Please send out a new patch, so people can properly
review it. There's change to common code path.

> +
> +	if (!cp100_isolate_pending_irq(nr_irq_groups, handler->enable_save, pending, enable))
> +		return 0;
> +
> +	hwirq = readl(claim);

Possibly missing a io barrier. readl isn't going to enforce the ordering of
readl/writel_relaxed above and itself. There could be other barriers missing.
Please check.

> +
> +	/* Restore previous state */
> +	for (i = 0; i < nr_irq_groups; i++)
> +		writel_relaxed(handler->enable_save[i], enable + i * sizeof(u32));
> +
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
> +		int err = generic_handle_domain_irq(handler->priv->irqdomain, hwirq);
> +
> +		if (unlikely(err)) {
> +			pr_warn_ratelimited("%pfwP: can't find mapping for hwirq %lu\n",
> +					    handler->priv->fwnode, hwirq);
> +		}
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
>   static void plic_set_threshold(struct plic_handler *handler, u32 threshold)
>   {
>   	/* priority must be > threshold to trigger an interrupt */
> @@ -430,6 +516,8 @@ static const struct of_device_id plic_match[] = {
>   	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>   	{ .compatible = "thead,c900-plic",
>   	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> +	{ .compatible = "ultrarisc,cp100-plic",
> +	  .data = (const void *)BIT(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM) },
>   	{}
>   };
>   
> @@ -664,12 +752,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
>   		}
>   
>   		if (global_setup) {
> +			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
> +
> +			if (test_bit(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM, &handler->priv->plic_quirks))
> +				handler_fn = plic_handle_irq_cp100;
> +
>   			/* Find parent domain and register chained handler */
>   			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
>   			if (domain)
>   				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
>   			if (plic_parent_irq)
> -				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
> +				irq_set_chained_handler(plic_parent_irq, handler_fn);
>   
>   			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
>   					  "irqchip/sifive/plic:starting",

My rationale of the above comments is to achieve minimal overhead with this
"read pending[] -> disable IE[] -> claim -> enable IE[]" approach. In general,
the fewer interrupts enabled on a hart, the lower the overhead. If there's only
1 interrupt enabled for a give hart, then there's zero reading/writing of IE[],
and you can further optimize away the reading of pending register.

I'd imagine that if the user truly want to avoid the overhead of this quirk,
they can chose to spread out the irq groups onto different harts to alleviate
the slow down, or better isolate a single irq to a given hart, and we should
make it possible.

Feel free to point out any of my misunderstandings.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
