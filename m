Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BE5606A326
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JVRt3XzJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbiTQpLL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=svNQ3z+qqLG0c+9uxvYGBZ678KhcoRU1UgOHt8vQ6+4=; b=JVRt3XzJGl2TVdoc9Ep12R/+UX
	ZFMSWMaHkdBbvxR8x8IuvGs0V6iu4eGepTw59iukDLSdf5xn544JSYR1u3m6efEAXuNp/WMIbYQm1
	Tdii1Pj45m7SZjOuFJ/au1fYdyL6f6MjFN2YJLO+L92Ef/VlNoSfEYXuqm3XZ2LEPRBmSMPAYd7DV
	88+KC3YIhYjP7mWURvM47r8H53TL86YEIYd25YvABe76X85kz/GEb6n4hjwzhbpjSMp9XMVs6lzPd
	EhXakdROvUx1X00DFWuV8b8GJJQtkKZ2dmSIOM/xTrhc1XxfuCYVfknrBga2Sm7qNKSkf2BsRVxaA
	rEqVdlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDD-0000000F9jW-1A1A;
	Sun, 01 Nov 2026 22:39:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDC-0000000F9jE-03ut
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:39:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6715C401F2
	for <linux-riscv@lists.infradead.org>; Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D8A1F000C1;
	Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572777;
	bh=vLtVfEGtwu3bwZiOUe3jPRQr0Jnv3xFPriBAFC9hebk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EbiTQpLLtPVIrDr6uk8x5RwxaKWrPWGzzmd5Tl7f8dq/EKS5wKCLl0pjuuFQy/VMK
	 NkZFMnw34H7smMwZEESl7iDCOsGYEXzJKXj3ZkPABstCuAq8/4I4BVSaE4TQSJmF2e
	 Cu8aDXaE/7S2+3SF8kYQ4m3ZwecHQJzkARH934GQc9r93Ks7ebs+RQIuuJu8hKEH5K
	 NassOD6UfCjOhDVBR1f3jVhG78r4CznZwGNHPDYaFPosmE0Z4FgGhaM5VBbm9jeZYd
	 gPmvX0pZfNJnTgDoQWaqpVJroZrpBLrCZ/t8sQc7MTvJvWF7gxmK/ziqttkOB6N1mf
	 l76zRkzrKbcBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401EA391AF9C;
	Sun,  1 Nov 2026 22:39:37 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL][3/4] RISC-V soc drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357277605.2624073.11642438626081905507.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:36 +0000
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

This pull request was applied to riscv/linux.git (for-next)
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
