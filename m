Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B839C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6eY+H7JCaZXteLQxwwqSZv1VrBk/b3lnuY5+8IQUTg=; b=RiLt+6RuMPD+aR
	k5RtuJKmiTxqmzImquvLB5LCJ3YvKRyw8q3dz0Vcg15M/yoDyWaNMMJ+C4AJz0LQ5AkDoDwS+hlJR
	1uacB+qOi9QG7tJqebdKF0eGu890KNe24yHBKGjM/5GQda/WJNbjoGddUwbCVcGmMV8e++aotdOYR
	zJqQRQPWeZqI0DpV+XMEdXG90+1vQH0tfIZlfEBlvo1awPhw2OUAMw2BqfAlR4SzavnLdjeu6PIRc
	LNYjBLmdi+mTD02VqNKVT9U/N6eu3G/CQ3uvGh8hi49+CIc3Hr8m4KKzOsedR7UPUPdwtDMDrga4s
	juU3+92Eaoc5ntifVUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIcAZ-008eSZ-8E; Fri, 11 Feb 2022 20:05:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIcAW-008eQw-Ee
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 20:05:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 713F6B82C96;
 Fri, 11 Feb 2022 20:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06258C340F6;
 Fri, 11 Feb 2022 20:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644609921;
 bh=a3+OiQ2U9k44AyRxGUDgBmBEufOWsGoN35othw3JSeU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=TiO/r+m/nk8ZETiu0jIutaXO1cLSGK9HBjbGio1nSmLCMlEJM3hW+l+G3FwYfpxBb
 BwG5rlmrPGiBnE727hhVTzGPUcUOT5fkdjUru9U4If2jROi839uPkpC2nnXUM5b6Ju
 z0HWllbszZlcHKbNkn2FNH3aJMPiGVGDYW/KCmh1Ao2rSVOA35/Sik+aMZfOIuOO2P
 7NBvD3SopAi+u9AS2Mb8krtLo537Ced7TNZqj7c8X7kqiFi4Yx1XzTN3t46iHXyD1G
 sPX/a4LbRvpLMAmMOu94hqU+e2w4sQRqca0R97P0OrTcZe/j9kjc+kYpraYK6iNV+K
 f/sRpg+7ZAELg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E5DEDE6BB38; Fri, 11 Feb 2022 20:05:20 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.17-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-9ae96702-cb8f-4e96-b126-0ae9b4f5a7af@palmer-mbp2014>
References: <mhng-9ae96702-cb8f-4e96-b126-0ae9b4f5a7af@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-9ae96702-cb8f-4e96-b126-0ae9b4f5a7af@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.17-rc4
X-PR-Tracked-Commit-Id: 6df2a016c0c8a3d0933ef33dd192ea6606b115e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1d41d2e82623b40ee27811fe9ea38bafe2e722e9
Message-Id: <164460992093.1412.10063568591934198888.pr-tracker-bot@kernel.org>
Date: Fri, 11 Feb 2022 20:05:20 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_120524_674377_3B01DF9C 
X-CRM114-Status: UNSURE (   4.24  )
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

The pull request you sent on Fri, 11 Feb 2022 11:28:17 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1d41d2e82623b40ee27811fe9ea38bafe2e722e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
