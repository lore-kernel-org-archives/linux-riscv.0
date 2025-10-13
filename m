Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514EECCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9iK2cgKwOVsbuNUKOfIp9g5kg7LCyoYtowKhSntjZk=; b=hbauMaJcw50fBx
	VF2tRNd1aXQE0Ch8tR8ntrlRADa/qrnRrbjvvOI7nzS7/VOug91eqF7dN7zVKsATvp3Lu3tREY/9J
	xuiC12/LS86CtYnApxD/Ib/eVf4l0uTo6zW5A7OBWytc/6ytVSNy/NIWjzPi75C0c+rWfc2QzbxMB
	+Cc+Pz7inn5W3wwt3R+2g4NS/Z2tJD1lgbl9kZ9xVKK6y+6fw25gyFJDxtpJZhrazOAqJ/xQlgwd5
	eLxgnrUJUM5qCkz/P+05ZsFq4rhaDHZjONjPUYZ0vdqyytIxPnjHrRD5aD3S81P/zGk3UzSj0UgkK
	keC+tRxDVc+65sjfQa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Nme-0000000EDx1-28Ti;
	Mon, 13 Oct 2025 19:00:36 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Nmb-0000000EDuN-3Bdj
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 19:00:35 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-9194a0241aaso172197539f.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760382031; x=1760986831; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssDH5wMDHRQ7E8ITNqhxYfPq50TMwnF4aaotfvSu9x8=;
        b=BpMHuJwA00SEb9Z6AY7PS9mM1wuXLUqrHLqjuPfedcA0YitOj2A8fNW1SRfbAngLTe
         hH08Ox9Z3/URg+RSl5mIQpIRNXhcie4+ScuC2FkSm0wGw328I0LQ7L4UocnM3BTtzbjl
         34xeI945xfiO1DAATP3WsdKLuuFZ7y8eG3rLj9a99Aad1MHqAZ2jYblMzX4z5U8CpGeg
         kz0qYehl9lCjxagu+Ljr8e8/XoTgATt85oMJxwXcmn2fh4H+avQ6g3cfafBgTMabtP05
         eWXEs8fAiSDgPqL9TFjTNpSqNV7Vcigbdkofkv1TPsbA0KH9IgWdtOLNnGGKurOO1PSQ
         NGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760382031; x=1760986831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssDH5wMDHRQ7E8ITNqhxYfPq50TMwnF4aaotfvSu9x8=;
        b=rJqag0ZQr5qij6Ov1ZM2PCDZ+kLQuFAZU4qotebIsVk/MvGtMesjZFGMIBQwr4+HZS
         S1QQ+OaXkRfMpKtYoym4W8cCaGUG6AAPgI6rAU6y/f1PVrqJiYa6dACZf7yfsjIBb0k2
         1C1xrncOEst5lPWWOYMQwIWsoCLsTkgM36jPycSHgLsEL5dWVQhIjtyx2pghBqeD/HeX
         vLHW8O+hnsxLM9kvkm3+EG8mKPuaVV5vAPtqbJ8Ioyr74Oa4+FHOouZxtNe3eC1Rj+PF
         gLkwzY0N00qjx/ul/1ooYD9xlmxSV+mjUA9NNtYf6mLPnQ21RzL6V3vcyEAD6Bm/yy/O
         eWug==
X-Forwarded-Encrypted: i=1; AJvYcCV9PK59Z33lPgfMFZmlkF5UHpN4/eWauCbRfI5hljGe6PI19BBoRGf6g7gtQ98EEPbc5Ek4nMmrmyA7CA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrIuHDGNcslKRE95O14amxbMa7E4pkqXu8mZo04jcrCUECcZ6f
	lnadCgyMajVo5vYqI0vE2oEoIM/7Oum0RFY0MZPE3zk2wFy+hcchxMSmlqrNpAAqbQg=
X-Gm-Gg: ASbGncuOgPm9zONDoLSdD6UmkspVWPc6qHNJoKQS93BV6RNwa4Adqu9ZEXLm6EgY3TR
	3zM4dpmqeKdWjBW4sYzfY7EfTXr0XcQTwhNpHw+dczvU2FDaa9MoCFAXdpJcK9zHVTIeMkukiZ4
	KWWN+0Ja6dAVycmTS1rK/a3Z7xamUVu8DBRWTZ55MqXC2jXCSl7yadDu7zvhEfeJlRRDGV0+8pO
	5c1ZABTAjS7Ek8/mQrQMHaJIvKkM489TQcQdHyfvL3Nx/rDB3OauJ4ShQwZzrHN9PXugoIWeUKC
	oYPiVg0ao8Xt2eu6/9p6WHOTj6fPE/9rVUhjz9e4NcdozS246xfnsVWLU+xu2eM825rzfGjJn9Y
	5BHhmazJf1MbI8fwaRhd6M8NMroaB9b8PlreC7+jDkvunEG41qnuvuxYnkg==
X-Google-Smtp-Source: AGHT+IG4W8VtMga1eZ2FO+QwDF4LZFqBPLZzjzJvdbI9DAmiIc+D/vD2QvPa3hISTH2l19wPpplo3Q==
X-Received: by 2002:a05:6e02:3c85:b0:42f:9ba7:e47e with SMTP id e9e14a558f8ab-42f9ba7e72dmr156254155ab.14.1760382031018;
        Mon, 13 Oct 2025 12:00:31 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f90278522sm54190115ab.13.2025.10.13.12.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 12:00:30 -0700 (PDT)
