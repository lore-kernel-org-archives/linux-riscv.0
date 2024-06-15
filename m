Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB338C27C6E
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 03:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5tOL+GarzeWYgC+KBkHvI+4JW/9RIcWDMMMEe9EZZo=; b=gXva1wDkhIkwPI
	SicsWzuQMXHUEQaKDUQ7Zae/Mo//H+FyNFAMMVFgDbLZ3oEVSz7FMmT7c23YxNcScIMSOtZ51ogIP
	HDnP3hS8f4K3NVIM+1k0E2FSSWIbsefIv8QoFIUNA77Qk0SFLtLQV4Hjf9KgnXqstFohxkc6FYiV0
	CPH734G6/vEUFlRkblDMY3WWwqUIOEJzOUXfULx4S4qXphCZ5oFYFWvwdbd1V+yNHX/y6/xLrRSFQ
	tfuGCzPhEeYjm/3LCwWcJOjOEZBvN2giCVipFg9l/n7hUPD7raPF+cnjpTP5rAHhub0PQE++AZ8aw
	RLPn+vxOob3s/kMjBwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIJum-00000004Z9x-3NLf;
	Sat, 15 Jun 2024 03:17:16 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIJuk-00000004Z9L-0Lih
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 03:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718421434; x=1749957434;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1Flck8NrpQ7n+FaQzcFFuAz7EFwUT5kfNeULG+ypZ3Q=;
  b=fxR/LjIE47AeYYHjMgze6+ZNuTYov9uMP4FxOlxyeCAAK6jwgn5qFJCt
   sUvtdiXNgY7BvXFMAmcJ9lUk9InWMHg4zc2pDMgtCsb1mhmf432IOQuuv
   /86tNo1iiv4PrdKid4OMUj7mjOpphkqEBQCKvu+1Oclj2dlG+VFyT3EWW
   N2BuWVn2on9eIBHNRDHOyFHh5r71Sl1PgjFlE21qLN9ZTVSPqu/MeXP6X
   SCCLrfXDW7l+aJVLXdpU7B23orZhxlZNK0rqcIEh8Ld5dw7XVxHZglbZA
   pDYLgUh3V0tUqO1/ps0C3pTF79JkZXDXb72h6nxFIs6mLQdM4Fpt0PRg2
   A==;
X-CSE-ConnectionGUID: V3rKFpjTR4mN3wLt+7nuNQ==
X-CSE-MsgGUID: cFKTbZumS6+PG4eWHOzf+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32871815"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="32871815"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 20:17:11 -0700
X-CSE-ConnectionGUID: 3NvPnBnSSeS2Y9eDPh/UsQ==
X-CSE-MsgGUID: oBTkWiKDRfOWvep4qSxjYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40557009"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2024 20:17:08 -0700
Message-ID: <a1a99374-dc40-4d57-9773-e660dc33beb2@linux.intel.com>
Date: Sat, 15 Jun 2024 11:14:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com
Subject: Re: [RFC PATCH v2 04/10] iommu/riscv: add iotlb_sync_map operation
 support
To: Zong Li <zong.li@sifive.com>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jgg@ziepe.ca,
 kevin.tian@intel.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-5-zong.li@sifive.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240614142156.29420-5-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_201714_208231_C5FAF5CA 
X-CRM114-Status: GOOD (  13.18  )
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

On 6/14/24 10:21 PM, Zong Li wrote:
> Add iotlb_sync_map operation for flush IOTLB. Software must
> flush the IOTLB after each page table.
> 
> Signed-off-by: Zong Li<zong.li@sifive.com>
> ---
>   drivers/iommu/riscv/Makefile |  1 +
>   drivers/iommu/riscv/iommu.c  | 11 +++++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
> index d36625a1fd08..f02ce6ebfbd0 100644
> --- a/drivers/iommu/riscv/Makefile
> +++ b/drivers/iommu/riscv/Makefile
> @@ -1,3 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_RISCV_IOMMU) += iommu.o iommu-platform.o iommu-pmu.o
>   obj-$(CONFIG_RISCV_IOMMU_PCI) += iommu-pci.o
> +obj-$(CONFIG_SIFIVE_IOMMU) += iommu-sifive.o
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 9aeb4b20c145..df7aeb2571ae 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1115,6 +1115,16 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
>   	riscv_iommu_iotlb_inval(domain, gather->start, gather->end);
>   }
>   
> +static int riscv_iommu_iotlb_sync_map(struct iommu_domain *iommu_domain,
> +				      unsigned long iova, size_t size)
> +{
> +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> +
> +	riscv_iommu_iotlb_inval(domain, iova, iova + size - 1);

Does the RISC-V IOMMU architecture always cache the non-present or
erroneous translation entries? If so, can you please provide more
context in the commit message?

If not, why do you want to flush the cache when building a new
translation?

Best regards,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
