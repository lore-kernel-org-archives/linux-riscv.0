Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DA1C28B2F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 02:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00p1gjGQse9gk0hqP9K3AGAE+mtP2K6nyNcMOJxq9ZU=; b=W0ihF5pvPu9NwY
	9694oXhmPDoDiiWPBpiLx2bQWThJMTRP6jqUIhZxyoa7K58iFCwW1CG1kHTE/478ra7DMPA4eIE8v
	oLzUshZiVuBj4gRHxVR39M4oao5RDqtTyJxV7dg0pbFWRHtZ1cM9oitVmPaSAgbtjnAJ2u4UOqQ40
	kuIG7ljwSp9IvUECFviN4T2ZqvFHHmnlQt2M5D9vBzl6c4pPg+eJxScQ5Zw/VC86EgVlcfvg8Rc2F
	mJzXj+etPkpUvi8qqpSzSDoA5Vl11ttA8ertC+glITYy1aenMDW5BGOP+MDxEKs3XKAmxmxoJVy35
	IGdG2/se2IvdgQwb39uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trSsn-00000001RlW-47ZI;
	Mon, 10 Mar 2025 02:28:45 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trSoa-00000001ROF-1vx6;
	Mon, 10 Mar 2025 02:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741573464; x=1773109464;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WKFaRGNbm41ygiDOYwuZyQiHlC64X9yBshoJhOG//8I=;
  b=hOkspDBQi/8XI70YKg49egj8AndBAUzLV/U2obyuoOdTc8ty9kQiX9XL
   ZZBoteDZN+x84R1dnq+Tt5uHN/1VBjFvVqGtkqYKbTM2Ob7KzfiXcNwMi
   sW60bYj9yj6mUS42QKNydaPZ8OmXWK721UxYxpJzTcFSxpY6POCtVObNF
   l+jjXPdiD77XbuLIshHrAQa9bKfMbJ3xIu4Ppx0Brf9c9pzK68nMuMqVE
   KZT5Vz61rHBNqg9RRdtgZnl8cXRvBIJFxxp7qTceO8F2vYVTYPNp0KH3c
   e43rs5tzNGDfP/wL0iKU83JMdUhNVLkY4lzj3C0vb2LvQJXZYY89lzDWG
   g==;
X-CSE-ConnectionGUID: Yu/f5faVSdaHo7V6oAwsyA==
X-CSE-MsgGUID: NTJxOy/wTwq6tRNYNyHC1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65000966"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="65000966"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:24:22 -0700
X-CSE-ConnectionGUID: EBcI4p/gQFCFWXYHUd2zOQ==
X-CSE-MsgGUID: kuyCE67oS6CBdcD22w3xyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124459380"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 19:24:15 -0700
Message-ID: <2db8d0c9-f6df-48f3-8bbb-4592e86d92fa@linux.intel.com>
Date: Mon, 10 Mar 2025 10:21:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] iommu/vtd: Use virt_to_phys()
To: Jason Gunthorpe <jgg@nvidia.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <8-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_192424_588705_C27405DA 
X-CRM114-Status: GOOD (  12.26  )
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

On 2/26/25 03:39, Jason Gunthorpe wrote:
> If all the inlines are unwound virt_to_dma_pfn() is simply:
>     return page_to_pfn(virt_to_page(p)) << (PAGE_SHIFT - VTD_PAGE_SHIFT);
> 
> Which can be re-arranged to:
>     (page_to_pfn(virt_to_page(p)) << PAGE_SHIFT) >> VTD_PAGE_SHIFT
> 
> The only caller is:
>     ((uint64_t)virt_to_dma_pfn(tmp_page) << VTD_PAGE_SHIFT)
> 
> re-arranged to:
>     ((page_to_pfn(virt_to_page(tmp_page)) << PAGE_SHIFT) >> VTD_PAGE_SHIFT) << VTD_PAGE_SHIFT
> 
> Which simplifies to:
>     page_to_pfn(virt_to_page(tmp_page)) << PAGE_SHIFT
> 
> That is the same as virt_to_phys(tmp_page), so just remove all of this.
> 
> Reviewed-by: Lu Baolu<baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/intel/iommu.c |  3 ++-
>   drivers/iommu/intel/iommu.h | 19 -------------------
>   2 files changed, 2 insertions(+), 20 deletions(-)

Queued this cleanup patch for iommu/vt-d.

Thanks,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
