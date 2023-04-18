Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27BEC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uTq+YofVl0oiPDKc1JuZSjDiM92ZY17u2upjGW1cbE=; b=HyzCs0jgcX5mc0
	KbirUhW3w4KFq+EN9hB8lcQtQ9duO2hblOv/1/qu0UBtUi+09p3G50GtJDsRT0ADk0sEUocA4jk2W
	sjzd9bq+Va6VaTA5Cv/7NKQ9OZ2w521IcyWwma8ArmeVmYNQBeVEJfEqLOA1HZwHkuhWa281l992o
	ikUeGgcovOQf3BHcHlvcx0NysQ7Hq8xFsKnbKOPjrrCkIxJV3pLU1K/rv8AK/vSEXhzmN5Zl2/aZq
	zZeCSJ6K1kAj2auQZDIKehJeyHZbaPdY5t/bntAA5XBDWAnklmraWbohUPbbwQxFDWbBgybUCYZYw
	snHofqqCObjQ9P2oHa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojXV-001wv2-0Y;
	Tue, 18 Apr 2023 11:30:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojXS-001wtk-12
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 11:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 833BD6305F;
	Tue, 18 Apr 2023 11:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC28FC433EF;
	Tue, 18 Apr 2023 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681817420;
	bh=rRRuyw16Gggmf7eYASFhnKYz5r8Dy2IULXNtZc9Bvlg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nkrMWq4qToOZjbhBPhZzz80EEZkQ92VKIKWFaMwgEkaCNSgXtCf9ZqINxjZQxGUT8
	 eTUfdw6Ad4XDm4qGqLP58X5+M3x6d9qevSBnqGqw67kyV1Bdu1aEIiUd3fxZDD63jR
	 OPUS7CDCWKdCisHG1/BJYr/01f46zx5ouO7xEap0wH0EDILz+YXeJur4QDHGExtEzz
	 hwxOo0d+Qi9mujN5CNp6kIfdk5s4qD6CNmDMmdJNIcDc9+MDh3CHxHG2J6HiIFc8YH
	 PK/2fKs9o8VRlpkJs8wCcTLcEJLjpGPxHrvLJ2riT3rl/DyidjgZZTVAzfFox4UdyQ
	 TN4AUKBsbChVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA1A3C4167B;
	Tue, 18 Apr 2023 11:30:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [-net-next v12 0/6] Add Ethernet driver for StarFive JH7110 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168181742075.8442.13068337635820008574.git-patchwork-notify@kernel.org>
Date: Tue, 18 Apr 2023 11:30:20 +0000
References: <20230417100251.11871-1-samin.guo@starfivetech.com>
In-Reply-To: <20230417100251.11871-1-samin.guo@starfivetech.com>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@esmil.dk, pmmoreir@synopsys.com,
 richardcochran@gmail.com, conor@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andrew@lunn.ch,
 hkallweit1@gmail.com, pgwipeout@gmail.com, yanhong.wang@starfivetech.com,
 tomm.merciai@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_043022_395526_826298A3 
X-CRM114-Status: GOOD (  11.80  )
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

On Mon, 17 Apr 2023 18:02:45 +0800 you wrote:
> This series adds ethernet support for the StarFive JH7110 RISC-V SoC,
> which includes a dwmac-5.20 MAC driver (from Synopsys DesignWare).
> This series has been tested and works fine on VisionFive-2 v1.2A and
> v1.3B SBC boards.
> 
> For more information and support, you can visit RVspace wiki[1].
> You can simply review or test the patches at the link [2].
> This patchset should be applied after the patchset [3] [4].
> 
> [...]

Here is the summary with links:
  - [-net-next,v12,1/6] dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
    https://git.kernel.org/netdev/net-next/c/13f9351180aa
  - [-net-next,v12,2/6] net: stmmac: platform: Add snps,dwmac-5.20 IP compatible string
    https://git.kernel.org/netdev/net-next/c/65a1d72f0c7c
  - [-net-next,v12,3/6] dt-bindings: net: snps,dwmac: Add 'ahb' reset/reset-name
    https://git.kernel.org/netdev/net-next/c/843f603762a5
  - [-net-next,v12,4/6] dt-bindings: net: Add support StarFive dwmac
    https://git.kernel.org/netdev/net-next/c/b76eaf7d7ede
  - [-net-next,v12,5/6] net: stmmac: Add glue layer for StarFive JH7110 SoC
    https://git.kernel.org/netdev/net-next/c/4bd3bb7b4526
  - [-net-next,v12,6/6] net: stmmac: dwmac-starfive: Add phy interface settings
    https://git.kernel.org/netdev/net-next/c/b4a5afa51cee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
