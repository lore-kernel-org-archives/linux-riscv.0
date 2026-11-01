Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513360701E0
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NPxbxG6c;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jP10cT91
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C/jiwsgeFzzwgMz+YYkPdiAeFOQ+z2UYTx17LaKRo4c=; b=NPxbxG6cg1ozm+MMT5W3CUWKav
	FHUzlnxbRyPeL+x6ApOT0zO4Ehwj5P/aJk4TonlS95sAdHGDsT/rZJoW0eBjpGa4JwVutC/QDMS/C
	12wo0EJjb7GLa0BhZIpic6tz4ae+37tXmvwnfy7KfUFSaw3PgPYLUieiVNG1CfOvO5VxAdIc1XXJj
	9ZKjxbfHddS8d+pY1DjZaza95/OC8eVinJtqP5ToL5vQq0892NaHqNyAtJgFEl/PpSXoos0scJwER
	mn8Ke1+/ffHcfSH4tN9HRC4gwF/dNKOdQO1yNi5qzok92NcUSSyZjCTqcnZdoNk0fwb5wtR2VbVG4
	MdgoHi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqo-0000000F0T3-3Cds;
	Sun, 01 Nov 2026 22:16:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqX-0000000Ezc4-2M62
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1DC06024D
	for <linux-riscv@lists.infradead.org>; Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875131F000C1;
	Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571372;
	bh=giZGJrmJ+qacYqxmdFZFyw17xIbuZvWJpSr/F67UmNM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jP10cT91/z/TVGLS1LbXUmDx/BvBQNuhf30v2H4Hx5WDw1rP1N7tofXE15JkcGK85
	 TY4ZvR/OPuuJQ90O3Wygg4v8bQQ0ahkmCONct0gECzbDiWFDPOkH3QXVEdwZEtJ4DN
	 RMt0JvJMQ87UevxMmtffQm2smJdP6NQ9domQ1VkvQBjypQmqgyJNxyKboUrCmj3Tcd
	 ictPzu9tMSImPCe91AaZmiopVLrfx+ViUgaMDgE+qS0XL3b8BJqBpztEM1PI7NBeY9
	 6IQKGPRlxlhF/HULLFO1uRyX/g9zjnp66sFOxLItIhI6Bn3ygRjxPMYbBEAL9VJHGF
	 TslbjOWCm0e4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D27038003B8;
	Sun,  1 Nov 2026 22:16:12 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL][3/4] RISC-V soc drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357137104.2624073.12690536548445042177.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:11 +0000
References: <20261013-glitter-lingo-dce2f8d724c9@spud>
In-Reply-To: <20261013-glitter-lingo-dce2f8d724c9@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
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

This pull request was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Oct 2026 16:38:28 +0100 you wrote:
> Hey folks,
> 
> Diff here contains a lot of clock bindings, so I've provided an explanation
> in the tag.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/4] RISC-V soc drivers for v7.4
    https://git.kernel.org/riscv/c/b45ebc4a7cfa
  - [GIT,PULL,4/4] standalone cache drivers for v7.4
    https://git.kernel.org/riscv/c/655e6054acfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
