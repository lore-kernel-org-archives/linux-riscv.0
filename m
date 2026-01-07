Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC5BCF6BE3
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 01:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyFHaLswiYEktNHb9vtEbWcyF25+8PPWIlhnNO1jKh4=; b=rL17UFmvW840DY
	NpRAthUaEucpCbAZWuVlt6mOgmyDpqP1zqe3z6j4mq8oJQ4vF8ny/XlItYRwh1VWM1WmWRRA+aY08
	sb9PspjXjAwMBdjwna/A9IdtXfcrGAAKo25ATXYuv/zNMmb41awHbZOBjWicbIkNRn0dlVRTCLAqS
	jyr5zH7d387UvMCppf487mtvB0YPLBkbqq8gy49S/pTu1dns4eS9RGnoMg9sPabyQsxinu/K8CJRR
	bhKL9k3wUZ3OX/9feEhJua7ZxmQlmIK7flDx1a35sNyGwx0r5DEI7qQt5blAOVeAz3u8qic/KLQzE
	M+pKP6Ve5ojorojqKuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIQa-0000000E10s-34DA;
	Wed, 07 Jan 2026 01:33:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdIQZ-0000000E10R-2R1F
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 01:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F57260141;
	Wed,  7 Jan 2026 01:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44002C116C6;
	Wed,  7 Jan 2026 01:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767749614;
	bh=jOHbZXYVn1ZnDQ/GTnJFzXF3De/oa2/X7ZkkC0wVBH8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OmwdHsgkYuLFEFkCWNX7HvZDJ5p9MEUhdJtn7Pt35D5//t8w+tNyTuQVNJpc3K7ly
	 29RMNcN9X4+HJtLHOI1oR76ei7o9l0maFrfEPoWAbzWtMp8Lf80clpsaIlvlHhm6p1
	 Cjs0rGkkSFMLCMAT9eyB0/6Z2BW2ZYr3Ui7avF4Fzq2K57XrIIMufWTtjGOGCIOSFM
	 M/9AlGzZOWVXgcOCf3zIiJ3ryVz/enbBR1fZlIE2HDKKS4dbN0vg3dICBKkX4VQxFu
	 zLMACvR9HpMRuCJU/VhzupPpi2oo9/Lgkx0TZERd0UkugAeXzWCXpCVSKFcwuYb9G4
	 /yOfJI8B+Er0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2846380CEF5;
	Wed,  7 Jan 2026 01:30:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3] net: spacemit: Remove broken flow control
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176774941152.2191782.5264945592916797804.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 01:30:11 +0000
References: <20260104-k1-ethernet-actually-remove-fc-v3-1-3871b055064c@iscas.ac.cn>
In-Reply-To: <20260104-k1-ethernet-actually-remove-fc-v3-1-3871b055064c@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@gentoo.org,
 vadim.fedorenko@linux.dev, troy.mitchell@linux.spacemit.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
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

On Sun, 04 Jan 2026 14:00:04 +0800 you wrote:
> The current flow control implementation doesn't handle autonegotiation
> and ethtool operations properly. Remove it for now so we don't claim
> support for something that doesn't really work. A better implementation
> will be sent in future patches.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: spacemit: Remove broken flow control support
    https://git.kernel.org/netdev/net-next/c/f66086798f91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
