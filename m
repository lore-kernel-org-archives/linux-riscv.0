Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C0606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 22:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oaqioyq9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMT/d/Ci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VAO/SErBtNikPpM72SBOLnqdBLisPJeGAP6BvIHH6bo=; b=oaqioyq99GaWQ5pCXzp9WjyQaU
	B3iYvc/D+KxmbrMQ2FN51cunf6VYjtINDt7KpImwq3VqWjBsoszr+WUhckSVIo4kEEDAhGMpaxQfb
	zuY2mL0E7KXgJp4bQ1STfac1fV7enLriWranUiYAVpxTVh8wjsoLEX0siTMJZ2HyHca497P9JrDXJ
	p8y2MApNH7dTXzSJiPFy1IHCOirIP50nMrzuwdboW3eY4b2uoP0hNM/SzRTlqubHf8U9yjKegWq5I
	uyzMsbhfMGAzd6/a1gLpj4zliWb96RPZwp5G70aMcAD4iRcgnjv7n+N1NCttdAMYvAeazK9o/C4pj
	8ZKzLvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFux-00000001qGH-3J9H;
	Sun, 22 Nov 2026 22:20:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFuv-00000001qFx-2uqY
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 22:20:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA86C60233;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4648B1F000E6;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386012;
	bh=58/xK+gJsTuXHUFqeudxRMchPbmP/WPyB8538K2N3XE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=JMT/d/Cicr+Dp4nXiYaVvuVYlIbRpiP+RcMOdIA5mqXhDDQTBw8c+rehvOkWKZ/Pg
	 2y46EZkCTGrhMKDHzKzKZfNbVAlUM/cYNZaAeb/RQQYk2pF8JkFxCETTgmDCo2p/28
	 AOVFYCRwV1BkSf6TraAIEGQybtnaGN2/y0ifKQDj8xYBaqQyR4eTx6K9MIY2nSqKVP
	 KG4fY6GAaam9t7CxCgG78WsSZFsvDH1lnEq0uc0jrxAtYffM0L1q4g6IughUhgdrRS
	 xEFbh0e8MTV6yV+IqK5aNcnI2oU/mmxBu9qG0bzuOf/rX9mexaynjP1lBR7tBK6Mw7
	 iOcNYe1+ic/Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A315392ED41;
	Sun, 22 Nov 2026 22:20:12 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <1a74c335-ead7-bf62-b35b-d2afd06599ca@kernel.org>
References: <1a74c335-ead7-bf62-b35b-d2afd06599ca@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1a74c335-ead7-bf62-b35b-d2afd06599ca@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-rc4
X-PR-Tracked-Commit-Id: fc91dacd0c2b4f9ca7e0ce30016f5aee6256cba5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2681617eb9317444247380298564f58142fc4ff8
Message-Id: <179538601156.1569645.5378016366950557720.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 22:20:11 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pull request you sent on Sun, 22 Nov 2026 13:11:58 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2681617eb9317444247380298564f58142fc4ff8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
