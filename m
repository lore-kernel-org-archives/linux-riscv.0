Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B49EC3ABCB
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrP1sy8GoqcBMRyFKpVPS/E1+gsBZduuDXp1EGH+LE4=; b=z7ZYqcGeTZep4j
	Xut5qnVDFxKFWN0U0fA2i+orMkp+rshbMdNnDZLxZ6RVyz7TxOfL63S5NZptIwCOZ7rsDfPtkpD27
	GFgGzCSp7mLS2+oS6bjyZ4rbE4vRv0UP/ncfLaSmALkeKJJg1hHBZVRC+d1B9IjK2f6Lmn6T09Pdl
	ckdpmhyImWJR//+8QjrdzJJAHyYPX+gEbacPWG1+zT5nbd0NGZucSIUqkY8X0+Ip7LpnrR8LuA3DX
	RdebtHbYxiOXPSMgUrL6WA8dHXj/IcXj1NieXFkhhsLAkkAWrr2anwSj6qYWkgKQee6udr9gf5Kb0
	zf6iWBvAXSTkLRmdNdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJz-00000004p4i-2hN4;
	Fri, 09 May 2025 20:27:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSU7-00000004ZxZ-2UcC
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 18:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6219EA4CC92;
	Fri,  9 May 2025 18:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0892EC4CEE4;
	Fri,  9 May 2025 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746815410;
	bh=udV99osEjaUccUjVGvCSpuxdG+Q+f3OQGs3zgzs0Ydc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mI3f5wJ4ozjvWao+2h3woPXhYxcYYo3molADljwwSxuppSjkQSr+pY3Nso5f/jI73
	 77KFnjzzRkRb8DnIYsEGDpkyGEruGbJjDJtTXF7h8rzj89ZCW0/TGRCoHzYpgBJJ6a
	 c7jwEiJkvk5aQbgLB3WAHIdvvyXb0J9SluNEaSFjOZC8l3C5eQWhLtqvpA9GY5mIH7
	 RcCF4YBjantihNg8CDsPKSGvzC0nJMgyV/7yVJ2cQjtITTEThlteCfVR0+SiWXgEBB
	 Dcd7xFR+qU4qOKwZaNw1onhQKfg6y1tu2rXAKzRIIBGpSs/F4psldG2kfKCRRZrOCe
	 VKH4OI0d+fS4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE119380DBCB;
	Fri,  9 May 2025 18:30:49 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
References: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc6
X-PR-Tracked-Commit-Id: 01534f3e0dd75e27ed03e5542f0c7bf6aa7130f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3013c33dcbd9b3107eef8facce0e4c69f3b7f780
Message-Id: <174681544827.3713200.14256955835077534513.pr-tracker-bot@kernel.org>
Date: Fri, 09 May 2025 18:30:48 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_113011_696946_B297707D 
X-CRM114-Status: UNSURE (   3.66  )
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

The pull request you sent on Fri, 09 May 2025 09:11:24 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3013c33dcbd9b3107eef8facce0e4c69f3b7f780

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
