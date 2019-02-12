Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492C8C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 21:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17077222C7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 21:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KIehJNPf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuNj6U4Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17077222C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C18Z8+upVBQPIMB3w3cxl05ysuw5YceHeCnsOacEze8=; b=KIehJNPfcKA2Ur
	zC9WvJTrUcGfJcYZJIDbq/gWXkktSuo43d39tfEK39Ro8W60DO5EQYVvkVOfzuaU4YL4s6zZuFsJt
	L9AkItj7SLzyBByOOjrxXfqmb8eB+kOJsIHbGf571a5AkTqWOKt5rhP+ptxSA7iMv1A8J+6SV1jWZ
	MLA9u5CvvauI+w06cmOm/7BLkuHI+ExgZhKv9A9xXLDjxnOgfHZo3vFUcBzEHOHnEMR+6UQ0eqNiW
	kuPt+nFp4nb5ix1dVWnxq5fbiPEpntKdYnLhvfPwELbujKi/7k9daKVx5OfgoVepv6Rr1hbOTMqOy
	NNWZLUtCCBbj8FEw16DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtfrX-0001TZ-M0; Tue, 12 Feb 2019 21:45:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtfrU-00014r-QN
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 21:45:06 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.0-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550007903;
 bh=bPDDenangOOi6e95JV75EXEJq/LsHTGT+kd4X2xA1L8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=uuNj6U4QM50S0tYcqRSDbLwlM1zts3XevOlsE7g1DlOOZWD5f2Qymr43f6S2S4tSx
 WLnvqM7aD+jx6DJ21LwU2JXr13SNbdA0Vt5Egx6GTXmkgaQN9bSnugRV57WxDuhW4F
 w7QTfsboOTcLQd/UDhPHIWJzG7wtJ28ZO+TUtJ40=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-57c6009c-7e1d-4742-af0a-807c08dab07a@palmer-si-x1c4>
References: <mhng-57c6009c-7e1d-4742-af0a-807c08dab07a@palmer-si-x1c4>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-57c6009c-7e1d-4742-af0a-807c08dab07a@palmer-si-x1c4>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
 tags/riscv-for-linus-5.0-rc7
X-PR-Tracked-Commit-Id: 41fb9d54f12b87fb1f670653e95d34668a08e8ee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 57902dc0670c2926b0b5cc93a1e2ddf09d53e706
Message-Id: <155000790389.22230.12737198135434561900.pr-tracker-bot@kernel.org>
Date: Tue, 12 Feb 2019 21:45:03 +0000
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_134504_896625_7EC0F441 
X-CRM114-Status: UNSURE (   0.93  )
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

The pull request you sent on Tue, 12 Feb 2019 13:18:49 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/57902dc0670c2926b0b5cc93a1e2ddf09d53e706

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
