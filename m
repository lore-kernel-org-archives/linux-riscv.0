Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAF1C38150
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUycUGW+FYLMYvAyfXp3SO41+IAy3Com/TJBSauVytc=; b=omao4eb6gbbzcj
	Bu/Qy8naj3ztOySxS6gcwvVdZEOZRwOPCGkOWcvRPeD3LC96eeZ1Ks6aEDk+qbKnGzLD/KKa7VfXW
	yxbvgqnIxREU+OUSdBY/s5mBh+g+/ibAHjLrAWqizwdQdc3L29edWJbwIYFO1T9eVhgAaV+ou8Ez3
	XnhJcGA9HYMfG6xTqT8JWEy/54tMmdWxz4ZI1JDoPgHlUgTQ97TR3JuKEjYOKPfL375UTZHFDCX01
	qVf/YEN9gg8asZCYdMryCcpsJmTPWUVanSOcyKAVMdHIQji8XizodpmeQ9xHjW+O2xuFVSOkImZXg
	MF+Pa7qn/jUcvUAyKQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPokt-0000000GixT-1bvE;
	Fri, 05 Jul 2024 19:38:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPokq-0000000Giwh-1QdP
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 19:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29B7162C5A;
	Fri,  5 Jul 2024 19:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D284DC4AF10;
	Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720208278;
	bh=xNdMLT2mUhhiTc4YzHZzzJOgKHC7/CcVqnspUSp4enQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QBwZ6PJp47zIv0QT8SfWkeEm5xPXq6zhC80kwDN5nWg16OW/OTtRM81Rbx+Turb/H
	 1cW0EWPBRYzyUBDGTioxRwN9YhijdYmdcfV0KKXylD8t4cOUmp6n5MeXpSKPcYH44x
	 3AiklGIy+++wFJw7tlNjYso9KgFnCymQAyZWLkYC1hsbg8WbBzP3AYaf6VWCMNMZL7
	 Uo/NBzavifFAkKsLjqkj08HtJYMf3dNaUbwwqWofonT6bVBpFrOLn6HdPd8J5L7xf4
	 GQM0FoOusDFZn1hCTCOKrzBJnJ5KHd+7Rt2xBTkihAab/J4dwzOH3leVh3yzsWULy7
	 iiH4rKgi/SfbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7A00C433A2;
	Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.10-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c0537cb4-d700-4259-889e-c87f011e931b@palmer-ri-x1c9>
References: <mhng-c0537cb4-d700-4259-889e-c87f011e931b@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-c0537cb4-d700-4259-889e-c87f011e931b@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc7
X-PR-Tracked-Commit-Id: c562ba719df570c986caf0941fea2449150bcbc4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b673f2bda0c9d306e330a236c87706d8de18107a
Message-Id: <172020827881.9250.5322358935828636202.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jul 2024 19:37:58 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_123800_465482_32C37B64 
X-CRM114-Status: UNSURE (   2.87  )
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

The pull request you sent on Fri, 05 Jul 2024 10:16:32 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b673f2bda0c9d306e330a236c87706d8de18107a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
