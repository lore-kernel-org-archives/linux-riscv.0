Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1F16072157
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVFi3cA+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXLfuPXP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y98pJx4Z6s2CCiAezKq71QtSbIDc2+MfDYltl6ZFDNo=; b=SVFi3cA+YQ2Z1NQZCmSAAEV+BR
	5abtv2EMXc5uthvYPnzjDEkoYyoK7K/Fioh9ezKGiE2qQQrYLA+m8SZts4POWQhgJ4jlQZwVsdTm1
	/jeTppHgL+ThKm7x/r+H0h1ETViUCM9KqR3ga/zHmiM4kdvMUsfbQPp/APvUNiO6FmekiM0cH5326
	lOIz6D40U9r/AwQ5w38U2Pk0l1kYJvfAVUkvi8EKXEI0Os7k1b1t0jknDXsH6g1aT+bA5urBRsL9o
	azoRqSfzwQtKy06CYHW6sLmy6MFyw7bDyblpwv28c+Gwf9SIjTZ90/67xmdyCZAPV+4XgdVj8uUtq
	BCsFs7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr5-0000000F19A-0ZeG;
	Sun, 01 Nov 2026 22:16:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqn-0000000F0O5-2E2i;
	Sun, 01 Nov 2026 22:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBD8A60618;
	Sun,  1 Nov 2026 22:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5FE1F00919;
	Sun,  1 Nov 2026 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571388;
	bh=mYyAayRoZikGuVa2eTY9XdZusf49iXjgOkDtLITdEgk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mXLfuPXPchjyCsKqUUn6GfbB242wECSzlW5Nl5mVJ6Zte83mHJNI4R4d8xkp7uYcd
	 PsMB2hamerPq2dnWXNyCSG+wGVJoxOanUM42cDhwQZm6qnyCUjMMHEM/aieCRaZXTY
	 YZ6bc9U50iXAKJ6034iAZfuM4+M84BeH8T0pGIdkGJ0NIMUEZ1bKDwpu6Qimh7lTAM
	 tuhkR19/h7UrSYSq4bb66U5CX6UY/m+upd5rhiqJyHWOwF8yMk8WPOWyXOG1GECtPq
	 WPFZslCedVeFfgCdotFp5j/booJbOqPkd8OugZblxDJ9R1gbY68KHhHXNfQ9JRpvCq
	 9YL+YH3CTO18w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 873E338003B8;
	Sun,  1 Nov 2026 22:16:28 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0 PHY
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138729.2624073.17557863773534626721.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:27 +0000
References: <20260825065007.69353-1-bbanelli@gmail.com>
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: linux-riscv@lists.infradead.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, dlan@kernel.org, huang.ze@linux.dev,
 elder@riscstar.com, linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Vinod Koul <vkoul@kernel.org>:

On Tue, 25 Aug 2026 08:50:05 +0200 you wrote:
> v1 was a single patch adding "default ARCH_SPACEMIT" to
> PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
> Kconfig problems in the same entry, and that change makes them easier
> to hit: enabling the symbol by default means configurations that would
> previously have left it off will now build the driver.
> 
> So fix the dependencies first, then enable it by default.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
    https://git.kernel.org/riscv/c/882af55e42a4
  - [v2,2/2] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
    https://git.kernel.org/riscv/c/392101240b22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
