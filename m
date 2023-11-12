Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5C8C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/43N4+ARAsBYx8kBsfjFay/tpV67/e3C4LtWyNPBdY=; b=MxuxJ37vKMvA3z
	DsalSAtNoLe6LNpeOKBxvhDSczstc38hmZ5+bsryjzXcGaTRTkSLoTzZxU3ay/dJm7ojrlMYpUiOO
	kTtSa/Kjl8HRsnxUa01FwGvHZHnwGTnmMJwVPFa6l3ZfLWMWp6sDjeXfZxSiU7ZtxG2YircUr13rT
	3uzOA0mlenh4VBXKWJXM0TWNoMPOMHmAgfi3gAUwINLr4w2MVj80939Xn6k+5ZPQx5FgPs7GxLqMU
	vvO8jF3rS6zTU28s6PJVmwLNG6jMv5fMAmgSR8lwCe5DspC5/O7BZ5DCVFYgWiAarFwW7gxx7oh8h
	CFXpPYdF1J1DKRWpO9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylX-00BWmI-0x;
	Sun, 12 Nov 2023 00:55:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1ylR-00BWhC-2t
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 00:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 99725B80760;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BE13C433CD;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=uwSYhoJGjrvnFMdxDjEZiJOR3nt1YfMreVZ/T2Dv+hw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XNBBHv9eHQp/Z6l4k9c5NcC5YsIo8pDl+fvRJ5scAEYpVIoWr7GZu+ub2rCHIzket
	 Ie+eKE8oK9wLGtvBLS7r+xI/B6KugX0WE005mXpgRbmG+XI7yGnZvSlvehXLdZ4q6D
	 nP2QGCdvbxGwcB5+ZAFmWAZN+Ya/A1rFB36hc5CWt/GgSQ2lVeaKgg3Xp6WV89EXf6
	 kgxQ2kC5b1dwMg08GI13fkOpTrwFiGtvghFHyGAoTUFiZRyHvu4CBM1sB11oEPB8Ar
	 3k6MbiLkyF28K95zlgEybVq1cltRlruf+96/EwM0L8K599HcxIyGfzKaJ/rg1Zl026
	 o9hXrL1oEdnFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54C48C3274D;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.7 Merge Window, Part 2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054634.11360.7607646896972532722.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <mhng-9011bd86-9f72-4223-b78a-b4c69c1c927f@palmer-ri-x1c9>
In-Reply-To: <mhng-9011bd86-9f72-4223-b78a-b4c69c1c927f@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_165550_080235_78616988 
X-CRM114-Status: UNSURE (   6.52  )
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

On Fri, 10 Nov 2023 07:48:39 -0800 (PST) you wrote:
> The following changes since commit e1c05b3bf80f829ced464bdca90f1dfa96e8d251:
> 
>   RISC-V: hwprobe: Fix vDSO SIGSEGV (2023-11-02 14:05:30 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-mw2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.7 Merge Window, Part 2
    https://git.kernel.org/riscv/c/56d428ae1c4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
