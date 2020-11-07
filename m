Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52125C388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 19:43:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE62F2087E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 19:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2sUcNtI5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4Na6VMS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE62F2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kt1DtVE8mW6u3Lp8KaP7mNBvpZ60zWJEmM7Ps+QUq8s=; b=2sUcNtI5RjK9u+NQK9uJMLE3S3
	4aY/+mobWZLWckCtB4RGZvvKfZ0px+A4K7OJBNUnCCET0BFRrN0eeZYXpbtMg9NWBeWW1mh4UIWtb
	oNJV3eKi0jOf8Uz8BbZSAGoMW3deXwzsNC+lyEGncCsXAu7IOcN6SsM2YmOZ5qOYJCzK+wCp4wj3n
	0k1ZSGxhtuyfacqMCTThBTxUf+EpTVMPbx1FUfYD4+pnNu5+osYelsuJO0NUdrVTCFSC1HW4uyWbG
	BgAsv+r9lfBZSn2ja0NYX721zhdXMdmJZWy3ydyHzHzPlNmYuGtofkaV3QU70AzWKHCFBxV8SMv2c
	S8CNOBzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbU7a-00020g-3v; Sat, 07 Nov 2020 19:43:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbU7W-00020A-Ir
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 19:43:31 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.10-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604778209;
 bh=RBvFnZEJ5sR/qnXqblElAitROl9YLY1Y8CJ/7Uax/Qo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=j4Na6VMSKFQPq6olMjiZntb/zVJaO4er9KYyiMa2Psj0k1HMK5FCYpxAWRYpCsCwK
 0DfJl2rDXmXlWMiF5KesFXVdt3rSEpPiWvVkFGXu7NKwV6+A0heGpFXh08Ao/btSnC
 HUcpVXJpmuoqtSJrnBrDrZvIas/o7dHRK7rAF28U=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-3492671f-a069-445d-a6d8-89363714a1fb@palmerdabbelt-glaptop1>
References: <mhng-3492671f-a069-445d-a6d8-89363714a1fb@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-3492671f-a069-445d-a6d8-89363714a1fb@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.10-rc3
X-PR-Tracked-Commit-Id: c2c81bb2f69138f902e1a58d3bef6ad97fb8a92c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b1d362db99d9233406cb7cfe35fc698ef92be25
Message-Id: <160477820907.15421.11445199450215268776.pr-tracker-bot@kernel.org>
Date: Sat, 07 Nov 2020 19:43:29 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_144330_701533_9B018906 
X-CRM114-Status: UNSURE (   2.90  )
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

The pull request you sent on Fri, 06 Nov 2020 23:41:08 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b1d362db99d9233406cb7cfe35fc698ef92be25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
