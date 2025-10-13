Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF31DCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04QPAjdFy5KavGz74NQcNes4/5O5hYjkwLFpsxAbefM=; b=z3X2r0GVsXS8ar
	yf2odP+d5QhiK/RZ7C5iz2IymoJ8AUM9P+NAk4Diwq5H9KGfyXRExH9VsdFXWAwJqgJpa76PtflqI
	ayNd+LgYivqv6IS0i4hLPqcTqiCOj9Za6wh8ojggqm16b8vsbCkj5ZwjBfdHMB1MND3w+LMMB8NzU
	l1HE+37tbaKa9r+7m5rHNPIQRQodvZRla7F8wnYstZWg5mCaLfCGLHqWEYebehVnDpo6EA1jcTS6h
	4XIcefrq9nUpQi4vdtXxQCRZLDzYgMsi+4PYoJdzwUDjNDNudnSm9ArzN6J/mJv7GpHNapHiwysXQ
	7JkTyJhpxDP7xkqNDH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QYp-0000000Edli-0OBY;
	Mon, 13 Oct 2025 21:58:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QYn-0000000Edl1-3HlC
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 21:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V4CgO2gjUB1ReYMvMrsG9awRFMRdFdaL7/IydQKP1Oc=; b=qKljmQKqHN14P+WS06syqpyIeG
	xcqez/P/qxOlYfVrqmn3VvA2Nc60X9XjJPiTMRnEb+nq614Ys8j3oAGOMBAXgjsw2VdKD5Vv7S9WV
	LKR0hNxsyOsgPb4TlmkJ2xjhSSCawt9Q7zlU5W65XuJs0U3Bj2dDZrODVEM0avTsWax0BfljX1Tmd
	tMymgYuIHt5w1QAiOmWHZsgv2doy4FwWXK49A8I59PELroOJzbb4XKa0hX1YC8LljZKUtv50rTb8k
	ZY1ArPUnlSqv+0Ylt4za1Cw7YG/4e89De/n7JEfXeY/vZKNDjxftt4k8LthLMEkez8KedaosDCXEd
	fn02WJNg==;
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QYe-00000004fQm-1LS4
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:58:27 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-91179e3fe34so246838239f.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760392696; x=1760997496; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4CgO2gjUB1ReYMvMrsG9awRFMRdFdaL7/IydQKP1Oc=;
        b=SaYM2+vBDbEJKCYjZvNVdgm8B13zDahrE+sj6J9DUlVdhG0ktlh/PW5igutY95dNmn
         JHSRLq/M5vPbny1dWi2zmJBdY6/o7iPZyPUmm9lTbJU69hkO7Sv1vTTtRzcJyvCj22vE
         w9ipVU9FUWDLdfbFJKfSpSD1bCvpR8MqFFkKPQ0183+xBKjGTl1Djy27MbHoUejXDgtd
         huWyGJ5gC3zwFLiOQBsttRaQSJKZuW3n4OxUc0G7lBwDkbFBZIi0of6LDzPIi4v4QlvN
         9R9U/EfFVB5WZETArbHeqlhchB2RfiWfEdGR0b0BKonCXrcw+nVJ9+0FWVZeaAeYqo71
         xs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392696; x=1760997496;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4CgO2gjUB1ReYMvMrsG9awRFMRdFdaL7/IydQKP1Oc=;
        b=xReEgNhlCLrrtvaVtVSd5GLiXoYbZqKhsWyNvJJBPTpzmYjy7ikvjUv9AffRCWWZv7
         V8JCHP1B20pEbMcdQrIgPoEBZ28QIJCYNU8y6PjVC954ppGbSBFnB8kJ/Og+5jf2CiTM
         1Lb04H8phI+peMfUxFfINISgBc8SP4LrwuhxWgmSLvfvti12aa2AzpsR3Yd2B/2T2KPL
         ZwZzRJdhqvzP8LvGhMtnmgSTD4EFPck8RibhhZEECD+Gl7xG2zMV0PPwb1mr4dzHdeC7
         u46/Ld9x0TqAuaVdfANHodx6zFkFWaeqLx77U31XBF9wU26/b+5Kwaq5wP/x/WcS/m0n
         7bEg==
X-Forwarded-Encrypted: i=1; AJvYcCVLxhd2y8zyTpJlhpd4WNpyOrVdE6r6KPp6U+apY6VzuuyAvTB09Tx3QApOEZiXVfvaw59ZMCxSZcdJIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO6obkmpz34qNqif724JQOovNUm+c2WtjFddw9VwHNDElAui1x
	AX4KMtesPT4m9+jsGEZ12MN3xs+hkrfmr7da6H0UY/eoP4P/K6GiE03P6OyTJ3Vzc6Y=
