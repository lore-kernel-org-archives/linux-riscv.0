Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB19DCCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vb1zVjTO5TG5RGMq3HlvrETQN9YLt/jDszekVquYtrI=; b=0hvhJ24ia0ufk9
	kPbWrqrGUHDRdhzmcS/Q1B1XsOvHZTyvPYsfmxB0brx6mnKN2q/9a6qrCITrTY1sis33BFfksvUQ/
	gfz9ywnEk5MzL7FCkesK0GYxhDoBRotcwE2I75galN7CgEvPuJTlYO3B4wTi1UDDS8VDpJaqnmzn3
	aXF269Q+YiIrLullVPTqV0nP0YfW/utH5LOyGiA33ZSzjt0YkCWcRIR7szJ+t0YXeV8bA1cE5pNmF
	6FVdSsUL8exa3LgoWl/G3hUen8rIqNR/+RIw2pKYZoOYkDx6mqe/lZBZlm41e5H+JzlXwxU+eMCv7
	PvgblNuX/gJDLto20rYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VAV-00000005x1U-3ZG8;
	Thu, 16 Oct 2025 21:05:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VAT-00000005x17-1uXi
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 21:05:50 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-33bb0472889so1264273a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 14:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760648749; x=1761253549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2EzoKc9cX6h7fNdOB+aUUlkvfgneGtOjZpo3gaTcMo=;
        b=XqRksQmVioSu5TrOVCg4XJsJay2lpUe5KLNjh1oR5ZFoudumytKg9ZEVZIgkQwROjH
         hTWxL3aT3GeY7osKhzkXqBSdP/qow5RJvZn6hOgirmmrAg+ICslrxM7gVVCIaro33nd5
         GcDo9t/JWp+nZ4eZiB1/HDwF1POiKBjD0xYpVVlc7RCk14aF8HIipgh9t8sNRH0/HF6a
         ZjN+SfSFUGm5B/iqm0u8Ct7tW+8Pmlhj9E/uefRoDr8jAVEBfFppNwMoB/4tmLxs4Na/
         lt26xoW9XQlY0FBE0rf0zpRA+Iyx6YoYL3dHKldHbSQZUvX0SCnkfc/xs6Wg8y5OC2/b
         brSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760648749; x=1761253549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2EzoKc9cX6h7fNdOB+aUUlkvfgneGtOjZpo3gaTcMo=;
        b=O3Z/uZRZj7oqc9eRgE0tyF9Huxm/SqvN5mC5qNSymdjsaeczioNcUAegTbNLV9tcZf
         54ZsV+bYOiTHI5/r2m6nijbW82p01/bXCzYwj3uH8SR8knZRpS3LyvFgp/3j50vLfW5n
         yif8cDgz3aaWOPAbKHBBuMAAccqK6XSS4yWrK9OQQMybGXCBm3ZQKM4eDp/gcjMAav/B
         G4CosVCN7EB0W6ZYxSi+ArFFm3RUTPU4pvqXzlqiPQH6KzMUg355Al1RDHvyP8nKPBNq
         ipHy51vp9vhxDgGAWrgtll9sECX396XBucI3FXUGXTY6pjilLh0pOW77OJakRRaP5fgG
         QMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzQuQpbsGwWdBgMfUqZ3AZLcQXYbXchx6YJJgV06KoAyi2hlht7YE/CQ1P749t8AP1rW0B5mlynAbZwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4NQg14Jffg5/YXUn5zB6eKpeIaNcWzXsROMMoa0rOQeeIjP+y
	SM2GgdCJpdgzUEXSiUqYCnk+0hMf5uj0ZbpwuZw9ICRVX6EJN/gaGfns
X-Gm-Gg: ASbGncvSQJ1f07wg1pKVx31H7AsizZrZKERxT3rDbf98E1qMdqwN2VEDNKAjw2pW2C0
	0BZpdl1XARxP5XtXHaDhuJnHHrcTa+ASJIS9I8g+u1CiqiOjbus955MntNewX/TlklMI+40LFJY
	0DSm+r5s9lFFzCTaXDEkzpBhFCtDhnyVUoMn3iY+MqgBT+Pm9OONKPHsn+aYqzZt6NuuJCbo3SI
	VUc7jWyh9deGIhq2EmXRj8FjYyZCyjO5VfwTucoMHfylOYYLuSUFyvzEwA3AyEqMIsxPq1nBiqh
	RGn5TQTWL8yFf95H9WgnlSbtU+ClWXSK+GWz6Bxz8BRN8/bLuTQNpHZHGfFmUgyUc7NkycXbGHf
	m72C3RxK4QuWDqsfb7BJffSgJMwNqIKyEzAwleBVK64Fv1b/l0dhq9ru6zhM2JUP19q89SI3VYA
	n8YZv+EJ+jAgN0C2pmHQ8x2hibxhJRfzQSGoM=
X-Google-Smtp-Source: AGHT+IEL6ii9KnkIQBAerVn0Vg+xnY1ZhmA6A7rv/13jR+aG1nOdbS7HiWtqv1Golb0GwzDp3Xs8nQ==
X-Received: by 2002:a17:90b:2887:b0:32e:5cba:ae26 with SMTP id 98e67ed59e1d1-33bcf8fa1aamr1327937a91.23.1760648748582;
        Thu, 16 Oct 2025 14:05:48 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b7a625sm3812966a12.24.2025.10.16.14.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 14:05:48 -0700 (PDT)
Message-ID: <565422eb-d5fc-4b84-9a8b-6f36df39b8e2@gmail.com>
Date: Thu, 16 Oct 2025 14:09:23 -0700
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
X-CRM114-CacheID: sfid-20251016_140549_532199_8EAAD62E 
X-CRM114-Status: GOOD (  40.17  )
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

Hi Lucas,

Please see my comments below.

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

Here we need to read all the enabled bits from HW register. What about if we 
keep the handler->enable_save in sync with HW? I.e., enable_save tracks the
HW enable registers and we maintain it per each irq toggle. In this way, we
don't need to read them at all. We'll introduce more overhead with irq_toggle,
but they are not frequent. Thus, we can move this reading of ie[] away from
hot-path.

> +
> +	if (!cp100_isolate_pending_irq(nr_irq_groups, handler->enable_save, pending, enable))
> +		return 0;
> +
> +	hwirq = readl(claim);

Possibly missing a io barrier. readl isn't going to enforce the ordering of 
writel_relaxed above and itself. There could be other barriers missing. Please 
check.

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
and you can further optimize away the reading of pending register. If you chose
to use enable_save to track HW as I've described above, we should document it
well, because enable_save is only used by suspend/resume without this quirk.

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
