Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EA2111227A
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 03:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKrWTIgTYfDVOTpmsRi0QDcshEKvJMz4RjFghwJl6N4=; b=BTDMF2PV9l9fz2
	7E7YhzaXQNsHvmga++LY2WbOQ8JdZOXcDc7ob6uI4xSsRsxNVLu0okgwKjB0256zMAax7w5HMPPiM
	OTyoxX+PfwP+qjd+RAzxp/Aolt9+pbtiSNMFdNvIrNzyTICtyLHKtmLH21/GqmSuiPeyTMTAShVl7
	4uQ0rocQbUDzaQ8BJTCJR/2GWe40GXmhqZHxqp73Th4tLX6q+g6FT4Sn4tbfPNBl+OHXMkk2276Y9
	WGj9X1H4v5piH3zPGO5jlEk3mvYCBQN8mCUxLUqqafiojnSo3kntpzJMDySMsYadoOCjFKOKzP+2X
	tiidcMm/nY6GtrlgGH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w88lG-0000000GfNC-1jlP;
	Thu, 02 Apr 2026 03:30:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w88lE-0000000GfMd-25sG
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 03:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C415842AF4;
	Thu,  2 Apr 2026 03:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E770C4CEF7;
	Thu,  2 Apr 2026 03:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775100622;
	bh=9fgfxHGvBZIq07MRUZR8GJsU2l1aH5ay0pKgQs/ybow=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ezlf/nFNW1xBkwlS/tOKV8648orliI9baU+us/DOBiraA7RNIkmlRYnGWp0wFEKA6
	 jZ0SbMDwGJSHTeKODFwjR7a51tTwFVgbxOt/+Jas7rOHZaWCzq3FoULLipBJWXRFhc
	 hOrMOTCEVuIIRbFSXmpUKQwYdugXzmW/kti0L3Ec5Uq4XUx1g4V9u9O8edDR/h9D4F
	 ChMBxsn2brac/6lmbw4rdoOPkiazJDgILs5L2JNEDdHUufGHOMlBxhiWz2ny3cd4Ev
	 pFaECSDjb45k6B119UGa07ATSRy6bID3IZH8t5YEKl3ZqkkMyfff3Fbl68UqxwMb5f
	 hLpoMOTLbBBrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE193808203;
	Thu,  2 Apr 2026 03:30:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2] net: macb: fix use of at91_default_usrio
 without
 CONFIG_OF
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177510060529.3975901.11122963939632572331.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 03:30:05 +0000
References: <20260331-enroll-sensation-50901318a419@spud>
In-Reply-To: <20260331-enroll-sensation-50901318a419@spud>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, conor.dooley@microchip.com, lkp@intel.com,
 jiawenwu@trustnetic.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_203024_562547_A87F7969 
X-CRM114-Status: UNSURE (   8.92  )
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

On Tue, 31 Mar 2026 14:10:21 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> If CONFIG_OF is not enabled, at91_default_usrio is used undeclared in
> gem_default_config. Move at91_default_usrio back above the CONFIG_OF
> section where macb_default_usrio used to be, so that it is unconditionally
> defined and defined prior to any of the users.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: macb: fix use of at91_default_usrio without CONFIG_OF
    https://git.kernel.org/netdev/net-next/c/cee10a01e286

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
