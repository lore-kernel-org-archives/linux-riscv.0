Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805DBC38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 00:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKo0P/EsOS1nXiibXG9aV31y2UD86fZdx/VCOa5H1dw=; b=uDoN0mLLv+NxrZ
	X2Bceq86X7INpJ1Lpy3z9zSqU4rCxioXVn1wLqjyw/a7n1kjAX6RDRLYJ8QhufRJFPGGd80zuFcKF
	Da/njU2fTzpBAxDo/KCjadVCAWQoNLAAoUUSs3K2zliTnsK/+Q+a6e8lkG4qR6VmpY9BdOdc/aIwu
	ILkotV6+0Boq0m5Rg2+D7oDH5b0yzLVN5K3nICEjnjS81wt0Kk4xeS2uUWMahJIJZsHRlPSDRBBwJ
	ZKWyvnJkYWYRDAVIvRkZTOaKY8SOfSoAYJqp5eHJ5a+8hb/9usNV25VDXxokCrYbwDFNbPkll4sPc
	B1nl73MLv47S2upJFs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZVb-003QhY-If; Sat, 29 Oct 2022 00:15:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZVY-003Qgt-TQ
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 00:15:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 489A5601B5;
	Sat, 29 Oct 2022 00:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CFF9C433D6;
	Sat, 29 Oct 2022 00:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667002527;
	bh=EeYQrSSYue092zsjVCa6RxdEJgvrjxuCmZLF12ktlxI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=t2g+lelkNd1B+I0AB58Crnay+OQBxkfKSeAiRwDEPyWSjgmcNULvNzKBit6Y/Crng
	 FLUoP8cs05jx/fZun8trqiPyhnxULY8R71M5/hnbwK3r4ZB/VbBTLtyiW44j4VdiJF
	 8NiY8dto9FpMiQoZUA8YsYnBgTt6+kzj08BvjMZvGo+hnZgIfnFWUrR712zJod43o5
	 1hnK4J2QJgG4iA6DxmssFo3gHPKbuPHeYYV8ZWRg9qkXYzjxrhxPXJbBLVXbOq59e5
	 7/NlRC9Ut0DQ+RX8Zxfrw/WervYqJ6febdsCOQMSrROwPEgoKj6CiE0oQipifrhuy1
	 5MOmMQqVzFdUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BD61C4314C;
	Sat, 29 Oct 2022 00:15:27 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d47a53b0-2125-467d-a9ff-c17fd41d646b@palmer-ri-x1c9a>
References: <mhng-d47a53b0-2125-467d-a9ff-c17fd41d646b@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-d47a53b0-2125-467d-a9ff-c17fd41d646b@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc3
X-PR-Tracked-Commit-Id: d14e99bf95510fa2d6affc371ad68161afc1dc8e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 283f13d43bb4187bad3479f96ce7b4582ef4ed17
Message-Id: <166700252756.12440.12917889714759364259.pr-tracker-bot@kernel.org>
Date: Sat, 29 Oct 2022 00:15:27 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_171529_004014_79C8AEF2 
X-CRM114-Status: UNSURE (   4.37  )
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

The pull request you sent on Fri, 28 Oct 2022 11:41:32 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/283f13d43bb4187bad3479f96ce7b4582ef4ed17

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
