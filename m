Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7012C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKb+UPdyFkoNCx9Pqahzz3u4Vyha2gqbRDdTaBl1opc=; b=nKK0oFAkpW7mkz
	BYUYLbLKOYq2k/pKN84gtq211ZPcu3kIhrXmQxW3px5lQ0jvuMEMQi0VGRf2DnjKoh1NW9+q1dzyN
	WTMvMeDcs/dDckYTpk8uTfSu8vlxmOp4Jp6T3khh2Lg1Hv/LkYGomVJC6Vf5cnHzJJ3NIKNFh72XJ
	6jYPhtwM3B3sg0XOb1wU6gD1WjJnHzPP6citoU5820nVbztdmlV2s93JON9hOzOXiso1EZTD7g6J2
	qseX/Fxsk1OpeEP+G14Nl7OWe9bRSp37yFUFOxAjvs+YGWqRC9505JzAuZTurXM+UMxyMR7lW/dVU
	hYgI9HNTj8rgXbMuqIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf1gb-0000000DqBw-3J6v;
	Fri, 16 Aug 2024 18:28:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf1gX-0000000DqAx-1Yft
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 18:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 161A06229A;
	Fri, 16 Aug 2024 18:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC9BC4AF0E;
	Fri, 16 Aug 2024 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723832903;
	bh=hVbsUNk5hQjdCOKWnbYwau4OwNFxR9Ldnt5Erd0EGM0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o2Ys8XK0uDeriwbqQJFQ82bB50ZBS0PkKfbSO/LhvYJ2/5K0He2ikvHCwD5WxlpVs
	 25t4izupVqgQZjz6MHgA7OKtBIIkyxiZLwngORpAHWBS/Z+t2t0TST25OxlNwaOrbw
	 fayy3HiTeK7DoW4NJS9T4A2xA7x2j8eFV4S9kczm+2v+hE7o3+WPjh807B1rNsXDOg
	 T4/M6UTrjAC9HWZOb1eF5Pj38CL09Tceq1M3rY3WDdkEgSDTgT9k1O21g7PEqhGwKA
	 YJfNQWHXtBZIn0pzP/lVRIocUOVQOa3fCAQk4tVH8xeddzAh1aLuL51glNrfp4KyZa
	 CjevnvMKjUUkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7129438232A9;
	Fri, 16 Aug 2024 18:28:24 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-24597fb0-2ef5-4a27-ac81-cd0aa42fdd56@palmer-ri-x1c9>
References: <mhng-24597fb0-2ef5-4a27-ac81-cd0aa42fdd56@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-24597fb0-2ef5-4a27-ac81-cd0aa42fdd56@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc4
X-PR-Tracked-Commit-Id: 32d5f7add080a936e28ab4142bfeea6b06999789
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b179fe052334ea81c9f1841bf782bb0878b61d2
Message-Id: <172383290310.3597757.17050790371795847106.pr-tracker-bot@kernel.org>
Date: Fri, 16 Aug 2024 18:28:23 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_112825_494916_B1C62219 
X-CRM114-Status: UNSURE (   3.38  )
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

The pull request you sent on Fri, 16 Aug 2024 08:11:53 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b179fe052334ea81c9f1841bf782bb0878b61d2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
