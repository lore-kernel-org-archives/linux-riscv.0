Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CFFC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+1/Ma0csO6Nsqe3n5A5WnDHGX9NKDwsZuBI5R6g8cE=; b=doj0I8PL5EWaoV
	jX6NXYFTa3nBRsYNkw+OduGqvDgLQ5h+icX+QHC0lgVaSMPOfprrfqjUF3UbBSw9RJSmMpF2Ch+QI
	Vi0So5nxg7h2cJqlEmGQKupn2L62bL4qCKsEjvS/b+FmfxjHE+Dh8qmr0Gg+25VOgTQ8ArMrYvnwg
	LNn1X5UaTGmGA/8S/OL9Tym9dfSuslqiOpkAfkMw/oWhrxyz+ZV0M4OdBv/FI5bZl4WBx3GbuARq9
	b58Om0lbkAW0WoB15MITuVYp03v/sopSjHsxd9vGcvnLii8TblU3ZUujRXwH4cutFvENBnZUlKZ8/
	3NoRa5MxhEuu3/qqBAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl6K-00000004PVk-2xB6;
	Wed, 05 Feb 2025 19:30:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfl4w-00000004PPo-1VpB;
	Wed, 05 Feb 2025 19:28:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6FFB1063;
	Wed,  5 Feb 2025 11:29:16 -0800 (PST)
