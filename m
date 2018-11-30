Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52D6C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 00:35:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE892080A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 00:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="unhLbGIN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="KkJdeESs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE892080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=re611bCoAmwVFtquUumNjJICZIbq5NFptEnzVSWxYiU=; b=unhLbGINOPcx31GPps0qtrueQ
	0rfYNDQmPSLzY9lH6rdOUPytJWpfBYVfv3lEOnchh27GqaB8SHH0YY43gGU+uqFXD0kxU6y5zX/cI
	u3yGGGnw5+21XdbAu9zLzHgPJ4ofiq29DPo3YyBGJAk1qoTCL7QyFyUdVom7o16zsqSjWn+zR+fmP
	q3bWd81Dr0okbqDnXj3LtnhFVERWB0mUSLX7yReihLx/BtFqRiiJkMSALYRIJQxClDq72geKKrtDz
	C+/M+XGEP83ck9KEfn737gG0aeSa0pmbip4/QvtqnxKSWneHwbJZw2+bxoYcZz/8sditWhbgosoCz
	HH+pH6s3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSWmP-0007Ct-Qa; Fri, 30 Nov 2018 00:35:37 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSWmN-0007CB-2b
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 00:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1543538135; x=1575074135;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dFl/zZLgSDqemqPv+7eT/OSLd89e2+sy3YtrTSVl/Ck=;
 b=KkJdeESsqmpLDqypTHnpGHPizYiEa/KXtQwXD6L1SEXmDCwP2OgcXG3K
 X4B5u7/8yM/GsxSXRQwsvRaou0HU0/eY53g3EKYa4G6j4tjgtlsK+W7I6
 +YJqmAYZpXNkMgk9jiHBz74jXFBawrBlDowq/b70EMBrQIjnox6TKY3MT
 ML0epCJbYyPs0QorUArPbBhQjQGDBfoOHGWN0kykg7wQLgBtWIvQgxfcQ
 hikbuJxpHlICbRKDTWY6sjZ+5ustN7AXScixQ8NZLucHnxM5u881ZS+C3
 /k/PthX0hP2aTNZl8uvCfakc/+NDmg78x7KunOnMqmxDkIPZaB2Rq2J/5 g==;
X-IronPort-AV: E=Sophos;i="5.56,296,1539619200"; d="scan'208";a="100284419"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2018 08:35:23 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 29 Nov 2018 16:18:19 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.72.98])
 ([10.111.72.98])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Nov 2018 16:35:22 -0800
Subject: Re: [PATCH v2 1/4] irqchip: sifive-plic: Pre-compute context hart
 base and enable base
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
References: <20181127100317.12809-1-anup@brainfault.org>
 <20181127100317.12809-2-anup@brainfault.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <b6ff2593-9113-9b95-ade5-09e7e9fa1be5@wdc.com>
Date: Thu, 29 Nov 2018 16:35:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181127100317.12809-2-anup@brainfault.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181129_163535_129964_EE2EDCE9 
X-CRM114-Status: GOOD (  21.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/27/18 2:03 AM, Anup Patel wrote:
> This patch does following optimizations:
> 1. Pre-compute hart base for each context handler
> 2. Pre-compute enable base for each context handler
> 3. Have enable lock for each context handler instead
> of global plic_toggle_lock
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>   drivers/irqchip/irq-sifive-plic.c | 41 +++++++++++++------------------
>   1 file changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 357e9daf94ae..56fce648a901 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -60,36 +60,24 @@ static void __iomem *plic_regs;
>   struct plic_handler {
>   	bool			present;
>   	int			ctxid;
> +	void __iomem		*hart_base;
> +	raw_spinlock_t		enable_lock;
> +	void __iomem		*enable_base;

It should be u32. Otherwise, plic_toggle calculates incorrect address 
and it does not boot on Unlheased.

>   };
>   static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>   
> -static inline void __iomem *plic_hart_offset(int ctxid)
> +static inline void plic_toggle(struct plic_handler *handler,
> +				int hwirq, int enable)
>   {
> -	return plic_regs + CONTEXT_BASE + ctxid * CONTEXT_PER_HART;
> -}
> -
> -static inline u32 __iomem *plic_enable_base(int ctxid)
> -{
> -	return plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART;
> -}
> -
> -/*
> - * Protect mask operations on the registers given that we can't assume that
> - * atomic memory operations work on them.
> - */

Should we keep the comment for enable_lock ?

> -static DEFINE_RAW_SPINLOCK(plic_toggle_lock);
> -
> -static inline void plic_toggle(int ctxid, int hwirq, int enable)
> -{
> -	u32 __iomem *reg = plic_enable_base(ctxid) + (hwirq / 32);
> +	u32 __iomem *reg = handler->enable_base + (hwirq / 32);
>   	u32 hwirq_mask = 1 << (hwirq % 32);
>   
> -	raw_spin_lock(&plic_toggle_lock);
> +	raw_spin_lock(&handler->enable_lock);
>   	if (enable)
>   		writel(readl(reg) | hwirq_mask, reg);
>   	else
>   		writel(readl(reg) & ~hwirq_mask, reg);
> -	raw_spin_unlock(&plic_toggle_lock);
> +	raw_spin_unlock(&handler->enable_lock);
>   }
>   
>   static inline void plic_irq_toggle(struct irq_data *d, int enable)
> @@ -101,7 +89,7 @@ static inline void plic_irq_toggle(struct irq_data *d, int enable)
>   		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
>   
>   		if (handler->present)
> -			plic_toggle(handler->ctxid, d->hwirq, enable);
> +			plic_toggle(handler, d->hwirq, enable);
>   	}
>   }
>   
> @@ -150,7 +138,7 @@ static struct irq_domain *plic_irqdomain;
>   static void plic_handle_irq(struct pt_regs *regs)
>   {
>   	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> -	void __iomem *claim = plic_hart_offset(handler->ctxid) + CONTEXT_CLAIM;
> +	void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
>   	irq_hw_number_t hwirq;
>   
>   	WARN_ON_ONCE(!handler->present);
> @@ -240,11 +228,16 @@ static int __init plic_init(struct device_node *node,
>   		handler = per_cpu_ptr(&plic_handlers, cpu);
>   		handler->present = true;
>   		handler->ctxid = i;
> +		handler->hart_base =
> +			plic_regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> +		raw_spin_lock_init(&handler->enable_lock);
> +		handler->enable_base =
> +			plic_regs + ENABLE_BASE + i * ENABLE_PER_HART;
>   
>   		/* priority must be > threshold to trigger an interrupt */
> -		writel(0, plic_hart_offset(i) + CONTEXT_THRESHOLD);
> +		writel(0, handler->hart_base + CONTEXT_THRESHOLD);
>   		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> -			plic_toggle(i, hwirq, 0);
> +			plic_toggle(handler, hwirq, 0);
>   		nr_mapped++;
>   	}
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
