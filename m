Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEC9C021B6
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdu28SWbWQipktqXtjjAU15YfBbofLx2VOlM7EmVDHA=; b=H8CoWB0CR1P5Ln
	scdXAc4O0tpxH1/uJa7HNelAFQC6YiRQXICrbjDxajhc8vBVqK2UsbGql3yIyjB9esbzIgT1mENf7
	+jQ0vf7QSFYsPJV3avBNrbJTBRhHxsJf/ByM1/2qpvZBLm6LIbMFvGujgZ2GJkH7hGL8LqoBPFoaf
	s/kkWoX3XhhTsN5eUYiLmkxrPbHX4kvuQ0jlrfpQkzvERLJXROUoXMGHWmRh+MDwsLh28+aEJQc23
	eD2ULI0eFsIgZL64hPnf3uysI83U7riqnHZCJ4XAi/ZjaNmfGSGav71sVvm0QM+BLV19q3bO4y+r+
	o3ED2oEGYivH0HUnt2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmh8z-0000000FPCY-2v9r;
	Mon, 24 Feb 2025 22:41:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmh7W-0000000FP4Z-0W6B;
	Mon, 24 Feb 2025 22:40:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 438E3611FA;
	Mon, 24 Feb 2025 22:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB35C4CEE8;
	Mon, 24 Feb 2025 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740436813;
	bh=7OgwWkTR+dw0Tqyw5er0axNmGjTr5b4RO9FTtda++rA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iSC1h7n9mcw5ovxEzPZs4Uit31UD3bCjZoIPvv3lAw64A/6SFv8JGEEORBdklogVy
	 6YstAptx6WthKu6FTXizx1bXkfqld/MGj39fd4sGptLWkxtgvsP+vkPPje226ePUNt
	 aM8oBbmuFScQh4LlovzNFE6N7SJGGz8ZK9r2UCr+AT7G5BHxrRu2SIUxG7HK7hqcHq
	 nBM59H433UDJqN/nRACN4w9shW1pXQ0hV3W3xvPi28wkitpEV9dHZ3SiDWocXFW38P
	 JHIupu6Eqgeb8X0XMgxsf+cotAcKM02Mse2AyBE80OcM4NcFiNI9ub6waiskAXOzXf
	 CDnABboVEvZDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE347380CFD7;
	Mon, 24 Feb 2025 22:40:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next 0/2] net: stmmac: thead: clean up clock rate setting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174043684424.3634134.11083697589097973471.git-patchwork-notify@kernel.org>
Date: Mon, 24 Feb 2025 22:40:44 +0000
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, drew@pdp7.com,
 edumazet@google.com, wefu@redhat.com, guoren@kernel.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Fri, 21 Feb 2025 14:15:17 +0000 you wrote:
> Hi,
> 
> This series cleans up the thead clock rate setting to use the
> rgmii_clock() helper function added to phylib.
> 
> The first patch switches over to using the rgmii_clock() helper,
> and the second patch cleans up the verification that the desired
> clock rate is achievable, allowing the private clock rate
> definitions to be removed.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: thead: use rgmii_clock() for RGMII clock rate
    https://git.kernel.org/netdev/net-next/c/171fd7cb153c
  - [net-next,2/2] net: stmmac: thead: ensure divisor gives proper rate
    https://git.kernel.org/netdev/net-next/c/8bfff0481d91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
