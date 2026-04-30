Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8158CCD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZrV0xQXHAh6qZVFMlhyvEpVnPENYhrNtPENS5j7IOo=; b=H/qSAU/FkS2beB
	r7x7pXCLz4IpWC5Aja6XK8NJKvv1eU4rPj52dNMEYqZBta3hECxusKGVqAfXFEjsuhmsGeyXl+SwE
	T9Te05/i+OzyWw7E+2gYLY+8oRKBYwFI/LbqIw7mxUOHFZSgaBMr91vPp8Do+2fpkRKabJb37wYxk
	VsVNj3Mn1wMUIjvpDZHGGjWCHKGVn5SwqCnDxBAzf9LPq7nPUMUD3bS4bQ9tLHCWAS/DNg9ehNUQM
	Pc1LhUGqUnIVF1vLL51ZtNgx4YcTULaXKs4QtIeDFVfdbLq/o/ErIszsFD7cZenTtfaIcGCftY3Hn
	heg1H2acGQ2ze2d8MlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3I-00000004XMd-3U9j;
	Thu, 30 Apr 2026 03:27:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2U-00000004WZV-2oAC
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E71E4457D;
	Thu, 30 Apr 2026 03:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310ECC2BCC7;
	Thu, 30 Apr 2026 03:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519570;
	bh=MMezDMVVjOGv9weqyAZbIsRz2DJ3hj00P7r6+llifw4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vRz+s+9cOCsRHbqoqF9y7TN15mN/t4/9y/aFbWHbpYIG3rFsaAN0ZWWnZ2figYLFH
	 qT0+vFYiTpcJUDv6K5E2yw0gaZzcQqYtf0ghbw54gLZwsSfpE55l1HE/BpoB4X67g8
	 iJvxiIl2YR5VpH2ISyB7KAiTe2rsIoPsu/ewK8OPaszr9oFFOhkeMvvN6d4ZGtj2tD
	 /niHYE+0B27p8MTHXsbXjLboVTrLQyIoSFRfGpstoQGU1O/mfEHPflSpiOTAaRzp50
	 8uLjSSyzUJslLvLFg4VO8nycygv6v4kX2p17ejlhyQCsZE+Rtmu6AkyOKAywW0PcMt
	 52QngJhEtYsFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEE53809A07;
	Thu, 30 Apr 2026 03:25:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] iommu/riscv: Add IOTINVAL after updating DDT/PDT
 entries
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751952504.2274119.2285271071573350641.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:25 +0000
References: <20260122143224.25146-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260122143224.25146-1-fangyu.yu@linux.alibaba.com>
To: yu fangyu <fangyu.yu@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
 zong.li@sifive.com, andrew.jones@oss.qualcomm.com, guoren@kernel.org,
 ajones@ventanamicro.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202610_726417_A711B186 
X-CRM114-Status: UNSURE (   7.23  )
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

This patch was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Thu, 22 Jan 2026 22:32:24 +0800 you wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Add riscv_iommu_iodir_iotinval() to perform required TLB and context cache
> invalidations after updating DDT or PDT entries, as mandated by the RISC-V
> IOMMU specification (Section 6.3.1 and 6.3.2).
> 
> Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> [...]

Here is the summary with links:
  - [v2] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
    https://git.kernel.org/riscv/c/f5c262b54497

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
