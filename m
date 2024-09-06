Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6576E6FE46
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHefK4CjcUzrJzb0/mmVWhwwLBhGoE2NIBsT3iEFCko=; b=zycwg7ef6u1JlC
	rI4/CF0+/afMscqEDX7muEJNUDQ8c4vdcDZbsn4FLp+/FgJnK3fxN6efscgbn9W1LbL/HNBe/saIS
	WP/vTvrkoxWNTtt761cQ+kH89qwDy/aXmtoM9cqh2kbLCVClUCqUEFms1HdeJ+uGekcAtTTBijO3G
	2uIRNLvZxLB0tNtwRXA+/NFRxIZpOKP9DNQ0sCUZ/C0RIIdy5t4+8vCmfxxG6KGaal6BxC6yDr4QU
	WU36hbQKvICu2z7pRMqTU1RGIhGPuc/yrWwJChXtQj66bcLw0SIRguYlHUqKqAdqNE70KWZ31qIs6
	bgmVA9jKu8t063ljywlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smfYx-0000000DXt6-2cEW;
	Fri, 06 Sep 2024 20:28:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smfYu-0000000DXs1-1hNJ
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 20:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C7365C598A;
	Fri,  6 Sep 2024 20:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD83C4CEC4;
	Fri,  6 Sep 2024 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725654487;
	bh=E4z2YDollzOZnMKJ5VGZxb6GlDKsbqFPKwROtxnAzk0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=scCGqj3W15mjP5OuI+seuQ8TlTKfFPdxAewpBotSo7IltZsowESH/N4tmwXBaEnfZ
	 JoiGbyMn69LAwzsfoQonC61lnKq0Db+kqpyGm9qPP+nY9qGXytWD0QpAQ+FW45L2z0
	 vXq8vgvu2hmv6MMNM8pnynEz/mavu9k5axhMpQFs+w4QevNEqbxWXJs3p9YZCEZL1k
	 CTK2uJjUomSZESx5RWjq/tGhH/jYACf3FfcQbEKfa2Xh/H6NPOwwwFFuKYFegkNIiS
	 K3cRrBXc9zoPCYGv3PiIgFkgex6ReEZT3aHXfRjQo4f5Oz5PIP0P+DvuHImpnwO0SV
	 pXlFJmWSKVkCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F3C3806644;
	Fri,  6 Sep 2024 20:28:09 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.11-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-43509d97-4d3a-449f-b4d7-74f1041daefc@palmer-ri-x1c9>
References: <mhng-43509d97-4d3a-449f-b4d7-74f1041daefc@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-43509d97-4d3a-449f-b4d7-74f1041daefc@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc7
X-PR-Tracked-Commit-Id: 1ff95eb2bebda50c4c5406caaf201e0fcb24cc8f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 890daedec4f483bcb5cea0a4ce290830d12d78b2
Message-Id: <172565448800.2515438.1514750402355599836.pr-tracker-bot@kernel.org>
Date: Fri, 06 Sep 2024 20:28:08 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_132808_517611_767C47CF 
X-CRM114-Status: UNSURE (   3.41  )
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

The pull request you sent on Fri, 06 Sep 2024 09:21:30 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/890daedec4f483bcb5cea0a4ce290830d12d78b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
