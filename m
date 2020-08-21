Return-Path: <SRS0=uNJT=B7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFBFC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 22:05:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07017207DA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 22:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnHoAV9B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDxnRB7E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07017207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWeD3U/HXkn+v4prtpkj+W2Ct81Q8RSfajue0mWpb+s=; b=hnHoAV9BBD/f123lrlWB3A6AUK
	LHj8RuC/JgvBRXo80lVP59kSaoTBwNIZorCuWjJVwRwTOgfjPtR2NnfeiO4abCxbTB2Rlu/yPokUF
	wlTBnf9YGtMDiK0JZiSgaWyo61OsixBty5BzLbFb7x/aVvSH4/nEh3fGMOmwIqSaqtvIUUMb6E2p7
	6Jtks57xpOpZG8GiFKEuXMVxv6hX+pB3Y/dTCQyNajb9rwg5vvHJ1EIM9XPampCPeAKzAWWKtoBgI
	jlel28HjbJybDtmruhdPq4TtDMFHYBeBcTfi9/vMCliGfQgD6nfLr4iQ/NER4UUP3Zf6rAeBaU+pH
	+UYwXsZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9F9q-0002tb-S5; Fri, 21 Aug 2020 22:05:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9F9o-0002tF-IZ
 for linux-riscv@lists.infradead.org; Fri, 21 Aug 2020 22:05:09 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598047506;
 bh=opOBlqaUGECh+5z5xpnvyiZ8AHozCfhVoJLtemUrOFg=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=vDxnRB7E92FJK9kzPB4fyfxG0U2U8fBGbSe/Q9/THG+bBgIqhryx3exsF0k3PwoGL
 2DKsUjX7t12Rafv5+mutDxsJdrVF3wak/0vVo0FP4zxXoDWvI/7qv12WONcBjzgme5
 ykxBHQ9mxQaE+jTz7jHZv2XQmbxixrBWd/Q92aNA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
References: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.9-rc2
X-PR-Tracked-Commit-Id: fc26f5bbf19459930b7290c87b65a9ae6a274650
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f22c5579a7d600fa03f8c1d150cf78188f8709b6
Message-Id: <159804750671.4316.9225136869085625949.pr-tracker-bot@kernel.org>
Date: Fri, 21 Aug 2020 22:05:06 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_180508_683929_DCC3003B 
X-CRM114-Status: UNSURE (   3.11  )
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

The pull request you sent on Fri, 21 Aug 2020 11:26:44 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f22c5579a7d600fa03f8c1d150cf78188f8709b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
