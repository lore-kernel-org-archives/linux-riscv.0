Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB1EC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 19:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPnvdZl+TM6wCtf22YsI3SE3lhZLEFU+NJSjSmZsyao=; b=RIzRNxxU9pO6SG
	IONr96nvWYdQ/l7of/4oLuo+0rCgd9XDcJlFQIVG4KSPPFtIyKTnW0wy7ezDb62pj1PM3PLn0XXXD
	xHybnfNxOMRIxVg3I5L44qz+IkrgTX9htvO8gboLQqK/Z+DvPYl1D4LGA4N5Z0mzNUM2EA/WuXlfZ
	MzLaaVqbBkfVgQay8YBVacBQwOksUoqorSiVqkX84Ddn3Aiyz8Ee1JxCLiTJHwB875qs7e1hnsH1f
	U3spG3glrSMpjMptMd0vSj3Lzn8azK40O9/H5UHIPC+QoOx8/e8EY/ugLnIwjR1Qm7Q3ap31D1JkL
	y4hYvMdJdXKz+tKTVftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wizcO-00000007h6U-3zkR;
	Sun, 12 Jul 2026 19:13:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wizcN-00000007h6B-4Anb
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 19:13:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB8D2600FC;
	Sun, 12 Jul 2026 19:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939261F000E9;
	Sun, 12 Jul 2026 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783883614;
	bh=H/FtddJ65Y2uyjPMVR8lZIHR8qa0n0zxJQjVcd7UNMQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AYBY3a4vvUx4/t7MH5mK9M7nJNMdpJfJskr84zAtzLPdPYGpu+wZ/b9rvJgM1NAeA
	 0Qzi8t0qPWksLbzXojPb9p26EBNKN6OS0xWz4Fs8IPFWfoL/RANkTEGlwsFO75G2Xh
	 nSqIohDiq+m5RYlegvSf91LMGCnYD6qljjHQ7txe/vkjArg7o33FNu6z61uukRdmuS
	 afRpS8cs6XWlPIWhG6yhStblGC0W6kydRxCTqNe2da71amzppXUiULfrn0rWtkoIUk
	 ypudkVf8dFYeqqC4g3Txayt89PaaEhvxaqyHrtwHh9lAed2PM/8iQNdnTHzhr8GwKb
	 ku2dBVgfiiGfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A24383BF4F;
	Sun, 12 Jul 2026 19:13:11 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.2-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <3eee4a66-e241-8779-e99d-2403abe88433@kernel.org>
References: <3eee4a66-e241-8779-e99d-2403abe88433@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <3eee4a66-e241-8779-e99d-2403abe88433@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc3
X-PR-Tracked-Commit-Id: 58a37e7317b06665e21609a2f867a9962e9e2919
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f9eb0c54a834009a22f08903d4fdff48be62e28
Message-Id: <178388359042.1462520.7244139816063876743.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jul 2026 19:13:10 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Sun, 12 Jul 2026 11:35:34 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f9eb0c54a834009a22f08903d4fdff48be62e28

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
