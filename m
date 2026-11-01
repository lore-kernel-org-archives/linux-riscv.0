Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6820B606A327
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MOnpF7AO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mc7t9jVP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KFb3AC0x7N4ZsQ5sor4riGHayGDhNI1C3s0nvAQdbmE=; b=MOnpF7AOB7hIEHzgKD+EaJ1vHy
	KHagLVYbTrBKdSbEow+w4KtW4ofTCEuNXeEcS87usTdVt5ICS2Cif2mpLMENxP0QuWtPAA1zH/S2L
	hbbb6lN9ErZOx/lMdyaAY42vGUdo5nXWQdnNu9gOlens4wVe9aZze0bR/ZXFDEJIB1AsUCiTafq22
	CpvYanfO+lkNQjO6UgRUJ8FBvQmWmysWUJ81SrDNxP0yazV/bTA2k0miRXqpYNqSDIkd1LOWWIf50
	V3FMadrQOJ2sWcrFZIjtbp/ycOyVxTQWeqCFEo29Oe56GVMd7p1nUnD+Uyy+quTFRdCxmvinSFBpg
	s3ETuoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDJ-0000000F9nj-2ich;
	Sun, 01 Nov 2026 22:39:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDH-0000000F9m1-2hKT
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:39:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 683BE40116;
	Sun,  1 Nov 2026 22:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB701F00A15;
	Sun,  1 Nov 2026 22:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572783;
	bh=SZ7d8iHBSE3Yrx5Iw+4Dii899rcTylqgfWPZIDQ/CMs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mc7t9jVPyyVRk4QaAxMEqk0zFAoyH1m8YULkAjdOI3SGmUZC7CcIPQUNMCgVa+rlQ
	 22sNRm4GON533GT/4FNSWlOIg0iKvcs8eDcEiSEIxNVbb8dwyByIrQhzFkM+NHTQBr
	 J47+zxDbQPIarTuU5uGwkyAJmEGEfsHb7Itd5Rl+PfhnihPW9PSpeasYGxaL48Ceut
	 172Q2ODXoJnaqeVkBDKJzsnTsT8EomkIDstmtL3RLyIyCuxJSUKxCJR469nndqn0JC
	 jGhRyfinP+7E4u3I8oLSNA3mnqQ1hoJTq5MF8y5KvJ78a6SRNh9/w3MSBY6TdAxWR/
	 GempdmlBSsiQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4023B391AF9C;
	Sun,  1 Nov 2026 22:39:43 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357278179.2624073.8401504518480908201.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:41 +0000
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

This pull request was applied to riscv/linux.git (for-next)
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
