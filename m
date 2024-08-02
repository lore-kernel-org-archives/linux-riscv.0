Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5717C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Od4kyF1JkL5rLonEAE4vkAezHAOM0/0wKwR5q4Doo8s=; b=3TiAJeD0lxlLCk
	poII/xnmGU8swyUZzkyEf0qoQUPyZ/Z0alwavlzRRjyyy7AJ+dhZB+GxS6WuHIGgGf4ftQ5X5YQ18
	H/Qb133myBNvHOc3TbYYyWAXrqkZ+vyOHviZief07XV9UUv8V52UFl0g52zl41G0wakVQSaMxvzm8
	O5sdGmd3K4A8lNwa71MigIsskYFsK5aWURcEpfYxwON3JG0Qsx+d3hzGOmgDbkSBnIrmIJ1qBqKL1
	kuTAxcJi7o6eXToRL3mvVVkzZYMEf6vQfg+ESi5Mdo5kGO0XiVVi8X/vVsuLciCEO1/gu6eaR3U85
	b81lDI0a5g70i84UQHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZvWk-00000009XDW-0WUe;
	Fri, 02 Aug 2024 16:53:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZvWh-00000009XBh-1lvM
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 16:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41E5662AF2;
	Fri,  2 Aug 2024 16:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB26BC4AF0A;
	Fri,  2 Aug 2024 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722617590;
	bh=3NR2A6uZxVOxwjNvyWhjmTfIEJK7m9xETjsES+XsRN4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PqAlUpenx+6Xy46jOvIAOHOSZZIbfzgqbaJc+PcFYrRY7LUjbvRPJkxpvY3WqsNp3
	 QRYxCjAvUw/DqQEEH0VdMyILFzSx4XIqXXIyDFctweBTlueFW33aUODjnF+/JOPds3
	 Ale5dXzIWakgr8J2VM4vQ+mwJyYJ2iMN+W5jHIkPuIQChkgvNnPSP9QbL4hLmIUKdF
	 XMudbG3lZT+r3H3zn9tely53U64Lx/l1u8i79yysBz6PSxJkfznrVAbu4A2Al/ptYb
	 JBPB/pJdn1wUDlx1CMMedNIAPV/GbNphoNW4DgMc+/mBRPzZXXYY7UiBF0jsxPd6sR
	 knVj+sRcnSimg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E174AD0C60C;
	Fri,  2 Aug 2024 16:53:09 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.11-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-43770bb1-d5ee-499f-8925-ade7d59c6f38@palmer-ri-x1c9>
References: <mhng-43770bb1-d5ee-499f-8925-ade7d59c6f38@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-43770bb1-d5ee-499f-8925-ade7d59c6f38@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc2
X-PR-Tracked-Commit-Id: 3b6564427aea83b7a35a15ca278291d50a1edcfc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 948752d2e010e11b56a877975e7e9158d6d31823
Message-Id: <172261758991.28369.15960104277345307627.pr-tracker-bot@kernel.org>
Date: Fri, 02 Aug 2024 16:53:09 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_095311_548393_126EBE36 
X-CRM114-Status: UNSURE (   2.72  )
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

The pull request you sent on Fri, 02 Aug 2024 08:44:50 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/948752d2e010e11b56a877975e7e9158d6d31823

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
