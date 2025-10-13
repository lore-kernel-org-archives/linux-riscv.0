Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C0CCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iInwOMGZ3q1HJMbvHNUYfp1lrHujJPCxIwnlZ5w46M=; b=2orak7IpXdmnxt
	arvaEHVinbx8cdf3tmPvXdo1QbnL0pDPUwjeng++bQtSnZf/gY3e14vATZOsgQQ1h5T5IPiabPUDz
	+zDGZAlmCoZErVnNyMWetV9eHHzbHhD5eK9fL+u3lgQUFwZ49S48c9mXqaFWlNjQVg5YrhmVMMZ+Y
	UgSDM9Z+g0VJVDo+up9anQL+BcKXqyqE9zGvF4CEa29vIH1Fqu4jYm99eXGjzx1Gptfp7CFuxk1Z9
	BpoBeMe+Jc0ELJXPh7HA+r5WJnXcQeGLlNAHd6CG55WqTNqmi0RHKuARrqt94NH1G8uB+faOHOHHN
	kwbRww4vxmWIl+dATbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Pye-0000000EXjo-36MH;
	Mon, 13 Oct 2025 21:21:08 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Pyc-0000000EXjA-0nYV
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:21:07 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77f605f22easo3996339b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760390465; x=1760995265; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZRakwlsDIcfaa9Yjkhwp/x8BBQtu50zlU1+cKPLGbQ=;
        b=Jy+4b+cNeufl3LIzDdHvml+7Z7MHJW4mVHkXAOW0pLEx7JAgXMNuGa5BRhVhmMdmOY
         UBtJ+jFSta3fntyz+OtfMKCgXOyP3nRtLcvzqamryykOovxz4iAGEbdo+2RMwobLZQX3
         LNOYEId+4h6QEIBjc8+/ToiZqtu1HP9Cl0cEFWYfO56xSDtzeDwDvTPeJc8P33KTRx8x
         PpBGRmzGcthxh+TGKi4ZeB+krZpGrGUaHh1AlS9M8ozpMcobmv0AsH3y8OydxR5T3uh9
         BiIhmKC9VWYinzuDNSzYkVWK9ovVQAy2sr0qx2pPNsKRHfdIfJMBtTg2yv1ZbETlUGbr
         djLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760390465; x=1760995265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZRakwlsDIcfaa9Yjkhwp/x8BBQtu50zlU1+cKPLGbQ=;
        b=NAKY/t76GNf/F04x3R0KdoE45aITqZdNoxPBLQwRYMku9rxN1wEL+t0FOiEDJbNda3
         G+305FSQaT7v8WhqS7//S0NSptsJ0hID7D1BcZ157SsQa+zu0ZkLcpOkuQXsSVYIWnLh
         QKk2Isu4Ks+xDzOIeJNcT6RiCPeiR6I8az02vavMKCMPZmIoFceNeSMlixBT+ALYFiUL
         dTaASCRKS9FiNbde7GcQV4j3hHTgS3qL5PpMaL2YHxmsn0gtAFwUUuoAQX+4YV7005vH
         ZqCmPYftu4ge8mpJwzhaQzLUYaZ7E+NYEm8enBNKdujEDx58+BynVOJZ4FldJtvxodVm
         B8wA==
X-Forwarded-Encrypted: i=1; AJvYcCWTkblbJnyLj15z8WVun3x4YTQ+nVNmyekv3AKVkN5fMIgW2kKnDQoPvvjbxdxQhz/E4M32hyBm/kK8Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPtxL3V5vJ4PzoXyo6ZUWy5lsw2grv3DuXZ2QzU5cr7x/4jYQ4
	ztc92YBjBJnj8NponN2Gb6xT1Hd+WtdxUpyzbLmWJOb4MyA4vkYRlSLMDywyXZ4b
X-Gm-Gg: ASbGncvUY+Qiji8SfgTddOfq+fNShPD7ht+fgrQDJW6/YNaYts6SCTpozGOXrCFh+L6
	lxI4RaznmZzOE+syBetHCc7Zyaek1rHLnE4+bMwnSmVR4qUGZ5GsSK7wkGHU7jRC99Csm5BKBrf
	CzvfyhSVnjtwf8SoL3/9DB9DteAkqvIEElVH1ZOCS0XiQE1HEw7ToUwSZRvPxyvS6pPNUjt6AQr
	/xlM2I+rx6pU8Id4hB7aIobAWjoDd+R9wnQ/asl9hVWyVexdQMfoV+f/f0H1XxMPDoL3zVSN3qS
	+gOGhnJvDbHpWGBhzposZHxQYhlBl6K2z2AdrX5AlcVNXPrDBE96PmgxDpKR/ggFsOTgAsHvrLv
	duPP4J9silzmcAPma4PNo/3s3nDSmxwZtlJkHMcS37tawi6ZrmcpNUo+PQ/09/q1tcoTaYdTLMz
	MhftX48i9ilnE5+iN3cy5P3F1/Htoq
