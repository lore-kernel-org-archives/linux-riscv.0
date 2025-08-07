Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8F0C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meFrZ6t1F/jhU30h78Tk3uubPL+fmVZQIYbThrgYvwM=; b=KCO69gf4iYQfya
	hSb1oUftPdRqk7BR5Lwvz5ymTTO/WYrOmoZes+8KgwycjreRk6hSkO7RMX47bBF0yj4FJ3TcpG3/c
	xtAGeYcJvXkeLL3Nnpeqvbw4hHQpbg0ZmhsFQ4GKBf/PxscfyLpiyCPFW/wMzybHYhBeOIiG/MIfe
	qwVodc8WxEWKIJ7wCz4GLC2CJKx/a0bloMgqyG7Gqaj6st2HZxHmCGbI30Pm5IyAfHfvtsxweh7BS
	ZBT18KHMc1ImiUz/by1dYVW9TDR5Dk+Hzeh3YQMSPW2/Iil/CXwXkiHLCGl54hnco5VFaU9R6cD1L
	TPLgPpR0WkAmWH8Pz0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk09n-00000000c9L-0PXJ;
	Thu, 07 Aug 2025 12:55:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzuS-00000000ZTd-2TBn
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 12:39:53 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754570389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H04ZIKmE6o/aPmfvgSEleptBdX7dH7MfiferMt7opCk=;
	b=NZsPU/PbjAmXPLlxHSsskQxfOtibTbwPmlJokCaaAPMOjTFYCn+2cJlZ7fYnA1fMTc3lCu
	n0XXake88wIY4bmJhFeTs0YjdBcQ2e1SBLlLp+95Tr12Txh/kpTFNMDGszDdWwvEhafK78
	ZcCuuuiFX1sgn6lXLpC5USt9Phjr7hNi7HMsESOCvOOxk/jR3ozzijPU0QNVTwVYo/tkkB
	OxJ/Qp5WQlfJVuUlNAsSzu+fW/3EEKc7zKILYspOpYNjL8W6YICh7NGQIKNMlMq3z93hXR
	4/zVbF0HGELzmQaUL4uX6YDNIbiU7ryyi+Ly15+B0OlEGmL+uG4np0BLfmnsnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754570389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H04ZIKmE6o/aPmfvgSEleptBdX7dH7MfiferMt7opCk=;
	b=TepyGY1Q/w6JTWISuc7uBnfYRybQDBGRbEiIniDXkeS7XOTOy9r4ek7IMPif/ZYZVvKDqQ
	9W16cb2F6VkPC9Ag==
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner
 <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel.holland@sifive.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
 <looong.bin@gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Respect mask state when setting
 affinity
In-Reply-To: <20250807111806.741706-1-inochiama@gmail.com>
References: <20250807111806.741706-1-inochiama@gmail.com>
Date: Thu, 07 Aug 2025 14:39:42 +0200
Message-ID: <87fre3mhkh.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_053952_765038_E487C81F 
X-CRM114-Status: GOOD (  15.05  )
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

Inochi Amaoto <inochiama@gmail.com> writes:

> The plic_set_affinity always call plic_irq_enable(), which clears up
> the priority setting even the irq is only masked. This make the irq
> unmasked unexpectly.
>
> Replace the plic_irq_enable/disable() with plic_irq_toggle() to
> avoid changing priority setting.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bf69a4802b71..5bf5050996da 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -148,6 +148,7 @@ static void plic_irq_enable(struct irq_data *d)
>  
>  static void plic_irq_disable(struct irq_data *d)
>  {
> +	plic_irq_mask(d);
>  	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
>  }

This part is not required for the problem you are addressing, right?

I do not oppose the change, I'm just curious if I miss something here.

>  
> @@ -179,12 +180,14 @@ static int plic_set_affinity(struct irq_data *d,
>  	if (cpu >= nr_cpu_ids)
>  		return -EINVAL;
>  
> -	plic_irq_disable(d);
> +	/* Invalidate the original routing entry */
> +	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
>  
>  	irq_data_update_effective_affinity(d, cpumask_of(cpu));
>  
> +	/* Setting the new routing entry if irq is enabled */
>  	if (!irqd_irq_disabled(d))
> -		plic_irq_enable(d);
> +		plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
>  
>  	return IRQ_SET_MASK_OK_DONE;
>  }

This part makes sense:

Reviewed-by: Nam Cao <namcao@linutronix.de>
Tested-by: Nam Cao <namcao@linutronix.de> # VisionFive 2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
