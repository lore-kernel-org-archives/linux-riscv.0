Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8F3606A334
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tHI3CxJr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U17mrsiF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n9+VOmFv8QvSMKXzXQMrSZ9tTlgzvQztbxc9ecnMgvY=; b=tHI3CxJrpAKF22XhPuBv1v7Y+2
	YeJpPB48h8MBsk7BQsBk+mkWXsvvfv20baoRv/AXK/JvXy8KWgXZHGAYVP3LBfqn0GtuYxYx6JYKD
	smmQfH1b9q2WiAv1lpRhpRwyx41zJHFftDK5MV2lBhok7+KJLWS6bsuc8oynFYz9dsxF2eD+nsiqq
	AXI0jGXbDa37QCU2C7bO+iTa3iN1yF/6dyuqIDpnYW7L35CHMYVZEH8lmEbXpWP7ep7jxt0EPA07H
	WyBdKymh12k+yet7S9svbkxhCkjVWmX4U7g2qTtZyikhyU3Az7g4OnlDulQE9dWTPXCJ4WpVjzlbT
	BJ0+4v5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrn-0000000F3hg-3t2r;
	Sun, 01 Nov 2026 22:17:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrI-0000000F1rz-1oOB
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C93A6025A;
	Sun,  1 Nov 2026 22:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523D31F00A16;
	Sun,  1 Nov 2026 22:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571419;
	bh=nX9wbUjqzB9m4WCjSMCeEkPdiA1kFI3uH4dgYr5NhHc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=U17mrsiFIlmivT7Z1KlGuXKWEGRIW5laxD3b0f+b513X7OK1WGMNA8q8DqHSqZoTp
	 dlXmYgFBi4TBStkiUkyNuA1Si2KYVt1GI6FKTxl2gWcCUUsO5h/hD9jb83U1KPef6N
	 zLOxHhlvKfsoWA2iXtY4yU1tq5yHV+StmS3zGcVcfQg9SL4gSikHSTPdWsUsk50mIO
	 a0tEVh8ys5+O+hpWXysw05hR5g1Ohy6TXSgOGTdR3DEuOM8XHb/skK4Yon0Omhae3E
	 RPONtRYmcYuaGw0l2nqukd5wGRPNLjGHzaa2xDNJ1D/z7/O0p36mu4VgGbliIL2o+J
	 ost03wVWiZsGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400A438003B8;
	Sun,  1 Nov 2026 22:16:59 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v7.3-rc7
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357141780.2624073.2430346439842888636.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:57 +0000
References: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
In-Reply-To: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sun, 11 Oct 2026 00:05:14 -0600 (MDT) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v7.3-rc7.  There are several security
> fixes, a significant strnlen() regression fix, and several other
> miscellaneous fixes.  My intention was to send these earlier, but LPC got
> in the way.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v7.3-rc7
    https://git.kernel.org/riscv/c/b2d929a1c2a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
