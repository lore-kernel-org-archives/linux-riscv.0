Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280A7C00144
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jul 2022 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cB/bfayaLX30R/Aeil9nu36f6IVhjPuM45rq4Lyfsw=; b=pFpE6e77oz3Us6
	huqnrUrnEvs9+4Lht1P1vYZUlUp9zbCSx7vwnIjqQGPjNL6JsZ94l5VpBnT+w2gK7JbT8+fvQbYJO
	IhPvyESRGKLtuMraimE9kqPxUkrkgMO26FMy2TgR5U1wTyw9+Htor8VMzx7pSHBW/6Na0twnIkURe
	PMUphBt9KYfROXunRBEYIOGkaDPbZj5gsl+cGGLa90bNttrO+Xya5/fvheLwZ33RXgC9hkPBhOp6q
	dkpBZB1d7Odhqhx+Quzs9E/ggmmbAzHhJjWYqu2ceXOSkAgndCBsurXNvPgQSOJmGl6xtQSVaqatI
	WudkswUY0V2Ln16O0GJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHUq2-00BA4T-0B; Fri, 29 Jul 2022 18:35:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHUpz-00BA0S-Ky
	for linux-riscv@lists.infradead.org; Fri, 29 Jul 2022 18:35:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D533361F70;
	Fri, 29 Jul 2022 18:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3905C433D6;
	Fri, 29 Jul 2022 18:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659119747;
	bh=Lw4yeG4gGj+xasMC8EbTEK9kzoMzERAdtfZxGMXGXQI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=R0FxMKSqou+h3eRA1iLWR1rncbMRsJ5R2z5CeS40EPWGrwsuOMH9s7akX+yZGDWyq
	 Z8MaEgP+ijwdADPkI8VHmybuFAeHJ2LkdT4LZJ3DGIKxJRdudUt65Wk9J5dJ6psoOI
	 5rHDtBQRqy+zcDP0GMsQjzd4mUFyyiqdOZ/v1ogtPoezoEK/AH20ZLUNkudysqSsYg
	 hmTE5FTrnyDham13mo+2Cgt41fB5msRA9EeSaPvi4shVh+uDBh9yChL1o5FYE/zDTx
	 GcLaxj3d0bO/FolRnbgrY81Vs+iny5CNFPSXTv6g9lVItQz1BUVSR5c718j3ZhADKf
	 aWIljiRSFoKUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90D2AC43140;
	Fri, 29 Jul 2022 18:35:47 +0000 (UTC)
Subject: Re: [GIT PULL] A Single RISC-V Fix for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-b20f34d5-a1cb-4254-8cc5-d3c7752b3908@palmer-mbp2014>
References: <mhng-b20f34d5-a1cb-4254-8cc5-d3c7752b3908@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-b20f34d5-a1cb-4254-8cc5-d3c7752b3908@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc9
X-PR-Tracked-Commit-Id: 88bd24d73d5bfa1b7b97a9221ff320fc44ef401a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e4d8b09d671f0ee92d36c48b65d2f34affcdd531
Message-Id: <165911974758.994.7819261423841711803.pr-tracker-bot@kernel.org>
Date: Fri, 29 Jul 2022 18:35:47 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_113551_744463_C6F46B18 
X-CRM114-Status: UNSURE (   4.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 29 Jul 2022 10:05:21 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e4d8b09d671f0ee92d36c48b65d2f34affcdd531

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
