Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5263FC19F32
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 05:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yt9ArYZxCYim4MUm81Ko1gyjzSkxfSdij3bYzB1UT+4=; b=KnabMw5AKRBpCt
	vWwF8rL0GXtIg/0n1uqbSsPefEGelC+0CmS6wXeYgPlBL362AsL3rmDnex8RX/e43qdIqVW7LM31s
	fV/MviuLO6ye9DK8n5ownQBuGuzIjSQ2gvn1F4QgOrEPTMk4IP3YTT7c+VeNwF+1i4C3qj9Fv5jCU
	bAbxuQdueo/JwM6CHleA1LbuZnSkFyNGw/OKHf4yGRKSX8zGBx+uqPn61YmCTvCWNEDZrC0KUik71
	5jJTGo9z55NcS08H1CSLPoOtDuTRs3YGWgyXo0ppWwnLmM631urMffevODuVKE1aQPoxhdWNNhQhv
	cHWokXlfKfRSaBKI3eBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWLT-00000006MNy-0Vr3;
	Thu, 27 Feb 2025 05:22:03 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWJv-00000006MGA-0pTt;
	Thu, 27 Feb 2025 05:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740633627; x=1772169627;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vGpcN7P16mx836ZMuMkEdKUR6edRJ0QZzGvP196Ce2I=;
  b=UtkgQnB9NfRGk0o73qXLWkahrfB2ZIdoreCaiCatcf/1d14eeG12hB9J
   kQCYlJXisFE5oTdzBzAoSAGGIdXILWxWuOCHUN9u4pS48JsukVWiCN3u+
   9qA85PqXBPfy9ORQ33EzZP+4Rxia1BYU96L4JxgxBMSlBbn7BSwa0k9Wn
   uKjAO/DxPs83wV3jbEneD380F6LSI8YZQ2D1GDle5Xsnm0pjVpTRm/csJ
   +9HvxphqEidYSi0ZaHTyef04ysjoe/tCir5bZgYqBfpbeU2+A8UxBmMyl
   NGRMYiKj5miez+ACLiCzc1SC2q/DRLjYvFUe5XR3EeVH/myWOsViLvj4w
   w==;
X-CSE-ConnectionGUID: 7jjpcPaASNm1bqr7swnAYQ==
X-CSE-MsgGUID: dyqpWko0Ri2NLu/vgd3MJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41638731"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41638731"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:20:26 -0800
X-CSE-ConnectionGUID: Lk/GChz9R1GaGsF8Qphm4A==
X-CSE-MsgGUID: M2gLbS9DTJqV6N7Ph1buOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117561459"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:20:19 -0800
Message-ID: <35920cb4-05cf-4814-9648-0c7ad39f55aa@linux.intel.com>
Date: Thu, 27 Feb 2025 13:17:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] iommu/pages: Move from struct page to struct
 ioptdesc and folio
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
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
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <fafdcc71-b246-4855-a088-24854b124b21@linux.intel.com>
 <20250226135112.GB28425@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250226135112.GB28425@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_212027_283547_8209BC2B 
X-CRM114-Status: GOOD (  22.54  )
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

On 2/26/25 21:51, Jason Gunthorpe wrote:
> On Wed, Feb 26, 2025 at 08:42:23PM +0800, Baolu Lu wrote:
>> On 2025/2/26 3:39, Jason Gunthorpe wrote:
>>> This brings the iommu page table allocator into the modern world of having
>>> its own private page descriptor and not re-using fields from struct page
>>> for its own purpose. It follows the basic pattern of struct ptdesc which
>>> did this transformation for the CPU page table allocator.
>>>
>>> Currently iommu-pages is pretty basic so this isn't a huge benefit,
>>> however I see a coming need for features that CPU allocator has, like sub
>>> PAGE_SIZE allocations, and RCU freeing. This provides the base
>>> infrastructure to implement those cleanly.
>> I understand that this is intended as the start point of having private
>> descriptors for folios allocated to iommu drivers. But I don't believe
>> this is currently the case after this patch, as the underlying memory
>> remains a struct folio. This patch merely uses an iommu-pages specific
>> structure pointer to reference it.
> Right now the mm provides 64 bytes of per-page memory that is a struct
> page.
> 
> You can call that 64 bytes a struct folio sometimes, and we have now
> been also calling those bytes a struct XXdesc like this patch does.
> 
> This is all a slow incremental evolution toward giving each user of
> the per-page memory its own unique type and understanding of what it
> needs while removing use of of the highly overloaded struct page.
> 
> Eventually Matthew wants to drop the 64 bytes down to 8 bytes and
> allocate the per-page memory directly. This would allow each user to
> use more/less memory depending on their need.
> 
> https://kernelnewbies.org/MatthewWilcox/Memdescs
> 
> When that happens the
> 
> 	folio = __folio_alloc_node(gfp | __GFP_ZERO, order, nid);
> 
> Will turn into something maybe more like:
> 
>     ioptdesc = memdesc_alloc_node(gfp, order, nid, sizeof(struct ioptdesc));
> 
> And then the folio word would disappear from this code.
> 
> Right now things are going down Matthew's list:
> 
> https://kernelnewbies.org/MatthewWilcox/Memdescs/Path
> 
> This series is part of "Remove page->lru uses"

Cool! Thank you for the explanation.

Thanks,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
