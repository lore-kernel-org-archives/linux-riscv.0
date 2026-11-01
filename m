Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE279606A326
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inkAS1Zq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mU2smauH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L9M0tTozlbbzK2GYZtUk0Z0I+Re2+p9eLyPnW3A53o4=; b=inkAS1ZqFvfLmchq5J0delmpvM
	08vQypoCNZfMsgUkNsqrTCLoDakw9Wh1Js+J9e9D33dSP2whN2gLQMaeCId+w2FYy5cajkBr99dBW
	UL7KnG7Q20s9lID/EEWnNEajeCR49INSzb8KlabUkCcyTBo8JQuvpGIFI7xogJz+QoUDpwncNQTvi
	Oih76Ubtw1JURFpxUzcCj9lh14NAo9bfDITo9GvkRryNGIfRzPRiW+/zhFfAv6C7xCv7UsgUdiFDf
	jr9QzC7GxXVRtEvRUPG6sYehGa2iQp+UcNGiLFaJmiIXn6q3zhSTZuROuKMIBltfeBbuG3A5E4ER1
	aUXigWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNds1-0000000F4Vu-4A8n;
	Sun, 01 Nov 2026 22:17:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrY-0000000F2r3-3TbX
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0C5740A30;
	Sun,  1 Nov 2026 22:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42D91F000C1;
	Sun,  1 Nov 2026 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571435;
	bh=W3SseAUw1Adaw7R24q7ka5OACCTvGj4w3HZoU07C3lM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mU2smauHsTpSk4e8o5VKlerWwdMjuW2RmdR8AA+TXE/q8eg2LBHimTGFzN+bxJWlF
	 k1bkTo89sPzE5TbPsJzPK3mhefVdXN4tiDH8cHAZpDwp4trNnwoRf66/XiGfVmJpwC
	 s3FuzrojyaL2b2uP62vOSTQd+4TqGoon2EIkdmJ/DIgzCjuikMm4iZU7A8taIufZAa
	 N01ab3ILH0PGIjJ4Mdar7ihYBy8vUwmsGmbKTgipSbuuljgnYErIeQJNZKrQB2iU5r
	 JjXniizbRhbYDeCQ1+jOWUNY1MKLKwokkcdJwAfDMFedOaRs9IWoD8nlMMQIqTzYZv
	 pcASdvIycRRyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA38438003B8;
	Sun,  1 Nov 2026 22:17:15 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357143430.2624073.14407284284401354103.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:14 +0000
References: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
In-Reply-To: <7cd0fc49-0592-2030-17bc-83edd5003817@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
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
by Linus Torvalds <torvalds@linux-foundation.org>:

On Wed, 28 Oct 2026 21:32:56 -0600 (MDT) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v7.4.  These are mostly
> optimizations, fixes, and preparation for work that we're planning for
> v7.5 - there's not much in terms of new features this time.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v7.4
    https://git.kernel.org/riscv/c/1b8b67503725

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
