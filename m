Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B10CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9s/HQ0aOzsfqxw4eTS8mOXHuUbmMbSHZ+WngRY00hU=; b=Z83uscVO16DfcM
	MbcBRmPlqPHPsUOf1weoDJUL8r7iaHhrK4k5yy3uAoQjTUdAE5mqUsgP06CoqeL3yf4WZJQfmz+V1
	XiULojfkkcObbhFJXyHvCCMqizSQFQ5EwmNDM7ymAz1Nvdl0Y45UgCKkomcODLsDLjpty3/jywmZf
	3b/mVoo7TpX6P5RvQooiwnCCUIDLOg/xbP2ltcUwjSGDIeLWzQd63AsmgwRRR15iszkSAvvUCvPgt
	YgHdvHaLU8lR8hsMiMlNiLsLTJ+ymkMJxhe2pVUI1azkd8esyRLlpTO2UDHWcGaivu4WcgnPMHbeD
	5ZkoBzgDdmATJHCZrJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlw-0000000BNS6-1xrB;
	Tue, 12 Aug 2025 16:22:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloAH-0000000Ah4n-3bT3
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 12:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9187646229;
	Tue, 12 Aug 2025 12:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EA4C4CEF7;
	Tue, 12 Aug 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755001901;
	bh=yiBrKuWba6VUZfup9ZeV9421SjABVfIj51lBHmdRJW0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E2rBB2ESl52QtL7zEsFOolPtdPxh9p17mcwsc3P3pYlYohJZSXwct9V2df3myjbxQ
	 JEKrjnTHtYOY/EgxPl83sUto2F4SqU7E6GCE8YTR3SRsyop6ysCTzCvwvpHBBe/wMq
	 xIRKexZQX+kGkDevzIOHh5wK0RlRgbN7sHqttPaZi9T+3JiXw0GeadquLd2B8ids6Y
	 jDPg72Q3KPSd4H6wu0+NEKhh9DVnDllt/J5VFxwuCIsxv3GIJYWAx7dLEvhLS9lEmh
	 1w/nbm5HGn7xDNlDRn5IO24dRwOtXE2wav3L7ojvmpZPI/g3Wo8qM7D7Z+i5map/7U
	 DOP2NA8DW443A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD8B383BF51;
	Tue, 12 Aug 2025 12:31:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net v3 0/3] Fix broken link with TH1520 GMAC when
 linkspeed
 changes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175500191323.2536290.8876313312572303826.git-patchwork-notify@kernel.org>
Date: Tue, 12 Aug 2025 12:31:53 +0000
References: <20250808093655.48074-2-ziyao@disroot.org>
In-Reply-To: <20250808093655.48074-2-ziyao@disroot.org>
To: Yao Zi <ziyao@disroot.org>
Cc: fustini@kernel.org, guoren@kernel.org, wefu@redhat.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, emil.renner.berthing@canonical.com,
 jszhang@kernel.org, linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_053141_920439_7BE7E85D 
X-CRM114-Status: GOOD (  10.85  )
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  8 Aug 2025 09:36:53 +0000 you wrote:
> It's noted that on TH1520 SoC, the GMAC's link becomes broken after
> the link speed is changed (for example, running ethtool -s eth0 speed
> 100 on the peer when negotiated to 1Gbps), but the GMAC could function
> normally if the speed is brought back to the initial.
> 
> Just like many other SoCs utilizing STMMAC IP, we need to adjust the TX
> clock supplying TH1520's GMAC through some SoC-specific glue registers
> when linkspeed changes. But it's found that after the full kernel
> startup, reading from them results in garbage and writing to them makes
> no effect, which is the cause of broken link.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/3] dt-bindings: net: thead,th1520-gmac: Describe APB interface clock
    https://git.kernel.org/netdev/net/c/c8a9a619c072
  - [net,v3,2/3] net: stmmac: thead: Get and enable APB clock on initialization
    https://git.kernel.org/netdev/net/c/4cc339ce482b
  - [net,v3,3/3] riscv: dts: thead: Add APB clocks for TH1520 GMACs
    https://git.kernel.org/netdev/net/c/a7f75e2883c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
