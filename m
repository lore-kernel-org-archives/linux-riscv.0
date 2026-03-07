Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43BEFC9EC3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 03:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zudGj7tdhbOQJMp+kyWTkjmkNH3dCr3vggCyBnBE2a0=; b=Zmbt4nlIsJQbZj
	nY8gL9Pf1bMbnEK2VnTkEHVz0VSG4iogLO10voyfVOUBADKNH4Qq+Qw9/OkCMgo7QMR3gzCagiiJW
	kZRoZxIf4NChHBf1E5JCdZQYYSGQlFzoSEgGT6J6foGa24DhQ5GPbhxW+DjCLRiA6OoqzIvHi1MTk
	VdZJVoAOQdAiR6u0Nxbz/vIGAVZTlpg3F/rW/qQN8UsupJa1CXfMqbUsutV/wncoqIN4xaWy1TmKX
	bcGFpMuEapARPI4n3FEEgYaHbqHIzZkbFy4SJWKKtXFDQCbvDVVBY9KEplRAgGW7Tvi+tFXbDY/zR
	ZSZ6O61QZmA1ZZwgYJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyi3V-00000004pjA-0NbJ;
	Sat, 07 Mar 2026 03:10:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyi3S-00000004pio-1cXM
	for linux-riscv@lists.infradead.org;
	Sat, 07 Mar 2026 03:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EF0B444C4;
	Sat,  7 Mar 2026 03:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783FCC4CEF7;
	Sat,  7 Mar 2026 03:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772853013;
	bh=LGnvdT1aKqYb2Uio1qV5MJ3C5YO/gKg/GDx5YXLRzy0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Pi6mLDZ3OKhmafA1CxPaLPBTbJqaj2d/JLhSaK0cAUzHS/5DQSZtmSAswMa+5ZoP0
	 oSWJEdxuotYjqTtIFoAW73whqbIAVAg1aAoJumSQUYbZw30wCjH8x21gOl3hEqDtT1
	 UnNiZWOxBsgN71IMP+Q5zF7oOYeLMnW9n+g/hta335qAVwRjlNSpMO1oXblW0YHlCn
	 sc3bFjlU1WGxERZwXxYoB6zuGrCwiDXOq29PhO7o7C5CtEpzP4VGXhtG2/PcFlbR2d
	 3jj3ISq3G+n+bb/y7SEcNN8yMRk6U15dAq4PsYq9+7lxFnM4Xx0SK+vEiqPellYyxH
	 irZOmfRbjieLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EEB3808200;
	Sat,  7 Mar 2026 03:10:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net v2 0/2] net: spacemit: A few error handling fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177285301226.135595.13840950042647803809.git-patchwork-notify@kernel.org>
Date: Sat, 07 Mar 2026 03:10:12 +0000
References: <20260305-k1-ethernet-more-fixes-v2-0-e4e434d65055@iscas.ac.cn>
In-Reply-To: <20260305-k1-ethernet-more-fixes-v2-0-e4e434d65055@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@kernel.org,
 maxime.chevallier@bootlin.com, vadim.fedorenko@linux.dev,
 troy.mitchell@linux.spacemit.com, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_191014_448919_23C6B504 
X-CRM114-Status: UNSURE (   9.22  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 05 Mar 2026 14:39:37 +0800 you wrote:
> Recently a user reported a supposed UAF/double-free in this driver. It
> turned out to be a false positive (ugh) from a bug with riscv's
> kfence_protect_page() [1], but it did also prompt me to review the
> driver code yet again. These are some fixes for error handling problems
> that I've found.
> 
> [1]: https://lore.kernel.org/r/20260303-handle-kfence-protect-spurious-fault-v2-0-f80d8354d79d@iscas.ac.cn/
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: spacemit: Fix error handling in emac_alloc_rx_desc_buffers()
    https://git.kernel.org/netdev/net/c/3aa1417803c1
  - [net,v2,2/2] net: spacemit: Fix error handling in emac_tx_mem_map()
    https://git.kernel.org/netdev/net/c/86292155bea5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
