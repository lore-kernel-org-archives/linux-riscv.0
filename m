Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B6FCA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01e2Navhs+i+UniWbhlaFstAGKb5ufXa5kDLvIdqwI4=; b=YktBYNPhK70jUR
	YF8kblJLbNcvlF6Cd+Xe/mbphxdbrjfLJQsxMD0/nagTRxO1LXtzPrnEMpfiEp4e/bDuIOdLyxC+W
	HktBLZVaehXh9bHKwZ7L960uIIersmREn21HdlhRjmgkAWB+b+SZpPofJUwKYQKn6B17z3D8XdxGp
	bgdbVWIDsk1zO72pl6USBUGEbuCrKwVcc94yft3tVy+4WcwnBokqpqAICZPVnZXu6e2U6alAB+5fB
	EvWy2hPajICiZRy/PFwka+06++vpknVOV1BlPQbkpP9FoUH8eZZnnaMNOZZAYs6YTjtPJvTy5mSUM
	KLPOAyZbTarjn1NTC9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg0l-0000000C1R7-1zFI;
	Fri, 02 Oct 2026 16:21:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg0i-0000000C1QI-3OjR
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:21:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B252F;
	Fri,  2 Oct 2026 09:21:18 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEB003F86F;
	Fri,  2 Oct 2026 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790958081; bh=EYCHNwLbd3FNIDPR3reQ4ONA0wMTkDrOokTErY8y4V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=olcmUA92VImZqoHucFH9jJErBKuWGpxulrDFs6b9vsSgvv2YZSgnblb2DLCm95NSa
	 +To8qzdoedK9DlFM+0OU9zmP7vUhZnvaMG6n+ELx31fY7f4rcQ3L4pUn6FiKvJx83y
	 /4YNsAqYITtBT+t6KRM4vH96VpJaff87v4JKMymE=
Message-ID: <18c9b030-8dc6-4242-8e66-0448ee125d7d@arm.com>
Date: Fri, 2 Oct 2026 17:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/16] iommu/dma: Prepare MSI physical address lists
To: Andrew Jones <andrew.jones@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
 tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
 will@kernel.org, pjw@kernel.org, palmer@dabbelt.com, anup@brainfault.org,
 tglx@kernel.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-2-andrew.jones@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260925151659.419512-2-andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_092125_180392_720F7617 
X-CRM114-Status: GOOD (  41.16  )
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

On 25/09/2026 4:16 pm, Andrew Jones wrote:
> Software MSI mappings may cover an ordered list of physical addresses
> which must be mapped into one contiguous IOVA range. Extend the internal
> DMA-IOMMU mapping helpers to accept an address array, address count, and
> required mapping granule.
> 
> Teach iommu_dma_get_msi_page() to map the list into one contiguous IOVA
> allocation. Keep the existing per-page cache entries and mark the first
> entry with the size of the allocation so an identical list can reuse the
> mapping without changing the existing cache representation.
> 
> This prepares for the forthcoming iommu_dma_prepare_msi_list() API.

Sorry, but this looks pretty bonkers, even before we get to patch #8. 
You already end up adding what is effectively a RISC-V-specific 
entrypoint, so you may as well just carry that all the way through to 
its own effectively RISC-V-specific implementation, without making an 
unmaintainable mess of the existing code.

The current design for both DMA_IOVA and DMA_MSI cookies is based on the 
(Arm-centric) notion that different devices may be associated with 
different MSI controllers that are independent of each other, so we only 
map what we know we need (and have a way to get the address of at all), 
and the list lookup is to save redundant mappings and IOVA space when 
devices do happen to share. Your requirement is almost the complete 
opposite, where *any* device needs *every* possible MSI controller 
mapped up-front, plus the MSI controller driver has to be in on this 
notion too, so it really doesn't fit the same logic well at all. In fact 
IIUC it should be far simpler - you shouldn't need a list, nor even 
really care about the addresses, it should merely be a case of whether 
a) this is the first call for the given cookie so everything needs 
mapping, or b) it's not the first call, so everything must already be 
mapped and we can just return the IOVA. If trying to cram these opposing 
notions down the same path results in a bunch of weird complexity for 
pretending to support distinct and overlapping values of "everything", 
which neither case needs, that seems like a pretty clear sign of it 
being a bad idea IMO.

