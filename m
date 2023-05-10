Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13FEC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKihaiNQp0tjfwUOPcVi8WfderlAXXHmdQ3abVcCr34=; b=Hq51q9YWOInvWQ
	zAapOTUmQZLamJPbmPmTs22ptu78CZeh7joVRzC9iAZ0yx8/7kVgVgU55uLroyposC5+m1ossT6xK
	n+VE3FnbopuR5ucV0rbY9Li3idudZhnD/Rb9dDgaYAcJLtl6eIBNjjW5vWsxC+AUvkCe2oXNhpsYK
	JRIz/ECYqrKc8+GP2SFwKt1gSY3EZVMD1vdP/FtB3XrO1WHTE0BiZ77u4ASSV6WgLYOKo0e1eV4MC
	K+QNPsp1UbmAbrjx836KK0houzkz/EAsAZ5sSCXnY6O0AcmtflkNppJYtrEVIJgkIMCBBXaMGBiLM
	SogfFKJ2Xfw9gChv0HtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhNN-005sn6-0Q;
	Wed, 10 May 2023 10:48:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwhNJ-005sk9-2j
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 10:48:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEBFD1063;
	Wed, 10 May 2023 03:49:29 -0700 (PDT)
Received: from [10.57.83.77] (unknown [10.57.83.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F7D43F5A1;
	Wed, 10 May 2023 03:48:42 -0700 (PDT)
Message-ID: <38cb8b93-6f10-c269-e574-613ae6a9dd87@arm.com>
Date: Wed, 10 May 2023 11:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 07/11] irqchip/riscv-imsic: Improve IOMMU DMA support
Content-Language: en-GB
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 Vincent Chen <vincent.chen@sifive.com>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-8-apatel@ventanamicro.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230508142842.854564-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_034850_005127_38C6EEF3 
X-CRM114-Status: GOOD (  32.38  )
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

On 2023-05-08 15:28, Anup Patel wrote:
> We have a separate RISC-V IMSIC MSI address for each CPU so changing
> MSI (or IRQ) affinity results in re-programming of MSI address in
> the PCIe (or platform) device.
> 
> Currently, the iommu_dma_prepare_msi() is called only once at the
> time of IRQ allocation so IOMMU DMA domain will only have mapping
> for one MSI page. This means iommu_dma_compose_msi_msg() called
> by imsic_irq_compose_msi_msg() will always use the same MSI page
> irrespective to target CPU MSI address. In other words, changing
> MSI (or IRQ) affinity for device using IOMMU DMA domain will not
> work.
> 
> To address above issue, we do the following:
> 1) Map MSI pages for all CPUs in imsic_irq_domain_alloc()
>     using iommu_dma_prepare_msi().
> 2) Add a new iommu_dma_select_msi() API to select a specific
>     MSI page from a set of already mapped MSI pages.
> 3) Use iommu_dma_select_msi() to select a specific MSI page
>     before calling iommu_dma_compose_msi_msg() in
>     imsic_irq_compose_msi_msg().

The high-level design is that prepare ensures any necessary page 
mappings exist, then compose retrieves the appropriate page for the 
given message. I think it generalises well enough without needing a new 
op, it just means that caching a single page in the msi_desc up-front no 
longer fits, so that wants tweaking to allow compose to do a more 
general lookup.

Thanks,
Robin.

