Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7021C7EE23
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 19:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSZhfPvwKR0j9yVee8u/827bQmCDfmrZToG+VOg2j30=; b=vAh+UuhloiF1F4
	W64/pzG8DaoHo9rMEDr6xg4RvammKen9bpd8CVXSMIltQXa8Hwy4A3sZmDcTdxY7XmIuJUEG3p0Fy
	SYril2jqUIDHSr91opw3GpJsLVwohPpy/mH6558YwuW+AsIf6zxLao/heRNd3QabdeJc+ZCK0GR5z
	kecZgSI9h6HzR/Q+IjSp01noW510oegjRT+0iT9S5UC4JqZrhd6Gfuxyaw6wJDi789Q6bSL3O9Fo/
	18mjZpddteuU8VK2OTqzkO3arQ+bAJ3TeQnokuivvcjlV54gLjV7tEp+BfeUPSV3hFp5ZNvHhOV/b
	pk8mq5cG1Ga4xgHRrcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW05c-006CHf-Kl; Sat, 25 Feb 2023 19:20:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW05Z-006CGm-O6
	for linux-riscv@lists.infradead.org; Sat, 25 Feb 2023 19:20:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29AAC60B42;
	Sat, 25 Feb 2023 19:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ED45C4339C;
	Sat, 25 Feb 2023 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677352807;
	bh=EvctT7ujxPFVv/wfffyaw3ofefOwMbkNH9LWddsdjmE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EdXbiol/7ILyXM0xNGFWZtiQzf5N4g3czR7L+1QQL5IYI0VjWdAfEGuai275iRGz7
	 B+9xMMUJYPTuJZB8Rb9DkVvAxLGKMZIkCgIbze2G9mXRvD9ElKG7YnRWVpKhj7dpxD
	 Z5UXxdtTtitQIg1P+NlMWj5dxn5ifR3ZGhYNWvGqabM1WWSN5BEVJlkiWCYTS3zpL/
	 fVeXkT9hEbF1SuKtSonCQMc7x6sjxmF7O3DIZwiaHViqtooe0m6c+ZjRrkVp53ZImT
	 eDYFN+DEwQ1EFDyNBQWtnWDe9CS/e/uxX/vS9YVJE5DBcvy1r6abA9fuXVeWBT6d61
	 EoAF2/GCOipHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C32CE68D34;
	Sat, 25 Feb 2023 19:20:07 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.3 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-9df18be9-c02d-41f8-93ee-7e1e124a31ec@palmer-ri-x1c9>
References: <mhng-9df18be9-c02d-41f8-93ee-7e1e124a31ec@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-9df18be9-c02d-41f8-93ee-7e1e124a31ec@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-mw1
X-PR-Tracked-Commit-Id: eb9be8310c58c166f9fae3b71c0ad9d6741b4897
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 01687e7c935ef70eca69ea2d468020bc93e898dc
Message-Id: <167735280750.23615.6463231729672618207.pr-tracker-bot@kernel.org>
Date: Sat, 25 Feb 2023 19:20:07 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_112009_838550_918E0195 
X-CRM114-Status: UNSURE (   4.45  )
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

The pull request you sent on Fri, 24 Feb 2023 10:32:00 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/01687e7c935ef70eca69ea2d468020bc93e898dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
