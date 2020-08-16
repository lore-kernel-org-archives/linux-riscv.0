Return-Path: <SRS0=Dv9o=B2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5153C433E1
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2020 01:57:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E5F2068E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2020 01:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EAjYV1Mt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2sQ0h47r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E5F2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3L/ypa19ffUYKCZV7tN8Am6Elh63DgY5Ipt95V5Xqg=; b=EAjYV1MtK8BFaejIJ1IwXTQuJ4
	0eU5Z7WAryZ5u3il5CnVV4QTf5acSqNK5xqz/teTJspX9duU8tIg3EpRe5y40aCt7OViFFSLSUBOc
	4TWTXK+blJHYQxb1bCOe8JI+r5cdQs1eXBK/qAyRFgFUr1UWyWCdD22cZ2nxtlxjwXfvXColzuxqP
	0Ckmgi3UIOj42ZZwzJXYTuFrkjiI/5qIpmdn9av5NqruF1184T0c+GDmAvPHJ0iCUKUCejXdRjsZY
	bGIWJzQvAzpGPFRoEH0+BXxR8ZAeeLQC9KOhTOc4PTmMd9ycdfSgdjiy3y9L9MDn1Q7fEGy8xJEbI
	ieM/Itaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k77v3-0007V4-DQ; Sun, 16 Aug 2020 01:57:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k77v1-0007Uk-TR
 for linux-riscv@lists.infradead.org; Sun, 16 Aug 2020 01:57:08 +0000
Subject: Re: [GIT PULL] A RISC-V Fix for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597543027;
 bh=cAJrAP63vyHizFBti+jyzu+VN4BLiVQ1YOGXd47g3ls=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=2sQ0h47rk/jThYQWXSbsJ+dbtyPLgs0x5HhT5rZ/IPoOX4ddZojQ24E4QPvV3Rutl
 B8Na6ccNJIWlEmbj6sX9Eanzb0e2qCkIa4xu4Q0qLUNyFcHgOZPIBS45WB2ohVaXb7
 5bbjGtfxZlgQU4MJGJbGewkvNE2nSpE1buvhVNFU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-9e581f1d-3696-40ba-8a64-b0910d6c85bb@palmerdabbelt-glaptop1>
References: <mhng-9e581f1d-3696-40ba-8a64-b0910d6c85bb@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-9e581f1d-3696-40ba-8a64-b0910d6c85bb@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.9-mw1
X-PR-Tracked-Commit-Id: 76d4467a97bd8c4bb01e810a5129c8f96d7dcbf8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d84835b118ed8c14c21fa056ca54014b2eff068b
Message-Id: <159754302721.22546.13234087526570060438.pr-tracker-bot@kernel.org>
Date: Sun, 16 Aug 2020 01:57:07 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_215708_054770_6B392540 
X-CRM114-Status: UNSURE (   3.29  )
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

The pull request you sent on Sat, 15 Aug 2020 15:39:41 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d84835b118ed8c14c21fa056ca54014b2eff068b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
