Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD03ECD1292
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 02:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rox7XdPYByTVnzy3OY4uo7AwOBHzJZAb/1dXSeZpQqw=; b=JuvmATwz5IlBzc
	687b7iyxaHGRJ/3oJZFpcHrLpI5NUd1wD/GV/+qekwxJYvv1QPoGbtzROImHs9l71VTHoHaSR8NEG
	P3aCmOhSlV8/8O/gVQSlIeVTlNFUUHXP6xrp1XsgLu3w3OfRdSUMwYH9PdKKcFcYmTUJTm/InGNzL
	0HfySAWoko9iKhF/1V1KEX8mH+wKbqCUxsB9misnhuhOW7sbxwcT9urX7RzjgI5ux+9T5d61m5Kv6
	Rva3BnnkUPcz/m9+AEFwHgMoyCzdopMLBSTNovBkKfDq9NLTSaboiNmMuJZXwiiq39OpzWM5wVkOW
	fQi6OlncHBL05GqqQp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsZVL-00000004vE3-2FJj;
	Fri, 05 Apr 2024 02:40:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsZVI-00000004vDT-1Rey;
	Fri, 05 Apr 2024 02:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF85A6179E;
	Fri,  5 Apr 2024 02:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3780AC43399;
	Fri,  5 Apr 2024 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712284830;
	bh=Axh9FcoK3VYcCgrbRb02lLAG5Sv0+YQdR5I1p+8CItQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T4KOQAZOhSgZNcQ1dJiyeze9QmmAuEhT9hafKGlnPvNPyhSXznSPVYm41/n2QzEpt
	 Mwhe2Zx3fRvqTZ54Ovqt9ABBHHL82/6mCB011Gqip2IIaqp0ejh+aUNpn0S0amQT67
	 L4JmLyhZPVFmaMllQbIegnJ2j1/ALjb9pEN+vstN5uS5o+hFB8hQRJDQ4nzAwr7wyk
	 fgCEkdwMODxmfDnQtXCGEsgQqKEgPs2Z8/j5V4dG8NThJ5/QPibxt3c7fGCiFB6G/t
	 uujN2vHeENtb4/sLWaHqCgC4WU17EtADBKgOf46hh4yUjIMZ14cridMY1R6R9NNCLX
	 32uq2aqKlcPRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18928D84BAE;
	Fri,  5 Apr 2024 02:40:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/1] Add StarFive JH8100 dwmac support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171228483009.11871.14072192832057973325.git-patchwork-notify@kernel.org>
Date: Fri, 05 Apr 2024 02:40:30 +0000
References: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
In-Reply-To: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
To: ChunHau Tan <chunhau.tan@starfivetech.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, kernel@esmil.dk, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, horms@kernel.org,
 bartosz.golaszewski@linaro.org, ahalaney@redhat.com, jszhang@kernel.org,
 u.kleine-koenig@pengutronix.de, rmk+kernel@armlinux.org.uk,
 leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_194032_618301_18ECB1FF 
X-CRM114-Status: UNSURE (   8.51  )
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

On Wed,  3 Apr 2024 03:05:48 -0700 you wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
> 
> Please refer to below:
> 
>   JH8100: reset-names = "stmmaceth";
>   JH7110: reset-names = "stmmaceth", "ahb";
>   JH7100: reset-names = "ahb";
> 
> [...]

Here is the summary with links:
  - [v6,1/1] dt-bindings: net: starfive,jh7110-dwmac: Add StarFive JH8100 support
    https://git.kernel.org/netdev/net-next/c/1a9de5646559

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
