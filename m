Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4B9D6AAE7
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 15:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtuxzzwHvsa0AGATX+IG0y7Bwd6R6feJucX4pilXyj4=; b=QwZJ7RS9b22+EC
	P68PWblXJaynSVgPk0DqvzeRXTuVotPce2J7LO20YSrQSy/jx2icfKQpJIUZnRDCwrMp4VdagCkog
	ddg3bKMcbDg4lHa+C7JT6jTsfGUzuGvj/iuMgb5gKTYWXYWVy1l9xfAE7/HvBUn7rm6jZ7mrmb1Lw
	1DEgblWa1FdaCzHL4DS+ez61bEkgCmBZdqztEiJnnykt92713uqziQFVx3Q+i6CauUYAiGXHa42qZ
	5WbZABIuYmVVZI4cQdG25g/cwaYfYnY1/+/m2cNsHiXA60VCCniqW0U6qQpbiW6W6TXgJPEoQ6D0L
	2DkYEMyozzmm2NJbIi4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KIN-00000000T1o-2OY4;
	Thu, 02 Apr 2026 15:49:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KIK-00000000T0k-0CCo;
	Thu, 02 Apr 2026 15:49:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49FF24408A;
	Thu,  2 Apr 2026 15:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4634CC19423;
	Thu,  2 Apr 2026 15:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775144959;
	bh=ETKq7zpXTNX+jfpHKOz+WPkBvuAndyFKqifyTs989fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vDcw1prILIQAXHJowYDTJb6Nn1rk2kMRffrcqcdVG1vKoLbLy61HSdGnHVqlkKx4q
	 ylg/MMGiQlKZe28tTkDSkOan0AGo1g+dPj/2nlK4S1pZ/d6kp0OuWyo/d0fkH2NCF6
	 xDn8/HO4hkB4cT2GGVpv80jHaaYSdWeTyjMVyo1o=
Date: Thu, 2 Apr 2026 17:49:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>,
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Jon Hunter <jonathanh@nvidia.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v2] iommu: Always fill in gather when unmapping
Message-ID: <2026040202-uneaten-nutrient-b6e1@gregkh>
References: <0-v2-b24668f107b2+11bbe-iommu_gather_always_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v2-b24668f107b2+11bbe-iommu_gather_always_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_084920_160312_25145162 
X-CRM114-Status: GOOD (  23.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 02, 2026 at 11:25:16AM -0300, Jason Gunthorpe wrote:
> The fixed commit assumed that the gather would always be populated if an
> iotlb_sync was required.
> 
> arm-smmu-v3, amd, VT-d, riscv, s390, and mtk all use information from the
> gather during their iotlb_sync() and this approach works for them.
> 
> However, arm-smmu, qcom_iommu, ipmmu-vmsa, sun50i, sprd, virtio, and
> apple-dart all ignore the gather during their iotlb_sync(). They mostly
> issue a full flush.
> 
> Unfortunately the latter set of drivers often don't bother to add anything
> to the gather since they don't intend on using it. Since the core code now
> blocks gathers that were never filled, this caused those drivers to stop
> getting their iotlb_sync() calls and breaks them.
> 
> Since it is impossible to tell the difference between gathers that are
> empty because there is nothing to do and gathers that are empty because
> they are not used, fill in the gathers for the missing cases.
> 
> mtk uses io-pgtable-arm-v7s but added the range to the gather in the unmap
> callback. Move this into the io-pgtable-arm-v7s unmap itself. That will
> fix all the armv7 using drivers (arm-smmu, qcom_iommu, ipmmu-vmsa).
> 
> io-pgtable-arm needs to accommodate drivers like arm-smmu that don't want
> to use the gather by just adding a simple range, and drivers like SMMUv3
> that need to use gather->pgsize and also have a disjoint check. Move
> SMMUv3 to a new tlb_add_range() op which replaces calling
> iommu_iotlb_gather_add_page() in a loop with a single call to update the
> gather with the range and required pgsize.
> 
> iommu_iotlb_gather_add_page() is repurposed since nothing but SMMUv3 uses it
> now that amd, VT-d and riscv are using iommupt.
> 
> Add a trivial gather population to io-pgtable-dart.
> 
> Add trivial populations to sprd, sun50i and virtio-iommu in their unmap
> functions.
> 
> Fixes: 90c5def10bea ("iommu: Do not call drivers for empty gathers")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/r/8800a38b-8515-4bbe-af15-0dae81274bf7@nvidia.com
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++++-----
>  drivers/iommu/io-pgtable-arm-v7s.c          |  4 ++++
>  drivers/iommu/io-pgtable-arm.c              | 19 ++++++++++++++++---
>  drivers/iommu/io-pgtable-dart.c             |  3 +++
>  drivers/iommu/mtk_iommu.c                   |  1 -
>  drivers/iommu/sprd-iommu.c                  |  1 +
>  drivers/iommu/sun50i-iommu.c                |  1 +
>  drivers/iommu/virtio-iommu.c                |  2 ++
>  include/linux/io-pgtable.h                  |  3 +++
>  include/linux/iommu.h                       | 19 ++++++++++---------
>  10 files changed, 46 insertions(+), 18 deletions(-)
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
