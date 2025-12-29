Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD37D3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 02:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+zzQnUA7kfZ0Zua4aRv8u70T9ukxYHNgBQEo08Knk0=; b=lLOKFSliYuM++i
	Sng1duzt23FIhMxNaEm4uFvkDKTmbc4A0id+RlR02yOI9wwIPT7cy+6NxNTJ+7YSi9p0oOlExtkFz
	MukF98vJ0CYoTkN5+Pea6a0qI+dfmvs1dwMAkI89cczLMQqS/nis6z7RimyJWU+m7NbJMzIpYm2sQ
	+0nuckbSy4EYqusIUncYmtR0A29LGo4VSUdMMqZWWfnHsBZQ2LPC+KEFnT97/YLWg0cvtOezOt8c/
	U54VUjvN27xYbJG9he3luks2NiNqmKiHwbVzKO1mNaxc/W+3DS7NGE85XDw9TQ5gu8I3SvbhpkHBE
	E8ngC4eCZWsZZieY3SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va38W-00000003Eed-2J1K;
	Mon, 29 Dec 2025 02:37:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va38V-00000003EeV-0Z8m
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 02:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 954176001A;
	Mon, 29 Dec 2025 02:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482C5C4CEFB;
	Mon, 29 Dec 2025 02:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766975849;
	bh=7ZcmFVqLNlsCeCHjD+ng4FXYjFB6oaLeok1weFSF4Gs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PchjK303tzJUsCa7FsWVTH/s6pBBL6vWiTT8vZjD8M/c0NTmKHUQANxJ+7tYzhctA
	 vGDlYi3MfJF8hnefdvFUAzOpSfCFBkr+arTB7PQtry5yy0zElCDaOtv9esMZkdfLTh
	 I4SejkYULn4aWfy+5gnPxQTsMwuLDS465BsmwGXkLaIZ5ZCPyaUnAnLxYhcZ6IlRjl
	 tUbbDbhrZpIq+q3gXK6QosNJ0uwtSMmMEJULtjtHrSOe0AdHY5fBMUDwEX0wz33WeE
	 jgaPtArt+QYR8VY1Id9cqw3ZEeLKgUj70e3LnaD2UwaYonS9SNDFieKk08RwpDFH6O
	 74wz7+XnqlVjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 477923808200;
	Mon, 29 Dec 2025 02:34:13 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.19-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <fc36548c-baa4-821d-24cd-2f645f7d9cec@kernel.org>
References: <fc36548c-baa4-821d-24cd-2f645f7d9cec@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <fc36548c-baa4-821d-24cd-2f645f7d9cec@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc3
X-PR-Tracked-Commit-Id: 5efaf92da4365cb8d1ae6dd7a2d1245c69e09ff5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 03de3e44a706cd96f75ede209cb289324367ed4b
Message-Id: <176697565186.2397610.13576639934067283885.pr-tracker-bot@kernel.org>
Date: Mon, 29 Dec 2025 02:34:11 +0000
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

The pull request you sent on Sun, 28 Dec 2025 01:18:38 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/03de3e44a706cd96f75ede209cb289324367ed4b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
