Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB7CD13D9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWMspLJYCmpCiH+ov+dlUIyNDqkzTps0uqZWdAWZxNc=; b=byVhBWOSRbysz/
	jPcENlnYZ6Rwf3KXYuPeOEPmtOmDEa3hdUhvcf7OpYfgxK+gnonzTFypkPaHFzE2eQIKX9QvoNkpE
	GMd577Ufe78U9NnIzwpNu66/al+2DkhQXQvx7tdwO061FeG2U3zvuKxn/ROe+TBcyjuWWzHz1iOba
	hFVcLWAvj+1SWiLB7J60gbKvjItAkWNZzko3tE3qx8aHSgMUWINzUDoq8ZtZ9ohwRPW9s2x9slf+E
	tQimozjwRhJtr5tLnq/9lBQGAbox0qsq71goNcYjnzYWkkoJFWXIvQ28GJazyenI1q44EOmZXGco6
	0N3JmVMAdcTJwJBWL2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2t-00000004WpG-0wbO;
	Thu, 30 Apr 2026 03:26:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2D-00000004WOo-1LHX
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C5F544448;
	Thu, 30 Apr 2026 03:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEE6C2BCC7;
	Thu, 30 Apr 2026 03:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519552;
	bh=UFNQ+eqES3FdywXU8kIe7qagA+tevwyPVBu3bpMtz3Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g+qPrlwnaTfz03fVQHOfWhV2wGp5L+rATgExj6wfLoBx2agS+DrxKeWND9xYvDG0w
	 WVfntITuxkw1gLnTLRorfRxJazpVcTpqq3Ei3kc0ke7jQDxXkJ1q0I8wkfd4kvF+Y9
	 VH6PvGhXWRf2t1NmWxuVIbtgP3d/iypZx3spWQkibuEhqQNo+a9A4lblnDHar1U+2a
	 uYCacUVEhknqyxYY0gC4Xaua0C6IPTHQvwp33RJpXw/hlfa4jTUawBS7ATARqaA061
	 /7EpEN8Qd8GmDiRGfPX3fZ/BFkdquyx7Dy1ijqyufgQEwZOFBvHwJWH9P6P1nyKQsQ
	 SNC8aXKCgt3oQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC983809A07;
	Thu, 30 Apr 2026 03:25:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/6] Convert riscv to use the generic iommu page table
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751950779.2274119.4057431786381222118.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:07 +0000
References: <0-v4-5a9ca1a9b7a5+5f2-iommu_pt_riscv_jgg@nvidia.com>
In-Reply-To: <0-v4-5a9ca1a9b7a5+5f2-iommu_pt_riscv_jgg@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
 iommu@lists.linux.dev, joro@8bytes.org, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, will@kernel.org, ajones@ventanamicro.com,
 jroedel@suse.de, lihangjing@bytedance.com, luxu.kernel@bytedance.com,
 patches@lists.linux.dev, tjeznach@rivosinc.com, vincent.chen@sifive.com,
 xieyongji@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202553_384939_C74A0658 
X-CRM114-Status: GOOD (  13.34  )
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

On Fri, 27 Feb 2026 11:25:35 -0400 you wrote:
> This is a fairly straightforward conversion of the RISC-V iommu driver to
> use the now merged generic iommu page table code.
> 
> It brings support for SVNAPOT which is a 64K contiguous page. Otherwise it
> should not change the behavior.
> 
> The series disables SADE as the dirty tracking support is not implemented
> in the driver and should be done somewhat differently. The generic code
> gets further along though this does not include the format implementation
> of read and clear dirty.
> 
> [...]

Here is the summary with links:
  - [v4,1/6] iommupt: Add the RISC-V page table format
    https://git.kernel.org/riscv/c/e71e00127110
  - [v4,2/6] iommu/riscv: Disable SADE
    https://git.kernel.org/riscv/c/e93e4a6363b8
  - [v4,3/6] iommu/riscv: Use the generic iommu page table
    https://git.kernel.org/riscv/c/e5ef32191a87
  - [v4,4/6] iommu/riscv: Enable SVNAPOT support for contiguous ptes
    https://git.kernel.org/riscv/c/69541898b71a
  - [v4,5/6] iommu/riscv: Add missing GENERIC_MSI_IRQ
    https://git.kernel.org/riscv/c/c70d20b25ca3
  - [v4,6/6] iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
    https://git.kernel.org/riscv/c/7cd0c655f02f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