Note that since the core cookie rework, untangling the DMA_MSI 
implementation from DMA_IOVA has been on the table, at which point 
adding more top-level types of MSI-only cookies would clearly be 
straightforward. However for DMA_IOVA that could end up getting a bit 
combinatorial, and keeping an internal sub-type (like for flush queues) 
would probably be simpler, so it may well make sense to take the latter 
approach for both, at least to start with. But getting rid of those odd 
special cases in iommu_dma_{alloc,free}_iova() and the clunkiness of 
cookie_msi_{granule,pages}() would still be nice either way...

At very worst, a separate hook to just pre-populate msi_page_list with a 
regular page for each IMSIC address, such that the existing reuse 
mechanism keeps working as-is, could probably suffice without any other 
major structural changes; it's only really the IOVA allocation and the 
fact that it all has to be done under a single lock acquisition that's 
special.

Thanks,
Robin.

> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>   drivers/iommu/dma-iommu.c | 116 +++++++++++++++++++++++++++++---------
>   1 file changed, 88 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 58c624513cd4..0b4eb47d1a95 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -42,6 +42,7 @@ struct iommu_dma_msi_page {
>   	struct list_head	list;
>   	dma_addr_t		iova;
>   	phys_addr_t		phys;
> +	size_t			range_size; /* IOVA range size, or 0 if not the first map */
>   };
>   
>   enum iommu_dma_queue_type {
> @@ -481,7 +482,7 @@ static int cookie_init_hw_msi_region(struct iommu_dma_cookie *cookie,
>   	num_pages = iova_align(iovad, end - start) >> iova_shift(iovad);
>   
>   	for (i = 0; i < num_pages; i++) {
> -		msi_page = kmalloc_obj(*msi_page);
> +		msi_page = kzalloc_obj(*msi_page);
>   		if (!msi_page)
>   			return -ENOMEM;
>   
> @@ -2191,15 +2192,42 @@ static struct list_head *cookie_msi_pages(const struct iommu_domain *domain)
>   	}
>   }
>   
> +static bool iommu_dma_msi_range_matches(struct list_head *msi_page_list,
> +					const struct iommu_dma_msi_page *base_page,
> +					const phys_addr_t *phys_addrs,
> +					unsigned int nr_addrs, size_t granule)
> +{
> +	const struct iommu_dma_msi_page *msi_page;
> +	unsigned int nr_found = 0;
> +	dma_addr_t offset;
> +
> +	list_for_each_entry(msi_page, msi_page_list, list) {
> +		if (msi_page->iova < base_page->iova)
> +			continue;
> +		offset = msi_page->iova - base_page->iova;
> +		if (offset >= base_page->range_size)
> +			continue;
> +		if (!IS_ALIGNED((size_t)offset, granule) ||
> +		    msi_page->phys != phys_addrs[(size_t)offset / granule])
> +			return false;
> +		nr_found++;
> +	}
> +
> +	return nr_found == nr_addrs;
> +}
> +
>   static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
> -		phys_addr_t msi_addr, struct iommu_domain *domain)
> +		const phys_addr_t *phys_addrs, unsigned int nr_addrs, size_t granule,
> +		struct iommu_domain *domain)
>   {
>   	struct list_head *msi_page_list = cookie_msi_pages(domain);
> -	struct iommu_dma_msi_page *msi_page;
> -	dma_addr_t iova;
> +	struct iommu_dma_msi_page *msi_page, *first_page = NULL;
>   	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
> -	size_t size = cookie_msi_granule(domain);
>   	static DEFINE_MUTEX(msi_prepare_lock);
> +	LIST_HEAD(new_msi_pages);
> +	dma_addr_t base_iova;
> +	unsigned int i;
> +	size_t size;
>   
>   	/*
>   	 * Normally a device's default domain is only ever attached to that
> @@ -2213,32 +2241,60 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
>   	 */
>   	guard(mutex)(&msi_prepare_lock);
>   
> -	msi_addr &= ~(phys_addr_t)(size - 1);
> -	list_for_each_entry(msi_page, msi_page_list, list)
> -		if (msi_page->phys == msi_addr)
> +	if (!nr_addrs || nr_addrs > SIZE_MAX / granule)
> +		return NULL;
> +	size = nr_addrs * granule;
> +
> +	list_for_each_entry(msi_page, msi_page_list, list) {
> +		if (msi_page->phys != phys_addrs[0])
> +			continue;
> +		if (nr_addrs == 1)
> +			return msi_page;
> +		if (msi_page->range_size == size &&
> +		    iommu_dma_msi_range_matches(msi_page_list, msi_page, phys_addrs,
> +						nr_addrs, granule))
>   			return msi_page;
> +	}
>   
> -	msi_page = kzalloc_obj(*msi_page);
> -	if (!msi_page)
> -		return NULL;
> +	for (i = 0; i < nr_addrs; i++) {
> +		msi_page = kzalloc_obj(*msi_page);
> +		if (!msi_page)
> +			goto out_free_pages;
> +		list_add_tail(&msi_page->list, &new_msi_pages);
> +	}
>   
> -	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
> -	if (!iova)
> -		goto out_free_page;
> +	base_iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
> +	if (!base_iova)
> +		goto out_free_pages;
>   
> -	if (iommu_map(domain, iova, msi_addr, size, prot, GFP_KERNEL))
> -		goto out_free_iova;
> +	i = 0;
> +	list_for_each_entry(msi_page, &new_msi_pages, list) {
> +		msi_page->phys = phys_addrs[i];
> +		msi_page->iova = base_iova + i * granule;
> +		if (!i)
> +			first_page = msi_page;
> +		if (iommu_map(domain, msi_page->iova, msi_page->phys, granule, prot, GFP_KERNEL))
> +			goto out_unmap;
> +		i++;
> +	}
>   
> -	INIT_LIST_HEAD(&msi_page->list);
> -	msi_page->phys = msi_addr;
> -	msi_page->iova = iova;
> -	list_add(&msi_page->list, msi_page_list);
> -	return msi_page;
> +	first_page->range_size = size;
> +	list_splice(&new_msi_pages, msi_page_list);
> +	return first_page;
>   
> -out_free_iova:
> -	iommu_dma_free_iova(domain, iova, size, NULL);
> -out_free_page:
> -	kfree(msi_page);
> +out_unmap:
> +	if (i) {
> +		size_t unmap = iommu_unmap(domain, base_iova, i * granule);
> +
> +		WARN_ON_ONCE(unmap != i * granule);
> +	}
> +	iommu_dma_free_iova(domain, base_iova, size, NULL);
> +out_free_pages:
> +	while (!list_empty(&new_msi_pages)) {
> +		msi_page = list_first_entry(&new_msi_pages, typeof(*msi_page), list);
> +		list_del(&msi_page->list);
> +		kfree(msi_page);
> +	}
>   	return NULL;
>   }
>   
> @@ -2247,19 +2303,23 @@ int iommu_dma_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
>   {
>   	struct device *dev = msi_desc_to_dev(desc);
>   	const struct iommu_dma_msi_page *msi_page;
> +	phys_addr_t phys_addr;
> +	size_t granule;
>   
>   	if (!has_msi_cookie(domain)) {
>   		msi_desc_set_iommu_msi_iova(desc, 0, 0);
>   		return 0;
>   	}
>   
> +	granule = cookie_msi_granule(domain);
> +	phys_addr = ALIGN_DOWN(msi_addr, granule);
> +
>   	iommu_group_mutex_assert(dev);
> -	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
> +	msi_page = iommu_dma_get_msi_page(dev, &phys_addr, 1, granule, domain);
>   	if (!msi_page)
>   		return -ENOMEM;
>   
> -	msi_desc_set_iommu_msi_iova(desc, msi_page->iova,
> -				    ilog2(cookie_msi_granule(domain)));
> +	msi_desc_set_iommu_msi_iova(desc, msi_page->iova, ilog2(granule));
>   	return 0;
>   }
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
