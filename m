Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB4FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6fRq2iBg896t0ziLPZGpiI2XkAW2a8Ff25uo0if9AA=; b=gJoSdj1v4p8bhG
	Dm4hc+QSa/2pIdIZoH3gxnc9/E424H1sHFjqcfCGq135CnfBtM4tT92+efmy39Ov6Ax24ObqjNblK
	isdKIoRAcKkdZ2mgM7IdAXHlrB3ohuOgqD+JZVRX0qfw4BiomwAusH4gXNSXI0XwvzxHNb1r5aR+V
	kx0RiqRFhxWyRjZ3EEakUTSoGiG09iEkUd9cfJRwVO+E4kY6DqpdqX9g5dr/ASqnOOITgOagS36ss
	EO+6bnrLM6u8PLZj3Mzs3ubMErqyuvnYdBelo2+iQal3m5Af/ptu2DR+/tbaIVHtU5oQIG8PYjm7t
	SJc2PML1KnzGMxf3tnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3J-00000004XNY-0kUw;
	Thu, 30 Apr 2026 03:27:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2W-00000004WaO-1LfE
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C72C44526;
	Thu, 30 Apr 2026 03:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22F8C2BCB8;
	Thu, 30 Apr 2026 03:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519571;
	bh=YfC1QZZ/UU6y93F8yKnC0I+PiZBznMVQxb/ENiqO8b8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uwbKJYTRnPuHgHvmKVgiZN5bsbZmlaIPFFlBoSY4hQQVZt2jEssn+r90LgoJKtfVh
	 KYwquO77vUHjYWVQseqKU/ZfPgsvJjnuLok91FGW3PAAStr4I8xkw75ZrLomu6rkW8
	 ZG0ICIO9l8v8ED7E7mUYB4z1+rfgqGIIa92KGoNojnIg6dlrwbekebnofjiZ40Ux6s
	 byVyqhPJXTDD9DZLw0KyoTnPGOpkYrUM3wXgQywkg3pYdcAeUceTsrtQaMdEfovI/R
	 dM3t1lhgAWs7oL8wzCHEhHxEKE0R1jWI7QqtVJQw2jbsuZ15B2PXSOITwn/RMBSQuE
	 6mc9GOTRHcSTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDDC3809A07;
	Thu, 30 Apr 2026 03:25:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] Convert riscv to use the generic iommu page table
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751952688.2274119.13814163549347100067.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:26 +0000
References: <0-v1-d3317b0ee398+50-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v1-d3317b0ee398+50-iommu_pt_riscv_jgg@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
 iommu@lists.linux.dev, joro@8bytes.org, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org,
 lihangjing@bytedance.com, luxu.kernel@bytedance.com, patches@lists.linux.dev,
 xieyongji@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202612_381932_7422C804 
X-CRM114-Status: UNSURE (   9.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Tue,  4 Nov 2025 15:00:39 -0400 you wrote:
> [ It looks like the precursor series will be merged, along with VTD. If
> someone from riscv can test and review this it can likely go this cycle
> too. I couldn't even slightly test it. ]
> 
> This is a fairly straightforward conversion of the RISC-V iommu driver to
> use the generic iommu page table code.
> 
> [...]

Here is the summary with links:
  - [1/5] iommupt: Add the RISC-V page table format
    (no matching commit)
  - [2/5] iommu/riscv: Disable SADE
    https://git.kernel.org/riscv/c/e93e4a6363b8
  - [3/5] iommu/riscv: Use the generic iommu page table
    (no matching commit)
  - [4/5] iommu/riscv: Enable SVNAPOT support for contiguous ptes
    (no matching commit)
  - [5/5] iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
