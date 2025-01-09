Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EF8E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4/Z54G9t1yj5dKVDmpTGsz0vuRs20qrR4d4u0ZWsUs=; b=nzA5C3Ic3rhb+u
	AguMo4pVH9guh2SH5YyYO/Fkujvm1cjAMMLWsTrRN9pu8fZxTE1rOVeiIC5fTcwR/T2KUb61sATvP
	2mcWuLUz0a1Vffs3UjbtOqSO0y0CHtwjvEZVWaROb5pBvkoLbZTYbc3tVPZmJ2LsK8RgEQk3AC7HH
	qCHp5PzDB5+lAJ2+HBm74Y+QKJ2LrNEB6Ay7KHyHklmeD1gixOlZfcjtsoxQrSlgWW28SASUtbPQd
	Raf42AFiQ55KKuT5tE1y2jaBPDgSkDSS5gktj39H+otw9i/mMSW/K4bll3iCCxjhz7VaV2ASL4czL
	AaecBLFDrrK7xNldMrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCw-0000000CdlJ-0Cm0;
	Thu, 09 Jan 2025 16:16:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCs-0000000Cdj3-2B6S
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 199835C5C83;
	Thu,  9 Jan 2025 16:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8465C4CED3;
	Thu,  9 Jan 2025 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439385;
	bh=P4omZiuNPKRvfWFtFyjMMe2KlP1PlaCHnveL+GNvOfc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N+OLsBxL39t8/zEdqoVMIaKdv36/PzzEpTg0c+I4Q1EWxTh/txmYM74trpiwWY7Ge
	 +HomxJCp7LzH11ryhNdqZYqv2cLHXonQdgTwxfcTHdjNKIfgORR5JZ65k+ZQ5LBsKf
	 idHWrcDQ5JALk7kh7AiDyJGNN84EU0fD5iAQm/9/MWFO4to1CiURqBUeKHc9ccSqZV
	 NuysTwK4b7ijzXHqVV0cUBs0hx5fH52d+86DS/EbnE3zaSCpCkzYFsLm7StwPyiYPm
	 y5pAvjwmJuIcTssK7SkuHYB/9qXjG91eFsNPO+17i+DkacNMunuhUqNX/WUBnh02uv
	 inXLIsHNV/6tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFCB380A97D;
	Thu,  9 Jan 2025 16:16:48 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: stacktrace: fix backtracing through exceptions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643940723.1375203.17763630478007232527.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:47 +0000
References: <20241209155714.1239665-1-cleger@rivosinc.com>
In-Reply-To: <20241209155714.1239665-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org, antonb@tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081626_592827_AF09BCA1 
X-CRM114-Status: GOOD (  10.15  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  9 Dec 2024 16:57:12 +0100 you wrote:
> Prior to commit 5d5fc33ce58e ("riscv: Improve exception and system call
> latency"), backtrace through exception worked since ra was filled with
> ret_from_exception symbol address and the stacktrace code checked 'pc' to
> be equal to that symbol. Now that handle_exception uses regular 'call'
> instructions, this isn't working anymore and backtrace stops at
> handle_exception(). Since there are multiple call site to C code in the
> exception handling path, rather than checking multiple potential return
> addresses, add a new symbol at the end of exception handling and check pc
> to be in that range.
> 
> [...]

Here is the summary with links:
  - riscv: stacktrace: fix backtracing through exceptions
    https://git.kernel.org/riscv/c/51356ce60e59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
