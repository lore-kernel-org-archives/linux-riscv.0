Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D2FC76195
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZ5rwA5Zwdp3uHNV5YQv0gpCMBmaYUum7oDhC6GY34c=; b=WYog+OSjCiBNBN
	sCs6C/w7cBuOEyxKP2F6LtcG/nZSujHDZbamEtPXBq2LGl2SNxaMYNA07MoYESM+fo6f/wloCKJvq
	wIXpnFoI3VDfcvAdmoNvwtMs8qsUL+E9L2lV0X9Cybxyu5iURaXUOm1gfQYyOmU84WHXW+RFL7ehx
	yvpAj3rv5QvPgD7CSAt2VJtsYob9cOSZTuzNk8b+6c4/DKf8sevrPjYg86fQAYct3jCJSRx70W9Er
	N9My9XEEBUmkG1jWbG8JrZ+fOjS8AobC0xozHli/TB54P/0+gUxxN/VpC0Tvh+97/4vgtHehQm+0B
	Oj9EFy2N0hfVYdqUvVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfl1C-0054Y3-1y;
	Fri, 24 Mar 2023 17:15:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfl15-0054T6-2i
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 17:15:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 18F44B825BA;
	Fri, 24 Mar 2023 17:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEC46C4339B;
	Fri, 24 Mar 2023 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679678149;
	bh=3vK7EQHW/mUxIGD0tXcolxrLVKt2Ft5l+RQ3l5IVXBc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KqEWTcGZGFnVHSBzcdzh3sUNr6kTMIJ78JDdZzEvB9GAV4guT4RkSTLALCOJ7eqn9
	 hTIpUFF1/HC3r/tJDx7zoYgEinEBOk7P3pwHB6CJxbCwIHG3AV5IrCw46OnCalBE2m
	 2pQT9L8FFoTJiN403q2vwNvPJYDTKyRpU8ybGMjo0y3/UnwpuStGiw334SXbS6fzQP
	 pBqchLJqG3iwhXNI+xjjv+cBPN/LoJvKLWUUVIWJG8/dNnrHc9Qjq44XBFLH7uV+9X
	 4EgGNX6vvf3BLB734Gg1cfFeedLQCi3lS9TPlKJQM+Rul9prh9MSKxv/enGHGohoyU
	 TRXbBfnJ3UaNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A6049C41612;
	Fri, 24 Mar 2023 17:15:49 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-4d782094-e4c0-4626-a038-78e17e33b19e@palmer-ri-x1c9>
References: <mhng-4d782094-e4c0-4626-a038-78e17e33b19e@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-4d782094-e4c0-4626-a038-78e17e33b19e@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc4
X-PR-Tracked-Commit-Id: e89c2e815e76471cb507bd95728bf26da7976430
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 19a6b66ca5244203214726376fda978cda2fc488
Message-Id: <167967814967.905.5197343284289553060.pr-tracker-bot@kernel.org>
Date: Fri, 24 Mar 2023 17:15:49 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_101552_059853_15D3E6C0 
X-CRM114-Status: UNSURE (   4.17  )
X-CRM114-Notice: Please train this message.
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

The pull request you sent on Fri, 24 Mar 2023 07:44:56 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/19a6b66ca5244203214726376fda978cda2fc488

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
