Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A8BC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 18:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkFu8IQiD+aJ0ZP4ftog45pq0XtnWfkDIB1loAJ6HkU=; b=RrCC0HeptKXbLj
	sE19fzq0Wi77WnM3YfvqQf07vNU6dQOKOxGdZTrtfYclFg/yhhFohyW15Vt99D6jlAOuPTaVqOhwK
	3X+MSXQCqWEMXR/uvhRHklMScn0A/7GbEHJcqsN1BAY20lVPiCKXobbGSLQFNSDjjOp789njKdKcU
	Dk3IWyu61yuqYQQsCcjgixW3k8Ehbk3M/6R/+jvACNERNpiNuEpy2ttk8DZ+YNetDMZ8HVUTHHX11
	7E+IvNaKOA4jYhptTdj5zo4clvEMJgcbR2h4BXtPe7wthn1x3XmHoW1gR8Ivk9vPeXC5cp6QUrQoW
	68KRQkjrO82dcPabZWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9qLB-00000003kwZ-3jDN;
	Wed, 22 May 2024 18:05:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9qL7-00000003kuU-1iOC
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 18:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AF55CE12FF;
	Wed, 22 May 2024 18:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB396C32782;
	Wed, 22 May 2024 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716401120;
	bh=eFsafoJL80C4MIkp1b+NKFcZyfQbXlmmbJA0s8k+rOY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qb2OMm3J13HYO1ZewGMdCeS6N0f4zcgoA9mR4uBoil/0VOJzHBtVKt6Xpb2cz7roU
	 xtmUquDdl1nUCuV/317fU9s69i+FAkNdL7rKpqla/VTkaxFUcksv43UxoOrX8b38aA
	 3/MY5r1GTiTm2QeEWN0FktgJ/wk71V7FmHd9y33NZdv8NVcwBzr4sPKTaJfFW+YihP
	 1gV1HeWXA5FksvQzmGeAWPg1gHfjnrrmlXKUS1b7mKUllL/GttythUK4EGFegXZ/fP
	 5pb5cNoBxpcjGYv+3yVO5+lZ+cEJBBOoYGoxrVC+AnZV3BbTvE2aV2C6tAxyz5K011
	 dGP1sZJYlhIpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B2167C43619;
	Wed, 22 May 2024 18:05:20 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
References: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw1
X-PR-Tracked-Commit-Id: 92cce91949a497a8a4615f9ba5813b03f7a1f1d5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0bfbc914d9433d8ac2763a9ce99ce7721ee5c8e0
Message-Id: <171640112072.25247.2091425943706526372.pr-tracker-bot@kernel.org>
Date: Wed, 22 May 2024 18:05:20 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_110525_707001_506993E1 
X-CRM114-Status: UNSURE (   2.93  )
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

The pull request you sent on Wed, 22 May 2024 09:13:28 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0bfbc914d9433d8ac2763a9ce99ce7721ee5c8e0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
