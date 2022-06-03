Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2DDC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 21:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RP0UIQ9VfFXbdITCBCtMfIA3dqAjjv7giw5nsLBgniE=; b=rHObYey1KCvOeC
	UZkU9o8RYSkrmHhHzw6ZoDiiC83CuwE6Qx8AizgJDrhBBG42y/21aOsluGBgTtaFHy003EQnsadOh
	3+yrSuYtIKjwPGMwGIfC6QSAqWeN+CRPynYlAXUDFi7GBSO/XFjUhHS2GWfEHBkZ7CS0/30Lf0HTL
	wDeF8tKjh760tBGiQp6G+/b9n184bR1Nq80IGvZoy18mt/rZRj+vrotCJHmblI6muqI5B9NZzmohB
	rZvn3s/7fQpwTskxRLwO57jSSSByc/aSSwny7+p9Z2W980A0NgOCjJN0SFBvr1sIubKPDPw/g9SON
	5TCjTfJYW60mmKRuCKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxFAU-0092AP-G7; Fri, 03 Jun 2022 21:49:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxFAR-00929m-TX
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 21:49:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D23BB824CE;
	Fri,  3 Jun 2022 21:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23F95C3411D;
	Fri,  3 Jun 2022 21:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654292953;
	bh=ZeyhBQ31QZRSci05XFyBhW+xT730DNmSlDu7BE/0PA4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=g7ZCvK3hzEg20ambGum+TdJr/4joIc3FfQQgiQuVsiRUHYYqT2eJjb2zBtoEDZlKq
	 4P+LfNJFZ5qtdHtqQux23OSyRtj7h6rfuVKT+gIsio/9aHJjJwBMK0D+26Wb2Uq9rs
	 g3FCTL9nxs7QfNo9EbG5c3/uW8vxReF4wcdTCzFh+ti4Mc0KDZQnd034NfhUXW2v19
	 XuNHq06hsO501KdLYbPlS7GgvrLCLhWAfFX5fys2IY93otwAqz2eYzSmHyrC7YKvUb
	 Fg4Jv/TVl+tM3c9vShCVUXvD2UZmUlhHO5VQVZQf8gmOCH6/vX+GQu4kq6KlmaJv/n
	 rptVfKQ+kze3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 097C5F0394E;
	Fri,  3 Jun 2022 21:49:13 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-98b420ef-9b28-4e40-971e-7275b8f7c6e8@palmer-ri-x1c9>
References: <mhng-98b420ef-9b28-4e40-971e-7275b8f7c6e8@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-98b420ef-9b28-4e40-971e-7275b8f7c6e8@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-mw2
X-PR-Tracked-Commit-Id: 61114e734ccb804bc12561ab4020745e02c468c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f66e797b407bc03a438d1f05057dc7918bab473f
Message-Id: <165429295300.7657.14563990376660686418.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jun 2022 21:49:13 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_144916_136350_BF9CB30B 
X-CRM114-Status: UNSURE (   4.53  )
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

The pull request you sent on Fri, 03 Jun 2022 09:33:46 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f66e797b407bc03a438d1f05057dc7918bab473f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
