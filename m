Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25905C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y47rlNjkOTork9jpbml4e308jXIpuI2Jyj7DpNLoRWE=; b=NKuCfugKww6WPR
	UiP53aNENRKJPxr++dxRQS7/HAuDJNKKJ7G28AxM2lFghXZqJOKwcV6QvWPo7BQtinrJtfUglXIEs
	QROiLsiHAFCTQ+rLLbsvicwlnCXLjqxQpVq/i0sxGZhbE6jW2yQ3FY8laeIMnfsLYj7975nA5vibz
	7UCckTpT3e2G5K7Ygrtvti8hIdg0L0o21OLspnwcF+RZ4974cjqGfHx9VtsKD9YaAoIDRvD/sHndI
	481t+8c5h2FI8Tk7eCdwz85klcCEuvA4yoQichdDXRpeiuVJzNPfWuGkUo0/UDmYFOuMTm5GOegln
	0MJ8A/Y2TkC6MhWZi5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBhX-00000002fbG-3Y7u;
	Wed, 26 Feb 2025 07:19:27 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBWk-00000002e2y-2iR3;
	Wed, 26 Feb 2025 07:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740553699; x=1772089699;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lGuqG7+DEuXe1J2USAdDSTgmWvYFPHZTBIRv2glH2pk=;
  b=gFU0nEgTFHyqe9+BWhIZPDwlaqLX4P3zCzQaudTZsdlpdaktfa2S0dB/
   iBJWVmCdt0M5nIRV98kPmcnUg1BK5sITD91W7lWVO2t3ZoCrA+5DDFqXE
   WbkWr5mKVFX0iIP80rGHjf6QYD1LBskoxwCiETp+qM4cc2FdFSScIeAlr
   NnL4qDavjSpi0ZgZm81svLM0xNxyzzmHhIXD2JuztZuM97liSLk67oCjg
   QUzObWYRomDvH0ZNyaBhR0Xzo53r0WlBM+2tSTsyOIpQBQ5afYDLtmdY0
   hCvdRiFBmPOyjavnzTsmezrlzxtAF4/nSqTWYQaepT2kCsA0WUU0wf9Yv
   g==;
X-CSE-ConnectionGUID: xIJrdf8KRcCDtZLAlbWxPg==
X-CSE-MsgGUID: w2YMOV4zT8m30B3GK6p+og==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45301075"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45301075"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:08:18 -0800
X-CSE-ConnectionGUID: 4yW5/f4YTV6BcwIufl/fnA==
X-CSE-MsgGUID: ENbmKCDxR/qajyMYQN9NYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121717499"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:08:11 -0800
Message-ID: <3ddae747-fbf4-4cca-a13c-8d6e6b89841d@linux.intel.com>
Date: Wed, 26 Feb 2025 15:04:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] iommu/pages: Remove iommu_put_pages_list_old and
 the _Generic
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
References: <13-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <13-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_230818_717339_64A16DBD 
X-CRM114-Status: UNSURE (   6.00  )
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
> Nothing uses the old list_head path now, remove it.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
