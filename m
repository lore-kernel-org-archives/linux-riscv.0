Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFEEC369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/MxPxWhcX1U8WdbrykrLA17gcwIZ4jxxb5gA/Gwg0w=; b=oM1Iw0Sxx46ODm
	cBnQeGPGeL8GyBQ0iyhjyRjgdfsnaVVvKl4qP1lkaTnT9/Zeni/uNn45ZJYGJ54/FLCIYOWSp1qSb
	6uOVCHWP/AozBc0w/1MO4BHiEaN0nrxbarL8lSGYkNaVd/4eDgvoSWffMJOzq0uGbQ3m3EnqCR3Nk
	J4Nb9lZf1xiPL6RlQSdHSVsR393posVoRhOxh3ISD1NuqZuWt95Cm+Iaz0hYjZgPK74noyyfxwrOU
	SDU3rJctKYn15EY2Cjn2I8Tv6pjayJNWoT+yjUqdOr56py+RRW71cN/WVICjzEccHSIVHv2LK2+cU
	ECZ3fU/jGWe4mNTWkeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ev5-00000008fB5-42MX;
	Tue, 29 Apr 2025 06:58:19 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ero-00000008e9m-1WAE
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 06:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745909697; x=1777445697;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PpZtbA9kdwBRA3jbs9L3Dv6eNjFnhgwGX0jsrHH7Kxo=;
  b=QaOJc6KYctkhbpWwi21l52OsEiLFQQN3+dHolAm76KLY5RfRhr/wNMk7
   wlDFrm0amyz9cJZ21mBJGrEkTawGajsqA6yD9m3EbxzofbX89xLNgAh0z
   oQTyMLNUYgMtt0Id5Edz5IsXnNcSk4DnIJ7RmT1zZzsf1GHQ789wA863s
   rV/dnVMaAs8FVCPcTHiTmn8Q3K3SJ9oI1kqiCBGmiuFrgXs/pMjGXUl4s
   oI1pcJGj4F93kzXEBFEoQjlQW9BbhzQjY+GMIAlU0PZTrJSP4swKIMcMI
   X2ry0XIOYIjpwsruAd6n6AOmdXsNzPPnamjRBX70ALEJpkcBOlkS6DP50
   g==;
X-CSE-ConnectionGUID: rLdM4aKeQvaQPYGktwQ9bw==
X-CSE-MsgGUID: nOscqnZlQ9mWm5FvDgNYtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="70023582"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="70023582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:54:55 -0700
X-CSE-ConnectionGUID: 9eL1swR/S7aR3gcphn1kQg==
X-CSE-MsgGUID: 8dVE5jmeSmOYAhK9/+H+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134695028"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:54:51 -0700
Message-ID: <446b94d5-3192-448e-9f29-de1e04bbd517@linux.intel.com>
Date: Tue, 29 Apr 2025 14:50:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/riscv: fix use after free of riscv_iommu_domain
To: BillXiang <xiangwencheng@lanxincomputing.com>, tjeznach@rivosinc.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250429034007.578-1-xiangwencheng@lanxincomputing.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250429034007.578-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_235456_445690_ACED1A71 
X-CRM114-Status: GOOD (  12.70  )
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

On 4/29/25 11:40, BillXiang wrote:
> The function vfio_group_detach_container begins by calling
> vfio_iommu_type1_detach_group, which may subsequently calls

I don't follow here. vfio_iommu_type1_detach_group() will eventually
call riscv_iommu_attach_blocking_domain() and info->domain has been
cleared there:

static int riscv_iommu_attach_blocking_domain(struct iommu_domain 
*iommu_domain,
                                               struct device *dev)
{
         struct riscv_iommu_device *iommu = dev_to_iommu(dev);
         struct riscv_iommu_info *info = dev_iommu_priv_get(dev);

         /* Make device context invalid, translation requests will fault 
w/ #258 */
         riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
         riscv_iommu_bond_unlink(info->domain, dev);
         info->domain = NULL;

         return 0;
}

Perhaps I overlooked anything?

> riscv_iommu_free_paging_domain to release the riscv_iommu_domain.
> Then, iommu_group_release_dma_owner is triggered, which results in
> the execution of riscv_iommu_attach_paging_domain and
> riscv_iommu_bond_unlink(info->domain). However, the info->domain
> had been freed beforehand but was not set to NULL, leading to errors.
> 
> This commit resolves the issue by setting info->domain to NULL within
> riscv_iommu_bond_unlink, a function that is called by
> riscv_iommu_attach_blocking_domain before the domain was freed.
> 
> Signed-off-by: BillXiang<xiangwencheng@lanxincomputing.com>
> ---
>   drivers/iommu/riscv/iommu.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)

Thanks,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
