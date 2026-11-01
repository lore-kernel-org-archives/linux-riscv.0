Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B511606A326
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E298Ecwe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gU1EXYtY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Mj26jnWj3QCdieHWQp0OypHeQZbohK1voRyoDKNxZ4=; b=E298EcweeEA8ZDfIfTAZgVbHKI
	S0JMWQSzrkO6eNDt0UgVIdziQGxsaIpQPd98iYKfYIIDBfZkw885InpdgUvu7jqa3qO2GB6VXSszA
	rC++fVpk8IYrKoestnVs/vqQD5KePjiubmKtC1v2Yp9c8ZYRIA3tUqaMCRoJd8FC1Uecg/MW9ZWwL
	ZbZSYvZXfG+twIUjRsz/lFRP2lVYSj6Hc2AWw5+/TJbQ1dQrQSoiwA8AmAgl3YTZn8MLj3DZHelCW
	8noo+81cemvk+64K6FhJS7ZF0Mc0y0j8CjhpPkivWVXKqg5VT22b2YYn4IYaLxTr/9lPFR1SWCdLd
	AoexpRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDG-0000000F9l6-1qSf;
	Sun, 01 Nov 2026 22:39:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDE-0000000F9kA-2jsE
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:39:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63134439A8;
	Sun,  1 Nov 2026 22:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A7E1F00919;
	Sun,  1 Nov 2026 22:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572780;
	bh=tOvgo91yxB0uiVEye3fsaTYDXZC9gD67u6Rudl649m0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gU1EXYtY9+fXueorF+E+mDX4pidOvgBLT5wpPL3tUnMdHQ2wpuccKEkUC+6adUIw0
	 quAsHYH9JAM23o2olejKeR/gHORkM0eG3jICxsOzeesPw6+xmvo4n634anhS0RHGja
	 Hcqi4KFlT8oI26FnnutrwChRPqJowsfCklP1+ZlsL/1CLwM2hg9W1dkUWleXzyL8f5
	 sZGACnPZYK9D7QiLbVTFWMGtg2QxcYt4OsAOFPgmQuh9f2DY97YIEmIFvGIBZ8IeQX
	 WeC2e38G3KmtoSXa/xPhMf6jML1QFIwNZPPr5A8sDhQ1Tipkc+im1JP/l6IpT5KH+O
	 OjU3Gi6isy9kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400D0391AF9C;
	Sun,  1 Nov 2026 22:39:40 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v7.3-rc7
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357277879.2624073.7581000406464744053.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:38 +0000
References: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
In-Reply-To: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org
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
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sun, 11 Oct 2026 00:05:14 -0600 (MDT) you wrote:
> Linus,
> 
> Please pull these RISC-V updates for v7.3-rc7.  There are several security
> fixes, a significant strnlen() regression fix, and several other
> miscellaneous fixes.  My intention was to send these earlier, but LPC got
> in the way.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v7.3-rc7
    https://git.kernel.org/riscv/c/b2d929a1c2a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
