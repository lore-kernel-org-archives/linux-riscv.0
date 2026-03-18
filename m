Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E00AFCD0A1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 03:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CqpSmzPAiIi4QmB7OxVRq1jwAvG/nHSOOj4qPjuCs8=; b=3tlPB6AvrnxwYK
	au1mVFF+spFYA4oqczSXbKPvV4bIUhfLwVNIc05uN52Lh6c4soeIGN9hM9lQvLWcKBoJUY8aHeINr
	5RLs0nYvgYvcKr9/Mgn0Si2tA1Zz3lkZlG4MkSFoGdSj9u27RAnyy5HhhutUSg3qowml9WJ3GOA3L
	8u+Ws7HPArSOwNSqdohSJo0eIFjmBPNRrdEgpPYeH3CtLmr9lLh90D9KLa9ZSSz07zeuSS8UgYiH/
	jRoyPFY+nnYHUkA2EVeQLMOcu/GQ4KLmlvPR72P3sct7JNMMI5wFQPEi6I5CSu3pbm6XzfM9jURb0
	7+JClbFcez9ix5epKeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hm8-00000007iiS-1msV;
	Wed, 18 Mar 2026 03:40:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hm3-00000007igt-3Fyv;
	Wed, 18 Mar 2026 03:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ED74406EF;
	Wed, 18 Mar 2026 03:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170E8C19421;
	Wed, 18 Mar 2026 03:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773805244;
	bh=b5OWkuV535Oj1V56MTHDGF5WH37w+G2cepaHZkvA+6A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OZlImp5de0YUVbmDOxamq0jULzuXJ18Plsj/DYYr1d9yzVnU6jnkLIdgBgapY5l+Z
	 9z/5aKPq8GfU/o4Ld5wUT8/Ii6U5HAKgU1f410onFyYmJkWpepDrCDRmQMOZD1VY/H
	 16gKyCAwyP9sjqfzKI/7vuK50XPkT5mJwMRAU+mEVIMka9P3FSPwfFAjz697NEmuX9
	 F0xrbH4WwthbEiRhnluec/iydIpOUqNsL4LAs2ZPidcH1ZSlPAd6Fnc1oICkd/Bpjp
	 ZvzxCB2LilAYUWlnZt82XHcqnEBkQ8JhkTS3CHM+ye6UiSkWyLw4plYFKqJ9ZGURar
	 Km0HUg2O2yMXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FFCF3808200;
	Wed, 18 Mar 2026 03:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v10 0/4] riscv: spacemit: Add ethernet support
 for K3
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177380523578.113469.12534429691494800323.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 03:40:35 +0000
References: <20260316010041.164360-1-inochiama@gmail.com>
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, richardcochran@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 rmk+kernel@armlinux.org.uk, me@ziyao.cc, siyanteng@cqsoftware.com.cn,
 vladimir.oltean@nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 weishangjuan@eswincomputing.com, wens@kernel.org, lizhi2@eswincomputing.com,
 boon.khai.ng@altera.com, maxime.chevallier@bootlin.com,
 quentin.schulz@cherry.de, peppe.cavallaro@st.com, joabreu@synopsys.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dlan@gentoo.org, looong.bin@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_204047_840069_B5B1B83B 
X-CRM114-Status: UNSURE (   9.36  )
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

On Mon, 16 Mar 2026 09:00:36 +0800 you wrote:
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.
> 
> Change from v9:
> - https://lore.kernel.org/netdev/20260312012232.373713-1-inochiama@gmail.com
> patch 3:
> 1. fix misaligned brace.
> 
> [...]

Here is the summary with links:
  - [net-next,v10,1/4] dt-bindings: net: Add support for Spacemit K3 dwmac
    https://git.kernel.org/netdev/net-next/c/bb30400a566c
  - [net-next,v10,2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
    https://git.kernel.org/netdev/net-next/c/d35aa97ea908
  - [net-next,v10,3/4] net: stmmac: Add glue layer for Spacemit K3 SoC
    https://git.kernel.org/netdev/net-next/c/30f0ba420ed3
  - [net-next,v10,4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
    https://git.kernel.org/netdev/net-next/c/25e7553a502b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
