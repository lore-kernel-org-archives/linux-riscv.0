Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29090C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 23:20:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE9E42175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 23:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hpic8rT5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I+0mpOkZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE9E42175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHA18dNZOo1mxA9wYupshzIFdXA51bl65WyDgCByB+Y=; b=Hpic8rT5uKqkXJ
	lWjMNWRlyJIQvloM1YmoUZsCvBWJwf6hhzsvssPRQHiVx/EELrg2FeKsrA4gW+o0ry8gPUPKrRXtj
	3mwfjMCr6ZK66DfiTfp1+bTUivSJ7dHtMFu6UsFnvr+dxPrjpcVLJw1N7t3+ALrWgngkg+8Jyq6iw
	gsPsehPKTerouZCca3DgabwfMtSxNTGTFrtmsrZ1coAyE2dopCm6dPHUfuYoNjPl3S2L+W9/Z75LB
	E7KGPSBo52w7GBZmfZsqr2O+GSvyXDaI2KgnINJBzJZpSumfWP+nE0kTkU4Pjkr6MDxUoZ/Fyd4/6
	uQ305hQBeEhWtHu83ovQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gN4SK-0001y5-88; Wed, 14 Nov 2018 23:20:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN4SI-0001xs-Sm
 for linux-riscv@bombadil.infradead.org; Wed, 14 Nov 2018 23:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J2hWNrsYCWb16O6YjXIAJthNbLX40FAPJsr8rFa5s20=; b=I+0mpOkZnat6KnL42f0zBCSWV
 M0KTmUa0kxIA4thF5kMEOkHUKLNGFZJZU1YEe9edDRd210LhkvUm4Wjr9vD1BtJpQ1jh848aKTnJY
 cGQY28aCJ3qeToK1EPKSiw5i8ECL6QqNVw25ErS0evob86mt/2Ft5xYnro/eY+qvQWk+wZv1t3ObP
 4Hs385jjPHCNhBW6yDcJBMKdLRvrUWbxmbYkiWJlSihfi8vf/RqwoJS0OGQ6RkVEUOlAvARUi1weI
 mitTQfbkPSsioi3EPhQwgsr7aCTSEqi2aUDGtJxSk0aLqsZ5VutmNtjyT+q3+2oYlG5cfmEKCHYM5
 EoigFh3vw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN4SF-0005vB-NG
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 23:20:17 +0000
Subject: Re: [GIT PULL] RISC-V Patches for 4.20-rc2
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA2A2243E
Authentication-Results: mail.kernel.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
 spf=fail smtp.mailfrom=pr-tracker-bot@kernel.org
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-abc25686-4eaa-4d2a-bb97-2306b418b9fe@palmer-si-x1c4>
References: <mhng-abc25686-4eaa-4d2a-bb97-2306b418b9fe@palmer-si-x1c4>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-abc25686-4eaa-4d2a-bb97-2306b418b9fe@palmer-si-x1c4>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
 tags/riscv-for-linus-4.20-rc2
X-PR-Tracked-Commit-Id: ef3a61406618291c46da168ff91acaa28d85944c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5929a1f0ff30d04ccf4b0f9c648e7aa8bc816bbd
Message-Id:
 <20181114232002.22275.60648.pr-tracker-bot@pdx-korg-gitolite-1.ci.codeaurora.org>
Date: Wed, 14 Nov 2018 23:20:02 +0000
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_232015_895363_9FCEC097 
X-CRM114-Status: UNSURE (   0.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181114232002.r9H7tKsooty2LfCzEaXmLO_w0vUkfrPrUsX75tOaGWA@z>

The pull request you sent on Wed, 14 Nov 2018 14:35:54 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5929a1f0ff30d04ccf4b0f9c648e7aa8bc816bbd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
