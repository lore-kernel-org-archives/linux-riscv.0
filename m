Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE34FFF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5dyk3x++xSRDU1nYBh73SOXO5ve6HY8l9/gQBhlxj4=; b=MxKsr0XNABkAv4
	w1McelWl++5Na+9jkJV/VIy62KTHgRiIGQt3APAY7ft+QKN0r+PZACjAfJKoxjpqsrbEd/TjeygCD
	P10rZDFaFRdPXMIR68OwTl3WgLKtzopt10/bBjVZSC085bcqKkSuwfkQgkJ1kxe741JgkH+4mcy7f
	d8clV/hR8zxTPw3mVCykj+Ke08MvPc0X9ufQxtUcNquwHKl/MoFX+fXNkIqus25mezPKrmiiaFcJ1
	eOv739wBl2XMfFn9YejxWP2/TlpVSwMZZsfjT52MwAzZo2mTtBpJh+KqPygTrWE6Ej9Qx86crkx/s
	frGIEbUzBTmkDtr5Bkyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2D-00000004WPK-2v5K;
	Thu, 30 Apr 2026 03:25:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2A-00000004WM4-1VWC
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 167CF44582;
	Thu, 30 Apr 2026 03:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E227AC2BCC6;
	Thu, 30 Apr 2026 03:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519550;
	bh=bf9N1lmqNBRR4cIVIcMxpRMRBVYaYxFxFZFFSaNWAbo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sQg9tw19l26pKIEAaTWTTrMrVng1y8CfhjVkuxiL/K8qDP/2sWlnpq1Q2MwIv88DY
	 lRX+ec3eDXDHDGtsvrU0OmCpk2dKd6zzLsnNeve7SjamJ1zLcSI2H6inxNWVd4nA9e
	 FTogk1HoPUVrHXi5P9gJNdfFgCZr/PxAlezY/CYGu3vvQ3GT308ccyX3/mVX7GIlfK
	 iy5Jsym+EFDKXgoOnT2OWLTEyC4n6opnRobjCbRMLqYJPS0Ug4VY9gUcH8SsAROvnG
	 37yoqS0fi+Aiis7mglxA0RWdpjKwpnBvvDfbrJNnX5yL8Lr+xqW+r8U7Hc4vjk3UK6
	 ygR+y8wx1Z4LQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD2F3809A07;
	Thu, 30 Apr 2026 03:25:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] iommu/riscv: Remove overflows on the invalidation path
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751950479.2274119.1171635926750026675.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:04 +0000
References: <0-v1-0f76ffba5af6+11540-iommupt_inv_riscv_jgg@nvidia.com>
In-Reply-To: <0-v1-0f76ffba5af6+11540-iommupt_inv_riscv_jgg@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
 iommu@lists.linux.dev, joro@8bytes.org, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, will@kernel.org, baolu.lu@linux.intel.com,
 jroedel@suse.de, palmer@rivosinc.com, patches@lists.linux.dev,
 tjeznach@rivosinc.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202550_421404_F39740AB 
X-CRM114-Status: UNSURE (   8.65  )
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

On Fri, 27 Mar 2026 12:22:10 -0300 you wrote:
> Since RISC-V supports a sign extended page table it should support
> a gather->end of ULONG_MAX, but if this happens it will infinite loop
> because of the overflow.
> 
> Also avoid overflow computing the length by moving the +1 to the other
> side of the <
> 
> [...]

Here is the summary with links:
  - iommu/riscv: Remove overflows on the invalidation path
    https://git.kernel.org/riscv/c/40a13b499579

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
