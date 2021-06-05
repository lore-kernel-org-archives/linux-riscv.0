Return-Path: <SRS0=INRY=K7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A60C47082
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 18:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DED61246
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 18:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16DED61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPq05/EQitvTYVTuypz34vawMmo75Iky9H06Jg7BYRA=; b=q7EYoRgTc7clwh
	JB1IQeN/c9zoO3Jy6bOMWWTDjww87jowia6cydy4bNGoMJvMdwOrFvL9sOfhbQ0+02w75oav/WpFU
	R8bwer861rYjDf2mmxL9pajeiNPYA/p9+vLzLmxGe0350WDqb28xrCZg5WMwMB5vR0a4vGzvCcBe5
	nqAg+V0t5IuwSJG2Ghrcszyp1Ei1z4RfelsChAXRL4WxwkzemmoLV+Bz4yQBWCKP+OdGuNzxwRAXW
	4/xlOZ4fNzHmQoxTXGcDiXbIyDAGZKe85qnVvfyrNZxtyfFWMUnQujlaQwagJgaWE7tzJU2vfYyeJ
	YZ8TF5LvbTqy3qCxXfUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpamC-00Gucd-LK; Sat, 05 Jun 2021 18:12:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpamA-00Guc0-7N
 for linux-riscv@lists.infradead.org; Sat, 05 Jun 2021 18:12:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id D5CEE6120D;
 Sat,  5 Jun 2021 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622916719;
 bh=7KYBz/oKZyC/NsLkk9MJ4z8alzLXXucMcPXIxcoyKFY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lMr3hJ4Ceiup822nQUPEmO1Qofj4XAarSede7K0cUSirfVHF5YMhevmn2ugYbo/IT
 ItiSCOB+TE+GS+NyeYhTFyj0c2LGb1amzZGHKOxYzY0XZ8TRKtHR9WjNM+9K1gV3Bg
 061yG4n9bJJYX3Jy+hiX+6nnEaFYlgx7R6MtezTse7eTJa+BVVJN34sIOacjXNC/oh
 XCSyUlw2mdY8G6rT5w0zB9ij3v/hGXRFZ5bbP+HVjxBl3COaZDBtANAgXcWi89b4fn
 l7RQjHiKqWrGHyoaaPNwOh2yrAO46Mt6TYjoH0uCmurzvLNaZ2k6yJ2IvmeLXxy2/9
 LPs83blsrgI0Q==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.13-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-8b83335c-43d4-4912-a2b6-2d609e10d7bf@palmerdabbelt-glaptop>
References: <mhng-8b83335c-43d4-4912-a2b6-2d609e10d7bf@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-8b83335c-43d4-4912-a2b6-2d609e10d7bf@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.13-rc5
X-PR-Tracked-Commit-Id: 160ce364167fabf8df5bebfff1b38fd5d8c146c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af8d9eb8407601e3a95206831464bfa6f889df38
Message-Id: <162291671974.15499.15261472941439509336.pr-tracker-bot@kernel.org>
Date: Sat, 05 Jun 2021 18:11:59 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_111202_297496_232768BB 
X-CRM114-Status: UNSURE (   2.44  )
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

The pull request you sent on Sat, 05 Jun 2021 07:36:40 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af8d9eb8407601e3a95206831464bfa6f889df38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
