Return-Path: <SRS0=2LT1=HI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E8AC433E0
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 23:21:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9135264EC5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Feb 2021 23:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9135264EC5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3H1jCXJG8R6z3Dy1fMk8g5K5cHu9Goud7bmklLC4wy4=; b=uA1UkY9R7KGe5rpmXAoMbdGyi/
	rLg5KlMvgMFCMp6IkUOuhA/PmajhtsmAA2qPTrZVg+h6XUqyB8Cs7Qoc5DL3KQfTc1DV0qQndg+xU
	4/q4bqygOWZD6GMv6TIw0J1CohpZruWJWZNCDfOcnj7Mu6CxEoMC3ISWfRhn85FNgyptQAKejhH+L
	8oTXETNiNCnJNKCWABeyFDYNed64txiABx4cN/AiXLio0I87se0DOuMP3mPuDMHrTKKMjwVqtD97P
	sfs8Ha/3zORLh15ewun14MMQGAs8lT7PESsx78bHsGBhYRGkX4HAfAYNF8dWcBSAboZDjou8mLK5I
	mAoWcYcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8WtD-00006B-1A; Sat, 06 Feb 2021 23:21:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8Wt7-0008WI-5T
 for linux-riscv@lists.infradead.org; Sat, 06 Feb 2021 23:21:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id B40CE64DEC;
 Sat,  6 Feb 2021 23:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612653668;
 bh=TsfNUic6kbkF8Abe0yXNVuOcQxnbY8mWONq8jkHpyBU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=udn9k+8JuWC7Czyya0PPFAD6grxdy+S4qCjtid5SGp9T4IMbP+YqGruuceGZ5UaMO
 AAt0B75hmSho9T65kWO5detBcAZX8b5Q3DeXqk1pMxf8x0Ro0dylxqwRBSVkBlDG6O
 rnqjBWwUzefJiFrY4Y85Lop55sBUNoFOIWAUl4EBH2niKIv6cix3xAgUxdkJn4VlqA
 yGz70OR8WjVbTwfKhS8scJRMN11kSrMBNRcKkJTovn54XZL8bF3dN8qfTjsHkkJ6mk
 +2mY7a4yx1XnPwVYVT4GuvlCech3qMMgj8vQdP67mba1PKJvsRowUCmH74y//6eOXE
 INsk4bOTUoePw==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.11-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-7c050ab0-3c41-4b21-b011-47b64a4b713e@palmerdabbelt-glaptop>
References: <mhng-7c050ab0-3c41-4b21-b011-47b64a4b713e@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-7c050ab0-3c41-4b21-b011-47b64a4b713e@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.11-rc7
X-PR-Tracked-Commit-Id: de5f4b8f634beacf667e6eff334522601dd03b59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7455e5d6897f275aaf5b6d964103ba295ac0cdd
Message-Id: <161265366869.26028.15837848350940601026.pr-tracker-bot@kernel.org>
Date: Sat, 06 Feb 2021 23:21:08 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_182113_693209_82585FAE 
X-CRM114-Status: UNSURE (   3.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 06 Feb 2021 11:38:56 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7455e5d6897f275aaf5b6d964103ba295ac0cdd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
