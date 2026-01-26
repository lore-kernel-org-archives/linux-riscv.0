Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD9C88E43
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBrZTSQrfqGQ2eVv25iFG9bRwr04VtAP8UBl7uvKcW8=; b=O0hhZr5roIA11G
	ZBr7pFnuEabgXTYmSXJJ1mmuwHMxcpf4JrdE6sG8rhxDR3uVCHTT3BvG/yCE48Hy+mQ1qBdq+9ffb
	i99WHZjYd5v+kJXGUKl8dXUZPHnKiHwjilJNuargCFnzTxkwBSQTp8l8pR658DHtL7vqoq8QkRab8
	LTnYhdvPgCShYEzPuwvwIu8TE8zKGFaCNByFxgwrnUKE8ANUoiomCqMqfH5656YhAMVAdfWfOJRwk
	7Kf9VxymIYvIeUpeSvc8NkiyOepGRNy84NdrcxcNemOn7cYLrW9R9/WDSxF9F6lixmOSHooW7/F93
	WrhVZE1BBUvoFcjXhawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6v-0000000BsYm-1EOB;
	Mon, 26 Jan 2026 04:21:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6s-0000000BsXT-1H8C
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AE204441B;
	Mon, 26 Jan 2026 04:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDC6C19425;
	Mon, 26 Jan 2026 04:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401312;
	bh=O0Chq8FOwcKLbBZ6GgKrruLCkSBIdndz2GCwD70Bmn0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AaugFFuUyWDMrG0RBi0+t/mFV/TECAGxCNW/Xu1Bmy1HggS4k1oszf5b1CTFJkL7n
	 plVJXS37a/bz+oRkMg+vPrEw9XI4sHC3xB8OFG0PioyPHsqtLqg09CEva07c6QRMwj
	 24wX0YlE+Oo/+IfsdCy29FfUwxMOvyXG62zCq6WPvxB1FfEy4aJBqxs2Q9czXo2WJo
	 CM4Z1Kmrcj9BWS4sPA6y1+T9r4WWM/zJuuDb94Po0dcJhqsVz6fUrxJCpGQBDo/I5N
	 Qo0W4/3hJNgVX41JM4SsKIWB6KLjHWlRmnz9I1jlYAry8IBo+1GGPbWCNQcneA+W/w
	 jWRlGN5q9SqwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EBF83809A22;
	Mon, 26 Jan 2026 04:21:48 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 11/21] i2c: spacemit: Remove IRQF_ONESHOT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176940130684.4057692.5555017535441416202.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:21:46 +0000
References: <20260123113708.416727-12-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-12-bigeasy@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, tglx@kernel.org,
 troy.mitchell@linux.spacemit.com, andi.shyti@kernel.org, dlan@gentoo.org,
 linux-i2c@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202154_421940_A24DEB96 
X-CRM114-Status: UNSURE (   9.02  )
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

This patch was applied to riscv/linux.git (fixes)
by Andi Shyti <andi.shyti@kernel.org>:

On Fri, 23 Jan 2026 12:36:57 +0100 you wrote:
> Passing IRQF_ONESHOT ensures that the interrupt source is masked until
> the secondary (threaded) handler is done. If only a primary handler is
> used then the flag makes no sense because the interrupt can not fire
> (again) while its handler is running.
> The flag also disallows force-threading of the primary handler and the
> irq-core will warn about this.
> 
> [...]

Here is the summary with links:
  - [11/21] i2c: spacemit: Remove IRQF_ONESHOT
    https://git.kernel.org/riscv/c/e351836a54e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
