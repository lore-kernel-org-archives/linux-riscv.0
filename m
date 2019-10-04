Return-Path: <SRS0=3PXF=X5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918EBC4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 20:40:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6261E21D81
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2019 20:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ey1B02Q2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vSIq9J8O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6261E21D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FX6FNsKZLQp6uSp528+f8TIxkh2jqu9lxD3uze7QuOI=; b=Ey1B02Q2JRa8wC
	aYpEbGlr4KorS8vcK3DkfBZTofvrKbaKWUzSU9/IXgUERT9+OYvoozv9OGTc4UUT3aDlKkxMBB9Sg
	WfLwrdfJDRVbPPzIgrr01LZwSXKyD6Uaej+obs2iw4Xf184NfPRUOHFBPWC5TeFtXpGpKcCUj1+6q
	IJ2QmsBxs7VhxUpKRRXNYC89tcqu0FU1S8LXzswl/f74pvFE2BuWVB1Kj4Iw9A9tBHTZe0oIlCwJq
	C6kSIyIJVKgVXV02wrAcEJdgWnTX/IW/oKZNbygPuo3KTJw48PTdtk632tubFMM8rbw/8EQvW2po9
	syVBf+PC8oxtq27Su3bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGUN8-0006Ra-Al; Fri, 04 Oct 2019 20:40:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGUN4-0006Ls-FY
 for linux-riscv@lists.infradead.org; Fri, 04 Oct 2019 20:40:17 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.4-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570221613;
 bh=KzerK/f3QXvAsnl4IaRxU3mdhQB2zwWapZZSem9lYVc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=vSIq9J8Oe6MBe9NJwAGB7ivXE/KmAnJxT0tq6XETHd2kg1HlsZireCeo7Sa+2zmer
 kvMgNLkcQJCccdBslcfGpxZpe/q/HpdgzdXcAV3GR9P3LPGz6KEMQJrQ5ak7WZ2DoS
 mmP0MwA0hS1+jrLJ4qYBEK8MFSWwSwlhvEJ2BwU4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1910041036010.15827@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1910041036010.15827@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1910041036010.15827@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.4-rc2
X-PR-Tracked-Commit-Id: 922b0375fc93fb1a20c5617e37c389c26bbccb70
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 812ad49d88b51fab551acb3c2d9c7d054bc69423
Message-Id: <157022161327.19958.10759204343706672644.pr-tracker-bot@kernel.org>
Date: Fri, 04 Oct 2019 20:40:13 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_134014_549076_1F268902 
X-CRM114-Status: UNSURE (   1.04  )
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
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 4 Oct 2019 10:36:54 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/812ad49d88b51fab551acb3c2d9c7d054bc69423

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
