Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12C2C83F34
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 23:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKDnmklGF2hidgj3tlT0LewrGP1BcAZSjL1YGFo1jUA=; b=1vLXmSXLaQCzK1
	oBDYWijLIN5lORegLx3cqG5TvwzBpysR3ll5NdYRjUkHNWQjJ47yEocrP+8ZCTF2cBnSk7uw9BClx
	28qimNVo5WBoacgVpC7UNrXuwPbwNTNtOAbImIdlgSjeknBBOFIclPgJzpEVpeD/Rh8krijUme7GO
	IRNULx3F0DgR2rz3X0RggPAO8Zhp7vNWxuBbzmbcNu0NvClugOVF4+TF/r66I1mVK2odxpTusyZwp
	oi9eSAiSlNU3Utryprngtygq56o22lxFecasZpWDoF0ot55w+LrnnY7Yqz1n0C0Ws/ETEi6FPTtXI
	tQ41lE8/DWCVFxuitGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucuC7-0000000DaUc-0JNK;
	Fri, 18 Jul 2025 23:08:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucuC4-0000000DaUV-3ZD1
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 23:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5A12600AE;
	Fri, 18 Jul 2025 23:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6B3C4CEEB;
	Fri, 18 Jul 2025 23:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752880121;
	bh=Vurc3vJIOZclQbjZGOTZ7VSzBlFwX0C4CBqFNYImuaA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dspGXYWX59a7XEkn40IhDkw5hGsg1WXWo1IIoPw4FnjprueS5XgL+x3h6J1UQFeic
	 iCfrz9LPu3c7/ijhwFZZqCPZUMGsqncOn7yumgPF8NMRVAzuzNwY1MufwKucuxRweb
	 2nn7/BxakcYGYANCI0F2SGJSQzEdOuO51FxcKjxTgcx5oz+2Cs9iEcEvzNYppdeB5I
	 Mi9b1aL88h0jJ8c0TCkRH5UZyOXAOTJzJYAukWe+ddt0gKqTxk9KLHzHZ5OyFG4zuG
	 Ar+n5kneJ5p/pKR+U2szgyfcwAgo+j8V3ZwMXskqDUklK3p2tPdtyOV+boQvCpBlEg
	 ZvcYDzQULcwow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F3C383BA3C;
	Fri, 18 Jul 2025 23:09:02 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.16-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-AC007570-958E-4BDE-A86F-44681C9AC10E@palmerdabbelt-mac>
References: <mhng-AC007570-958E-4BDE-A86F-44681C9AC10E@palmerdabbelt-mac>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-AC007570-958E-4BDE-A86F-44681C9AC10E@palmerdabbelt-mac>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc7
X-PR-Tracked-Commit-Id: b65ca21835ed615907ba231a60db80a2605b94dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 414aaef1537ac7f90dcb54e618864680aca2e197
Message-Id: <175288014106.2820345.947998064876714169.pr-tracker-bot@kernel.org>
Date: Fri, 18 Jul 2025 23:09:01 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 18 Jul 2025 14:54:02 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/414aaef1537ac7f90dcb54e618864680aca2e197

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
