Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F052C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 20:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niOvjekCf/qG/ic9YZc44Z98e8Ho/9TT/nKYUc3pX24=; b=gMCfrBBVbOCm7N
	8ePb92Tvl/v2AeIrzQKNISYbLTBhqC86NWWpKGQ68+VujNGW4O3Dknbx/b2ouU8LNOyg6UEfbyWqD
	9IDY6eVDrctk0wAekbPDhucJcp6Iv2xuGqtCEytiLGmIkWE/ttLG3rfDQ6lBR1I1LryWfwM0tsTBE
	fTVuI0msx8lV6uEBxxIEAdlG8RfsmC6dAbraAyDpY/Izl2lx/ih7cz9XXcbOOjeTL+sQ6dPIoyBcw
	9zVq45M03VJ0O5aOVW+QLgzabK8IP8xhBN35KX6h0OlfZUYBRwCixPzKmjTZH7LqMvwM/gFT/XUNr
	hHSgARYF2JjJdBvgOjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRJA-00000008jPo-2pMD;
	Fri, 07 Aug 2026 20:36:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRJ9-00000008jPe-1TNn
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 20:36:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A843343AFF;
	Fri,  7 Aug 2026 20:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4C81F000E9;
	Fri,  7 Aug 2026 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786135006;
	bh=PC1DtOrjp0Hv15KMic8iAdGSREhJUEAqTIXRwqdUKtw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XtGpy3vIhNdQZ5bOKQHhJcUVty13P0F7Jl+A1pZhj52LZHkPXqFCxQkin+taKWA+V
	 kiODKh9GYM2RDnuos9aBb4LIPbxZJVciPPv14s0NDzR6vx52PcInkl7m3jasbQNtHj
	 wuULQjI1lMo38o+XIWRHZI7P7Hwo+Osc+GLammkj71FE9xGoQT9eKCoSdWd8bu/xra
	 Uga4aGivVrOZhGyiNg1O81p2jxYamQbPrJU/axJPrzsNZ6gy3EGxt7l40qexQGVwDU
	 dUh6LY8qbWrUFMB++ynMfMKGKibEgJaykoCwnXRsPexbj96sHbOb6Lj36U3t3kmvXM
	 /EZ9DzJ6FgvTQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
 tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v3 07/19] iommu/riscv: Add IRQ domain for interrupt
 remapping
In-Reply-To: <875x1lekog.ffs@fw13>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
 <20260807181713.228535-8-andrew.jones@oss.qualcomm.com>
 <875x1lekog.ffs@fw13>
Date: Fri, 07 Aug 2026 22:36:43 +0200
Message-ID: <8733wpekh0.ffs@fw13>
MIME-Version: 1.0
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

On Fri, Aug 07 2026 at 22:32, Thomas Gleixner wrote:
> On Fri, Aug 07 2026 at 20:17, Andrew Jones wrote:
>> +static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
>> +						unsigned int irq_base, unsigned int nr_irqs,
>> +						void *arg)
>> +{
>> +	struct irq_data *data;
>> +	int i, ret;
>> +
>> +	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < nr_irqs; i++) {
>
> for (unsigned int i = 0; .....
>
> nr_irqs is unsigned after all
>
> The struct irq_data declaration want's to be inside the loop as that's
> the scope where it is used.
>
>> +		data = irq_domain_get_irq_data(irqdomain, irq_base + i);
>
>
>> +		data->chip = &riscv_iommu_ir_irq_chip;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
>> +	.alloc = riscv_iommu_ir_irq_domain_alloc_irqs,
>> +	.free = irq_domain_free_irqs_parent,
>
> https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers
>
>> +};
>> +
>> +static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
>> +	.prefix			= "IR-",
>> +	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
>> +				  MSI_FLAG_PCI_MSIX,
>> +	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
>> +				  MSI_FLAG_USE_DEF_CHIP_OPS |
>> +				  MSI_FLAG_PCI_MSI_MASK_PARENT,
>> +	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
>> +	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
>> +};
>> +
>> +struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
>> +						    struct riscv_iommu_info *info)
>
> You have 100 characters, please use them.

Oops. Just noticed, that this is IOMMU territory. So whatever the IOMMU
maintainers prefer :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
