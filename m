Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B4CC4321E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESmAt73cT1TfxBQHK8SO3w3oUiyeoObyr/sXBk3z7hM=; b=xuQ2fvd/IYLhKi
	hTy2aHQ8UNnInxf8+FOIb6nmr23aeiDaEEj4JgGJPH61O25Uk2S0dCOGPjwBSo8bZRvsSgUC7UJWg
	/60mcOFmz9lMif9rfTICToxeDSfOBQ1nr085zEjsnUWj/gYSF+olkwy6uW1jWKyUyP62qPmtaGwPy
	rivdSNjVcyK5czg+lNaJGfiNOIw8YmK+97q/cddO0iDJFulIATNJYSfMSmoHo1NYvsnIPkektq7os
	DBsU0x2doGvjgmVewvnikki3yeKksSep1gV++aMHv6clnsD7h5n/HbFcAY9D6w4cEql5XRWXgNiEJ
	Rs9l8vqCA/bTqgXL8pcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1G79-001mMX-Me; Sat, 03 Dec 2022 00:10:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1G77-001mLx-2d
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 00:10:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9CA38B82306;
	Sat,  3 Dec 2022 00:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A012C433C1;
	Sat,  3 Dec 2022 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670026237;
	bh=UoY0yL+gTdz7KbbVWhh7PwyPSxsEMr3LBk1X+Lcsp9o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gkjK0P/KQx4EFlGtAziXzbWtTof6dTryM3kOJO3UqWpMn4FADe1Qh3Brgb3kVMe2z
	 h4JVR8gFIc1IWIgMeAYhHS+SCuhP5Tu+PrSbmvVwqyfUjtm3Y9enEZFjJZXxPzopNt
	 yPMuJ5qU02Oi1/CA3cMZJ4UmjNOVIFqzFapilK1pjXQ96tJiSP2mGiUwsLyL8+7qA+
	 AaNAZfClQ0SXy0cz4IcPbJS5sCDUAm9Tw01k6K0GRzU7pIVDXUQng9P6lJiVNWs6Fb
	 +hTCELrEK58aiY/LS3B3lnkk1eM5d00ErmPH92ysm7i/VUlatNUQd84/J1vcBSa8d2
	 Ic5pMiTw6U9Qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56D22C395F5;
	Sat,  3 Dec 2022 00:10:37 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.1-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-ade5e352-1239-4324-aab5-e2fb6a575c25@palmer-ri-x1c9a>
References: <mhng-ade5e352-1239-4324-aab5-e2fb6a575c25@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-ade5e352-1239-4324-aab5-e2fb6a575c25@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc8
X-PR-Tracked-Commit-Id: 39cefc5f6cd25d555e0455b24810e9aff365b8d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e15c3c75a28b10bac7b3ad7627fd6b458623283
Message-Id: <167002623735.23477.14131709914366367868.pr-tracker-bot@kernel.org>
Date: Sat, 03 Dec 2022 00:10:37 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_161041_289522_7BFF8D61 
X-CRM114-Status: UNSURE (   4.27  )
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

The pull request you sent on Fri, 02 Dec 2022 08:53:14 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e15c3c75a28b10bac7b3ad7627fd6b458623283

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
