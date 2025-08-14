Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DFDCA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+p7zpJonzaSTBpLJjVwj/WErn8t8kYkWcZZl3gsuFYU=; b=CiPw4HGhupFkgo
	061fVso2KDrG/dm4Pw0oQ+vYYG3OoVGEbgUwP+7BQqIQLoY9XeaeTXoFsJFnAEM34t+44DYU2AyJy
	m9ePnSuK54s0EOsQCMgvSIYoHUyota+xyG7rNwWKD9o9GM0EALl6HrQq8loZz15UqhG3c6oZrV0A1
	Is5434cHsJhH34IhpxmzuXJFeimVmEvh9SrWKw10Ao25nskJoM9lS6rcoOXV+6y98sp02aQvMpoiW
	eoiimVOlgkY0o6bXIa9fpUjmsJv0t5++stXRFORgl4NOD4JHFu2rZ+3nl/y9IVQBeBHtsVWKqzFkD
	8JUuZCBEZaoDWT2zc04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTL0-0000000GFGa-3Pqs;
	Thu, 14 Aug 2025 08:29:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umT28-0000000GCbe-1LAG
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 08:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DF446111F;
	Thu, 14 Aug 2025 08:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35B7C4CEEF;
	Thu, 14 Aug 2025 08:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755158998;
	bh=kRPvWk3+oRUyAKWoxWpoP6qQ6GBUxFbJ97WPacEf5u0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sBeMTkpNRQ5SMWT7ZAp2DlQx+p1b5GxjQ90xd+qujp2z88tZSe1o1w66tYD0np7E6
	 xxgEHQ8N7dm0c6d+68JcHimSbYXP0rKMj+ijzqWbiCZDMHMQ28Uh2TdmDM+enwXKX2
	 ZtNzViLBtn4w3fKFgYXQ6zdEg0oCxvDSDM6dQZnrKJAKKc160kIvMNkQXFcD2iEUkr
	 8P4kbIf5GMil5bQAmtAfLNEp7pkxuyp51dLxlo3Awq1ylfOd/4I7lyXhEyRzdBj7+S
	 VA893SUFzYMiC7IZfc9r6HvKfLpmPemjVQ3PldDqIUN9LZJZ8+Im90gb2QgJ6cDI68
	 M3D5ZMBhGDymQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCC239D0C3A;
	Thu, 14 Aug 2025 08:10:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] net: cadence: macb: convert from round_rate() to
 determine_rate()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175515900950.181378.1619500424714699903.git-patchwork-notify@kernel.org>
Date: Thu, 14 Aug 2025 08:10:09 +0000
References: <20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com>
In-Reply-To: <20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com>
To: Brian Masney <bmasney@redhat.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, paul.walmsley@sifive.com,
 samuel.holland@sifive.com, mripard@kernel.org, sboyd@kernel.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 10 Aug 2025 18:24:14 -0400 you wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 61 ++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 26 deletions(-)
> 
> [...]

Here is the summary with links:
  - net: cadence: macb: convert from round_rate() to determine_rate()
    https://git.kernel.org/netdev/net-next/c/40e819747b45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
