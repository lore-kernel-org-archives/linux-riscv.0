Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA74C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 19:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwVY9NHulCdm/6YhwXdf7Q5oTICR2Ou10BAxIXtTm/E=; b=Ij47rlFa3SB9Cw
	B37qyOst4667zYU7do2Z66iFV3qUDQyldrvlCZaoNyK9tehPbu19bMsT8t+n4I8RbkQGD1N0cDxcR
	GFr4/9i4MVaTVzKMyYpjG3iP6LSiz5XwwMpkLEPfMYZ1wm622eRcc8tKwZGLOxrmA+GDRcIX4jtIT
	+TpkAZc9h0Qp26E/kNLeLrX24+aDnDTVTGNYWk/Bw56HOg6bR65Tk+Y4IP4T94RXakpI+JCCLPd7d
	Jxrog5nv5rmkv9NxpBbEfKOeP89vMhStZHus2BphOVfoypMkANm7PDerrxCJpbxtmBDQiBWezgjJm
	SYWLt5zJgDx3gYZpm0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnk9y-00000008RPD-3Stn;
	Fri, 22 Mar 2024 19:02:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnj9c-00000008FsL-3tP0
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 17:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E76B6148F;
	Fri, 22 Mar 2024 17:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CE64C433C7;
	Fri, 22 Mar 2024 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711130288;
	bh=BuncvNeNfuiQyiAMnrZBftzn+j9tJRF8CoQDRaBRqTc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Pe7EkVM2ZXRHUSOg9eEEE6td4gaS+jl14MX52S11fJ1QMzP9MAhpdMSZVHMBc6HUa
	 XEExT9z8YQ6dmYkPtRup3n7jt0gPhDw5bmPoicAuzASHi9EdQxtu1ir+xT54oCbAmi
	 eN9T9OURIPmEnxuTPpZyJ8GCzHXTI3wIJq/3TUs3/UQFKG/cA6S+l4d+t+7YdbnaUa
	 Bw14ZXm5hB6NLmQ1lp2iMmKWshhSnCrjNN/NgD5QRFAw41z5Ps34ZWduUy9by8YduR
	 feU/dohqAS0wMKhvyX5Sn77CopZ1SON7sl1/FCd8BUSQva4+TCDS54mwgHhsCttAYG
	 QsjZ/pWlleLVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16752D95056;
	Fri, 22 Mar 2024 17:58:08 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.9 Merge Window
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
References: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-105d6a21-7483-4a20-a9e7-8e72770737d8@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-mw2
X-PR-Tracked-Commit-Id: a9ad73295cc1e3af0253eee7d08943b2419444c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c150b809f7de2afdd3fb5a9adff2a9a68d7331ce
Message-Id: <171113028808.2552.1070666340046445949.pr-tracker-bot@kernel.org>
Date: Fri, 22 Mar 2024 17:58:08 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_105809_184477_37A8B50B 
X-CRM114-Status: UNSURE (   2.98  )
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

The pull request you sent on Fri, 22 Mar 2024 07:22:06 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c150b809f7de2afdd3fb5a9adff2a9a68d7331ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
