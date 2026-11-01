Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A5607352B
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BG/b532e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTSWZ6Dt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CYO8kE3mHuzoSPdvcUFXQaClJpjiFqoMWuA7JQwlRsA=; b=BG/b532ehIeloNYjmaqxwxrclk
	Mn5UwfXaMZKpazkJxbxFWn2uqg8g+zEiOmFxgRsaiZsd21TR/kEhXjY1I/h0UFAyLC2v3SSTl4Y13
	BbGwzkuNfFJU2DSInBBUrFjqOTdNJcA79FgSMykEZRmDtXANiQHvqLyjjlWNj/+2241vOSwPGPRuY
	68IcU9IAAlbnZAGoF3EA1e3oGHUSqLpyAAnj6v18phWCog8G/aHyhBJ2rDxF4otVWhZ8e6sKHUUGH
	b7izLu+q2dd7K/r0Sjn48zysfED3fD7iK7X5/kuWaJxn/t2VMigYT7FHfxnDKT2x3Pt/7H/gNt8L1
	Hj3qKmKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrD-0000000F1bn-0HN9;
	Sun, 01 Nov 2026 22:16:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqt-0000000F0cw-015Z
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF7A605D0
	for <linux-riscv@lists.infradead.org>; Sun,  1 Nov 2026 22:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61881F000C1;
	Sun,  1 Nov 2026 22:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571393;
	bh=vPgja9r0ZoRtHVHcwxsfwm7w5JViho96W46Bm4fLyK8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JTSWZ6Dtzs9J0UqHUyPbPEyV//V4NX61L4kzLACDacmhWcsyGwdMTrPVS/Y+naCDj
	 uDrnMeeGtvuaKOcIsdCDhLA+US0bUAbj23SvZD7syFGKvml6d8ODjUM+tuk1HMnWbT
	 TZDV8WrLIfX8PEKmrstDDoxT/0+WupCSrWK3FiZr7WRGwQNPaM0q/+5ts6nRY6/53c
	 SbV7zaoJzrQ0ACFn3mXGCKuNjeE9zh9m2dX/apQ8mMU+RtiqUgY5NU/Pb+f/8H1/xm
	 JZPP0h3Xc44I3+FudJiqxmEFjp0cdasLgV/Y2y8Q+eUytWemZyuEVZcGyd62rbkMB+
	 pzWkDECYEExNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA39638003B8;
	Sun,  1 Nov 2026 22:16:33 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL][1/4] RISC-V firmware drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357139237.2624073.15165428968109516783.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:32 +0000
References: <20261013-defame-busload-7eeb111f35ce@spud>
In-Reply-To: <20261013-defame-busload-7eeb111f35ce@spud>
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
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 13 Oct 2026 16:14:18 +0100 you wrote:
> Hey folks,
> 
> Might be my last mini PR here, since the RISC-V SSE driver is coming via
> the actual RISC-V tree, so there'll almost certainly be a much increased
> activity here going forwards.
> 
> I'm a bit late PR wise (sorry) but I blame conferences and a busy week
> beforehand for that...
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] RISC-V firmware drivers for v7.4
    https://git.kernel.org/riscv/c/7c2871861461
  - [GIT,PULL,2/4] RISC-V misc. devicetrees for v7.4
    https://git.kernel.org/riscv/c/928fdc6ff69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
