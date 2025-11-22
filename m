Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A3CFD2E3
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 18:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t91qIy5wIN0Ua8anLy9fr9xlaI4NggMD3UtDjN5MyTg=; b=ZuKZNn4jc6rGa4
	GExhok9zAMGwaOwoyyfN5JCxAyFmL4XS+nqo9anMjxQ0iBceaAzSQCnkBrHMDp52ZY6kWJvYpB1Vf
	sp2g0GBROh2xHwSnapHHgbIJ3OypEMINUtMvK0TFU4hYATDu0LUgXGQo6PXTrGPCODeplufxGC9xM
	fCCrRPUqPBgxPgxlzR/Kf2tshm/Z05SBxYg94rCh+wMYBhzMJHYYAgivgTHcNxNyGWsDiqj+xb5B+
	8bcySBip9cvqicWc+Fpv76/FG1dy68wyAyNcb2jxpJbbVy2aJ26yKvptPTwN6tpGhEMLg1Ksb7Pzz
	fibWdioGhmdzJw7BZBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMsNE-00000009nEU-3ZNp;
	Sat, 22 Nov 2025 18:30:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMsND-00000009nED-3Yeu
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 18:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45D6660143;
	Sat, 22 Nov 2025 18:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DADC4CEF5;
	Sat, 22 Nov 2025 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763836213;
	bh=RCcsiQjd8UP/PFoFrT1WC4dyMUR5yV+8MjGVTCHRbV4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oPQlZ6xAViYfuYZVH9NTzmw3mGHjSQSGS56467MEhviP8FY0fIz0TY+ZZ+ftrxl9D
	 33igwkWsqgX/brKPynM7QhUSYrD1DwOePdFBGSpWm6T105/9GYTODjrJERF0Z2CJQm
	 WtdL1KiFGcTOONrhE05EaRWEHhvbZooVQqa9PGpcHSbO1Bja/VDoZlF9TA+wdzM2MO
	 i5kzn3rGALaEuOvzwq5oKJMjgQkJIOSkGyUntZMUbz0SMYn/mUUeOp9aV58utOjZOo
	 8T3Y4tuvv8bD52Zszi9gpcK89igPObn7lqAaqPUSxF493T8zZwaxVfSYyQiKYRXwja
	 F0yp2E4J3qFsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 341CA3A82577;
	Sat, 22 Nov 2025 18:29:39 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <d51764f8-04af-8930-78bf-bb253b55b561@kernel.org>
References: <d51764f8-04af-8930-78bf-bb253b55b561@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <d51764f8-04af-8930-78bf-bb253b55b561@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc7
X-PR-Tracked-Commit-Id: e2cb69263e797c0aa6676bcef23e9e27e44c83b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a6ff0d85ebf0d4033c9850bf7f77fdaf472191a1
Message-Id: <176383617765.2850055.4799267376263780914.pr-tracker-bot@kernel.org>
Date: Sat, 22 Nov 2025 18:29:37 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 21 Nov 2025 18:37:44 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a6ff0d85ebf0d4033c9850bf7f77fdaf472191a1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
