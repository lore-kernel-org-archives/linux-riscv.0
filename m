Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7231C5478C
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 20:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/7FHC/+jRbZVNkzk7wJ1xk5/TdNsIgaZp7YNplaJGI=; b=F8CACNYGMIh47s
	3CbBIZ6tjsoiNpzuwCe6du3HkETsXUGBOxQNLSgehPG+T18CMGQzBeoTrurjvutWa6rtQQTqAOvbW
	i7v37hop5vmhtqFHT1UhXb11TupAW5Yrn9mtlBIk/tr6/3BBGJod/Lo4aUaSTjaT7K5bU++4yBXFi
	dEdWcsFqGhjjLB454EcJvj3ON5h2pR5WdVMBLg32RHXbC59EokhxuVB0E2pXnq9ktqb7W/iIUN9iB
	k6rvQPxI+Ff6zb/0DxZCik3WuwhVbSxFeXjsdCOi81tWHVEDzQhlasV69sdFKbB+jyDZbCUI/fxnX
	5SOc+w3xNWwSJ2h8ONuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg9rg-00000001x64-1vXP;
	Fri, 01 Mar 2024 20:52:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg9rd-00000001x3y-1Mjn
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 20:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACBC661B89;
	Fri,  1 Mar 2024 20:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AA12C433C7;
	Fri,  1 Mar 2024 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709326336;
	bh=ssAqB+QWyIVQUkV1L1MYK1nhKVDkE0p+uOs9I+7kJNA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KIqeHcR4h0lUWYHgG3Dovb3IR5daCUGkpaQQNLw6KVzWeaUXDpt6zN5EE+FUbHRVX
	 po3Tz+AnKjA89cxnEGhieEudRf3WkCltnq98OlaiFeSgTVc+ZF3Rby39F3AlK+WZz8
	 buQ7lBngXnaYibD+PeKvknGPp3R1tBmRu1jw0U+MCzCa7RAO5CYZQGfoR6WS4m18qn
	 WBkWEGOwnz1jhwqgS0uCs5+lnIxrNGXoVa+2t+CqSOuUgF5xbhtTuHQJ6KyElP54QA
	 fGYsVHJd3KFUWcb9jgDRJ8cWZuliUTwg4bTeuvaYX4JhvOFWrciUB2uhZWUD4I0DR5
	 2MxapUOWeOKVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48990C595D1;
	Fri,  1 Mar 2024 20:52:16 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.8-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-17aa05c6-25a6-481d-ab1e-cd01d8b4da43@palmer-ri-x1c9>
References: <mhng-17aa05c6-25a6-481d-ab1e-cd01d8b4da43@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-17aa05c6-25a6-481d-ab1e-cd01d8b4da43@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-rc7
X-PR-Tracked-Commit-Id: a11dd49dcb9376776193e15641f84fcc1e5980c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d17468c6f1f49e6259698f6401b8d7a5b90eac68
Message-Id: <170932633628.15943.13364216292656642698.pr-tracker-bot@kernel.org>
Date: Fri, 01 Mar 2024 20:52:16 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_125217_440980_4007F83E 
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

The pull request you sent on Fri, 01 Mar 2024 07:13:07 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d17468c6f1f49e6259698f6401b8d7a5b90eac68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
