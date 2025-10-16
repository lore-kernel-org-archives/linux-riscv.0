Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C73CCCD19F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSZDa4jsrtUpgPJMc6TUXbHmjPiJm2Kh+RBFRxUOxUU=; b=oIvWd56EtT7KNE
	ausv3YXUAIe9e0KiV9209Q0LocsXNfTBGW2i4ZXLUcTBk4MkMLii9R+ZXi+dX9emak4cYVXlFO3VP
	ByX9uFdXhlktqP15qLi/KQSdZrWp2yac3++nSD4TCvinVhR9KrpLtEfzz0+tTxHqXIeY7QcMyR2I1
	73FGNf2ZgPZ0qXyuCIeZaoDAKhb0ktrvOTiCbQmEDwisiHwPVH8nDAoZYafZaRMMc1/ZwWFrTIqmJ
	s2lopCasd8gQsPloGsEOqfk0QBVb+jtxqNdWt7zs1Ry5jqs861Ons7Mlqo0vyBGKGS/1xvepje9XV
	iptUUMROy91l9PVKhlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NrZ-00000004qtm-1gM2;
	Thu, 16 Oct 2025 13:17:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9NrX-00000004qtI-1IRN
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 13:17:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760620664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oUsWchRMdAE4l+vEN2fWlus0VY/n34ExO8gyOqnMgA=;
	b=3/uLnaLmN//dFyOSyDF7z93ieUKiwrTSGweVvS0Zt+mj1ZlLJM6EvuYJq7lQYwf6A8sNZJ
	qmL0ZsFD5ylLS62sUlAziXGrq1mxaWSoXhfL30MRWnX5IoYG/dPaeNAICX9As8IpFHAFQ0
	oezi9KI8sVw6tkcDDtRR1S1DiX6zqKcIeCRQukpnSWi2cLxN9ztpnUybJS/sHDlMokwupJ
	cmYsGFiH6O8yhzqgsilzDLCIJarNni9F8ncD+nyOxV+EI9X3Lu8jGojxw/kxynWLmbrZcH
	Ih7XhBYmh7hTJfUE26CiZ3VuiB1dFaGsNSf9jbJuk2lk3q8ZAHVLw0xEVd8zUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760620664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oUsWchRMdAE4l+vEN2fWlus0VY/n34ExO8gyOqnMgA=;
	b=gn/NlTqnvRPSe8AeSdxph3cIKZLyJJlA5SOlj8PMN2CG1GBeIbsmhusHcfKwYcc3GKYCNk
	km8SkqAp3iDfvmCw==
To: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian
 Wang <dramforever@live.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Zhang Xincheng
 <zhangxincheng@ultrarisc.com>, Lucas Zampieri <lzampier@redhat.com>
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
In-Reply-To: <20251016084301.27670-4-lzampier@redhat.com>
References: <20251016084301.27670-1-lzampier@redhat.com>
 <20251016084301.27670-4-lzampier@redhat.com>
Date: Thu, 16 Oct 2025 15:17:42 +0200
Message-ID: <87plan0yvd.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_061747_510197_9440C459 
X-CRM114-Status: GOOD (  16.87  )
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

On Thu, Oct 16 2025 at 09:42, Lucas Zampieri wrote:

After fixing the corrupted patch up I had a closer look and decided not
to merge it. See comments below.
  
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
> +		if (j == i) {
> +			/* Extract mask with lowest set bit */
> +			new_mask = (pending_irqs & -pending_irqs);
> +		}
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

This is truly the most inefficient way to solve that problem. The enable
registers are modified with enabled_lock held, so you can just cache the
value in plic_handler::enabled_save and avoid this read loop completely.
After claiming the interrupt you restore from that cache, no?

Now for the search and disable mechanism. Of course you need to search
for th pending interrupt first, but then you can make that masking loop
very simple by having a plic_handler::enabled_clear[] array which is
zeroed on initialization:

        unsigned long pending = 0;
        
	for (group = 0; !pending && group < nr_irq_groups; group++) {
		pending = handler->enabled_save[i];
                pending =& readl_relaxed(pending + group * sizeof(u32));
	}
        if (!pending)
        	return false;

        bit = ffs(pending) - 1;
        handler->enabled_clear[group] |= BIT(bit);
        for (int i = 0; i < nr_irq_groups; i++)
		writel_relaxed(handler->enabled_clear[i], enable + i * sizeof(u32));
        handler->enabled_clear[group] = 0;

No?

But looking at this makes me wonder about the functional correctness of all
this. What happens in this case:

Device A raises an interrupt

    handler()
        ....
        disable_groups();

Device B raises a now disabled interrupt

        restore_groups();

Is the device B interrupt preserved in the interrupt chip and actually
raised when the interrupt enable bit is restored or is it lost?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
