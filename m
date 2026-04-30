Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F788FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ar0u1TAzOlHrMEb3rkBJ1aL+ojfy326kXU7wSoTNPEk=; b=nsb01FpCoVFfD9
	/0XHulJqQQPVHw25LWjTloC7GvaTKyB8T3H3FsxcCCtCHkFDSiFeUWj7Jyea/DggLUJFmwB2g9uWP
	bwID5LvoapuRXqb42K+hvSfSIG6vxrq5celwlf3lrEhzC5jUTL+efJEHI+yYXNIXsk8froe0SJLs0
	Luh0tp9LczUDSyC9cVlervX61rv0SBHD/xzE2RLRtej/TzOjQSA9HvdBRf1uXdxLgzfY3w79CNYii
	aV3H8Z0Lca1BU9q3OnbQ/EUlgvtTyRFf68/cH8UZ8pDo2pCzW/gtKUCMe7oCp4qXlgIBEIQcdGlfl
	xjgUZYwc2pHedi4f93Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4H-00000004YOL-3gm9;
	Thu, 30 Apr 2026 03:28:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII30-00000004X1y-3e5E
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DA00445A7;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B5CC2BCB9;
	Thu, 30 Apr 2026 03:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519602;
	bh=oOqTJz6+oGeC7nxSzHHie9Uo4ZcI66wvOXUSWcZByso=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lTp2pmXA/4Ix72Fy7WWJ9qNn1wSjsAloemMTyLOiYMbJ5ifPVk2xD2TqfRnuJsopR
	 7JWDq0A/kaqf06j6WxmEk+fCHLnlX9PQaSdoj8ooz6ePF1A7bNRiIce46qQTZa3XV0
	 XJbXS3mxeFaQNnIYUVbDInpsV1kx3kHjLk9FmQu23HzvnFQF41uirWQ2aP+s0l/zmt
	 aIHo1beYHvknsfuUot2tDWTtfA0kwd0QCxjj6L52xjzRsO9tbBiflBMP8gqsSSltb8
	 zA6d4Vqpw5XAR4XFtiDwyAaZDSU+uGWtBOEB0SXi4ipX03dRykUUS5ZloEEfYGv5ge
	 ns7RBe8l1tZMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA4DB3809A07;
	Thu, 30 Apr 2026 03:25:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v7.1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751955754.2274119.15664736705901088247.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:57 +0000
References: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
In-Reply-To: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202642_948114_EBC56B32 
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

This pull request was applied to riscv/linux.git (fixes)
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
