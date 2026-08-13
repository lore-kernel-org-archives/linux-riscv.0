Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7433C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGQ9DwSyMJuk+UHk+eZJTThih8C2DYHFoksIzW4UXbw=; b=wL8ar97OEu/3Kk
	KP20HhIo4PD2KNoHNKUN+6bsW1GFmYaPSf2a+F1yUKXFkV4s0x44CPu8Ebk0bgJ46O5RoVijRNBod
	Hx/4lAQMi28tSYu7oeYJUSXKI2KiBwFqQvi8hfncBP7vw0XUUJ9OePEDwDBtzeFLjuYgz9VJfQYty
	MGoMzncwKi9s85F44INjH1s5Ewr2AGHV6U3t6OLpBRCzTfOvEe8487hpKb9y0CRVIodtt6oPOapgt
	b7t2sYxEt8jCESUzBh/HMf+2+JFQ9FTBBwOXFeYQhE2S2i5Rr2qJzieefKuCdPil31+HJ/5MnSe/m
	sW5mJNl3mVGac2eupxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZSq-00000001JzT-3Zs0;
	Thu, 13 Aug 2026 17:43:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZSp-00000001JzE-2Ddq
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 17:43:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC534400A6;
	Thu, 13 Aug 2026 17:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608CA1F00A3D;
	Thu, 13 Aug 2026 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786643014;
	bh=Vx7YXtRMyITi1C1CRhaAFx1V9a28c3m1pyOxBUtEric=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k3+gv6vCEM7acrABINQc35rhIjGyDCPJ41fVl9NaG7cp8eMtHLI/ty+6SglNFTvXR
	 DEw9jcdreOnKrTgNNoA+ZUi/r/oYs+vnPO6ZO/6gn/H2eIzJkx7lGzoGh2TAJgxGQH
	 MVD3wRG6jb2pWoioasY1HoKyxsDuijgY36DCD6bbCOLgJmgGjCoJXfA/hLRt9hJggW
	 IgRqC+E2I6E/sMpkrmgE5BENK/YUiarqFRFUv3+1yoo0KF1LyEecHLGQTrAf7LBhug
	 Rvo2dXld/tAgAMGCbNk0ct2+nypHgfp9/7iGcxq07G0vw36OtX4WM+RZp3ULSi5xVt
	 mV3c3snvnfQIw==
Date: Thu, 13 Aug 2026 10:43:33 -0700
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	Ben Horgan <ben.horgan@arm.com>, joro@8bytes.org,
	palmer@dabbelt.com, tony.luck@intel.com, tomasz.jeznach@linux.dev,
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net,
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com,
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH 6/7] riscv_cbqri: Assign IOMMU groups to resource
 groups
Message-ID: <an4CRRXt44+PhHgy@x1>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-7-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-7-zhangzhanpeng.jasper@bytedance.com>
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

On Tue, Jul 14, 2026 at 09:06:56PM +0800, Zhanpeng Zhang wrote:
> Allow the resctrl devices file to accept iommu_group:<id> tokens on
> RISC-V and map the target resource group's closid and rmid values to
> RCID and MCID.
> 
> Record non-default assignments in an RCU-protected binding list rather
> than inferring membership from hardware IDs, which may be shared. Keep a
> parent reference obtained by numeric group lookup so the binding does not
> keep an empty group's devices kobject active, and prune bindings after
> their group becomes inactive.
> 
> Publish an explicit UPDATING state while hardware changes. Paging-domain
> attachment rejects that transient state. Static FSC=Bare transitions
> preserve the current IDs so a mandatory release-domain attachment cannot
> fail. After the checked group update succeeds, publish the packed IDs. A
> validation failure restores the previous active state without partially
> changing hardware.
> 
> Moving an IOMMU group to the default resource group resets its hardware
> state and removes the software binding. Device contexts created later for
> an assigned group inherit the IDs through the RCU lookup path.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
[..]
> diff --git a/drivers/resctrl/cbqri_iommu.c b/drivers/resctrl/cbqri_iommu.c
> new file mode 100644
> index 000000000000..4086c32546bd
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_iommu.c
[..]
> +#include <asm/qos.h>
> +
> +#define IOMMU_GROUP_TOKEN	"iommu_group:"

I am wondering if maybe this should be parsed at the resctrl layer since
it could be possible for RISC-V and ARM to both use the iommu_group
token. I am hoping that Reinette and the MPAM developrs will add their
prespectives on the the resctrl devices file and at what level the
tokens should be parsed.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
