Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ED0C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 11:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VT+wR8yEtMK7AMK3hcN+BWtpdR5Da8keNmw8hOl3R9A=; b=nyrZHHednAemQj
	xHW99HglW00i4meO3f+ys1EQO6Tc1vh2bdfZu5FReyk9vNnyMcAmxVLFJzBE51C3GZheS4gbbGiY8
	nHYagHOL5xmLi6TOQE2N0HHoBfXCP9FhmSoEfQ02V71mmB5aO5OM3LgsMLhN0n39xLF1U1TIY5QTS
	vNW05GBzSzyutGtELPj6HU5z5Y7vQQX4Jffm9aQwKoL8K1DEK9RrgzUOU0FYieiMTRaUI+MlKERDG
	ggltfsQfXLKXymCchBt7TXCHwasNzwJZce+CWUEEpaUAjMpGfJRgjcY0rTBCyJH/9OsuWFs1ROhdA
	3CIl3TkwlRVHlWEPEE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHVr-00000003xUm-2N3B;
	Wed, 29 May 2024 11:30:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCHVo-00000003xUA-27wc
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 11:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C9D2DCE17BE;
	Wed, 29 May 2024 11:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2143C32786;
	Wed, 29 May 2024 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716982229;
	bh=iGJBYC0HS9WohGDJgHX+IX1VimUcl63tvEKfwQTFOLw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HaRCdd3aUptqszMAFpDNjuPVQW4EdDUIJdM1lbP1sbDyN14I8+s0hpFOEd/L9+/mh
	 f8tYyfxiuNR8f6ZZDYwgnzjVy1o9Tb+KucSc99IMyWzZr+8L7BolGmVvF2LAQ/W1O5
	 VnWnAbLmLMjLn3dkv6Pn2LMYZJZq6LutIJDtTWPd0OqDQsXcki42uy3p3suaEZInbF
	 vURY9/WxqUgpM6CNdqWIB9pP2TAbQhNoevrSjJBGi9kJrrRelHSqA5tZ6CofP3N0gx
	 Hf7tq1+ooTXxPt24jBCbBQox1zFmKmcFIGtFpGFY/DBedynXvyqUM+AsfX28Bp/gsG
	 ZgiDHrMT1Smgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1ECCCF21E0;
	Wed, 29 May 2024 11:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] MAINTAINERS: dwmac: starfive: update Maintainer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171698222979.5082.5782691130195774110.git-patchwork-notify@kernel.org>
Date: Wed, 29 May 2024 11:30:29 +0000
References: <20240528015120.128716-1-minda.chen@starfivetech.com>
In-Reply-To: <20240528015120.128716-1-minda.chen@starfivetech.com>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, kernel@esmil.dk,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_043032_959656_484E1E36 
X-CRM114-Status: UNSURE (   9.13  )
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
by David S. Miller <davem@davemloft.net>:

On Tue, 28 May 2024 09:51:20 +0800 you wrote:
> Update the maintainer of starfive dwmac driver.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [v1] MAINTAINERS: dwmac: starfive: update Maintainer
    https://git.kernel.org/netdev/net/c/e9022b31db80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
