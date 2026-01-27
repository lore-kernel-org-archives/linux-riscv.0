Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE1AD25932
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 04:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDmTms1kCWHzpONMEfhrjiA/rc2WOewbf33sYHbv5Ac=; b=Zfuf90RPs5m1mf
	BrL6j/ibvpoiT1wxbtitwz+p5ROE1M3N3SeWMtPnmX9kkxpPmaEcaLk0TVfjU2tL5+I3Iy42VjaOb
	qq2OYWdXgFGnyKZZfx3k2j5ed76PRxNRQqiXWSZx5tqdIWLKwpdfQerPyebwSHlezD04ZjRumq9iR
	y4cU1WU8/wosaonbEzhTAAdQD9y8V32Wao9jl1ptSOy7FoDGQFwO6FN52ZLSRB4CmpJwtv3QkKxpo
	uVSheRsqLWtCrH6fDoNKDVTFFFik1JLmoFvYXACIZWKY3zLfwSWRTxENKA4HbM82QQk2+gDE73alU
	fiSrSQlsyT2umeDIwNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaFX-0000000DcpO-0A5b;
	Tue, 27 Jan 2026 04:00:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkaFU-0000000Dcp3-41W9
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 04:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38FE9444C5;
	Tue, 27 Jan 2026 04:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C93C116C6;
	Tue, 27 Jan 2026 04:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769486415;
	bh=/dnKUp4g2owUpoadHslNe+UnWeyhp45Dv0N1zbazH/0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h0OsIkyVYOsuapZYA1CVXBKpZ3J91N3a8QTzY3NuQzqhl4duy8HC5TKr0IcRMQinz
	 ClbqsZyNjpWaaUmsAfqAjfeSOy1Ro5z+wiKH8rjouCKGHTMhNDd62qFMk5Q2PLrv30
	 3jjlt7rXW8sSCJNjP4FtyWpZTnBAHN6Pmmo51M6en+Pzw0ynd57CSUc69Dlf0AVp1c
	 0NZ+eHz5l2B2T917CkaT5sSkTjXZKyykXN92jnP0xC7TkGjHtqE5MXigcsEJ2DwiVn
	 jaD6yfy/ZTUk0fEkOs9T7pk7E88/5qiJnVWVevAYlitEcq64AuSTk1DCY2lAy/bYYE
	 ngTbJAoMQuAbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BBA8380A961;
	Tue, 27 Jan 2026 04:00:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net v3] net: spacemit: Check for netif_carrier_ok() in
 emac_stats_update()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176948640910.677485.7954248952886250088.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 04:00:09 +0000
References: <20260123-k1-ethernet-clarify-stat-timeout-v3-1-93b9df627e87@iscas.ac.cn>
In-Reply-To: <20260123-k1-ethernet-clarify-stat-timeout-v3-1-93b9df627e87@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, dlan@gentoo.org,
 vadim.fedorenko@linux.dev, maxime.chevallier@bootlin.com, pjw@kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, troy.mitchell@linux.spacemit.com,
 amadeus@jmu.edu.cn, michael.opdenacker@rootcommit.com,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_200017_022105_3F946E65 
X-CRM114-Status: UNSURE (   8.58  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Jan 2026 11:52:23 +0800 you wrote:
> Some PHYs stop the refclk for power saving, usually while link down.
> This causes reading stats to time out.
> 
> Therefore, in emac_stats_update(), also don't update and reschedule if
> !netif_carrier_ok(). But that means we could be missing later updates if
> the link comes back up, so also reschedule when link up is detected in
> emac_adjust_link().
> 
> [...]

Here is the summary with links:
  - [net,v3] net: spacemit: Check for netif_carrier_ok() in emac_stats_update()
    https://git.kernel.org/netdev/net/c/2c84959167d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
