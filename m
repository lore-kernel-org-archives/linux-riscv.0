Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA190C55174
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 19:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfQjbQERp4D31sUcFBEiyM/nrwx9IY3oLOIF9ONbNVY=; b=HAOmcD+oY7XRV4
	xq7DFWLQkT/oAAMUAVX9JOmaTNw+Fl/ojuxrQ1vI3ZultmCPy5YiEb54s7bMwo/5cIZWop/8XzuNI
	giQfsutkxp7ySvU+8SOhuDu7nx5z/rtmibPIlW5438BY8GSFORyzNDr9EmNEnAlMWHLbyk5qHuiUs
	JETgg8UMD0AEoaG42tpAiOZSp3hRp0hhvBlSQB9Q6eUTmxuCq2JUA3SY7pOSyPqHWjHVJsT2sfh+z
	kdYhtC0I0bY7/s7ci2sMU3Wrs6fvSRMipqVRL7fjMAPwhy8MYXudG7Nw8i7Pnr/W5lOPCDeaod95c
	PoaO4ShnPmuJSSZtqDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbuK-0000000FzFf-386V;
	Sun, 02 Aug 2026 19:31:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqbuI-0000000FzFX-46J7
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 19:31:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6EC043C04;
	Sun,  2 Aug 2026 19:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB51C1F000E9;
	Sun,  2 Aug 2026 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785699093;
	bh=JKegjBJg8VqCshrfxEvIF33lBxJ7h9oumE2/7DkJFRs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fFDwE6rV2Sf5mHHdba8D+vLjpeqPEgXHeUrIQ4Shk/SHNHU1hSPRPxca1nQh7Bb1C
	 LhXGSvRVFtB/HSWKOWRL7xSEnGYC81ehr7pf0lTIG4W0u6AmeV3+4dqvEji+kzgkXb
	 sti78VQiL1U8ZogkieeatOwoK7cnytxKTxiyCSz8qAohssKJTjjQQ3EhovwDwSActy
	 F9j1a3YYiV4G3szMs46zGkJ8thKwYD9Efiyn3n0TOkX1HjKX9fOzBAsyNeR5vrqtXN
	 Y613nrAZXe/z8MQWqsnC5YPXHfqsXOSycMKJ147sEklle1ouVnn2ZsUcZYylnexirD
	 So/PAtzzRHy6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93D8D3809A38;
	Sun,  2 Aug 2026 19:30:56 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <d1ade3aa-5231-988b-b0cf-d2ebe43eeb52@kernel.org>
References: <d1ade3aa-5231-988b-b0cf-d2ebe43eeb52@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d1ade3aa-5231-988b-b0cf-d2ebe43eeb52@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc6
X-PR-Tracked-Commit-Id: c052927905710de1ab7364bf1925efbd12517ea3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5a7e2ae5f0a9a5caf59501457938eeb249a7dc8
Message-Id: <178569905514.1467519.9874227473981566893.pr-tracker-bot@kernel.org>
Date: Sun, 02 Aug 2026 19:30:55 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sun, 2 Aug 2026 12:10:31 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5a7e2ae5f0a9a5caf59501457938eeb249a7dc8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
