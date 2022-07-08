Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB5C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcWz2mMP7IgHdZ8tygZR9UjBwvfNlt932DjdfBTcS8o=; b=yFd247Z12B8l+H
	Szq4YnOZmlo0jPBqI0mb5toZH2/FNeCuoH55vGozadsHYSzgcnocoGSTe4GPER30CnQQxiHIxD17h
	aSWKuRYUOcaklYD3dun2XIC/ldkd4xDdq8vYXyRer6rLAW4pJW3MWrf2hei0msFuGbDR1j6E85zmv
	TlSuYEbAF0313fTkNwRlWGKmsfeJ7yjiKYNBoHC8xMCJf6BjnmAmnYB7pKjoI1A7lPVpPEP8vCwos
	YYl3c11ebr3ySSyBNtJGjecc826CZyUBUOQdVe0AfBYvz1Nm6r7nWonbDUCMScvu9iRGl3FUVEqsI
	f8xbZ0+gXuWiRlo3v0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9eNn-001V3c-Kb; Fri, 08 Jul 2022 03:10:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9eNl-001V2T-Bd
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 03:10:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0A4C612C3;
	Fri,  8 Jul 2022 03:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B18EC341C8;
	Fri,  8 Jul 2022 03:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657249814;
	bh=hUb1J/cfIQYBVKSFpdw41ZNmvs0ACmGBKvHJvHy42ro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jPXSS3qatkE8XGA+Q37axo+fmvhKlGV03kTtV4olQMlgw/6rdexi+nlXMD1zEIqdw
	 1A5lTXSz7W07VLWp85l15mBdWTihZ11Qais0mZqlEOrb/0U3ovUl9Fg1X6NMkezYEH
	 TttXmCwsImp4mXaJb5OXFv9VhgXxohbg3xOSRW+K06RBpqSBV2m4bLcZC+6a2ehqlH
	 Dqskct21lxq4VlmN2cxIG9ttlE4YoNUszkQUPwnovFtmRZx3f5bvKfT/Ex5FDed9KU
	 ksI6wrpk+DiWCyeUUq2pYwjavctOJYCl7kJnKagpo64PwRCNB0YLvzmus7z9FNDMsn
	 k9iJ2Gt9YFR3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E381AE45BDC;
	Fri,  8 Jul 2022 03:10:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [net-next PATCH v3 0/5] PolarFire SoC macb reset support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165724981392.15320.15228672706280247998.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 03:10:13 +0000
References: <20220706095129.828253-1-conor.dooley@microchip.com>
In-Reply-To: <20220706095129.828253-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_201017_475999_382D5C9C 
X-CRM114-Status: GOOD (  10.89  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 6 Jul 2022 10:51:24 +0100 you wrote:
> Hey all,
> Jakub requested that these patches be split off from the series
> adding the reset controller itself that I sent ~yesterday~ last
> week [0].
> 
> The Cadence MACBs on PolarFire SoC (MPFS) have reset capability and are
> compatible with the zynqmp's init function. I have removed the zynqmp
> specific comments from that function & renamed it to reflect what it
> does, since it is no longer zynqmp only.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] dt-bindings: net: cdns,macb: document polarfire soc's macb
    https://git.kernel.org/netdev/net-next/c/b09c6f8ff731
  - [net-next,v3,2/5] net: macb: add polarfire soc reset support
    https://git.kernel.org/netdev/net-next/c/8aad66aa59be
  - [net-next,v3,3/5] net: macb: unify macb_config alignment style
    https://git.kernel.org/netdev/net-next/c/649bef9c7663
  - [net-next,v3,4/5] net: macb: simplify error paths in init_reset_optional()
    https://git.kernel.org/netdev/net-next/c/ea242f821a2d
  - [net-next,v3,5/5] net: macb: sort init_reset_optional() with other init()s
    https://git.kernel.org/netdev/net-next/c/8a78ac73de20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
