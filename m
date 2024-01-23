Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8888C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mrm6yGkhZLJG0rlvtLPLzfyYqmp78n/fcXEWaNJNZsc=; b=OWcaXHhyYtCzSD
	Nc3qEWaaKbi9Pw0Sv/QJE76zLFLqIjR3TWOFuXzFkqmIv6JqXWpOpiCaGVmGiBZO2wamIAiwGg6tH
	K3EW1dk5cgdk7yYgp9+4yhYTvZN+B04oHAJCLsppLX+l6xTjQpg6qquk//mja8YKEJ3iQ8BdrAnLF
	JHdg75bMXYNren8J0pueOnob5N+Q7sfNLANiSMDR2hTfPq+UeYTWpa6YRvts59if6ODeUQNpzQj1r
	BWUVhkKN3uhlsvjgTcukKkh5rYrBH4O1/xcArQgzUtfdwyLVUW+WhrnG6evdLqh5dNV5eGMN8J0Kt
	PwPdWaNTMLSwNeM0vvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKux-00Ha7z-2M;
	Tue, 23 Jan 2024 17:50:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKuu-00Ha6A-2b
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 17:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A2BDCE2FB4;
	Tue, 23 Jan 2024 17:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B98EC433A6;
	Tue, 23 Jan 2024 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706032230;
	bh=awxAMzYU9HaDntJhzA+a1+0udHhkZHo7Vmb+bJNuLog=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U4uUotORjnduHiJnhga9a9iSC5xexNraKM47i9W1TViRCenGXQS8oRUX8UCRh6rfu
	 YDW2oQBDn5cpyw5zPINkhy0C1lPJucdgs9c550n77DCcw3r52DD9IyfH/Xca5g0v/L
	 OkLkDoymMEcmVgxBuoqvRSRi6d+/a6EXQLl6RvKWzRW9nw6xToH/XeMMhq1dW89X37
	 MJKC2z0Jb1456T68ookjB95wDYtBBOKfuua69vH9xLiOfMncbdpERuXeIMZrqqWu9Q
	 2nu2froMu5VF7WV81pR8B8D5CRR/BOB1V0RESAs6N0proOmCD8JYCZqBu0j5VYMb92
	 82kr8pvY8Zh6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E781FDFF764;
	Tue, 23 Jan 2024 17:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] clocksource: extend the max_delta_ns of timer-riscv and
 timer-clint to ULONG_MAX
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170603222994.30461.12710346561077104850.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jan 2024 17:50:29 +0000
References: <20230905070945.404653-1-vincent.chen@sifive.com>
In-Reply-To: <20230905070945.404653-1-vincent.chen@sifive.com>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_095033_021151_A14F9A0A 
X-CRM114-Status: GOOD (  10.88  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  5 Sep 2023 15:09:45 +0800 you wrote:
> When registering the riscv-timer or clint-timer as a clock_event device,
> the driver needs to specify the value of max_delta_ticks. This value
> directly influences the max_delta_ns, which represents the maximum time
> interval for configuring subsequent clock events. Currently, both
> riscv-timer and clint-timer are set with a max_delta_ticks value of
> 0x7fff_ffff. When the timer operates at a high frequency, this values
> limists the system to sleep only for a short time. For the 1GHz case,
> the sleep cannot exceed two seconds. To address this limitation, refer to
> other timer implementations to extend it to 2^(bit-width of the timer) - 1.
> Because the bit-width of $mtimecmp is 64bit, this value becomes ULONG_MAX
> (0xffff_ffff_ffff_ffff).
> 
> [...]

Here is the summary with links:
  - clocksource: extend the max_delta_ns of timer-riscv and timer-clint to ULONG_MAX
    https://git.kernel.org/riscv/c/d38e2e7bcb3e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
