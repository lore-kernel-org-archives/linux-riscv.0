Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3A2C19776
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAk7woEAGB1IUbTBWH6xMDuj8rHdhi8UpewNe200IjQ=; b=y5YcZiV3brga2x
	FeRUFBra2YRqtmZKfz6tw1Tt0AsnPAZGPElWkPW7PC33zcoje+dGaUipaUSBDYwq2MYUVkRpFGfkp
	pg+1Tqx5BOiqtc5aYYtOnN6Cp2cTksyLkJGdqmgnax4QWjVzkRkV5iqHBtYHPM++1GLYjwc1YXAOj
	5XZXf45kMAfHxhJXE5ro0phFKbpttYOa0N2sdcSyNhCabIszhL/BIZ+3cmztks3ZXcvb+MsrlcP7/
	yWzJZXI45pyQ9eIDp890dz6ttE/tUW9GOYG3BpwcF1NzO8aksCFhunOECEBoFhP3Rm2t6t7hhHaGo
	NIwOn6xlEm2R6PTvhLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnB9E-00000002Zqq-2kBo;
	Wed, 26 Feb 2025 06:44:00 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnB5b-00000002Z3b-3aC4;
	Wed, 26 Feb 2025 06:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740552016; x=1772088016;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LhlJYnqquo1shJKupI/Fa8GBn0+W1Px9NHZAejazzu4=;
  b=gXM3CcYqEA/+eQWDOaanJXEMkeYc4oFExxF0GGpuJ9q+R8DY15OalFyi
   fqwCZJKoMJnc9wnAQrS5GEN0ckIMsT9sCHk5Obvkk7xou3cgSxyETUBt6
   NluJGkw96zC0ytwRagQrU0e1+QawesAVx1cAiuzlDZsFGG5fA1rdDv+QO
   ly5rQtyTH8Y9I2DgQi9JRebFXM2REyDfzWVJkD6VOzjAjEv2aVgSUlY+P
   A+IH1Ya5FkqHQBxTrTOGdnhS2e7WzAhmpwDPhVxRBxD0BdVZQa10zXvxD
   P4540cvBrDomeINROtuiiw1a7ZMuQyZCrpQ9ysVhMcI5jNDUIXlkNW5KF
   w==;
X-CSE-ConnectionGUID: F96HoINoR4W3BjRsHMGOWQ==
X-CSE-MsgGUID: OR/s9/dETkCPVwOE69Juig==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41088309"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41088309"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:40:15 -0800
X-CSE-ConnectionGUID: BfdrDOJVTkOUWSLCJpkdNQ==
X-CSE-MsgGUID: 9n2T3c9ATAi3EHRCb1cr8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116810796"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 22:37:27 -0800
Message-ID: <94b38478-9ec7-4d42-b989-cbcfb65927eb@linux.intel.com>
Date: Wed, 26 Feb 2025 14:34:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/23] iommu/pages: Remove iommu_free_page()
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
References: <6-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_224015_946313_11E562FD 
X-CRM114-Status: UNSURE (   5.56  )
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
> Use iommu_free_pages() instead.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
