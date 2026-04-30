Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8ACFF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 04:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzyXsql2i9oe0nUZJZkQ/TZ3GZdrrhrr2lcbIu++4nc=; b=esADDES1BApc9Q
	z9lmFscVAsFKr+CI1uaeNkzersyEryAR4eBIU8DxuEYSkoSe3C+k0pJ7izV1tG66/Z2chorX8LLO8
	Be/D06ET27D7uPwHDUzTNicCDECXReQgSHc7D/dWCEnz68jMRK4+bwydUHPK5ITFyVWh+LS6OyIni
	UL4OpqlMi2JT6D9KrGZEulV11YPrUoBXHIgyfxZb4jW4+wB2cG1ANIURq/wh9dDaZd2pGlQSUd6hE
	19i/GwHB67UCm2TsRGoNvYJApPITrp8CRGayZ2q5BgsrIN3WrJyqf5x4uKrQZHFlaEbE9Y/8gcDrE
	L77kx4wYAYhOhN2aHw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIiS-00000004e1c-3IkF;
	Thu, 30 Apr 2026 04:09:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIiI-00000004e0H-0m5Y
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 04:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C6C4418AB;
	Thu, 30 Apr 2026 04:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1E7C2BCB8;
	Thu, 30 Apr 2026 04:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777522161;
	bh=Ktbpf0yUOm3W/1VP8Z7n1gHDrM5MjGbFwY6KPg7YrwY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XN4CkeKCbhiDpM0RK+07j9+wK8cHWk3dbbFmdz5jpHY7HaRPhlaObZKeqTqBqCWyO
	 cFf3V/fBkpdTO46SlzD23e7vrR8MLvX+JKLzA//eDFWqxYTxXNwEiEfmQ7ft8yJ563
	 AzXGYrnijkp1RVaT5prdLvzguvVXzbBZTI59548rwJCmuZxE+coDDDnHBMfCkYorex
	 nIS9569aeiVwbUM/SpDt2wm28csUPKW0dsS/7g2E0bcq43DlyB8KWLICy6Ox8JJUWP
	 FicpxdPw3ULlmEosjLwj6huoR2nD8jUMz7hbcgOg9wjqKdo9Hvj6pnecYc4ByITEq2
	 RiN5gBc3He+RA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0BE3809A07;
	Thu, 30 Apr 2026 04:08:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v7.1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177752211655.2274119.2873579149327343188.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 04:08:36 +0000
References: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
In-Reply-To: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_210922_266288_3CC3DEA6 
X-CRM114-Status: GOOD (  10.17  )
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

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 23 Apr 2026 18:07:29 -0600 (MDT) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v7.1.  I'm sending this pull
> request much later than I or you would like to see it.  I do not plan
> for this to be a regular occurrence.  My goal is to send RISC-V PRs
> much earlier in the merge window (if not before it opens).
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v7.1
    https://git.kernel.org/riscv/c/feff82eb5f40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
