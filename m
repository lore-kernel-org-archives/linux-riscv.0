Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD51BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bq+pUhQkxwHvYBHyGN4HA3ridsmo/RwrArzISQq5fkE=; b=BwRGShs7ywz6e2
	HgIVtDaY621XZI8thevquozlanLow93JI1PSu1DcO4B93u58RyqeMqtcCMVxGAHVmKofMmVZLox9N
	22h+S5AMmfT4AkXsSeLYa7Q1RARMPaS49ZjeqLqMqazBbu2Fg6/VVBcR9UR/zHDDyfyXFD/M4/M06
	5+kYzC4UF6zLoa9fuQ+XmGOOOH6P0ZdC4qz4OTdiyjm7OesVHcDJuN20C6zVDg2f7mCHddX6RtX2o
	1zSWDN6S9BtVjB1Dg66qmKHSyD0dVY+a3hCM+WmF0gQotBjsPwYA2eL5DvPVcUvjzKpd0PfV/qgbg
	awSsqzY72N6XTirs7h+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myL0l-00CStU-Rt; Fri, 17 Dec 2021 21:43:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myL0i-00CSrY-18
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 21:43:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3669623F1;
 Fri, 17 Dec 2021 21:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DF96C36AE9;
 Fri, 17 Dec 2021 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639777406;
 bh=L3mVzxB2Y2Wu7nTpTqO18BWJxUuntT+xOw5kxJ+QGSQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pzG5p7U/jLwdO+1HPOZ3k2FrWk5OMxr9i84FyNIMO5nt3TNOSnPLcATn3UAwbjbD8
 CDTVVsMbUxotZ6tOBMfZIRqKrDQz9bdVjsx1R3P0hhJD00+cX7U0r6QkuwFnN0fP9Z
 pwit6dGXV1ki4QbajFz08QT/5pkFJB3wkx21ZHS1yMXfNZ7bMc0/JMlBeOTnO8vQiS
 0H75U+9uwQSNoLWd7F7uSvfRVSdU6D3lIuRBBHu6lH0qSdnv5q1zDETnTRgtAsocyl
 0LAm5CNsNZ1BbkpdlXaBwTOAeg86u6ExyRQe59Epx3NJ0lIhU6lt6sYibblLphp1cX
 4WKrskNk4jU5A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0A65760A39;
 Fri, 17 Dec 2021 21:43:26 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.16-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e635e7d2-fa3c-4c47-8a6b-989873263b30@palmer-ri-x1c9>
References: <mhng-e635e7d2-fa3c-4c47-8a6b-989873263b30@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-e635e7d2-fa3c-4c47-8a6b-989873263b30@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.16-rc6
X-PR-Tracked-Commit-Id: f6f7fbb89bf8dc9132fde55cfe67483138eea880
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0bb43aec33ea9dabda27bb8863d0e15acd5c6cb7
Message-Id: <163977740603.30898.13365123503393934821.pr-tracker-bot@kernel.org>
Date: Fri, 17 Dec 2021 21:43:26 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_134328_142766_548E6B01 
X-CRM114-Status: UNSURE (   4.20  )
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

The pull request you sent on Fri, 17 Dec 2021 10:35:51 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0bb43aec33ea9dabda27bb8863d0e15acd5c6cb7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
