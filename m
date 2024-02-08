Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12474C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtDZwM47WJpocSSV5YG7K9c8aze3BH/ig2fw5yFbs0I=; b=C2kKahYinojm4p
	nOeT07u7CVgowvD5DPkMgIgm8WGMC+Wgwm1AkJRhhv4wS/puB2p3uMMW6qkR7axjWYy9inBerNSG0
	gycDUtUcgZk3l4aeizDtyejYKOQuqO7HfHMZssdWzRXT41CxWRT1R7PTe4BLdXgW9nzOUlq7o8ElV
	PfOB2fgvn92VeOAYhBkGxKqfzy+uZ5/vZNlq3LDNAMAt6/5DEKOs36ovFTFNFZ+eHytDDA1Gcy675
	1tMWZcVtZFDqNqxdS3slhhcIMlFE2pU0sA5Jf9hPTUF5onZp/VFLnoLKEQqb1WvjX0OsUHir1Vgr2
	DbOciFISZ73W1zzcSlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFZ-0000000COY8-1yyD;
	Thu, 08 Feb 2024 01:30:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFW-0000000COOk-0mKz
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 01:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64C32CE1B48;
	Thu,  8 Feb 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63569C433B2;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707355829;
	bh=LM9rriYZStkud30VJaubR5guh0n/IwnZmlpk5h5RwCY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bgDQTMtPRgF2FFfkL82Uhv8R185R3Ak4jsEKvagyrfNdEIcmeFNq1ufMbkCCrRXpv
	 is/VDTHrzXW7aEpIq7NcXlE5f7d3KeepQXY8zH95fT29sbtev3Sr7GBK8lGtzR2yoX
	 W2NwnieCz/m+2EOrsyF0tmQdgkUwjrFrXCfLuja6w0urv6VmEP/VkCnFTLRqE8z2Iy
	 A+36FAa0hIUxUhKBS+UofXPcDoRKQYJtkU8cSSg8BOJvuPWLYpAmgcinLaErPOwEDt
	 y/lU9wIRsAsbW+lfa+SNwtJukqHG6ee/xbpRimFd9+O8kKW4ZnsRAb59fGG33ju44u
	 hgL2oM5qzvrDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46AD2D8C97E;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes 0/2] svnapot fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170735582928.12826.2812001497496359961.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 01:30:29 +0000
References: <20240117195741.1926459-1-alexghiti@rivosinc.com>
In-Reply-To: <20240117195741.1926459-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, panqinglin2020@iscas.ac.cn,
 ajones@ventanamicro.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_173046_440820_B4B9468B 
X-CRM114-Status: UNSURE (   7.39  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 17 Jan 2024 20:57:39 +0100 you wrote:
> While merging riscv napot and arm64 contpte support, I noticed we did
> not abide by the specification which states that we should clear a
> napot mapping before setting a new one, called "break before make" in
> arm64 (patch 1). And also that we did not add the new hugetlb page size
> added by napot in hugetlb_mask_last_page() (patch 2).
> 
> Alexandre Ghiti (2):
>   riscv: Fix set_huge_pte_at() for NAPOT mapping
>   riscv: Fix hugetlb_mask_last_page() when NAPOT is enabled
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Fix set_huge_pte_at() for NAPOT mapping
    https://git.kernel.org/riscv/c/1458eb2c9d88
  - [2/2] riscv: Fix hugetlb_mask_last_page() when NAPOT is enabled
    https://git.kernel.org/riscv/c/a179a4bfb694

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
