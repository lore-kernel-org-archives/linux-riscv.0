Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E59C5B549
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X11bqw/1XxDY6zuWQ+VuDrip1OwShSrdUhwuC5rSeeM=; b=vckAiU+hijRzdo
	w9ul3Fd9Z6szgHGXKrukv4W/4X5qo5S1gf2fCP4hVTv0Au6oW+jnIlgmI1DGAAb461pqUizSqjymr
	4F/72e+XRfAaaK6ae6cAv+2qFdZo0NjTnu84XmE8HJ2m9/JNhW7Sga7V1tXhoi6VRnd4WizvVA3YV
	VZxarXx4zbLq62MlFcI1GArNb4WQyHyHj91IyhefBl+1y3j8h8K1X4vcqHJMumBLOKeO4ocCRZaRH
	Ji0mcThnKehnZX1v29TFplNK6l5ULoihjv67fjOm1aZQml9QEsIeiHUEUicK6aqX2j+bBXypTLqab
	v+wBfTZqq8ethNbZsu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO7-000000099i5-03Va;
	Mon, 02 Jun 2025 22:12:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDO3-000000099fc-2BW8
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79B90A50437;
	Mon,  2 Jun 2025 22:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287DBC4CEEE;
	Mon,  2 Jun 2025 22:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902326;
	bh=rsZx61t60Jc54DaNK6EBwyF5d20S6nRe5Uf1+PLgEfU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZoNFcWrac7Dpr5Il7/P0vOiPnRMCNXXlmlHQto8kbJ5Fa7koUu91+nR46VUmeNEz4
	 fbURMllcifXrxFyQQZkcS+V66PAmjR1zjHNuGCEL7WWn6Xptp8WoOo3N+hMTDLYxkI
	 5UIVp2HHD1goF/xvsNrB462+7BDTf1Wco3vefuEUcucixxl78i+2MwVyfG7av0ORDy
	 cuYJlX8oBovEewxmrlkbdFSQ8QvAMl+VPGcU7QjhCoLNDExplhqTjHIyWGYVaCtNJp
	 IjMYt4ii4/lmY8f2uP9kceTiRhBlrAzP6dOPk5aeiq2fyqQRkf6xbFC899r1oNEGs6
	 6KRTybvoKAplw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB038380AAD0;
	Mon,  2 Jun 2025 22:12:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] riscv: Add Zicbop & prefetchw support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890235873.925497.2365799693882283939.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:38 +0000
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_151207_625248_90016F5A 
X-CRM114-Status: GOOD (  13.05  )
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 21 Apr 2025 16:24:37 +0200 you wrote:
> I found this lost series developed by Guo so here is a respin with the
> comments on v2 applied.
> 
> This patch series adds Zicbop support and then enables the Linux
> prefetch features.
> 
> Changelog:
> V3:
>  - Fix typo (Drew)
>  - Split first patch (Drew)
>  - Ensure that the bits [0:4] of the prefetch insns are zeroed
>  - Move PREFETCHW_ASM out of ifdef (Guo)
>  - Remove CBO_ prefix for prefetching insn
>  - Add prefetch (Drew)
> 
> [...]

Here is the summary with links:
  - [v3,1/4] riscv: Introduce Zicbop instructions
    https://git.kernel.org/riscv/c/b81f148e583b
  - [v3,2/4] riscv: Add support for Zicbop
    https://git.kernel.org/riscv/c/120068a68961
  - [v3,3/4] riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
    https://git.kernel.org/riscv/c/46a47d7a42bb
  - [v3,4/4] riscv: xchg: Prefetch the destination word for sc.w
    https://git.kernel.org/riscv/c/993d2e054b05

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
