Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F5DC27C65
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 22:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWqmEhULLnddCqV4vr1KKkE9hoeUBNbEDk3HvFiFjK0=; b=bwRhI1cn8uIB1J
	zj2ijntYXs1urZ1+QKCO00cxAfiwFu9LEy7WQwZT+ZaM28Dzn8zlWDurS/7+LWw11AhixPKA6FXw8
	wLXgVO3i+++GJxYVtGAlbyEfNV5vIOwTY5pEULGFJZFiqtqqP8EQXbefmHYuXdFmSZPAJOOIrhac6
	OCx2rvK06VUVihUzqX3y0zDhboF8/gpJW+HZ+SlBizwmJybobP+yw+Yflq58P75eQnJSojX2uH3p8
	o8yfcppZdq2Oj11IY7iLmmhxIEZt1Jdkj3ohFSZhrKcwNGSVFT7wCodWfTBTuka5nwrpJdWmrvAzl
	KYZUGWfFMwTGR5vjhj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhkj-0000000FneD-0dt4;
	Fri, 07 Jun 2024 22:08:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhkf-0000000FncQ-2liw
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 22:08:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3757562078;
	Fri,  7 Jun 2024 22:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E41DCC32781;
	Fri,  7 Jun 2024 22:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717798079;
	bh=gFCX/2+fe+TC92v/LNNuECOPuo+VqmHtOgpUKdTkALg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eyEHQaJMuIZGvwJPSMOaGTa+dkZGRlZOp2XxEt1NPAB3A3yFvIfqEl/I7spf9NIn1
	 RR8QLVKujjGyeXtDa34hHgfEL3fn7AIdgPH6cruhb4x52VJzf7TZx2+2AXFo23zoTz
	 AaFPi0v/NdxyFnQxty+4YNMTEaLSY4GL9y4UFZIK9J0XEnaoswGxU4RJJY94m4e/Zs
	 ny0CjxJ7WnHRtVmFX5Of2maocSX0QKb8BgjiA8pnIPl9CTG79Ac5cIPAcgfFYAO7CN
	 W89lBb/TE2RhrpWASPF10lSo6hWa3gexdg6dc041YN21XFHVjjWwsYH33aWA6JpTEV
	 LS4CA0om5bVIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9396C43168;
	Fri,  7 Jun 2024 22:07:59 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.10-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-1afb5c2b-25de-4eb4-a911-523495ad3939@palmer-ri-x1c9>
References: <mhng-1afb5c2b-25de-4eb4-a911-523495ad3939@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-1afb5c2b-25de-4eb4-a911-523495ad3939@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc3
X-PR-Tracked-Commit-Id: e2c79b4c5c4d83520abb570ca633ded09621c0a6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a02756d9145725c1b9979f0486c268f91471a48
Message-Id: <171779807988.32288.747862417457855949.pr-tracker-bot@kernel.org>
Date: Fri, 07 Jun 2024 22:07:59 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_150801_784224_D00FA6A6 
X-CRM114-Status: UNSURE (   2.57  )
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

The pull request you sent on Fri, 07 Jun 2024 07:25:49 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a02756d9145725c1b9979f0486c268f91471a48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
