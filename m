Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5514D73EB2
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 02:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlUBNihkVws5gyDu6rn4XbLBxh6GwcQB6glgsxAFgqQ=; b=cfEInlB2eXdgp6
	5G371Lwc5tj+1DiyI5XEOVi4g844fblty8ni7xz1p0wmcFAtwpbls0HzrSULQn1i4CM9f0jNEBjVs
	xCOAYRNwMUflDtI54tZWVzRP6TOIYRqI0CKKygAXF55W6r3SJwlMswrpepNXR0bMwjNyoVNxAwL9G
	LpTswg2FSCYhO/LO/2yU/2EeaIr9gSY8cIY4KYNpdgNu8bRDtBokY53ZMnv9p00joZBi3HbPtbmCw
	sLVO8saBUaDL/m9mofhqM6O5zKRw1qybmnuoSYNSBNSTsQqfe5U5gfNVZaR0f45F3o/qosJ6hmHy+
	/okp1TjtrZMW9DKH2rVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlebE-00000000ujd-2BfP;
	Fri, 30 Jan 2026 02:51:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleav-00000000uZQ-00QU;
	Fri, 30 Jan 2026 02:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEBE744534;
	Fri, 30 Jan 2026 02:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A5CC4CEF7;
	Fri, 30 Jan 2026 02:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769741448;
	bh=YnXhxfv/PgSEeYazcWLixzHseoSlG5XpJcXQaxI+Imc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kB0wdIkFjFPhwfMk7mjY2gf3zytLxtNfGxwrsr1ZaZO3MlgQDJ5OMUAGDEWtKl0uX
	 9h7BfLJUTpV1BQVd5vl5a9aw0LTzaETreSpBkKazR9UgM8jwUj1EmOyiJfjM4E9O9g
	 ww81WeRevmvXI5+XRCIfxvN7DLaSbqHpqzTnIc9XKGCDcKcbcHMiJ+CNhnXGQSNoFL
	 uYPTAumpC9rM1G3pj+V5LF2QaBaisbf17MVOFqDmb4wtpeTqAdNk8ScpbuZek3X6JE
	 jL++/0Wl+YETV/1iykFkAuTQS3X7ecwKM+Uwi9iPDXGkMMM0oLF7sHAwvbIb1YO9/A
	 BTvM7tgYSTGHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BB5B380CEE0;
	Fri, 30 Jan 2026 02:50:42 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] net: stmmac: thead: avoid conflicts with
 PHY_INTF_* definitions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176974144135.3149010.17418895035388677174.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:50:41 +0000
References: <E1vl35b-00000006upH-2zt9@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vl35b-00000006upH-2zt9@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, fustini@kernel.org, edumazet@google.com,
 wefu@redhat.com, guoren@kernel.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_185049_871505_B0C0D188 
X-CRM114-Status: UNSURE (   8.52  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 28 Jan 2026 10:47:59 +0000 you wrote:
> Avoid conflicts between stmmac PHY_INTF_* and GMAC_INTF_CTRL register
> definitions by replacing the PHY_ prefix with GMAC_.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: thead: avoid conflicts with PHY_INTF_* definitions
    https://git.kernel.org/netdev/net-next/c/88afa0dd655c
  - [net-next,2/2] net: stmmac: report active PHY interface
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