X-Gm-Gg: ASbGncsAZFuHS231GAqqhsz6dl2xq4zsh4oGPOvESoD5qg5A26yVaAPDtRvbfhXwVIv
	vvNBzLDdHG261oIXfQMGOKMGQdAJh7GI8U26C7q++YtkkM2v6A3F+eDMlf3jjOfTb2g7FUEqtqe
	EEb/+O4TovpaGaLHBzC603oBlbin+HVmbOx9XbOcXQlbSXWrsfHrt3jRtegrio9mPb6bKb0a2ZE
	o6OyJ+XQs6ijas5RYuqUNqnFYV/SodoZ1VajHHpANN2KWGBM/wFlgP1lY9P1xya2KkWXV9oF0lH
	YmwP9bk6JdNhaWp7+J5mOdDv9AI/6fzhbMlySxwiEVAMDuayANTPMRTgm6e5B9hqq0nYtbJkUaf
	m0H1AnuG2EZsKzPByBy4AYx0M0QxfIhtAa/VScwY5K0lGWVsFlSLNM+5QZ19i9YP4vqNv
X-Google-Smtp-Source: AGHT+IEV6dAdcfXQoRvn/BXZwFufuwLnQ5+I48pbEZjHle5JG0qhVLr8+8yrpSJSElgFCsDommrYNA==
X-Received: by 2002:a05:6602:29d4:b0:93b:a3c3:1b09 with SMTP id ca18e2360f4ac-93bd17928e4mr2919782039f.6.1760392695538;
        Mon, 13 Oct 2025 14:58:15 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e25a39134sm424429139f.12.2025.10.13.14.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:58:15 -0700 (PDT)
Message-ID: <a7f42340-63ee-4d26-ae9a-840bbbf46b05@sifive.com>
Date: Mon, 13 Oct 2025 16:58:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
To: Charles Mirabile <cmirabil@redhat.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, dramforever@live.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lzampier@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 tglx@linutronix.de, zhangxincheng@ultrarisc.com
References: <1ecbd61e-6b3f-42e8-86cd-e1c589a45262@sifive.com>
 <20251013210318.3879203-1-cmirabil@redhat.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251013210318.3879203-1-cmirabil@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225821_767408_1F9AA51C 
X-CRM114-Status: GOOD (  51.04  )
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

Hi Charles,

