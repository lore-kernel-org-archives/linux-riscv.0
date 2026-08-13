Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0068C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sg6ST8hV/8hO44FCDj1GVWIDmPk/VL4MLysMJt7Qqww=; b=UGeHr/SLHR8xPr
	vAF4elQXx36SB9TuKE0imjQcJhoO1Cfci2pG5MHQQ02sLIhZcA7JwUQLDKmDxWwkRGjX26C8F04r0
	+v1TNAIm/+zdZDsPJHRfzy36KW6YMz3I0Oad6+/c35hP8XbmTDMbokIlc9pa/T9x1fAtqKFY2kArS
	ewehM1jRTDYEcXesXx6EWu/BuRY56s0FmmoERTDEg8bYxCoeMCAnAHa6EQ1DcTRtoP1C3AfsiyNP0
	mGvGOrUbSV2dtjO9BfTtr0xK+QlRtKTUmNUBClK69ObJcV2gK4olx2gTcmDyk1DuFAHZ4tEZZVm6R
	EZPTuRyQNMvcd6PLC5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZJz-00000001Iu5-3HgS;
	Thu, 13 Aug 2026 17:34:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZJy-00000001Itk-1bpt
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 17:34:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 934E360120;
	Thu, 13 Aug 2026 17:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CC31F00A3A;
	Thu, 13 Aug 2026 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786642465;
	bh=d9/MjXSR6H4kUMgKLQ420rzJEEx4EYhO23B15g1ByFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c9MJOeCdmP8nd/hQntQKWiS5Rf1oiv+z9t8+HpBf8+k+4p3YAWy9JOpeHj8WxIAUK
	 hmOtKn7g3SIegv9clnN/P1fCzzHBnSSQW9l0d+QzySPIeVf8S2cLvuXhAy8OUekhmi
	 3IySaD44+xKIDsYeo2u3ukhtqSy5pEbJvpel17Rf7ynezm609FGwCVhcRu0Gj56w/a
	 UQSSkWbhdRr2zLBA25qc/5lQdjzQsGnVShMV3bfHEsRbRX46k63It9HPituT5vEdLT
	 +CDHkDyzQj71QGndWnds5IA0fgxmGpF5kh2wmc876ufEzW70dqC1Xlr2hJOiEGhKHW
	 j6qwYR7Y/Y4Qw==
Date: Thu, 13 Aug 2026 10:34:23 -0700
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
Message-ID: <an4AH5p2NW+tFlyR@x1>
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
[..]
> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
> index f2ef9bd3cde9..782de5c92727 100644
> --- a/drivers/iommu/riscv/iommu-bits.h
> +++ b/drivers/iommu/riscv/iommu-bits.h
> @@ -63,6 +63,7 @@
>  #define RISCV_IOMMU_CAPABILITIES_PD8		BIT_ULL(38)
>  #define RISCV_IOMMU_CAPABILITIES_PD17		BIT_ULL(39)
>  #define RISCV_IOMMU_CAPABILITIES_PD20		BIT_ULL(40)
> +#define RISCV_IOMMU_CAPABILITIES_QOSID		BIT_ULL(41)
>  #define RISCV_IOMMU_CAPABILITIES_NL		BIT_ULL(42)
>  #define RISCV_IOMMU_CAPABILITIES_S		BIT_ULL(43)
>  
> @@ -274,6 +275,14 @@ enum riscv_iommu_hpmevent_id {
>  #define RISCV_IOMMU_TR_RESPONSE_SZ	BIT_ULL(9)
>  #define RISCV_IOMMU_TR_RESPONSE_PPN	RISCV_IOMMU_PPN_FIELD
>  
> +/* 6.27 IOMMU QoS IDs for IOMMU-initiated requests (32bits) */
> +#define RISCV_IOMMU_REG_IOMMU_QOSID	0x0270
> +#define RISCV_IOMMU_IOMMU_QOSID_RCID	GENMASK(11, 0)
> +#define RISCV_IOMMU_IOMMU_QOSID_MCID	GENMASK(27, 16)
> +
> +#define RISCV_IOMMU_IOMMU_QOSID_RCID_SHIFT	0
> +#define RISCV_IOMMU_IOMMU_QOSID_MCID_SHIFT	16

Sorry for not making all my comments in one pass but I think these two
shifts are left over from before you were using GENMASK?

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
