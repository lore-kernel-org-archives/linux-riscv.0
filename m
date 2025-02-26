Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7917FC021BC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 07:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogJzgJqW3onSt/rZnvdjV/vN+dByNSGiqH6adiewzSA=; b=G232DPRQZQpKZG
	xAjK7ryS7w9YTprgevjxEcWxtGZv/c3elT7M7uN2JoVu0YmlmQoqbo7HCwAY+0z2e6eLLZpzJJaDU
	ABLpFNer7rK2KvhYKSztyGdhMFjYaIgrine72t4WDDyT4O5bcpUGaH7jz7d3Tu89BGghfYjI4EWh0
	UGYcuy1VESrRyaptw7z8ALUo9AJSYoY/2Wn1VEZ6XACvgcx4jCMGhIJ2Vk1KeTCLshOF1n0DpznaU
	f3XChmWabLoUNFHY0zcTHESNA8PvTYLTV6xcJv40hMkDtfmR6yDvm5doMnJBoLejP62/yCAB4kVAO
	G5FApKSrNkOOw6IH3URA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBd2-00000002esC-2nrU;
	Wed, 26 Feb 2025 07:14:48 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBUq-00000002dk4-35Dt;
	Wed, 26 Feb 2025 07:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740553581; x=1772089581;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W5m8VXXaCJzooM7nBsw1fkyJLmefcSUyEyU2R1fyCSM=;
  b=MThRaYb/MD3R9bSbWTl5MdSSFldXfiLiD298pBpXCX+/NmeQGygdlT/f
   ZxO6VqfaAF5uYJXuof4nY+RDtSDNhmBDZfd4J/UdwTKb90qpBGxDdw+gk
   wLJZuLmrdo66ZnCfM13a4TBYB4WGu4myPq2B90zA9qO8asip8KCRM4i4P
   iyGIPcXE8MwnF7JGZaZPHzA5O4je+43M8uA/R5Lu5eUMC/pjrUfLJFOSn
   x7p0KABW38suS3S5vV0JEwfyaWuiv8rehg9ZM+HvxVnGs7K53sFwRBBTh
   8XzwHtEB1b8Sk5X3efiTLpRItgJQZCCDwxNgCj6fGumcS+76NDCXhrpns
   A==;
X-CSE-ConnectionGUID: bBo2A1Y1Rx+pOzwcWhSapw==
X-CSE-MsgGUID: Zq8m+p45Q1ycsCQs0YcslA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45300940"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45300940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:06:20 -0800
X-CSE-ConnectionGUID: o2XeqybiSAuGJr9XU9Ilgg==
X-CSE-MsgGUID: 55W0no9QSx2jxxin+p8ALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121717131"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:06:12 -0800
Message-ID: <7e70dfea-1be1-4699-b238-2d63fbfc2bc5@linux.intel.com>
Date: Wed, 26 Feb 2025 15:02:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/23] iommu: Change iommu_iotlb_gather to use
 iommu_page_list
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
References: <12-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <12-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_230620_820202_7FFB51F4 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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
> This converts the remaining places using list of pages to the new API.
> 
> The Intel free path was shared with its gather path, so it is converted at
> the same time.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
