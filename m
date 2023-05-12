Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF1C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 22:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3Sqnv3uP680zkSHKrOX/zNbBj2/GtsOvbotp+lAIkc=; b=Uj+FZKVVq5pQ1m
	ZSNmF9I+meKrrF2IhQIwh8AJf1dybEBeVKBNsb1L8tk3hl0QVhr14/v2Vxib+RkFkZTQFHWGwDuGd
	CK7v4TmSEqmNedsPNkf+7Slgp1TgIUmo6FCwhMAYSzczbQ4cDQSDC2ZLp+hgh6ZQwTS0doVqnZGqI
	qAB6U0vOEOMHvZOCMRSn/3kcfE1zi8oLtBsPYkTwuvBjI45jwpI6Out68iuoJzhxnmTkXAVBZAKUr
	Q2KuS3aaXNcjFZ7d7hOJlTyYyO82xxDzjnhRXwpjidhwHXFF449O4ILW06geXKxulMcTap7nDW7tG
	CLAwvvkG1KSPkkcJ9wkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxb1j-00DAJH-2O;
	Fri, 12 May 2023 22:14:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxb1g-00DAHr-1I
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 22:14:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1DB4661D43;
	Fri, 12 May 2023 22:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 831D6C4339B;
	Fri, 12 May 2023 22:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683929650;
	bh=sare64ZtXhD2TFTZrjIyRvFo9dVSGVRaUZuwZb2j2Jg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=onfm9Z0hEE83Ls+f0HVEJStx3i8LmiYlfvAajqyqkjbzGsF41SeX0H4I/X33l0GGd
	 LgTFyQJpXE6duPAamujmOuQpW5cSxKecRkdsZAIRID8/6k6873jZ1G8IKvUfZMLJyf
	 7j8FVmRa+LdnMzMhs3MSgcCJKsFDeQb6jx5YCK+2z/0PHy1jU3ovQwDB93ktP7mQMa
	 ireYl5ES8wS7fdfQqcwAxn8cEEwH3V7rHsfeg1Q5LllZ5j99fkSLR3qEk5P+CDt3OS
	 VLJSg7aX9gPoMheLAs1hslwepEfUc3xn+c2kSOR5edhq35hQNJRV9BLexSgYJRCXe0
	 vh0u4zOAYqk8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7124CE26D2A;
	Fri, 12 May 2023 22:14:10 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fix for 6.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f7f97b7f-e3aa-4fff-abc7-19439d1720fe@palmer-ri-x1c9>
References: <mhng-f7f97b7f-e3aa-4fff-abc7-19439d1720fe@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-f7f97b7f-e3aa-4fff-abc7-19439d1720fe@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc2
X-PR-Tracked-Commit-Id: 3b90b09af5be42491a8a74a549318cfa265b3029
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed6a75e3133bca544849b967f7f3233cddb66090
Message-Id: <168392965045.28473.11930499297837206978.pr-tracker-bot@kernel.org>
Date: Fri, 12 May 2023 22:14:10 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_151412_489468_6289954E 
X-CRM114-Status: UNSURE (   4.11  )
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

The pull request you sent on Fri, 12 May 2023 08:05:20 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed6a75e3133bca544849b967f7f3233cddb66090

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
