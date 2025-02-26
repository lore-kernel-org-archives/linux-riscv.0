Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959A0C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 06:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3sd/HD0OtO+uBCTqO1PPXcbWLyHREVQGDLRs0uRE4I=; b=Thtoy1YU+hbQpR
	LRB0jsC461UdHr1l6/fZZQ0Fz2S9HYaiM8smjGSsA5a4NF1p7AGAknRkHKF/yimBFmVJxOakfKQyO
	Po1LYLlniTvcekDx/Cz0oo4gP/4YNTbj124c5rQLvt1zxH4s1crEkfwSWlmRRkqGfK9o+bwrLSGmX
	nW/NT3xGktBw/ycZLH5OpLiTM22DKR7EICWINk+alTgZDKN+mh4l4wcGVCf/FX8z3X9aPF2NtSCqb
	slYOAvEI2dIXHMdhqfJjcIZ9aRSRw+bGplVxa9HpagvOKzeXxLjJM1Jxd2tMnTflnTnHW3fInSU1z
	lK6lyeBBPaA7v/OTu0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAz8-00000002Xll-2rmJ;
	Wed, 26 Feb 2025 06:33:34 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAxX-00000002XDI-01oO;
	Wed, 26 Feb 2025 06:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740551515; x=1772087515;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yeNE9l/7kc4iO6oQlttdFI0ImAydMtnQ59bQsp4kneY=;
  b=fs3aEX7Ef/WJmOH1WsjZ7rZ/NLsUdw7E7LSsDTbtqidaEGhGDUJeTqkP
   MgAbjxYREPaCGqwwg5IJdkpFoal8OHYJ5ywJXJsVpnWWTm8e1B07QFCRS
   qCFGtk3qtU30rj4hqKUqKgJf6brsoqMxbZsGPkdVgUK2zWPWCL5cPkyS7
   rlYX+dbTzhlp1sIyYJYv59bU5zrNgkEPJIamK3eu3PyykFwrh5jJ9I1y4
   fglvQ0hAnDYaJYw31JWWhsuhHGECErl8rIVG593nLDo+K1XK26Hchsog5
   6Pz87/+0RReYPuzLPkTI8Ocfcr5u3RuLep2pUXGzzaSnl9gMciXDzBlTO
   Q==;
X-CSE-ConnectionGUID: FFV7cAtRSoexmaoUkv2Dzg==
X-CSE-MsgGUID: 3yBIG7s3Q2aYJLnYGuLTWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41087711"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41087711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:31:52 -0800
X-CSE-ConnectionGUID: 53+y1LNORqyqi7R5eDgD0w==
X-CSE-MsgGUID: IVNVYYLWRaGC3MlipK1v+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116418952"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:31:45 -0800
Message-ID: <20bd43f3-c1e4-4469-b5c7-9724607d6e57@linux.intel.com>
Date: Wed, 26 Feb 2025 14:28:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] iommu/pages: Make iommu_put_pages_list() work
 with high order allocations
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
References: <4-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <4-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_223155_119919_7873DF53 
X-CRM114-Status: GOOD (  14.14  )
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
> alloc_pages_node(, order) needs to be paired with __free_pages(, order) to
> free all the allocated pages. For order != 0 the return from
> alloc_pages_node() is just a page list, it hasn't been formed into a
> folio.
> 
> However iommu_put_pages_list() just calls put_page() on the head page of
> an allocation, which will end up leaking the tail pages if order != 0.
> 
> Fix this by using __GFP_COMP to create a high order folio and then always
> use put_page() to free the full high order folio.
> 
> __iommu_free_account() can get the order of the allocation via
> folio_order(), which corrects the accounting of high order allocations in
> iommu_put_pages_list(). This is the same technique slub uses.
> 
> As far as I can tell, none of the places using high order allocations are
> also using the free list, so this not a current bug.
> 
> Fixes: 06c375053cef ("iommu/vt-d: add wrapper functions for page allocations")
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
