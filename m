Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24618606A6C0
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B6UzTsHw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+ppPjbL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=31mzexXFQ2Ox80oRuRZ7YoUz6Vi2xQlf+bG64w22054=; b=B6UzTsHw+UEbjdbZqMM1zYtLMU
	DdhhIDPmrf4d3g3vnVyItE95+6YZA9ZQKiczlLb08jznHzxLVUQpgyXBrtrmwYFhIdjS9vfCc/PDq
	ncZbAwD4w/RluU+YqIa7MZReOt/DzbL6593h6KUBqNXl0oY9Z/RoccmQdOBNaaz28bAFjJnAoKEzd
	2lGGWJRUKd9Z0K+R7lZLIo+BYTlhsbtnuNcQDSmWR56dwm1XoCkdKjuMwDJBZ7Ymd4uVNPerjnrCM
	7cTFfHFNYIKaHOQ78HJLKBZWJHgG4B5TNIipEe7FcnjyNNPLU7Gxg+t8Qj1E+i1GUhmnY/JVD1aUs
	tt+WpbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrx-0000000F4Hn-3rEN;
	Sun, 01 Nov 2026 22:17:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrV-0000000F2d5-1MYY
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6629F4402C;
	Sun,  1 Nov 2026 22:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3021F00A1A;
	Sun,  1 Nov 2026 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571431;
	bh=z6WmWsGkP7B3vEQH9vudiLJJb6lZ4nLw+ZctscqAZ6o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B+ppPjbLR3m0KChrwzNHgrHStujRlV3kj3jydHfOGJx++Zw1FtEQ6AqvNZGQK1lb3
	 Yvh7S0GfPbFAxVwmb2/Sx3zNxW+8xUNPK8Jur8sAC5RUM2SXOc3DFwyTMna9ZZmfNc
	 ILJjUtUQnvw/RJGq74RnToldg4tzDq8UQeWV5v5gRdnmSpzItgHRXh1nOGjTW5rJ4g
	 5+FZO0/Xbg5/s2t25b/6Xzs7Lu3nvaJ7IC3wgt0Fm1fL4Uhcy48Q9WqFWKdECik6bt
	 YqyOuZUkueoD+TPyU3ABO//00sLfj5FFK4WPFIkSaNzkYtTFye2E9AypcbDQHZXJOT
	 Ng6Rkg9dipULQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4017D38003B8;
	Sun,  1 Nov 2026 22:17:11 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] soc: mpfs: use kref cleanup on probe failure
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357142979.2624073.6945468592724595893.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:09 +0000
References: <20261007121743.192486-1-lgs201920130244@gmail.com>
In-Reply-To: <20261007121743.192486-1-lgs201920130244@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, ustc.gu@gmail.com, linux-kernel@vger.kernel.org
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

This patch was applied to riscv/linux.git (fixes)
by Conor Dooley <conor.dooley@microchip.com>:

On Wed,  7 Oct 2026 20:17:43 +0800 you wrote:
> After kref_init(), the device_get_match_data() failure path frees the
> mailbox channel and sys_controller directly, bypassing the matching
> kref_put() for the initial reference.
> 
> Use mpfs_sys_controller_put() on this path so that the initial
> reference established by kref_init() is released through the existing
> kref release callback.
> 
> [...]

Here is the summary with links:
  - [v2] soc: mpfs: use kref cleanup on probe failure
    https://git.kernel.org/riscv/c/6f77194e1147

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
