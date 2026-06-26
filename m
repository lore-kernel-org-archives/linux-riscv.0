Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC34FCDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsY5QtcoIuc/+B6ipqqQwCVTZWzP/1hSh9roQ1Iotdw=; b=QcwL7PCde4VpzR
	hiW3dJrcX25Ma7g91WTgi4NPJrPRdv6Ys8lCFBgWHvRma5h9+G/zJPisv/P8vWLU1h2ReLZ0nLDu8
	ziReqP/2/SwYGJtHQszLhcjdP2UnaufVRcZmeoxufygRJIvl7VsGLxeLUrl2I2eZlcto7m6iI+GeH
	MowM7I09usmP8oNjnNyftmN1BevNcFBVyJXCu0sNUcs0dfMa0PRUgAFZnC6cBWhKKqewdSrLjmDwa
	+m763kUhD9gHtayQ/SYf4fNmN+lNhVxatWWVxDiOEGfCBwLWP3Lo7ZV6kt2uaV8iCzhz+8Os/rS0E
	4Rq1cUlAyuJLTFmt0sTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1o9-0000000Amx3-344p;
	Fri, 26 Jun 2026 08:21:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1o8-0000000Amwn-2vhe
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7321740A59;
	Fri, 26 Jun 2026 08:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545E41F000E9;
	Fri, 26 Jun 2026 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462064;
	bh=+YfZ76r2ksaV8Km/IBCLkq4BDK1sE4dAu4lNJUrn33E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PClxCafl7uU6D140WFTcVLHSe+JnE8XVg1bEtWxqtnVqcc0egtLYo7WqqboEO4D7m
	 DeNOsV4ecE44NXMKAYEJZHFzYP96iaQGVvusNZQGekuqmDZJ02cf0KZdw62YJ7AtwH
	 T6B8jxwwgQbXcCahcJ4iYjA4RmRQ58nnNwP1SCwHLjxA6Fi6IGc9h3dN1bJStX1beh
	 e4r025iZ0taPA+LXTdOT5t9Wj6Db44RJLkJpS80I4blWQtBjw9XKRTf6gzvNlsM8VX
	 I6JM4SbMLJQ6EkiBnzKai7KtSU3j6PnouZlYJUqH0cTI+zVc40aaFkoNHEWVZxHT1J
	 TphSLdkrHIBHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8FE2B39389E8;
	Fri, 26 Jun 2026 08:20:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] Support non-leaf and range invalidation features
 in
 RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246205139.3816447.9006141630589978031.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:20:51 +0000
References: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
In-Reply-To: <0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
 iommu@lists.linux.dev, joro@8bytes.org, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org,
 andrew.jones@oss.qualcomm.com, fangyu.yu@linux.alibaba.com,
 patches@lists.linux.dev
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Fri,  8 May 2026 11:52:59 -0300 you wrote:
> This is part of the patch pile to get SMMUv3 moved to iommupt. From
> that perspective it introduces the PT_FEAT_DETAILED_GATHER which will
> be used by both RISC-V and SMMUv3 to generate optimized invalidation
> commands.
> 
> I don't have any RISC-V anything so this needs to be tested by someone who
> does.
> 
> [...]

Here is the summary with links:
  - [v2,1/8] iommu: Split the kdoc comment for struct iommu_iotlb_gather
    https://git.kernel.org/riscv/c/74c9d82c7e3f
  - [v2,2/8] iommupt: Add struct iommupt_pending_gather
    https://git.kernel.org/riscv/c/f0e4b7f5f875
  - [v2,3/8] iommupt: Add PT_FEAT_DETAILED_GATHER
    https://git.kernel.org/riscv/c/89792629d4b2
  - [v2,4/8] iommu/riscv: Enable PT_FEAT_DETAILED_GATHER and pass gather to iotlb_inval
    (no matching commit)
  - [v2,5/8] iommu/riscv: Compute best stride for single invalidation
    https://git.kernel.org/riscv/c/bb62adcf4513
  - [v2,6/8] iommu/riscv: Add RISCV_IOMMU_CAPABILITIES_NL
    https://git.kernel.org/riscv/c/e4084c6bbb42
  - [v2,7/8] iommu/riscv: Include the dword number in RISCV_IOMMU_CMD macros
    https://git.kernel.org/riscv/c/835d06ee7ef0
  - [v2,8/8] iommu/riscv: Add NAPOT range invalidation support
    https://git.kernel.org/riscv/c/082ad5ed0785

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
