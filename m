Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F38C55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMjmPSJuW8eoPCGGPfNO+PZxnslS2Ltz09rntLkZvfQ=; b=INnvdPdNubv4Q2
	jBEtykNLDim3GGlS9SadD6PRic5hu0vHdswV8u4e5S4RImAjfrQYrE0oDddy/uV8OLp5Kpg3lzuLh
	bteRldHNye8CCYm+mR3EPbL6B8UoqDatfQg3OEjObeBkIZ4Ia75RIGbftTrjeHKTNxZ1SarkjKkXd
	UV9mxiSMRctC54af//kmcQXyMcSwx7amZM3xJI1b+8teuebayPBg5+CusYd7eJlvXtFq5DTqO1Qq0
	hfqz7C6MDZ9UBqM40h/tHcH5H0GtN8GmtgVveYrq4HV125uWvbrs4T5Yn6o5Fpdus3FFhDAQiy82r
	bn5AjRoCLyBNM+BCDcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskWM-00000009XbH-3JO9;
	Sat, 08 Aug 2026 17:07:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskWM-00000009XbA-0Fbn
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 17:07:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7CF660A58;
	Sat,  8 Aug 2026 17:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AA41F000E9;
	Sat,  8 Aug 2026 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786208860;
	bh=RZkqPDjuFooi7QGj5t/O5g20eJ3XuiiAxeKTnLb8vz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kEFiTAk6dJwIY8ucP0WzJtmpjuaY0C2iT2p+mcdqjztfYKRa56w+59ixsW4besMiB
	 I+LCAEHif77oFP0PO5ikGI93N7c9RiayxBy4AKiD/ui5Acq2aLvitujKgo2Vey5Z1X
	 1zbbFnwgJJamAgXfbqv767RaOdSui+4dLoTiG/sFVkZ1U5G9ERjZqWwHc1dglNP08S
	 e8rSud3pG8YZyO+oCPNUfNGfGMTQGgu9lAVS4kak6v+q2o+CgyPniHNZHvpuSNYF1l
	 coWzoRoN/7Kuc4DeESugxBCGrzNB5GAjf8SKquYJXGkGJKuWlXEdimU3XE6THBUlhU
	 NA69MO+GnjKhw==
Date: Sat, 8 Aug 2026 10:07:38 -0700
From: Drew Fustini <fustini@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev,
	will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com,
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net,
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com,
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH 4/7] iommu/riscv: Program QoS IDs for assigned groups
Message-ID: <andiWrKhz5rLPVuq@x1>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-5-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-5-zhangzhanpeng.jasper@bytedance.com>
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

On Tue, Jul 14, 2026 at 09:06:54PM +0800, Zhanpeng Zhang wrote:
> Program RCID and MCID for RISC-V IOMMU groups through the device context
> TA fields. The resctrl group assignment is per device group, so reject
> BARE mode where only the per-IOMMU iommu_qosid global default is
> available.
> 
> Validate every group member, firmware ID, device context, field value,
> and QoS ID capability before changing hardware. Then update all members
> through the checked IOMMU group helper so a validation failure leaves the
> group unchanged.
> 
> Serialize DC.ta changes with context setup under qosid_lock. Change only
> the RCID and MCID fields with ordinary accesses so fixed DDT mappings are
> not subject to atomic LR/SC operations, invalidate active device contexts
> after an update, and clear the IDs when a device is released.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/include/asm/qos.h     |  16 +++
>  drivers/iommu/riscv/iommu-bits.h |  15 +++
>  drivers/iommu/riscv/iommu.c      | 200 ++++++++++++++++++++++++++++++-
>  drivers/iommu/riscv/iommu.h      |   3 +
>  4 files changed, 232 insertions(+), 2 deletions(-)
> 
[..]
> +static void riscv_iommu_dc_update_qosid(struct riscv_iommu_device *iommu,
> +					struct riscv_iommu_dc *dc,
> +					u32 rcid, u32 mcid)
> +{
> +	u64 qos_ta = riscv_iommu_qosid_ta(rcid, mcid);
> +	u64 ta;
> +
> +	lockdep_assert_held(&iommu->qosid_lock);

It seems that qosid_lock is not defined until the next patch. I think
you should move the definition to this patch so that the series is
bisectable.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
