Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE90CAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b082q5bzgsbLtS3x9xvkex1SwqcCo8NpOlXWleN/36c=; b=ocx+aJa3+bDkMw
	u6rqHmRG0/jwf9RcMrAh174/SFytBlsi4uADIeaHYzPtHOs6hZDwsDK0oQaSK2sfFD4qcfP6GGFUr
	470Lkqt0GsqhxjbWNsh6uHe1dhHqj4yM4JigLkbea3nsR/6T3wA3keVaqSPZxr+WA+QFqLHpPJrSJ
	AjDkgLD8RbUOeg3z77o3wM5WDdGDs4NxZmUdliZJRK24XeFUrCyomyVytQM258og6saiDWbEfUNZK
	6fTdrc2xhoaptColKQRYIJFj0bEALai3Wtwg+bURiuihDxt9TyfHglajGmkmGEBI1gOYgOq2NvxJW
	HcTFOq1B2zghGq5nw6HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyTjK-00000007eUl-0tRu;
	Tue, 16 Sep 2025 11:20:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyTjI-00000007eUd-42iX
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 11:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 635E660141;
	Tue, 16 Sep 2025 11:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2E0C4CEEB;
	Tue, 16 Sep 2025 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758021612;
	bh=14sOQQinc11cHCKnIiI6Ab/MANDaVgA92SJ8bByuOrA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GwM8jv5bXdsHfLGp25eYIs+KXZkrnrk1BTxTI8uOnCDcLnnOfpO7jCDV8/zfKyVYw
	 R3XtBe05hWce2cnVkQsWvnmAS6GM/kKDsOzCofqrfT18T0y2niThi4CnnpYHDDO88d
	 nKBfo9i2rs1o6ZeMPVkdOYV7Yc4y1BZHEendlGMtaF4ft9LzwJr+XO6VMgnGhInk9w
	 cYGz8RF2NITu2t9He49tjMR/MEWemu0HRVIwouU54Z5YviVndwjmPqAdu4k4dPSsjo
	 MV8FMOL0+kY0vKZLLpvC2AXRvXS9C9JG/eOr5N9aJmw309/U4K7I1wXe7n3l3QnSex
	 +Qo1j+I6FVvfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F4F39D0C1A;
	Tue, 16 Sep 2025 11:20:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v12 0/5] Add Ethernet MAC support for SpacemiT K1
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175802161326.713595.16381910315366172301.git-patchwork-notify@kernel.org>
Date: Tue, 16 Sep 2025 11:20:13 +0000
References: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
In-Reply-To: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, uwu@dram.page,
 vadim.fedorenko@linux.dev, junhui.liu@pigmoral.tech, horms@kernel.org,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, troy.mitchell@linux.spacemit.com,
 hendrik.hamerlinck@hammernet.be, andrew@lunn.ch
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
by Paolo Abeni <pabeni@redhat.com>:

On Sun, 14 Sep 2025 12:23:11 +0800 you wrote:
> SpacemiT K1 has two gigabit Ethernet MACs with RGMII and RMII support.
> Add devicetree bindings, driver, and DTS for it.
> 
> Tested primarily on BananaPi BPI-F3. Basic TX/RX functionality also
> tested on Milk-V Jupiter.
> 
> I would like to note that even though some bit field names superficially
> resemble that of DesignWare MAC, all other differences point to it in
> fact being a custom design.
> 
> [...]

Here is the summary with links:
  - [net-next,v12,1/5] dt-bindings: net: Add support for SpacemiT K1
    https://git.kernel.org/netdev/net-next/c/62a12a221769
  - [net-next,v12,2/5] net: spacemit: Add K1 Ethernet MAC
    https://git.kernel.org/netdev/net-next/c/bfec6d7f2001
  - [net-next,v12,3/5] riscv: dts: spacemit: Add Ethernet support for K1
    https://git.kernel.org/netdev/net-next/c/60775f28cfb7
  - [net-next,v12,4/5] riscv: dts: spacemit: Add Ethernet support for BPI-F3
    https://git.kernel.org/netdev/net-next/c/3c247a6366d5
  - [net-next,v12,5/5] riscv: dts: spacemit: Add Ethernet support for Jupiter
    https://git.kernel.org/netdev/net-next/c/e32dc7a936b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
