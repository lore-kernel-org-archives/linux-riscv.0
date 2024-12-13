Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F9CE77180
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqxZYxYna64D4ewaGqzFSF38i6FuzrLXB7MuyBk23ls=; b=fbbyhAWih56ht/
	BrzcI1YKmkuS5I9kLw38Ycu0YVGl9IEDrB7XuW/S5HE4RSjT5gkM2VKq19yrWzYDtYwTeCgMpHm2f
	1g1Q0h8pnQryGCnkURu/+h0wkOSfaHa/fma60gN8sNVM+/diq+wd5pwGofnDxDm0tg8R0yx9kThzM
	k8WpME/Neam40dcKC1vgDgg9HD46k3T8cUACJPIsojFbfhNI4mckvHWBObg2uS5f9nc2rgUnefa+r
	ssIlSQVa+11vxr0MxsN0pf5uZXqMKQ8qpemHhv9TXwgONN0rMTR9WJd5XqNjPobyXL+GRj1ZAVGvf
	GPdvxrcA8QoFw6CigroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMEG7-00000005COU-3nsq;
	Fri, 13 Dec 2024 22:35:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMEFQ-00000005CHY-1FUB
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 22:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1963E5C5B7D;
	Fri, 13 Dec 2024 22:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A44C4CED0;
	Fri, 13 Dec 2024 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734129299;
	bh=XPTlpQtwF+ZkXHg9wDTdT84ApntOBmVexMUHSL0CMxw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r1TLE6JGpb82beWGgaF3o3pFzYUgDF/OWAULzvHTqqIrCfBBn5xFM44X3L2dLNCIp
	 5UgDCf2DX3w1Y9/Qttwi8feMsMOlMt0IJHA1lncpp0mMe3/O5kwEOg4CPPndJ46r2t
	 MW7afNyMm/a4G3FjgY2uWsrtX1QlWWKyRE5FtHSV/C0g/XezttaZ3aS8P8ddjhmcWa
	 D3wqlnhajNKDeqBNrYLZTeLa97GXze/N6n1nKq1gOBhKdsJ6zSOG06FV3muC0lSbmS
	 aCt9tSNnwdHlLY9q3yeaLZp8mddcHw0rG0zqV9SpMVXx+bB2ImdfhKe68BWuwifo/p
	 LzGPay9FzEI4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEF14380A959;
	Fri, 13 Dec 2024 22:35:16 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d041d4cd-3e9f-4533-ac26-e0d67be93496@palmer-ri-x1c9>
References: <mhng-d041d4cd-3e9f-4533-ac26-e0d67be93496@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-d041d4cd-3e9f-4533-ac26-e0d67be93496@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-rc3
X-PR-Tracked-Commit-Id: 21f1b85c8912262adf51707e63614a114425eb10
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5b3d5dfce3a1ac2e87cae8ea6b279038d418a6c
Message-Id: <173412931526.3178864.2460721745326330363.pr-tracker-bot@kernel.org>
Date: Fri, 13 Dec 2024 22:35:15 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_143500_384255_A7FD8D06 
X-CRM114-Status: UNSURE (   2.85  )
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

The pull request you sent on Fri, 13 Dec 2024 08:36:22 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5b3d5dfce3a1ac2e87cae8ea6b279038d418a6c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