> Reported-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   drivers/iommu/dma-iommu.c         | 38 +++++++++++++++++++++++++++++++
>   drivers/irqchip/irq-riscv-imsic.c | 27 ++++++++++++----------
>   include/linux/iommu.h             |  6 +++++
>   3 files changed, 59 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 7a9f0b0bddbd..07782c77a6eb 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1677,6 +1677,44 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
>   	return 0;
>   }
>   
> +/**
> + * iommu_dma_select_msi() - Select a MSI page from a set of
> + * already mapped MSI pages in the IOMMU domain.
> + *
> + * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> + * @msi_addr: physical address of the MSI page to be selected
> + *
> + * Return: 0 on success or negative error code if the select failed.
> + */
> +int iommu_dma_select_msi(struct msi_desc *desc, phys_addr_t msi_addr)
> +{
> +	struct device *dev = msi_desc_to_dev(desc);
> +	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> +	const struct iommu_dma_msi_page *msi_page;
> +	struct iommu_dma_cookie *cookie;
> +
> +	if (!domain || !domain->iova_cookie) {
> +		desc->iommu_cookie = NULL;
> +		return 0;
> +	}
> +
> +	cookie = domain->iova_cookie;
> +	msi_addr &= ~(phys_addr_t)(cookie_msi_granule(cookie) - 1);
> +
> +	msi_page = msi_desc_get_iommu_cookie(desc);
> +	if (msi_page && msi_page->phys == msi_addr)
> +		return 0;
> +
> +	list_for_each_entry(msi_page, &cookie->msi_page_list, list) {
> +		if (msi_page->phys == msi_addr) {
> +			msi_desc_set_iommu_cookie(desc, msi_page);
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
>   /**
>    * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
>    * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> diff --git a/drivers/irqchip/irq-riscv-imsic.c b/drivers/irqchip/irq-riscv-imsic.c
> index 30247c84a6b0..ec61c599e0c5 100644
> --- a/drivers/irqchip/irq-riscv-imsic.c
> +++ b/drivers/irqchip/irq-riscv-imsic.c
> @@ -446,6 +446,10 @@ static void imsic_irq_compose_msi_msg(struct irq_data *d,
>   	if (WARN_ON(err))
>   		return;
>   
> +	err = iommu_dma_select_msi(desc, msi_addr);
> +	if (WARN_ON(err))
> +		return;
> +
>   	msg->address_hi = upper_32_bits(msi_addr);
>   	msg->address_lo = lower_32_bits(msi_addr);
>   	msg->data = d->hwirq;
> @@ -493,11 +497,18 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
>   	int i, hwirq, err = 0;
>   	unsigned int cpu;
>   
> -	err = imsic_get_cpu(&imsic->lmask, false, &cpu);
> -	if (err)
> -		return err;
> +	/* Map MSI address of all CPUs */
> +	for_each_cpu(cpu, &imsic->lmask) {
> +		err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
> +		if (err)
> +			return err;
>   
> -	err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
> +		err = iommu_dma_prepare_msi(info->desc, msi_addr);
> +		if (err)
> +			return err;
> +	}
> +
> +	err = imsic_get_cpu(&imsic->lmask, false, &cpu);
>   	if (err)
>   		return err;
>   
> @@ -505,10 +516,6 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
>   	if (hwirq < 0)
>   		return hwirq;
>   
> -	err = iommu_dma_prepare_msi(info->desc, msi_addr);
> -	if (err)
> -		goto fail;
> -
>   	for (i = 0; i < nr_irqs; i++) {
>   		imsic_id_set_target(hwirq + i, cpu);
>   		irq_domain_set_info(domain, virq + i, hwirq + i,
> @@ -528,10 +535,6 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
>   	}
>   
>   	return 0;
> -
> -fail:
> -	imsic_ids_free(hwirq, get_count_order(nr_irqs));
> -	return err;
>   }
>   
>   static void imsic_irq_domain_free(struct irq_domain *domain,
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index e8c9a7da1060..41e8613832ab 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1117,6 +1117,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit);
>   int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
>   
>   int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
> +int iommu_dma_select_msi(struct msi_desc *desc, phys_addr_t msi_addr);
>   void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg);
>   
>   #else /* CONFIG_IOMMU_DMA */
> @@ -1138,6 +1139,11 @@ static inline int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_a
>   	return 0;
>   }
>   
> +static inline int iommu_dma_select_msi(struct msi_desc *desc, phys_addr_t msi_addr)
> +{
> +	return 0;
> +}
> +
>   static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
>   {
>   }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
