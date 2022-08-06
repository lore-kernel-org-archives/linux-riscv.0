Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D09C19F2D
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Aug 2022 22:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c96fhmx7YLdi9HwIo7DUlAGGPBgHjUSZXreTIP/XdHU=; b=X6tRuQnwMAtB93
	zPJJkXoMYz5WsALOjH4YvMCxIo/vaNZtBD1zEfjsfsyH5tC3iHJXPRItmrqJQXz5/0zflaxQoj8KB
	vvhOLzXM6/qLootolgDbV1mG3CTT8KiQZECgdM5L5CjjDbaPUnVBFgK49M5xCUZNprkvktQMaHgYa
	AclZG8sNidLc8chdsqlq5AE2i4hqjSfTTDLEdfFtf1pnNJ3Pe7yRqMUsCWKq3SVTeI0x5SO1C2P1o
	AwZatuqgVAZB6bOlcXmv4UREGfDWDTtzwpA2F/GNjMV/3Rf9YtIrd1YF4EJIs8nm4YCjT8ao2Q1Hs
	NtLho+LdsbUG9UzWs+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKRyK-0013uR-4u; Sat, 06 Aug 2022 22:08:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKRyI-0013rg-1W
	for linux-riscv@lists.infradead.org; Sat, 06 Aug 2022 22:08:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9D0D60C6F;
	Sat,  6 Aug 2022 22:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25139C433D7;
	Sat,  6 Aug 2022 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659823715;
	bh=jZ0uCQ6by0VwAs59D5COi1dX0BnewwZqZNVNuMw2mdw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qnIb+hvUmHFHi056ppH659k9KBA5VY22QTa3oW/X6P5Ak/H62+gjoX4O6QpMMz6nV
	 f18fNxbtbsrUUyaswIkiipGnEFBnqugSZftyQ4BhUbj6hvWJGBpWDVuzY3oAj1/CjO
	 I934C8HMiLm9Tq2wv3AwsJtXkBG6Aeu+VVBviDva87JQd9FilPUmXVcPXzqW1EifNL
	 XWmWZ6wNEIatFRKSKOgIf6cXlCF0yZMCMRvPexW36imKV6LtQEDhewlrkIhmY0Gmej
	 2AIb5qP279tVbeiPx8yY8arBCgGKsKIsMg40fyYHplml5h26ShTl76HCizCvbKXdJ9
	 wzxwDs4P79nqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1615FC43142;
	Sat,  6 Aug 2022 22:08:35 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
References: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw0
X-PR-Tracked-Commit-Id: ba6cfef057e1c594c456627aad81c2343fdb5d13
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d1044fcb996e8de9b9ab392f4a767890e45202d
Message-Id: <165982371508.16627.10357025252070843404.pr-tracker-bot@kernel.org>
Date: Sat, 06 Aug 2022 22:08:35 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_150838_142582_8B938819 
X-CRM114-Status: UNSURE (   3.96  )
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

The pull request you sent on Fri, 05 Aug 2022 16:36:38 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d1044fcb996e8de9b9ab392f4a767890e45202d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
