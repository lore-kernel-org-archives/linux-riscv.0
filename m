Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BBBC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8nrcJtTwKF/6JfzREMHPQD7IcVefCShE0Lbzl+wU/g=; b=rbmsbMUtFnnJY1
	pcNDWcyJja8wSPnJUYCpPINsAExCaz0L8MT01Hfrcic4MEV4sDzbbS5ad3hx3WeLUS5wHTYHgQ7jQ
	LKkWu+KuykltLm+6BTLdt/i7FtVsx5hhmeuyeHARbggi9l7FTQNG9Lec594dJ5XFIe/cO9aiGhmQP
	IQicnbCYjZYpUI9FrShXO+tV18+9pct/eQICvjRsRcb2yiHcWtv76vE2Er1PoLEuvE5Ml4/uuYECf
	fc0ty1/3JSC8A5Rvg6nKXKG5VnB5FErhnt+pt37KUGGYHqPJ2mXZF3x3Qc5/9q+PBzQDVYj6Mrj1L
	GHtCwkPHrdgvhQiIMh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nqg-0000000CoPb-0fH4;
	Fri, 04 Apr 2025 20:41:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nqd-0000000CoOg-2CYo
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 20:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8030C4513F;
	Fri,  4 Apr 2025 20:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34C0C4CEDD;
	Fri,  4 Apr 2025 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743799266;
	bh=AI0kAoZDIZzvjuVpxzrPvSOwNQfs9Bm97d8lEW05ktE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R+fxI2bONto3OBk7CYvIBWLBU4PUZxFB2+qiIxE8PHLgtRM5eSHP5Ti1AwZuAOn94
	 vPpUWqPj+4GqlH2UHsz5y5WmIt/0uvy1uujaS+pvOve720qsWJ9t6o8zZvY3yGJMYe
	 CyfZ0Hdibg075G21G4ltEvJFlL4IenOAUmLJlkmsu7s28N6OcNWr4wndneBK9bb/Mq
	 ZtFJIrSKY6SdXfv3pqsP15Bp24qcAzL8fAGZD+UCmb5QxcCfAc+f0ZHGNNIlY3mYfL
	 XXnL0/v3xpjJEDhpDUwFJSbPfsz7bf/FPCgZWC4TE1Zl4fBQYzGbZ6Z4Eh67cVGX13
	 X0dMG0+8A86xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F613822D19;
	Fri,  4 Apr 2025 20:41:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174379930375.3383526.18254951877447594108.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 20:41:43 +0000
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_134107_580072_9DE11659 
X-CRM114-Status: UNSURE (   7.53  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 04 Apr 2025 08:58:06 -0700 (PDT) you wrote:
> The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:
> 
>   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
    https://git.kernel.org/riscv/c/4a1d8ababde6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
