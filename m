Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F6DC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjynnPc64z0ksh2dfeqGpL8x0wNF6jqs1caX6GxlZUU=; b=AEg0i+bk2k9BHv
	3J9DAQyU1zppXopq9avx+4oQ5Oz6eA3pKaJtXnpVgx1OXLonzFXwotBVqezqtHkxkSvymkNuWP9B3
	cMgth/B3wf8oWXQRp9qu9/k3MuTiCx2y4mtHepzGKhOM7XUCqVuh2T2xvc4pAB5eP5J8caHbILbgl
	2Tk9c/Q2qQIjssTNkb6fw4D6yi45Rr6047N+9p87aXRQ5yZ/lojgMbOq+Kh8Dp1IFZlrPFa1B1jsZ
	t4lOw05ByXXSRQXTA+KcvU9zVLfED/XIQqZGmODCFowcmOza/b7FYtVZrhHVwU3MWzC086eh/tAww
	xgVr7zFuovvzwdeb37Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1zw-0000000GS4M-1dz5;
	Mon, 03 Feb 2025 19:20:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ux-0000000GQJQ-0Bqc
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1319CA41C1A;
	Mon,  3 Feb 2025 19:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24813C4CEE3;
	Mon,  3 Feb 2025 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610134;
	bh=amXpXM2dMijrA0MtGiAiusiXv5glXfKEr2kGBt5Mf5I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=orq8j9IL4sJCwffHeQkMqQ1LIzj3bLY8D/nrO4mnXrEndAU5xhvp1AnN+MPsSWfAS
	 IZvgG2Nw7sRKZfvdeBoU24R2M3mICG80BdgzQG5I/Uk/HAB63MWT6zBpw0p2oEMxlG
	 E8a7k3yyvNeN7d09N1SQvXMuDzOc5RDhdiwzRZt1Onqk/9We/Jy6PWS/UhHcfOEo+8
	 iErOqSj3NkZautMbNrY1aUZ+ZDSjaK42026+wZ4WVZ1YTR/W1+OjLgplV9vpJrYA1W
	 bbv7Zo/NVVNEU9Q1bbcgG36BP63LfRm1tbxQAfzJ1eXk+ut+Untsl+R6vGED961E9B
	 wK9dQCBP2xa1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710BB380AA67;
	Mon,  3 Feb 2025 19:16:02 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Microchip CoreI2C driver fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861016099.3409359.8425752210633125446.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:00 +0000
References: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
In-Reply-To: <20241218-steadier-corridor-0c0a0ce58ca2@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 andi.shyti@kernel.org, wsa@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111535_156372_B646AF8A 
X-CRM114-Status: GOOD (  10.10  )
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

This series was applied to riscv/linux.git (fixes)
by Andi Shyti <andi.shyti@kernel.org>:

On Wed, 18 Dec 2024 12:07:39 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v2 with one of the minor items pointed out by Andi resolved and
> a new patch for an issue fixed in the months since v1, plus some minor
> checkpatch things that I seem to have missed on v1. On v1 there was
> unresolved discussion with Wolfram, but it has been two months without a
> response so I am sending this v2 in an attempt to make progress.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] i2c: microchip-core: actually use repeated sends
    https://git.kernel.org/riscv/c/9a8f9320d67b
  - [v2,2/2] i2c: microchip-core: fix "ghost" detections
    https://git.kernel.org/riscv/c/49e1f0fd0d4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
