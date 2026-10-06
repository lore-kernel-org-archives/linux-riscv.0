Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EBFCA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2GgXuN2UUSdKJSl9Lw6OqWUxAq4zVbDU4MUpqWCkaE=; b=ENR1WbNMm23FPD
	hvQKkY2uSbkXKt7yYHKZFX19Lv4z2zM+qOOCbH0NEP4mtWoxKrFwcEWWzBfXlV+vvfnRuNBjZ/uB9
	XSnBLBvl1z7eZO0Uo1PAbUOlTZB18A4Ok8/3PV5+fG9DyITSgspXz6KQsAKoyIjkX058PB/eJcNpk
	dnlMvsx9HM7B8Xmp1QNli6RS5GIr7MPEu6fo8MIMhzmtyb1CZxq8m6mhojZS8CTv3nqdX8bpGfoXc
	OQAjD1N33hlG4aMLKv74LWR6MbVjtb2Es+iQtgI7Ojhi8KKhFKoaWXrBu9CLUe8ZT+CB6DZ+IjFsx
	eDj4h4/7JKXlUBzHUBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1ef-00000000P3D-0cJ5;
	Tue, 06 Oct 2026 09:40:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1ed-00000000P2y-0cS5
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 09:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 983586022A;
	Tue,  6 Oct 2026 09:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D591F000FF;
	Tue,  6 Oct 2026 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791279610;
	bh=6R8RMOkwV0EymoYmXscl5Br2ZuN1oYC1fXv6El8aBW8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IbHnaY6EVS3ghVCrRzhMIgUe+eh0bxn1lifep1QqXUOz7qs4qdbjUsKFWd8tb6+FO
	 u+R+z8/Bw39bM58TNAMSpPmO6UU8jUYW3xN1vBnQ2gD3Y0bJ3fUhZr6KZldUvsZtcg
	 LTuQyD7qMV6yIb7gCkEXiX2GPh3jsWeAArR3+y/4TgSum5o5MK3Jh3eHqacEvSG+rp
	 kDjaRIiWMwWQfCWj4RdjTj9nY5P/vuVvjEiQFNsCOvQEqcE8f4KGPScXYJEm1ihveH
	 zNnajBdORx1S0xfFN/faMvY5IFOS1ynH3gnc/SaXd5MpqKkS3CayW0Yi/raH8hW/Vd
	 nwwKWDD4eGd7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2D23927078;
	Tue,  6 Oct 2026 09:40:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
Date: Tue, 06 Oct 2026 09:40:08 +0000
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
 dfustini@oss.tenstorrent.com, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, olof@lixom.net
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
by Paul Walmsley <pjw@kernel.org>:

On Fri, 18 Sep 2026 16:51:14 -0500 you wrote:
> This series provide several optimizations targeting system call latency
> regarding vector context management. Before the series, the kernel
> handled user's vector context in an conservative way, where registers
> were null out and VS is tracked as DIRTY. This introduce excess context
> saving and restoring when there is a context swicth.  Also, the kernel
> turned off Vector at the exception entry, making all in-kernel vector
> usecase take the serialization cost, which includes context switch and
> user copies. The cost is not easy to hide as vector code are usually sit
> right after enabling V.
> 
> [...]

Here is the summary with links:
  - [v6,1/8] riscv: do not read csr in vector context switch
    https://git.kernel.org/riscv/c/5fd018c630e2
  - [v6,2/8] riscv: vector: refactor context switch for kernel-mode vector
    https://git.kernel.org/riscv/c/4740b934ebe7
  - [v6,3/8] selftest: riscv: test vectorized user copy
    https://git.kernel.org/riscv/c/52318cf0fa6e
  - [v6,4/8] riscv: vector: refactor vector context operations
    https://git.kernel.org/riscv/c/1a5c75ee3d09
  - [v6,5/8] riscv: clarify vector state semantics on syscall and context switch
    https://git.kernel.org/riscv/c/cc12e55016ba
  - [v6,6/8] riscv: vector: adjust ptrace and signal behavior for INITIAL state
    https://git.kernel.org/riscv/c/0d4b43a7734d
  - [v6,7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
    https://git.kernel.org/riscv/c/6740ec489dd7
  - [v6,8/8] riscv: vector: optimize vstate operations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
