Return-Path: <SRS0=GQGn=AB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94191C433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2020 19:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6984F207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2020 19:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3YVKWBo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6rbiu3I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6984F207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M/iMIb8fZqEBIOWeMcSS+BKxnDKWo5dKysnvtn/IYr8=; b=m3YVKWBoX9Gk3xEhngDvQ8HMc
	d6CH+B1v6nusPSgwPUbvDEt5X+ee35fIlzJa6jSxxGuOrot8Y7GxoKamB3gXL62NzP6D8HtrYorqx
	CRfLLdnB3WMEMdpkinv/iRFwnUMjOR88aMCgyJ9XhDE3yYMC+ku89gHpRvfeil7lVZzhAGtfKWGn+
	t+fwD2Yx9K1A3rQZ7qC/gxryV78uP2hLzufo0CRklDiBLXJe410U4VrLnGOo6IZxv+NjkknBqE05B
	3OFyXvqP+Mvvoh1uC8dMYDNxtvc0hUpCmTwy8+5M60jDjONMfp46AIy5qcx2GqVXsfBM/0zbRhCqV
	NK/nXvFeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmjaK-00020E-6G; Sat, 20 Jun 2020 19:55:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmjaH-0001zs-Je
 for linux-riscv@lists.infradead.org; Sat, 20 Jun 2020 19:55:27 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.8-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592682924;
 bh=YOhXoTb1o5C1Jl/TLWwhF9JZzy9ZzY00Jlr6C3UMC2c=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=m6rbiu3I9do1tLyhAU9d/FO1rwxxO3a++llJhkKpGOFC5G/G4vYgEm56Y6SE6m5vX
 B9bLvVJcGEx+f2/z6ioEWkBWUvt4PGwv5wFeTmtC4znX4ryv917ZTBX95/OsUjiH+c
 oSb/dPuiy72Y/m63oZhzPny0+2I7WuZx+aX8OIso=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-ff59c9fd-a367-4804-bc35-73c8a572b016@palmerdabbelt-glaptop1>
References: <mhng-ff59c9fd-a367-4804-bc35-73c8a572b016@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-ff59c9fd-a367-4804-bc35-73c8a572b016@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.8-rc2
X-PR-Tracked-Commit-Id: 0e2c09011d4de4161f615ff860a605a9186cf62a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fdfbe08a2b3e2bf776e2f2b341768ba93c2e158
Message-Id: <159268292459.15446.1815019867968444758.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jun 2020 19:55:24 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_125525_666244_28486530 
X-CRM114-Status: UNSURE (   0.60  )
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

The pull request you sent on Fri, 19 Jun 2020 16:24:29 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fdfbe08a2b3e2bf776e2f2b341768ba93c2e158

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