Message-ID: <1ecbd61e-6b3f-42e8-86cd-e1c589a45262@sifive.com>
Date: Mon, 13 Oct 2025 14:00:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
To: Lucas Zampieri <lzampier@redhat.com>
Cc: Charles Mirabile <cmirabil@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>,
 linux-riscv@lists.infradead.org, Zhang Xincheng
 <zhangxincheng@ultrarisc.com>, linux-kernel@vger.kernel.org
References: <20251013111539.2206477-1-lzampier@redhat.com>
 <20251013111539.2206477-4-lzampier@redhat.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20251013111539.2206477-4-lzampier@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_120034_004741_AC677B7C 
X-CRM114-Status: GOOD (  37.06  )
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

Hi Lucas,

On 2025-10-13 6:15 AM, Lucas Zampieri wrote:
> From: Charles Mirabile <cmirabil@redhat.com>
> 
> Add a new compatible for the plic found in UltraRISC DP1000 with a quirk to
> work around a known hardware bug with IRQ claiming.
> 
> When claiming an interrupt on the DP1000 PLIC all other interrupts must be
> disabled before the claim register is accessed to prevent incorrect
> handling of the interrupt.
> 
> When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
> the enable state of all interrupts is saved and then all interrupts
> except for the first pending one are disabled before reading the claim
> register. The interrupts are then restored before further processing of
> the claimed interrupt continues.

Since the workaround requires scanning the pending bits for each interrupt
anyway, it would be simpler and more efficient to ignore the claim register
entirely. Call generic_handle_domain_irq() for each interrupt that is (enabled
AND pending), then clear the pending bit. Then you would not need to save and
restore the enable registers.

> The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
> SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
> This has no impact on other platforms.
> 
> Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 83 ++++++++++++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 9c4af7d58846..a7b51a925e96 100644
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
> @@ -367,6 +370,82 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
>  	.free		= irq_domain_free_irqs_top,
>  };
> 
> +static bool dp1000_isolate_pending_irq(int nr_irq_groups, u32 ie[],
> +				       void __iomem *pending,
> +				       void __iomem *enable)
> +{
> +	u32 pending_irqs = 0;
> +	int i, j;
> +
> +	/* Look for first pending interrupt */
> +	for (i = 0; i < nr_irq_groups; i++) {
> +		pending_irqs = ie[i] & readl(pending + i * sizeof(u32));
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
> +		writel(new_mask, enable + j * sizeof(u32));
> +	}
> +
> +	return true;
> +}
> +
> +static irq_hw_number_t dp1000_get_hwirq(struct plic_handler *handler,
> +					void __iomem *claim)
> +{
> +	void __iomem *enable = handler->enable_base;
> +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
> +	int nr_irqs = handler->priv->nr_irqs;
> +	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
> +	int i;
> +	u32 ie[32] = { 0 };
> +	irq_hw_number_t hwirq = 0;
> +
> +	raw_spin_lock(&handler->enable_lock);
> +
> +	/* Save current interrupt enable state */
> +	for (i = 0; i < nr_irq_groups; i++)
> +		ie[i] = readl(enable + i * sizeof(u32));
> +
> +	if (!dp1000_isolate_pending_irq(nr_irq_groups, ie, pending, enable))
> +		goto out;
> +
> +	hwirq = readl(claim);
> +
> +	/* Restore previous state */
> +	for (i = 0; i < nr_irq_groups; i++)
> +		writel(ie[i], enable + i * sizeof(u32));
> +out:
> +	raw_spin_unlock(&handler->enable_lock);
> +	return hwirq;
> +}
> +
> +static irq_hw_number_t plic_get_hwirq(struct plic_handler *handler,
> +				      void __iomem *claim)
> +{
> +	/*
> +	 * Due to a hardware bug in the implementation of the claim register
> +	 * in the UltraRISC DP1000 platform, other interrupts must be disabled
> +	 * before reading the claim register and restored afterwards.
> +	 */
> +
> +	if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
> +		return dp1000_get_hwirq(handler, claim);
> +
> +	return readl(claim);
> +}
> +
>  /*
>   * Handling an interrupt is a two-step process: first you claim the interrupt
>   * by reading the claim register, then you complete the interrupt by writing
> @@ -384,7 +463,7 @@ static void plic_handle_irq(struct irq_desc *desc)
> 
>  	chained_irq_enter(chip, desc);
> 
> -	while ((hwirq = readl(claim))) {
> +	while ((hwirq = plic_get_hwirq(handler, claim))) {

This is the hot path for interrupt handling. Instead of checking for the quirk
on every interrupt, please create a new function that you conditionally pass to
irq_set_chained_handler(), so the quirk check only happens once at boot.

Regards,
Samuel

>  		int err = generic_handle_domain_irq(handler->priv->irqdomain,
>  						    hwirq);
>  		if (unlikely(err)) {
> @@ -432,6 +511,8 @@ static const struct of_device_id plic_match[] = {
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>  	{ .compatible = "thead,c900-plic",
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> +	{ .compatible = "ultrarisc,cp100-plic",
> +	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
>  	{}
>  };
> 
> --
> 2.51.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