On 2025-10-13 4:03 PM, Charles Mirabile wrote:
> Hi Samuel - 
> 
> On Mon, Oct 13, 2025 at 02:00:29PM -0500, Samuel Holland wrote:
>> Hi Lucas,
>>
>> On 2025-10-13 6:15 AM, Lucas Zampieri wrote:
>>> From: Charles Mirabile <cmirabil@redhat.com>
>>>
>>> Add a new compatible for the plic found in UltraRISC DP1000 with a quirk to
>>> work around a known hardware bug with IRQ claiming.
>>>
>>> When claiming an interrupt on the DP1000 PLIC all other interrupts must be
>>> disabled before the claim register is accessed to prevent incorrect
>>> handling of the interrupt.
>>>
>>> When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
>>> the enable state of all interrupts is saved and then all interrupts
>>> except for the first pending one are disabled before reading the claim
>>> register. The interrupts are then restored before further processing of
>>> the claimed interrupt continues.
>>
>> Since the workaround requires scanning the pending bits for each interrupt
>> anyway, it would be simpler and more efficient to ignore the claim register
>> entirely. Call generic_handle_domain_irq() for each interrupt that is (enabled
>> AND pending), then clear the pending bit. Then you would not need to save and
>> restore the enable registers.
>>
>>> The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
>>> SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
>>> This has no impact on other platforms.
>>>
>>> Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
>>> Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
>>> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
>>> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
>>> ---
>>>  drivers/irqchip/irq-sifive-plic.c | 83 ++++++++++++++++++++++++++++++-
>>>  1 file changed, 82 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
>>> index 9c4af7d58846..a7b51a925e96 100644
>>> --- a/drivers/irqchip/irq-sifive-plic.c
>>> +++ b/drivers/irqchip/irq-sifive-plic.c
>>> @@ -49,6 +49,8 @@
>>>  #define CONTEXT_ENABLE_BASE		0x2000
>>>  #define     CONTEXT_ENABLE_SIZE		0x80
>>>
>>> +#define PENDING_BASE                    0x1000
>>> +
>>>  /*
>>>   * Each hart context has a set of control registers associated with it.  Right
>>>   * now there's only two: a source priority threshold over which the hart will
>>> @@ -63,6 +65,7 @@
>>>  #define	PLIC_ENABLE_THRESHOLD		0
>>>
>>>  #define PLIC_QUIRK_EDGE_INTERRUPT	0
>>> +#define PLIC_QUIRK_CLAIM_REGISTER	1
>>>
>>>  struct plic_priv {
>>>  	struct fwnode_handle *fwnode;
>>> @@ -367,6 +370,82 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
>>>  	.free		= irq_domain_free_irqs_top,
>>>  };
>>>
>>> +static bool dp1000_isolate_pending_irq(int nr_irq_groups, u32 ie[],
>>> +				       void __iomem *pending,
>>> +				       void __iomem *enable)
>>> +{
>>> +	u32 pending_irqs = 0;
>>> +	int i, j;
>>> +
>>> +	/* Look for first pending interrupt */
>>> +	for (i = 0; i < nr_irq_groups; i++) {
>>> +		pending_irqs = ie[i] & readl(pending + i * sizeof(u32));
>>> +		if (pending_irqs)
>>> +			break;
>>> +	}
>>> +
>>> +	if (!pending_irqs)
>>> +		return false;
>>> +
>>> +	/* Disable all interrupts but the first pending one */
>>> +	for (j = 0; j < nr_irq_groups; j++) {
>>> +		u32 new_mask = 0;
>>> +
>>> +		if (j == i)
>>> +			/* Extract mask with lowest set bit */
>>> +			new_mask = (pending_irqs & -pending_irqs);
>>> +
>>> +		writel(new_mask, enable + j * sizeof(u32));
>>> +	}
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +static irq_hw_number_t dp1000_get_hwirq(struct plic_handler *handler,
>>> +					void __iomem *claim)
>>> +{
>>> +	void __iomem *enable = handler->enable_base;
>>> +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
>>> +	int nr_irqs = handler->priv->nr_irqs;
>>> +	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
>>> +	int i;
>>> +	u32 ie[32] = { 0 };

A couple of comments since we're keeping this algorithm:

There's already an appropriately-sized handler->enable_save array that can be
reused here.

>>> +	irq_hw_number_t hwirq = 0;
>>> +
>>> +	raw_spin_lock(&handler->enable_lock);
>>> +
>>> +	/* Save current interrupt enable state */
>>> +	for (i = 0; i < nr_irq_groups; i++)
>>> +		ie[i] = readl(enable + i * sizeof(u32));
>>> +
>>> +	if (!dp1000_isolate_pending_irq(nr_irq_groups, ie, pending, enable))
>>> +		goto out;
>>> +
>>> +	hwirq = readl(claim);
>>> +
>>> +	/* Restore previous state */
>>> +	for (i = 0; i < nr_irq_groups; i++)
>>> +		writel(ie[i], enable + i * sizeof(u32));

All of the I/O in these new functions, except the readl(claim), can use the
{readl,writel}_relaxed I/O accessors. They don't have any ordering requirement
with respect to main memory, just other I/O.

>>> +out:
>>> +	raw_spin_unlock(&handler->enable_lock);
>>> +	return hwirq;
>>> +}
>>> +
>>> +static irq_hw_number_t plic_get_hwirq(struct plic_handler *handler,
>>> +				      void __iomem *claim)
>>> +{
>>> +	/*
>>> +	 * Due to a hardware bug in the implementation of the claim register
>>> +	 * in the UltraRISC DP1000 platform, other interrupts must be disabled
>>> +	 * before reading the claim register and restored afterwards.
>>> +	 */
>>> +
>>> +	if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
>>> +		return dp1000_get_hwirq(handler, claim);
>>> +
>>> +	return readl(claim);
>>> +}
>>> +
>>>  /*
>>>   * Handling an interrupt is a two-step process: first you claim the interrupt
>>>   * by reading the claim register, then you complete the interrupt by writing
>>> @@ -384,7 +463,7 @@ static void plic_handle_irq(struct irq_desc *desc)
>>>
>>>  	chained_irq_enter(chip, desc);
>>>
>>> -	while ((hwirq = readl(claim))) {
>>> +	while ((hwirq = plic_get_hwirq(handler, claim))) {
>>
>> This is the hot path for interrupt handling. Instead of checking for the quirk
>> on every interrupt, please create a new function that you conditionally pass to
>> irq_set_chained_handler(), so the quirk check only happens once at boot.
>>
>> Regards,
>> Samuel
>>
>>>  		int err = generic_handle_domain_irq(handler->priv->irqdomain,
>>>  						    hwirq);
>>>  		if (unlikely(err)) {
>>> @@ -432,6 +511,8 @@ static const struct of_device_id plic_match[] = {
>>>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>>>  	{ .compatible = "thead,c900-plic",
>>>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>>> +	{ .compatible = "ultrarisc,cp100-plic",
>>> +	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
>>>  	{}
>>>  };
>>>
>>> --
>>> 2.51.0
>>>
>>
> 
> Is something like this closer to what you had in mind? I tried it on the
> dp1000 and it doesn't work. Obviously it is concievable that I messed up
> the logic here, but it also might be the case that reading the claim
> register is integral to the proper functioning of the pending bits.

It's also possible that the pending bits are read only. There are existing
implementations with both RO and RW pending bits. So the claim register might be
the only way to clear the pending bits for edge-triggered interrupts. (For level
interrupts, the pending bits should clear themselves, so it should be fine if
the write is ignored.) I don't see anything wrong with the code below, but we're
working with known-buggy hardware, so who knows.

> I can confirm that a more minimal change that just moves the quirk check
> out of the hot path is fine. Would that be acceptable even if it is not
> the most efficient? (in essense take the hunk with new functions from
> the original patch but revert the change to `plic_handle_irq` and then add
> the hunk that changes probe from this proposed patch and then create
> the `plic_handle_irq_dp1000` function as a copy of `plic_handle_irq` where
> `dp1000_get_hwirq` is in the loop instead of `readl(claim)`).

Yes, this is acceptable. Even if the workaround isn't the most efficient, it's
at least isolated to the affected hardware. So we'll get the hardware working
now, and the efficiency can always be revisited later.

Regards,
Samuel

> Best - Charlie
> 
> ---
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 9c4af7d58846..fcf520ed33fd 100644
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
> @@ -367,6 +370,53 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
>  	.free		= irq_domain_free_irqs_top,
>  };
>  
> +static int dp1000_find_pending_irq(struct plic_handler *handler, void __iomem *pending)
> +{
> +	void __iomem *enable = handler->enable_base;
> +	int nr_irqs = handler->priv->nr_irqs;
> +	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
> +	u32 pending_irqs = 0;
> +	int i;
> +
> +	raw_spin_lock(&handler->enable_lock);
> +	for (i = 0; i < nr_irq_groups; i++) {
> +		u32 enable_mask = readl(enable + i * sizeof(u32));
> +		u32 pending_mask = readl(pending + i * sizeof(u32));
> +		if ((pending_irqs = enable_mask & pending_mask))
> +			break;
> +	}
> +	raw_spin_unlock(&handler->enable_lock);
> +
> +	if (!pending_irqs)
> +		return 0;
> +
> +	return 32 * i + __ffs(pending_irqs);
> +}
> +
> +static void plic_handle_irq_dp1000(struct irq_desc *desc)
> +{
> +	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	irq_hw_number_t hwirq;
> +
> +	WARN_ON_ONCE(!handler->present);
> +
> +	chained_irq_enter(chip, desc);
> +
> +	while ((hwirq = dp1000_find_pending_irq(handler, pending))) {
> +		int err = generic_handle_domain_irq(handler->priv->irqdomain,
> +						    hwirq);
> +		__plic_toggle(pending, hwirq, 0);
> +		if (unlikely(err)) {
> +			pr_warn_ratelimited("%pfwP: can't find mapping for hwirq %lu\n",
> +					    handler->priv->fwnode, hwirq);
> +		}
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
>  /*
>   * Handling an interrupt is a two-step process: first you claim the interrupt
>   * by reading the claim register, then you complete the interrupt by writing
> @@ -432,6 +482,8 @@ static const struct of_device_id plic_match[] = {
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>  	{ .compatible = "thead,c900-plic",
>  	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
> +	{ .compatible = "ultrarisc,dp1000-plic",
> +	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
>  	{}
>  };
>  
> @@ -666,12 +718,16 @@ static int plic_probe(struct fwnode_handle *fwnode)
>  		}
>  
>  		if (global_setup) {
> +			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
> +			if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
> +				handler_fn = plic_handle_irq_dp1000;
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