Received: from [10.57.35.21] (unknown [10.57.35.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6D0C3F5A1;
	Wed,  5 Feb 2025 11:28:38 -0800 (PST)
Message-ID: <be153973-550c-4ea8-bf65-35b5ce28ac22@arm.com>
Date: Wed, 5 Feb 2025 19:28:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] iommu/tegra: Do not use struct page as the handle
 for pts
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <2-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <2-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_112854_499914_970E3A11 
X-CRM114-Status: GOOD (  27.05  )
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

On 2025-02-04 6:34 pm, Jason Gunthorpe wrote:
> Instead use the virtual address and dma_map_single() like as->pd
> uses. Introduce a small struct tegra_pt instead of void * to have some
> clarity what is using this API and add compile safety during the
> conversion.

Hmm, I'm not sure it's all that clear to have a major discrepancy 
between how different levels of pagetable are referenced - I'd say 
either use an explicit type for both, or just rework this as a u32** 
along the same lines as the current patch #1.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/tegra-smmu.c | 68 ++++++++++++++++++++------------------
>   1 file changed, 36 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 717bcd3b8de7dc..1e85141c80548d 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -51,13 +51,15 @@ struct tegra_smmu {
>   	struct iommu_device iommu;	/* IOMMU Core code handle */
>   };
>   
> +struct tegra_pt;
> +
>   struct tegra_smmu_as {
>   	struct iommu_domain domain;
>   	struct tegra_smmu *smmu;
>   	unsigned int use_count;
>   	spinlock_t lock;
>   	u32 *count;
> -	struct page **pts;
> +	struct tegra_pt **pts;
>   	u32 *pd;
>   	dma_addr_t pd_dma;
>   	unsigned id;
> @@ -155,6 +157,10 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
>   #define SMMU_PDE_ATTR		(SMMU_PDE_READABLE | SMMU_PDE_WRITABLE | \
>   				 SMMU_PDE_NONSECURE)
>   
> +struct tegra_pt {
> +	u32 val[SMMU_NUM_PTE];
> +};
> +
>   static unsigned int iova_pd_index(unsigned long iova)
>   {
>   	return (iova >> SMMU_PDE_SHIFT) & (SMMU_NUM_PDE - 1);
> @@ -564,11 +570,9 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
>   	smmu_flush(smmu);
>   }
>   
> -static u32 *tegra_smmu_pte_offset(struct page *pt_page, unsigned long iova)
> +static u32 *tegra_smmu_pte_offset(struct tegra_pt *pt, unsigned long iova)
>   {
> -	u32 *pt = page_address(pt_page);
> -
> -	return pt + iova_pt_index(iova);
> +	return &pt->val[iova_pt_index(iova)];
>   }
>   
>   static u32 *tegra_smmu_pte_lookup(struct tegra_smmu_as *as, unsigned long iova,
> @@ -576,19 +580,19 @@ static u32 *tegra_smmu_pte_lookup(struct tegra_smmu_as *as, unsigned long iova,
>   {
>   	unsigned int pd_index = iova_pd_index(iova);
>   	struct tegra_smmu *smmu = as->smmu;
> -	struct page *pt_page;
> +	struct tegra_pt *pt;
>   
> -	pt_page = as->pts[pd_index];
> -	if (!pt_page)
> +	pt = as->pts[pd_index];
> +	if (!pt)
>   		return NULL;
>   
>   	*dmap = smmu_pde_to_dma(smmu, as->pd[pd_index]);
>   
> -	return tegra_smmu_pte_offset(pt_page, iova);
> +	return tegra_smmu_pte_offset(pt, iova);
>   }
>   
>   static u32 *as_get_pte(struct tegra_smmu_as *as, dma_addr_t iova,
> -		       dma_addr_t *dmap, struct page *page)
> +		       dma_addr_t *dmap, struct tegra_pt *pt)
>   {
>   	unsigned int pde = iova_pd_index(iova);
>   	struct tegra_smmu *smmu = as->smmu;
> @@ -596,21 +600,21 @@ static u32 *as_get_pte(struct tegra_smmu_as *as, dma_addr_t iova,
>   	if (!as->pts[pde]) {
>   		dma_addr_t dma;
>   
> -		dma = dma_map_page(smmu->dev, page, 0, SMMU_SIZE_PT,
> -				   DMA_TO_DEVICE);
> +		dma = dma_map_single(smmu->dev, pt, SMMU_SIZE_PD,

SMMU_SIZE_PT (yeah they're numerically the same, but still...)

> +				     DMA_TO_DEVICE);
>   		if (dma_mapping_error(smmu->dev, dma)) {
> -			__iommu_free_pages(page, 0);
> +			iommu_free_page(pt);
>   			return NULL;
>   		}
>   
>   		if (!smmu_dma_addr_valid(smmu, dma)) {
>   			dma_unmap_page(smmu->dev, dma, SMMU_SIZE_PT,
>   				       DMA_TO_DEVICE);

All the unmaps should be converted to _single as well (and in patch #1) 
- the APIs are not officially interchangeable.

Thanks,
Robin.

> -			__iommu_free_pages(page, 0);
> +			iommu_free_page(pt);
>   			return NULL;
>   		}
>   
> -		as->pts[pde] = page;
> +		as->pts[pde] = pt;
>   
>   		tegra_smmu_set_pde(as, iova, SMMU_MK_PDE(dma, SMMU_PDE_ATTR |
>   							      SMMU_PDE_NEXT));
> @@ -633,7 +637,7 @@ static void tegra_smmu_pte_get_use(struct tegra_smmu_as *as, unsigned long iova)
>   static void tegra_smmu_pte_put_use(struct tegra_smmu_as *as, unsigned long iova)
>   {
>   	unsigned int pde = iova_pd_index(iova);
> -	struct page *page = as->pts[pde];
> +	struct tegra_pt *pt = as->pts[pde];
>   
>   	/*
>   	 * When no entries in this page table are used anymore, return the
> @@ -646,7 +650,7 @@ static void tegra_smmu_pte_put_use(struct tegra_smmu_as *as, unsigned long iova)
>   		tegra_smmu_set_pde(as, iova, 0);
>   
>   		dma_unmap_page(smmu->dev, pte_dma, SMMU_SIZE_PT, DMA_TO_DEVICE);
> -		__iommu_free_pages(page, 0);
> +		iommu_free_page(pt);
>   		as->pts[pde] = NULL;
>   	}
>   }
> @@ -666,16 +670,16 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *as, unsigned long iova,
>   	smmu_flush(smmu);
>   }
>   
> -static struct page *as_get_pde_page(struct tegra_smmu_as *as,
> -				    unsigned long iova, gfp_t gfp,
> -				    unsigned long *flags)
> +static struct tegra_pt *as_get_pde_page(struct tegra_smmu_as *as,
> +					unsigned long iova, gfp_t gfp,
> +					unsigned long *flags)
>   {
>   	unsigned int pde = iova_pd_index(iova);
> -	struct page *page = as->pts[pde];
> +	struct tegra_pt *pt = as->pts[pde];
>   
>   	/* at first check whether allocation needs to be done at all */
> -	if (page)
> -		return page;
> +	if (pt)
> +		return pt;
>   
>   	/*
>   	 * In order to prevent exhaustion of the atomic memory pool, we
> @@ -685,7 +689,7 @@ static struct page *as_get_pde_page(struct tegra_smmu_as *as,
>   	if (gfpflags_allow_blocking(gfp))
>   		spin_unlock_irqrestore(&as->lock, *flags);
>   
> -	page = __iommu_alloc_pages(gfp | __GFP_DMA, 0);
> +	pt = iommu_alloc_page(gfp | __GFP_DMA);
>   
>   	if (gfpflags_allow_blocking(gfp))
>   		spin_lock_irqsave(&as->lock, *flags);
> @@ -696,13 +700,13 @@ static struct page *as_get_pde_page(struct tegra_smmu_as *as,
>   	 * if allocation succeeded and the allocation failure isn't fatal.
>   	 */
>   	if (as->pts[pde]) {
> -		if (page)
> -			__iommu_free_pages(page, 0);
> +		if (pt)
> +			iommu_free_page(pt);
>   
> -		page = as->pts[pde];
> +		pt = as->pts[pde];
>   	}
>   
> -	return page;
> +	return pt;
>   }
>   
>   static int
> @@ -712,15 +716,15 @@ __tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
>   {
>   	struct tegra_smmu_as *as = to_smmu_as(domain);
>   	dma_addr_t pte_dma;
> -	struct page *page;
> +	struct tegra_pt *pt;
>   	u32 pte_attrs;
>   	u32 *pte;
>   
> -	page = as_get_pde_page(as, iova, gfp, flags);
> -	if (!page)
> +	pt = as_get_pde_page(as, iova, gfp, flags);
> +	if (!pt)
>   		return -ENOMEM;
>   
> -	pte = as_get_pte(as, iova, &pte_dma, page);
> +	pte = as_get_pte(as, iova, &pte_dma, pt);
>   	if (!pte)
>   		return -ENOMEM;
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
