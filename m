Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64FDCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTDEmTPUBAfP3pq+gUTLoZfoXUZQ0ow2lhFP455PUYM=; b=uI2sT7aK3CO9oi
	npZSX8Mqw3ZF+pR+xm+TnJ1fYhWseqR0lpf2T6iIMaROlPGZpIf/MgJ7RMG9w/zE2Xs+0u/dB9Bl4
	ZEXPo7osUzrcfowy5+SZweJINVsBTRJre0nSyP4j2W+3+6v+ae1oSvMXLqSm0uL8lsAi1mJJcIjGj
	6Ir3/w8UI50iyPaLDOkTbfu851qOSfJGu3tyoTCvGUcm+0J1JQtDmjdBZEIJUZnNrJzJA+/BIeYAm
	ZeIFX6KzvcAbsUIMO/22SW/A2VIxvYN4TBiP/Z8xRLM5JPg3SvxgpPsUIE/noDCrpWhSQdIbltF7d
	SqZuTYV8iv53oN/8lEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lm4-0000000BJ8e-2yHh;
	Mon, 22 Sep 2025 19:00:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lm2-0000000BJ7q-35Ju
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 19:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40A7144ABD;
	Mon, 22 Sep 2025 19:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9C5C4CEF0;
	Mon, 22 Sep 2025 19:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758567628;
	bh=jSZMVY8tK6FEY+x6iuddgnutHAt7zymsZwQ2rIdY01Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d+ryZ/6f400scXloTds6VVlrsNvr3YVS1Csy4J9T3vm5sfo/IRUIjSExqYsgaB+n5
	 HGGop+jRnchJAy7yeFamfYpp5mr6xfAL7TPzdW5qllM/o28daOWNzZhbxj0uDKufeO
	 h8bZRWsVVnddarfHaymo8HrqNLY34m62SW19s6q+lCyMQgkrMwgv0aLTUMcPa9KRko
	 UD3zFDqNK6056F/wipMnKiMb5XzWXsIHcaY/IUedObbaAF+jdm3DkTC3X0fCYuL5gW
	 jCal2RFkFDQjwPWMzWxlTbqe63u/TZbcGYpcLePL5wbuFcdP/GzrkOQrxhNrd+8/Ng
	 Q7FzO4MeYOyzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD6339D0C20;
	Mon, 22 Sep 2025 19:00:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: spacemit: Make stats_lock softirq-safe
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175856762549.1122110.9995435257899207460.git-patchwork-notify@kernel.org>
Date: Mon, 22 Sep 2025 19:00:25 +0000
References: <20250919-k1-ethernet-fix-lock-v1-1-c8b700aa4954@iscas.ac.cn>
In-Reply-To: <20250919-k1-ethernet-fix-lock-v1-1-c8b700aa4954@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@gentoo.org,
 maxime.chevallier@bootlin.com, troy.mitchell@linux.spacemit.com,
 vadim.fedorenko@linux.dev, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, uwu@dram.page, m.szyprowski@samsung.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_120030_794800_3DDBD2A8 
X-CRM114-Status: UNSURE (   8.62  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 19 Sep 2025 20:04:33 +0800 you wrote:
> While most of the statistics functions (emac_get_stats64() and such) are
> called with softirqs enabled, emac_stats_timer() is, as its name
> suggests, also called from a timer, i.e. called in softirq context.
> 
> All of these take stats_lock. Therefore, make stats_lock softirq-safe by
> changing spin_lock() into spin_lock_bh() for the functions that get
> statistics.
> 
> [...]

Here is the summary with links:
  - [net-next] net: spacemit: Make stats_lock softirq-safe
    https://git.kernel.org/netdev/net-next/c/35626012877b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
