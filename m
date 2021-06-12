Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE0AC48BCF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 21:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A5861009
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 21:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A5861009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w39141813IByv31WdJgifkbJcOpVKGfgWkgGT8ig2m0=; b=U5bQf9plIlGZSW
	3hWG9gXN5f2AIoJFgurxl0pjILCQeAhRoUVxmiREgMWu5bEyzS7R8RWZINYNZUDmzEAjv1iAsErNX
	480DlzkFMkofEepWFt5gNzNsRuyg8d/cp+Sp0PbFYjpg03NHcDiqgLkgUs5oV/Uxu5AO1dQHAC/aq
	PpuoajsYg4kizfseeV+SamTsOrJ8hIsH3AwxsYdy/qA/oZoDKJKNbsx/PIaVo+8xg2sOiDagCl04K
	cuqjVOZJ7xyjlLY33pXdePk3tcZzSCFGf+VqEjI786gvC6EXSsx0ub7pN+zQkvohGkAcU60m5amgc
	bofFMyEmTmEu24QsbpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsAp6-009A96-Hn; Sat, 12 Jun 2021 21:05:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsAp3-009A8o-MX
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 21:05:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 61E3761009;
 Sat, 12 Jun 2021 21:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623531941;
 bh=mxL3orDQ2lIBWZJ8T+uJfTHiqMrrrpp603yP4M96s8Y=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=umLhcE9lJSM9DHg6x//TmMR6jam1Oy+uxHfq7dYh1URL1rGdGUwdcUkTu3mioyVNY
 Krd/Q3kqJkWZXLv4IawEN24ExoOWgMf7s3nnt6IO3St9efoIhG3iynggJTZq/zEUOg
 VOp1Ijc+f3/597qTWHQQHmyu9X3PHM/q8qspHakoi/dR2W1r+HzbZe+jMR3bsLVz2H
 94Mx1xZWRwThoxmn578W+td7hhFJf/QU4VIagjPCWed8HAYa3zUONK6sTukTBrh5JM
 D6iQnSjMu++g1FzhtDA3Dmau/e0YGK2/59KDH37GCZsbWdQF80WVz+iw7/hWSrVLb7
 RabLi3Ulgn69Q==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.13-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-eafb1de7-d58e-417f-9a42-76e32e2a04d5@palmerdabbelt-glaptop>
References: <mhng-eafb1de7-d58e-417f-9a42-76e32e2a04d5@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-eafb1de7-d58e-417f-9a42-76e32e2a04d5@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.13-rc6
X-PR-Tracked-Commit-Id: 0ddd7eaffa644baa78e247bbd220ab7195b1eed6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ecfa36cd4db3275bf3b6c6f32c7e3c6bb537de2
Message-Id: <162353194126.25557.17189221444801857836.pr-tracker-bot@kernel.org>
Date: Sat, 12 Jun 2021 21:05:41 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_140541_773717_44C8F978 
X-CRM114-Status: UNSURE (   2.27  )
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

The pull request you sent on Sat, 12 Jun 2021 08:58:05 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ecfa36cd4db3275bf3b6c6f32c7e3c6bb537de2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
