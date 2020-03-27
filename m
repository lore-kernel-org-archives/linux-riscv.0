Return-Path: <SRS0=JvIR=5M=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05583C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2020 18:25:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 993652072F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2020 18:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oSdilfHf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioKWNL71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 993652072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qlkRzTwBVD9B0BRyvuVkASwqJy/iAd8SuqXK++lKsAc=; b=oSdilfHf7bm2v2Wj2CDpMV/xh
	lvFRc+UNKrhibIiU+RYXNX5M0Jfrd7lBu1o2R2sC6Amk9i5bHUSajap9ctZlckRnj7JMFTbMuKgBE
	5Zq1eHe+qCsAwnB2uNq9trvzdtkydQDZdBB7C0SNHIh2iDwIgu+rObCT0xWgRBVAXhrt3G9SgEdFY
	IIbyuXzVYTPh/767+/pJ+vPcSCoJs8K+IcWt2LM8UgqTLXLTZWlItrXvqkWBdiZEdLPfKkxX7Q3Rr
	uFb2dj2nz0rxueAfgjBFwplf8ARqpw8W4N76QVOpouNbEmpVW77v1afgpdO2/Bwa/IoeQCH1vPVGe
	MNUor11ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHtfS-00065a-Ms; Fri, 27 Mar 2020 18:25:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHtfI-0005sA-WE
 for linux-riscv@lists.infradead.org; Fri, 27 Mar 2020 18:25:10 +0000
Subject: Re: [GIT PULL] Last Minute RISC-V Patches for 5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585333508;
 bh=XTyR3Ei+Ij4JCQvNeDFqRnPcP7UXYvEQrZ95s+WjTvY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ioKWNL71SlNMvYZM4fV+jwCXfxtvtou0Ty9l2flF8R+niCtuSqIBWGZKohAtdacHZ
 sXwgTaphDgdhjA0kzE9p0PqfPjIK2baHk9NOeekGgZFH1QkKvlE4jZdXIE+PU/hTJ9
 Ryuwk/DO05lCApLf1fnfImtnT3epKQrY6nSA3JUE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-06e46f55-fd4f-48ab-b741-cf487976999b@palmerdabbelt-glaptop1>
References: <mhng-06e46f55-fd4f-48ab-b741-cf487976999b@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-06e46f55-fd4f-48ab-b741-cf487976999b@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.6
X-PR-Tracked-Commit-Id: 2191b4f298fa360f2d1d967c2c7db565bea2c32e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 823846c3107197b6eae9fb656a23e986926d6c07
Message-Id: <158533350869.5176.11624956760593190651.pr-tracker-bot@kernel.org>
Date: Fri, 27 Mar 2020 18:25:08 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_112509_064544_20F6A2B5 
X-CRM114-Status: UNSURE (   0.51  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 27 Mar 2020 10:53:16 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/823846c3107197b6eae9fb656a23e986926d6c07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

