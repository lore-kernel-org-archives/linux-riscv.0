Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAFEC197BF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 05:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6IZEf0tnjpFK7OO23L+UzNbq3NEjBPz86FTjxbkhYU=; b=EI8yvkKIvH0pDF
	KqEdWof4oPkgUcuR6x5oHvPtnTZ5CTxxFiHtJuGa4Dup4kVwfcIqRLiFQxhVq02NB1NRqdS9V6HNL
	LMsPqFg8kgf3GNbD+JayUFB6kpyNxJEACBVbdazzSuYcdcE1tvPkXIe4RLcjks6P7/CGfWnVEQzIb
	rPTPj6pCb+kUMopYFNhAK/aofHcj2uZD0J1BC/9sdKhWx+yJ0Jg6lBS/zZs/YPakLrBHzLnET3vbf
	mHaQFbvdaKHzL1PxmUBH/XFULmIfz6iacMjWnkyQd2GY+JsVqIkW8AgsARNerToqVIUzh9TxCqKr2
	CpskTwIRzGKoDL89AxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWMx-00000006MbQ-2qOs;
	Thu, 27 Feb 2025 05:23:35 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWKY-00000006MIU-3zcR;
	Thu, 27 Feb 2025 05:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740633667; x=1772169667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PQtjihnmxnJNt9cGH7dsXgv0bEF3d3LqLBB92T9bDY8=;
  b=nOi1NzNUdbggdBHHiDeFss3Lm5WGznG6mP6tIvkGIjbbgxfggzjw7tJR
   gWjV5hldv8TfHgKnJUoAXiHttToREhu29K0DJaHnWZ+4L5J/iqg7hbm8U
   t/evBD0Uz4oB2VADeS38+W/X4nhrEdbwT1O1mfKp1/5ynxKtuWOd5eK98
   1HTkqywDwCCo0bidGIDnUIs54iJmVwbq32RN8GQygYkQbJ5FYw+2zGkNP
   M3E5i3lr1bWVqN2jMhk2WwX+o4vRxr+KeXy/Ic0tUOW8Gq08lf1ao2+xp
   d6lsrXgmE2rtEbqj9RXoCtSRfV1cKbd/q+k/607D/HfTJdlylQFMC+cvC
   w==;
X-CSE-ConnectionGUID: L7ukhFHdTfGKaU08GnujYg==
X-CSE-MsgGUID: sQwKdHbcQkmdjfff2faD9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41638804"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41638804"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:21:06 -0800
X-CSE-ConnectionGUID: IDSQ03WOT0Sf2y1g0JuloQ==
X-CSE-MsgGUID: X4xnN020QO2lRkAamUgJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117561589"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:20:59 -0800
Message-ID: <397fbef1-3aef-4421-bd68-107e289a95aa@linux.intel.com>
Date: Thu, 27 Feb 2025 13:17:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] iommu/pages: Move from struct page to struct
 ioptdesc and folio
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
References: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_212107_030769_0430C4D4 
X-CRM114-Status: GOOD (  12.09  )
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
> This brings the iommu page table allocator into the modern world of having
> its own private page descriptor and not re-using fields from struct page
> for its own purpose. It follows the basic pattern of struct ptdesc which
> did this transformation for the CPU page table allocator.
> 
> Currently iommu-pages is pretty basic so this isn't a huge benefit,
> however I see a coming need for features that CPU allocator has, like sub
> PAGE_SIZE allocations, and RCU freeing. This provides the base
> infrastructure to implement those cleanly.
> 
> Remove numa_node_id() calls from the inlines and instead use NUMA_NO_NODE
> which will get switched to numa_mem_id(), which seems to be the right ID
> to use for memory allocations.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
