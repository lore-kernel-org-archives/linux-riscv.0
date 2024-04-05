Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB3CD1296
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 21:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KHi7eb+wXM7Xv5zUZBw/8H5c+REeYjz1NEr2wqFQi0=; b=LgG4+cXzpueBOi
	bLfI5ditMJjIA6mkweu5+1knKSRa+C/7gDrjfA2jgo8uTfp8N9yKdf2raSzAFoMv3EQxeMrBS6xxi
	fO0pZw+CStMkW0ssFF8ElR5fz4RCCqGHdyv9TwvFDBDmLc2Iir8Y8X9LFwSuUpl2qPL6r+UzHH+3i
	fTgqtP4nS+G+Au8b97QLELYo38EdQopWI8hLyiimYDYWHGbq5+v2FIeU/Qqgp1HJSb2hve3W4UYT3
	/RA2jYYcfmPhUE9CrK2F1++Q/k748bQdsV8AHKsxZlyDma5GjsQib5YlAjAGdguzuXoDe5HAtE4Pv
	NDv0OFPmtbEo+CCLjdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsqlL-00000008pRb-29EG;
	Fri, 05 Apr 2024 21:06:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsqlG-00000008pQI-3ZWV
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 21:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C30E6123E;
	Fri,  5 Apr 2024 21:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0284EC43390;
	Fri,  5 Apr 2024 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712351170;
	bh=B4Sgbntbvj+AgCtEMDhyAntY5n2I43aIiKKUajYQXQU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S/9U4EyCVHhbABqdO9RfMuPqzFd9XcePxdpuF2xTL7NRm/s8by7mcRgOTF3OlYpCB
	 7O3AS8LnR+aZwQlTouP/JkE2ubTM3eY9/J8u6Cpn5rXYfyEpZNjr+H7fC4E7BIv2W4
	 TELu7a1+v0THJwkZR7XbYLbVlOz1/CYLOgDHedbLQZ3xLnCgdpn1kfaWY54p3/faCi
	 ye9L65Uld/2/6YW+P2HBOt6iK44yax5P3mDJ1ZD8RLRRAbW8XP69FxJS0I9WhTb0HQ
	 RhjdZ2NSw4TpewGY0pG4hmxt7p7q2MF+wyea3vS9yuF6ARm7FrYWZQoj5qQM6lR4pv
	 5c7gde3iuKXyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EDFE0D8A100;
	Fri,  5 Apr 2024 21:06:09 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.9-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-28e73e09-0100-4e0e-8c4a-490552b42c6f@palmer-ri-x1c9a>
References: <mhng-28e73e09-0100-4e0e-8c4a-490552b42c6f@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-28e73e09-0100-4e0e-8c4a-490552b42c6f@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-rc3
X-PR-Tracked-Commit-Id: d14fa1fcf69db9d070e75f1c4425211fa619dfc8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 261b8e89b6274f7f9c2fee5ff494dfb384d3e2c7
Message-Id: <171235116997.3156.1887417054016273983.pr-tracker-bot@kernel.org>
Date: Fri, 05 Apr 2024 21:06:09 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_140610_980674_60858820 
X-CRM114-Status: UNSURE (   2.66  )
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

The pull request you sent on Fri, 05 Apr 2024 10:29:24 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/261b8e89b6274f7f9c2fee5ff494dfb384d3e2c7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
