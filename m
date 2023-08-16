Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB1C25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHeTG6/hcuierdCfS7a1sRV3/ibfHHcnwBVVO59iaMI=; b=cqH/SRyk3PnRNS9gx+vyyd+5og
	vz8bPYnDUY4FR60lwjNd1+n/eXlolmD8b4b4GuFkVSfshNGkp2XheDRyyvxj2/KEl/dKhneXo+q11
	fJw4PlzAfaAgthm6Ee4TS/0GboupySVrUIYaoaZrv0FamUySka9n5n9XrOPFMzc7Y5y6Jk2atexGU
	5zl0gip3A6aYs3nUPD/xUxWEzTejSDJz/FmiupywQZyfKb+B4mwspRGI9x6eLhTh6Y5co3CCKN25y
	COavw+9s55d2aBBxpSRqKVMl7ergCJN3vG6uOjyIpBFmEMBHrCnmbGBmI7UUK/0ad6BzbLCy++KB4
	0HjBWkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNpz-00516v-14;
	Wed, 16 Aug 2023 21:13:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNpv-00516J-2l
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 21:13:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D706BD75;
	Wed, 16 Aug 2023 14:14:30 -0700 (PDT)
Received: from [10.57.90.114] (unknown [10.57.90.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 817793F762;
	Wed, 16 Aug 2023 14:13:47 -0700 (PDT)
Message-ID: <a0061d0c-2a74-9f32-e6ab-d3d9d06d9fd4@arm.com>
Date: Wed, 16 Aug 2023 22:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 11/11] RISC-V: drivers/iommu/riscv: Add G-Stage
 translation support
Content-Language: en-GB
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <0c391072fe0be52b3bdf3d826e4313d960aecba0.1689792825.git.tjeznach@rivosinc.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <0c391072fe0be52b3bdf3d826e4313d960aecba0.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_141352_015734_0705971D 
X-CRM114-Status: GOOD (  23.38  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-07-19 20:33, Tomasz Jeznach wrote:
> This change introduces 2nd stage translation configuration
> support, enabling nested translation for IOMMU hardware.
> Pending integration with VMM IOMMUFD interfaces to manage
> 1st stage translation and IOMMU virtialization interfaces.
> 
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>   drivers/iommu/riscv/iommu.c | 58 ++++++++++++++++++++++++++++---------
>   drivers/iommu/riscv/iommu.h |  3 +-
>   2 files changed, 46 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 7b3e3e135cf6..3ca2f0194d3c 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1418,6 +1418,19 @@ static struct iommu_domain *riscv_iommu_domain_alloc(unsigned type)
>   	return &domain->domain;
>   }
>   
> +/* mark domain as second-stage translation */
> +static int riscv_iommu_enable_nesting(struct iommu_domain *iommu_domain)

Please don't add more instances of enable_nesting. It's a dead end that 
has never actually been used and should be removed fairly soon. The new 
nesting infrastructure is all still in flight, but the current patchsets 
should give a good idea of what you'd want to work towards:

https://lore.kernel.org/linux-iommu/20230724110406.107212-1-yi.l.liu@intel.com/
https://lore.kernel.org/linux-iommu/20230724111335.107427-1-yi.l.liu@intel.com/
https://lore.kernel.org/linux-iommu/cover.1683688960.git.nicolinc@nvidia.com/

Thanks,
Robin.

> +{
> +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> +
> +	mutex_lock(&domain->lock);
> +	if (list_empty(&domain->endpoints))
> +		domain->g_stage = true;
> +	mutex_unlock(&domain->lock);
> +
> +	return domain->g_stage ? 0 : -EBUSY;
> +}
> +
>   static void riscv_iommu_domain_free(struct iommu_domain *iommu_domain)
>   {
>   	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> @@ -1433,7 +1446,7 @@ static void riscv_iommu_domain_free(struct iommu_domain *iommu_domain)
>   		free_io_pgtable_ops(&domain->pgtbl.ops);
>   
>   	if (domain->pgd_root)
> -		free_pages((unsigned long)domain->pgd_root, 0);
> +		free_pages((unsigned long)domain->pgd_root, domain->g_stage ? 2 : 0);
>   
>   	if ((int)domain->pscid > 0)
>   		ida_free(&riscv_iommu_pscids, domain->pscid);
> @@ -1483,7 +1496,8 @@ static int riscv_iommu_domain_finalize(struct riscv_iommu_domain *domain,
>   
>   	/* TODO: Fix this for RV32 */
>   	domain->mode = satp_mode >> 60;
> -	domain->pgd_root = (pgd_t *) __get_free_pages(GFP_KERNEL | __GFP_ZERO, 0);
> +	domain->pgd_root = (pgd_t *) __get_free_pages(GFP_KERNEL | __GFP_ZERO,
> +						      domain->g_stage ? 2 : 0);
>   
>   	if (!domain->pgd_root)
>   		return -ENOMEM;
> @@ -1499,6 +1513,8 @@ static u64 riscv_iommu_domain_atp(struct riscv_iommu_domain *domain)
>   	u64 atp = FIELD_PREP(RISCV_IOMMU_DC_FSC_MODE, domain->mode);
>   	if (domain->mode != RISCV_IOMMU_DC_FSC_MODE_BARE)
>   		atp |= FIELD_PREP(RISCV_IOMMU_DC_FSC_PPN, virt_to_pfn(domain->pgd_root));
> +	if (domain->g_stage)
> +		atp |= FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->pscid);
>   	return atp;
>   }
>   
> @@ -1541,20 +1557,30 @@ static int riscv_iommu_attach_dev(struct iommu_domain *iommu_domain, struct devi
>   	if (!dc)
>   		return -ENODEV;
>   
> -	/*
> -	 * S-Stage translation table. G-Stage remains unmodified (BARE).
> -	 */
> -	val = FIELD_PREP(RISCV_IOMMU_DC_TA_PSCID, domain->pscid);
> -
> -	if (ep->pasid_enabled) {
> -		ep->pc[0].ta = cpu_to_le64(val | RISCV_IOMMU_PC_TA_V);
> -		ep->pc[0].fsc = cpu_to_le64(riscv_iommu_domain_atp(domain));
> +	if (domain->g_stage) {
> +		/*
> +		 * Enable G-Stage translation with initial pass-through mode
> +		 * for S-Stage. VMM is responsible for more restrictive
> +		 * guest VA translation scheme configuration.
> +		 */
>   		dc->ta = 0;
> -		dc->fsc = cpu_to_le64(virt_to_pfn(ep->pc) |
> -		    FIELD_PREP(RISCV_IOMMU_DC_FSC_MODE, RISCV_IOMMU_DC_FSC_PDTP_MODE_PD8));
> +		dc->fsc = 0ULL; /* RISCV_IOMMU_DC_FSC_MODE_BARE */ ;
> +		dc->iohgatp = cpu_to_le64(riscv_iommu_domain_atp(domain));
>   	} else {
> -		dc->ta = cpu_to_le64(val);
> -		dc->fsc = cpu_to_le64(riscv_iommu_domain_atp(domain));
> +		/* S-Stage translation table. G-Stage remains unmodified. */
> +		if (ep->pasid_enabled) {
> +			val = FIELD_PREP(RISCV_IOMMU_DC_TA_PSCID, domain->pscid);
> +			ep->pc[0].ta = cpu_to_le64(val | RISCV_IOMMU_PC_TA_V);
> +			ep->pc[0].fsc = cpu_to_le64(riscv_iommu_domain_atp(domain));
> +			dc->ta = 0;
> +			val = FIELD_PREP(RISCV_IOMMU_DC_FSC_MODE,
> +					  RISCV_IOMMU_DC_FSC_PDTP_MODE_PD8);
> +			dc->fsc = cpu_to_le64(val | virt_to_pfn(ep->pc));
> +		} else {
> +			val = FIELD_PREP(RISCV_IOMMU_DC_TA_PSCID, domain->pscid);
> +			dc->ta = cpu_to_le64(val);
> +			dc->fsc = cpu_to_le64(riscv_iommu_domain_atp(domain));
> +		}
>   	}
>   
>   	wmb();
> @@ -1599,6 +1625,9 @@ static int riscv_iommu_set_dev_pasid(struct iommu_domain *iommu_domain,
>   	if (!iommu_domain || !iommu_domain->mm)
>   		return -EINVAL;
>   
> +	if (domain->g_stage)
> +		return -EINVAL;
> +
>   	/* Driver uses TC.DPE mode, PASID #0 is incorrect. */
>   	if (pasid == 0)
>   		return -EINVAL;
> @@ -1969,6 +1998,7 @@ static const struct iommu_domain_ops riscv_iommu_domain_ops = {
>   	.iotlb_sync = riscv_iommu_iotlb_sync,
>   	.iotlb_sync_map = riscv_iommu_iotlb_sync_map,
>   	.flush_iotlb_all = riscv_iommu_flush_iotlb_all,
> +	.enable_nesting = riscv_iommu_enable_nesting,
>   };
>   
>   static const struct iommu_ops riscv_iommu_ops = {
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 55418a1144fb..55e5aafea5bc 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -102,8 +102,9 @@ struct riscv_iommu_domain {
>   	struct riscv_iommu_device *iommu;
>   
>   	unsigned mode;		/* RIO_ATP_MODE_* enum */
> -	unsigned pscid;		/* RISC-V IOMMU PSCID */
> +	unsigned pscid;		/* RISC-V IOMMU PSCID / GSCID */
>   	ioasid_t pasid;		/* IOMMU_DOMAIN_SVA: Cached PASID */
> +	bool g_stage;		/* 2nd stage translation domain */
>   
>   	pgd_t *pgd_root;	/* page table root pointer */
>   };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
