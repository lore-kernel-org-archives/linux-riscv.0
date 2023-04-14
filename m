Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2D2C77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqTJJGOzSVLEevlOR9tEUQs5aL+NdPRRhgvCTi3jxBQ=; b=RwBrgK1N34GIPo
	i168/jcE2bALsiUiZJQDvMwE4PenraE8SzntIAbSFqL7GrEsENbGmzzAMUYV4mEq1uVoch1VY9N4y
	j6ejPG/9fRIQCApUzmVaPnmKeRZNJpJ191vrxLqnfTvywwDDONaqn5flORDoqJUTZ62GAIw40103w
	4i4/f3+YiMpCwMulEql611MAyfjM6HKHab88Zi/wvAsW4eChj70Xqg+FOEsY79WLkLIDlWaoHxP3A
	eAhr6TV2IlgQ0lfbnVso2k2jiiUOo0ggkiQhV7bZ+vZkCxzruvElExhHUh9vnRENXwLekIinmlQyX
	IlmYBpS/P/U4LpThCkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnNYv-00AIUY-1T;
	Fri, 14 Apr 2023 17:50:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnNYs-00AITk-2X
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 17:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B178064959;
	Fri, 14 Apr 2023 17:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24012C433D2;
	Fri, 14 Apr 2023 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681494613;
	bh=WZRbQRqH4e7yc4/ZQrSWpzr2f88IPovT0DbH8l99Snw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UmcYVTAzw1IhuwnjGb12LSV+QmjMvvp0jAUDg+U3LH1WJr8RLBYE+/DKYjXyjdnHL
	 CyKv5J88aGjeOi6CRNYNqCcoE5+DNdPy/jYuLP0i9YzFzIvZl8ie62bm9cklYOeQO/
	 otU0xK1+soJXs4J48ShE1VrgE3uHRMRsNoej4YZIBjoebi0YqgCbUhknmX2DhNgC90
	 idq0spx2WvVRtoy62B1ZVgo/V3ZhRrNvcNKzf0sbcLfUeDMfosUv+JTFXoG2nuoxvK
	 jSUMB14XvPuu7322mB6JCfB77gqcexwRpRn9vRsiRdwHWdB2vb45CL7/oaMfNMKUJg
	 oH8f37ejfRtxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0186AE52446;
	Fri, 14 Apr 2023 17:50:12 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f47ee915-bbee-4c49-92ea-1d598355a0f3@palmer-ri-x1c9>
References: <mhng-f47ee915-bbee-4c49-92ea-1d598355a0f3@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-f47ee915-bbee-4c49-92ea-1d598355a0f3@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc7
X-PR-Tracked-Commit-Id: 1b50f956c8fe9082bdee4a9cfd798149c52f7043
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a934f4bd7d6f9da84c8812da3ba42ee10f5778e
Message-Id: <168149461293.15164.16774872103556012068.pr-tracker-bot@kernel.org>
Date: Fri, 14 Apr 2023 17:50:12 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_105014_860306_E146D467 
X-CRM114-Status: UNSURE (   4.10  )
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

The pull request you sent on Fri, 14 Apr 2023 07:47:26 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a934f4bd7d6f9da84c8812da3ba42ee10f5778e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