X-Google-Smtp-Source: AGHT+IFiTEUx4WX6SEaX5gClVFJ7Xjbo9xWDhK4U59yZRFiLTXuzAsnVWEiBinffB9NWYVY0KwkOEA==
X-Received: by 2002:a05:6a00:189a:b0:77f:2dc4:4c16 with SMTP id d2e1a72fcca58-79387440592mr24625398b3a.21.1760390465214;
        Mon, 13 Oct 2025 14:21:05 -0700 (PDT)
Received: from [0.0.0.0] (ec2-54-193-105-225.us-west-1.compute.amazonaws.com. [54.193.105.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8135sm12402497b3a.68.2025.10.13.14.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:21:04 -0700 (PDT)
Message-ID: <65122c79-7497-4b40-8112-a8ccaeeb16ab@gmail.com>
Date: Mon, 13 Oct 2025 14:24:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000
 PLIC
To: Samuel Holland <samuel.holland@sifive.com>,
 Lucas Zampieri <lzampier@redhat.com>
Cc: Charles Mirabile <cmirabil@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>,
 linux-riscv@lists.infradead.org, Zhang Xincheng
 <zhangxincheng@ultrarisc.com>, linux-kernel@vger.kernel.org
References: <20251013111539.2206477-1-lzampier@redhat.com>
 <20251013111539.2206477-4-lzampier@redhat.com>
 <1ecbd61e-6b3f-42e8-86cd-e1c589a45262@sifive.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <1ecbd61e-6b3f-42e8-86cd-e1c589a45262@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_142106_260254_6991EC5B 
X-CRM114-Status: GOOD (  35.37  )
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

On 10/13/25 12:00, Samuel Holland wrote:
> Hi Lucas,
> 
> On 2025-10-13 6:15 AM, Lucas Zampieri wrote:
>> From: Charles Mirabile <cmirabil@redhat.com>
>>
>> Add a new compatible for the plic found in UltraRISC DP1000 with a quirk to
>> work around a known hardware bug with IRQ claiming.
>>
>> When claiming an interrupt on the DP1000 PLIC all other interrupts must be
>> disabled before the claim register is accessed to prevent incorrect
>> handling of the interrupt.
>>
>> When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
>> the enable state of all interrupts is saved and then all interrupts
>> except for the first pending one are disabled before reading the claim
>> register. The interrupts are then restored before further processing of
>> the claimed interrupt continues.
> 
> Since the workaround requires scanning the pending bits for each interrupt
> anyway, it would be simpler and more efficient to ignore the claim register
> entirely. Call generic_handle_domain_irq() for each interrupt that is (enabled
> AND pending), then clear the pending bit. Then you would not need to save and
> restore the enable registers.
> 

Is that safe and race-free? Can we guarantee that the enable bits for
different contexts (harts) are disjoint at any given time? I'm a little
bit worried about the scenario where 2+ harts having the same irq enabled
and competing for the same irq claim. Without using the HW claim register,
we may get spurious interrupt, and then wrongly claimed the spurious
interrupt causing the next real one to be delayed indefinitely.

>> The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
>> SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
>> This has no impact on other platforms.
>>
>> Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
>> Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
>> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
>> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
>> ---
>>   drivers/irqchip/irq-sifive-plic.c | 83 ++++++++++++++++++++++++++++++-
>>   1 file changed, 82 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
>> index 9c4af7d58846..a7b51a925e96 100644
>> --- a/drivers/irqchip/irq-sifive-plic.c
>> +++ b/drivers/irqchip/irq-sifive-plic.c
>> @@ -49,6 +49,8 @@
>>   #define CONTEXT_ENABLE_BASE		0x2000
>>   #define     CONTEXT_ENABLE_SIZE		0x80
>>
>> +#define PENDING_BASE                    0x1000
>> +
>>   /*
>>    * Each hart context has a set of control registers associated with it.  Right
>>    * now there's only two: a source priority threshold over which the hart will
>> @@ -63,6 +65,7 @@
>>   #define	PLIC_ENABLE_THRESHOLD		0
>>
>>   #define PLIC_QUIRK_EDGE_INTERRUPT	0
>> +#define PLIC_QUIRK_CLAIM_REGISTER	1
>>
>>   struct plic_priv {
>>   	struct fwnode_handle *fwnode;
>> @@ -367,6 +370,82 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
>>   	.free		= irq_domain_free_irqs_top,
>>   };
>>
>> +static bool dp1000_isolate_pending_irq(int nr_irq_groups, u32 ie[],
>> +				       void __iomem *pending,
>> +				       void __iomem *enable)
>> +{
>> +	u32 pending_irqs = 0;
>> +	int i, j;
>> +
>> +	/* Look for first pending interrupt */
>> +	for (i = 0; i < nr_irq_groups; i++) {
>> +		pending_irqs = ie[i] & readl(pending + i * sizeof(u32));
>> +		if (pending_irqs)
>> +			break;
>> +	}
>> +
>> +	if (!pending_irqs)
>> +		return false;
>> +
>> +	/* Disable all interrupts but the first pending one */
>> +	for (j = 0; j < nr_irq_groups; j++) {
>> +		u32 new_mask = 0;
>> +
>> +		if (j == i)
>> +			/* Extract mask with lowest set bit */
>> +			new_mask = (pending_irqs & -pending_irqs);
>> +
>> +		writel(new_mask, enable + j * sizeof(u32));
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static irq_hw_number_t dp1000_get_hwirq(struct plic_handler *handler,
>> +					void __iomem *claim)
>> +{
>> +	void __iomem *enable = handler->enable_base;
>> +	void __iomem *pending = handler->priv->regs + PENDING_BASE;
>> +	int nr_irqs = handler->priv->nr_irqs;
>> +	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
>> +	int i;
>> +	u32 ie[32] = { 0 };
>> +	irq_hw_number_t hwirq = 0;
>> +
>> +	raw_spin_lock(&handler->enable_lock);
>> +
>> +	/* Save current interrupt enable state */
>> +	for (i = 0; i < nr_irq_groups; i++)
>> +		ie[i] = readl(enable + i * sizeof(u32));
>> +
>> +	if (!dp1000_isolate_pending_irq(nr_irq_groups, ie, pending, enable))
>> +		goto out;
>> +
>> +	hwirq = readl(claim);
>> +
>> +	/* Restore previous state */
>> +	for (i = 0; i < nr_irq_groups; i++)
>> +		writel(ie[i], enable + i * sizeof(u32));
>> +out:
>> +	raw_spin_unlock(&handler->enable_lock);
>> +	return hwirq;
>> +}
>> +
>> +static irq_hw_number_t plic_get_hwirq(struct plic_handler *handler,
>> +				      void __iomem *claim)
>> +{
>> +	/*
>> +	 * Due to a hardware bug in the implementation of the claim register
>> +	 * in the UltraRISC DP1000 platform, other interrupts must be disabled
>> +	 * before reading the claim register and restored afterwards.
>> +	 */
>> +
>> +	if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
>> +		return dp1000_get_hwirq(handler, claim);
>> +
>> +	return readl(claim);
>> +}
>> +
>>   /*
>>    * Handling an interrupt is a two-step process: first you claim the interrupt
>>    * by reading the claim register, then you complete the interrupt by writing
>> @@ -384,7 +463,7 @@ static void plic_handle_irq(struct irq_desc *desc)
>>
>>   	chained_irq_enter(chip, desc);
>>
>> -	while ((hwirq = readl(claim))) {
>> +	while ((hwirq = plic_get_hwirq(handler, claim))) {
> 
> This is the hot path for interrupt handling. Instead of checking for the quirk
> on every interrupt, please create a new function that you conditionally pass to
> irq_set_chained_handler(), so the quirk check only happens once at boot.
> 
> Regards,
> Samuel
> 
>>   		int err = generic_handle_domain_irq(handler->priv->irqdomain,
>>   						    hwirq);
>>   		if (unlikely(err)) {
>> @@ -432,6 +511,8 @@ static const struct of_device_id plic_match[] = {
>>   	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>>   	{ .compatible = "thead,c900-plic",
>>   	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
>> +	{ .compatible = "ultrarisc,cp100-plic",
>> +	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
>>   	{}
>>   };
>>
>> --
>> 2.51.0
>>
> 

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
