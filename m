Return-Path: <SRS0=/1wY=XJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D87C4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2019 23:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86CC206CD
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 14 Sep 2019 23:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NGV0Wv+S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgMzG401"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86CC206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixvvnb9t5HiyEYlyJmO/njsyo+Ox9yyCqBwmHBuKq6Y=; b=NGV0Wv+SBZFj61
	TieBL4cA9ocEreIlKf492pnKMtwAa9UsuNZSxbsVOo4SsAOaKk+DC7xhrC2P5WDMaO4/yH5C5o0fV
	bVyuxE7aNI+bE2zi+wrfCZndXaHsnje9Vswlbh+l3dmxgmI3b2dSOkZIUjT8Aogzb3ozh10Jp6A7Y
	u1SLcIusbDnIz/boMWeR/lAE46gziBOIdkm0sFOX2hNQCQ/Z87PqRQurCdoeuWamKyN4Ji0DXVV+/
	QXehKBJQ6xOIHgnnIAn56dxwWWmVvnXRlBgB7Hu+LTwNjj34VpEip/qbSIcJZA/rVos+8/vMBupXz
	Ivz0Dj0UojAEQPjKmWHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9HPk-00066n-0l; Sat, 14 Sep 2019 23:25:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9HPg-0005q1-MV
 for linux-riscv@lists.infradead.org; Sat, 14 Sep 2019 23:25:10 +0000
Subject: Re: [GIT PULL] Urgent RISC-V fix for v5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568503506;
 bh=zN3AiQcN4OyiNPGhUtI2YBjvp2tsF6+c4sX8WDAP87o=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=FgMzG401RLitCgZXMvXvc1xiSlLn4yaOOxbIvc+qJa3Gtpm8me5fPcEB+zyBlvWVS
 JkhZVCuipJELlCGbs8XzdMvUZO74w7a8t+8EE8QzFyRIW91oC5XlSL6z8bWnFchD5K
 PTPPt3S/D6ACZwcKGWdbHfaonECCHDrYx5Ct1qiM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1909140651430.10284@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1909140651430.10284@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1909140651430.10284@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.3
X-PR-Tracked-Commit-Id: 474efecb65dceb15f793b6e2f2b226e952f0f8e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b03c036e6f96340dd311817c7b964dad183c4141
Message-Id: <156850350617.2116.314351951829278963.pr-tracker-bot@kernel.org>
Date: Sat, 14 Sep 2019 23:25:06 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190914_162508_760910_C6D54B9A 
X-CRM114-Status: UNSURE (   0.86  )
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 14 Sep 2019 06:52:48 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b03c036e6f96340dd311817c7b964dad183c4141

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
