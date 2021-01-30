Return-Path: <SRS0=fnRf=HB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E3EC433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Jan 2021 20:01:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B3064E24
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Jan 2021 20:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B3064E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DmOwjWGg6I3vZXCQZEuOPsx3Io1daT+BItHHORP/ek=; b=oJR+Jc/IKJDSOUN0YWVgNEQf61
	udNXdKFNeF9rF14cGrU/KnWWdQX235MB6s5Heo1LycBFX98wwHiLCpmMWJ+5t37yvrOVUgSFcoPqA
	upLW85L+t8NWyHdvHo6SPcO9xoE/tYMp1vo1tVObdZfKJnSy1Px4wRnMSH/zbYVpmUeCv3nvyrVWz
	QazgGeXHSNL2+eWJ17gk/FuDsnvDyQAiZ9k3vB0/w/vndjlZ10pZN/radhE0rwQBUujEv9AmP86kY
	DzQPCoRzNC8p4BkpkcpLVE8BuC5swti5yCpurDV8OIZMflPeWEsUOqaIzCy3XOgEcTQw7aNiZ6bSg
	9naHCAMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5wQw-00053Q-LK; Sat, 30 Jan 2021 20:01:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5wQs-00052x-0F
 for linux-riscv@lists.infradead.org; Sat, 30 Jan 2021 20:01:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F36564E13;
 Sat, 30 Jan 2021 20:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612036880;
 bh=h3yiFeGtDdkyP966NeMZXxypjb9ER8N5jG6QqOVFOP0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SdJ54BvZ0LAxj9/FpKC+68usAEPt14drXRDv2CaJ8J12OZMzOi5ntlZ/LRVwUcmx0
 WpW9bmqItMv50K0Q5u/xCGKkefEf79Ymp3ZQLKF5iisitKcrHjmKju98nwQhySm9Ed
 CvRq4gHLDF3ZMdwAxbODTGWLykmTFQ7oQJDlFeymDNmZ96vrXKSdYxMeCF6itKRNAd
 OK0G71K+PN7+MMXCosyGnhF3r1rUnvqI/wHJBgygJFV8HAm4EdRXAlw4cCJM+cp+jj
 9OYJZs5dgq03wkfIUzF2hp8x3fHI/za1mE1a84F1SAsH2+yVvai2dPbPdto3Rw59Gu
 q4sVc/aWeFNOA==
Subject: Re: [GIT PULL] A Single RISC-V Fix for 5.11-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-72236532-fb2c-406a-9a7e-509c579364c5@palmerdabbelt-glaptop>
References: <mhng-72236532-fb2c-406a-9a7e-509c579364c5@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-72236532-fb2c-406a-9a7e-509c579364c5@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.11-rc6
X-PR-Tracked-Commit-Id: 336e8eb2a3cfe2285c314cd85630076da365f6c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e37c0fbabd8e1d50bdd6cd0a1a07b72e1048a9d0
Message-Id: <161203688052.22475.17138244263808539799.pr-tracker-bot@kernel.org>
Date: Sat, 30 Jan 2021 20:01:20 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_150123_000569_10016178 
X-CRM114-Status: UNSURE (   3.05  )
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

The pull request you sent on Fri, 29 Jan 2021 18:52:51 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e37c0fbabd8e1d50bdd6cd0a1a07b72e1048a9d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
