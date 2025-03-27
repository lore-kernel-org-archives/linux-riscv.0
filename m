Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A0AC3600E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zB8TY8mFPAQJkv8VzJMGBQigwbM01rEg2r9KSR0hp0=; b=iAvAlLCY4joQ8j
	XeHhXox3F3OmhLQI1ojJz/CIhC9AdHgN92UAr7sljw1X3nEe0CJh7X9SkR3eKywNWE9n2ibPMHr8W
	hjEIk1NC4NaaenW4mYN16Xk3wMlJt5wO8ygZB8zXyJCuMM2VHvyeG4vSYZkloghrrvn2AELbS9O7a
	tgDOFl9guTuMoi6QFCoG5gt1K/bk5/QvuGs52a5WqcFRABV7/Y/kPxq74V2HvIq2zKNObuJBKo3tX
	yi9vu3gft2g4vTk2mc9UhOuCg/NOrkY491Yhh72CgjscZY99F9Q47TWAwgg5pVlojCLNc0bPTydhV
	oe4l19YZeAmXB9JmCS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqh-0000000A46A-48gK;
	Thu, 27 Mar 2025 03:24:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqg-0000000A44X-08x1
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3D956116A;
	Thu, 27 Mar 2025 03:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226CBC4CEDD;
	Thu, 27 Mar 2025 03:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045845;
	bh=a/1dhKQZA9WXAV4MchBNrnu1u3x/RKB2nhabVuvLdEE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tInMVZ1xbJKBmdRpo+3xhaTiRiIWrjOXUZs/0F85DjYlRcH0wI1SCYZjItLpGdq+L
	 ZG9Ud1dGEe9NJIPjatI1q+PhyksJnfGvTebWgThuBEHz/jJz/Avyp9Pi48LP1u+8Rv
	 K5vXSuMK/LKY+M7ag4OzmQg/6IY3T38m0nIuMbC2KhOAQuFy51mJqED9RypFuuoIq4
	 7fZP7wvtSVRdmbGdBOSZObyg1skDOxnG4FqAu8D8Nlhcqwaa8xVqHh9XwQm37JE9/q
	 KeDfpIPeAkI06LwAndwbYFvopRIEaOKtH72MGLxZPIHjLUrMMoLJjDHgUawqEiSGAP
	 opOo3KmyYTNPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCBD380AAFD;
	Thu, 27 Mar 2025 03:24:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: ftrace: Add parentheses in macro definitions of
 make_call_t0 and make_call_ra
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304588138.1549280.9624481038618834667.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:41 +0000
References: <tencent_AE90AA59903A628E87E9F80E563DA5BA5508@qq.com>
In-Reply-To: <tencent_AE90AA59903A628E87E9F80E563DA5BA5508@qq.com>
To: Juhan Jin <juhan.jin@foxmail.com>
Cc: linux-riscv@lists.infradead.org, guoren@kernel.org,
 guoren@linux.alibaba.com, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Thu,  6 Feb 2025 13:28:36 -0600 you wrote:
> This patch adds parentheses to parameters caller and callee of macros
> make_call_t0 and make_call_ra. Every existing invocation of these two
> macros uses a single variable for each argument, so the absence of the
> parentheses seems okay. However, future invocations might use more
> complex expressions as arguments. For example, a future invocation might
> look like this: make_call_t0(a - b, c, call). Without parentheses in the
> macro definition, the macro invocation expands to:
> 
> [...]

Here is the summary with links:
  - riscv: ftrace: Add parentheses in macro definitions of make_call_t0 and make_call_ra
    https://git.kernel.org/riscv/c/5f1a58ed91a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
