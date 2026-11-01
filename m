Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4218B60A2603
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ifd4/e5X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NMPhMg7/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ru8nTY+iufLTH+CPrJtbBEN9+lTlAmITlNdsojW9pjk=; b=Ifd4/e5XDCtDCldmKVSOBrsmMy
	dfzZADUiLbhyNp6WAXktfnRoR7wgZTLLRJhixrYUHEskRoMEo3JIyvZ4CadQ4wcSphmefJxNa8w5d
	DjvzR8IBramnaNsHENAOJW4awjUQY5OwI/vrkwHIxK48uvLN6Pt2daX+hSa8HtTdxVClA8OB4fsG8
	BiF/j3dzEHuFnhLvXgTmAZ4hkbYLWDbcj9kO1nGo6pzWigA5EGtrjQGamb0XNRxt6JEerBx6A1EbF
	wgjTiF6fZKW5/2lM3wHXmwKxwALC3nOw+psovT3bgigb3J+HRcMZspp3OFMvI/N2XbT/TrOcabYhZ
	4jgncUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDG-0000000F9l2-1UGr;
	Sun, 01 Nov 2026 22:39:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDD-0000000F9jV-1qlq
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:39:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E36054004E
	for <linux-riscv@lists.infradead.org>; Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C614E1F00A15;
	Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572778;
	bh=DRQRIRQarXTnNZOzq36UNa3LsErU7BTljNQ23y9A7r0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NMPhMg7/LznAP1qKPdQhcyzfkoRnuRkq7vWZjqAO6yYDMCI3+mTSy00GNoTykPN/l
	 I+GcNSBWN/4lKNE6BrbqMKRcw2/+bmGiav7aSTicXO36taBJC5NZH18IU5+Coi0wDA
	 gdR+edr+EYORtPTeI3PIdccVm00zUB6RTLyHFT1po3Dthbd/+/AQoelHGin4MWU/kH
	 uoyu3FyWLf+cXi9OWPgdTyEABrwXLQsIAJPmb66RPyboOjS6jYP2HlbHO9F5enDPf3
	 gg8XEGofYWsoGjADLkrLrV//hLH/EIbWNPvi1BLJ2/pR3iSrs8Q6hADfijvq8CV2e9
	 aclo/6XUh1New==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA314391AF9C;
	Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL][1/4] RISC-V firmware drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357277729.2624073.16276179294842565397.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:37 +0000
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

This pull request was applied to riscv/linux.git (for-next)
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
