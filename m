Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBB6C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSROUunwhjodxnbIKvYeUISNyvcpeTCu2xYcRaxdDtg=; b=tjqgDusTM9g50K
	2zMQ7aUQR0puvbgbZ9F7vvNd0m3hfjOrerIea38WQXvlP4xHfpHKGHxwCM2geaD9d+oblTqOxx0vU
	P1mfGSYcdEBiO3m4XmpsLA7Tn+jSFXzTMP2jsgXbsXPGa6GBtr8fgHQjfAiHOOOcRadjOJZq+2Uqv
	aWgfuVKTPVqgt2FiB/TLBAvuOZbMGVUacYWp4Vyxtobr6ybe24yRmyX5YPBHQwVkGRzTm94KdPO+r
	uILvG9tEYdAoirxtmOCgOkHhdO+ab4GIyQcwcJfq9UXYvI784T8uIHmNx561AdepH8vOJHmW9f20f
	UKabsNTAbIyz6IdzgEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1WY6-009FxH-0M;
	Fri, 10 Nov 2023 18:48:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1WY3-009Fwd-0d
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 18:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3CCE61AC4;
	Fri, 10 Nov 2023 18:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F1A6C433C9;
	Fri, 10 Nov 2023 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699642085;
	bh=ClGSceAlbCVo9rETcsmbabnLkfY1X+M7qOq2aAOdopc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=H3M/oJeeyHi19vXS2HOHuv5E7KoP78OrzMRgYWs9Iu+dKbK72wVTdtjmCbTO26Sx9
	 AOz7poR59MJgHbArddB2XSO2iJtK5a0cGe067JiQMkXfaapoNVlIqvkU0GcSS9NQ/6
	 vsS95oXZFqB1Z9R9u2ejewmc2weBu4udBDUOdpItfSRFcu55PpQ0NolpwqbiZtqQQg
	 cluvI2RaxTTo3Q1vcjyhF9MSbgLt5pqjDqViwc5C6wxkxXvfoNlK8LU+d+mehitdgS
	 1j9d0w3lGu4CLblNrIXX0wd8U56uzL1XURikF8dHMaUPsECo/iRtY+y3mi3hyJV+Oe
	 /BspRX1wMvUFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E2FFC4166E;
	Fri, 10 Nov 2023 18:48:05 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.7 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-9011bd86-9f72-4223-b78a-b4c69c1c927f@palmer-ri-x1c9>
References: <mhng-9011bd86-9f72-4223-b78a-b4c69c1c927f@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-9011bd86-9f72-4223-b78a-b4c69c1c927f@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-mw2
X-PR-Tracked-Commit-Id: 457926b253200bd9bdfae9a016a3b1d1dc661d55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56d428ae1c4e27fbe02cb554b2192cd66e4df05a
Message-Id: <169964208550.13214.16081066901424762439.pr-tracker-bot@kernel.org>
Date: Fri, 10 Nov 2023 18:48:05 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_104807_295196_96028F78 
X-CRM114-Status: UNSURE (   2.96  )
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

The pull request you sent on Fri, 10 Nov 2023 07:48:39 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56d428ae1c4e27fbe02cb554b2192cd66e4df05a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
