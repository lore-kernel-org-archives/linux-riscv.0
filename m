Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A872C3DA61
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfQkI3678iXK6QR/+ktWTN2lIjtsI1QqcnQ4PE+WhnQ=; b=XBHYQv6DNrvcbu
	g8DcY9qVBkwJPq7G7Daswmdj5FIaUhUY6Wl04uNyl/lPUKn8/LeW+zT1j5414/ogi5oj4148LzCkT
	jSnhN/N/RYSkdv5oi1i7RcJgNRekNniOzW8BEuxTn5r1UCnPQBe5TUqwByhgFc97WA67nl1ngi2T6
	asi+LevllEQTaphyxWueV+lmrWUk7xcwVQrYujrE2A1TctgYt3xGLnHONJYWEetGeUI7qW//Hb+Si
	DhbBXGcL3s8qaoi4kErXOFZ4dZnGsMZK2rMrIHGVCgTP75TVOuZ5FYW5jxcS2ibvMrxFlxAkebHDR
	vgnnpDG7l91xd9DxkE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXnhN-00000007DM7-0OAW;
	Sat, 27 Jul 2024 20:07:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXnhJ-00000007DKv-2aXR
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jul 2024 20:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23770CE03F2;
	Sat, 27 Jul 2024 20:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77735C32781;
	Sat, 27 Jul 2024 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722110837;
	bh=+DV4kCRHLIGABvSMp8Zc9czMIuhamMhxIql3DNJsYWQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CC6JKK9RWSFS5cV12YxQT2Ok4K84sX6yIGDb5hSl7gTWC5wfw19YU6N5LJhNxiu0T
	 sX37WOBrzjkwfipOtBagSyVC54pgT0Y9QcC3yw8+ugUQrvIhsvBsHPLYIenZhjBTgc
	 hB2HxbaFx6DNhwUzOP6u+2jYC//9837anK5cxtwc7bCMWbpOyDaF/UkLebCvkKtDp0
	 U8VsN6v3hfEVRYWCL2AKcipxKGLWhGBZl6YPR+/Pp3c2qIwsB7iDpMhRnA419f7CLJ
	 kSdl3MxkDPdB5ym7TWMsyW/rQbH57zkWjka/lsYC2y6OIBjkYVJ8reuSFyP9qTFL14
	 nhdHuzNVikdXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65141C4333D;
	Sat, 27 Jul 2024 20:07:17 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.11 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
References: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-mw2
X-PR-Tracked-Commit-Id: 52420e483d3e1562f11a208d3c540b27b5e5dbf4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c9f33436d85b72b2addfd9423eae864cb8dac1da
Message-Id: <172211083740.16614.18306159259071737244.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jul 2024 20:07:17 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_130721_847551_EC181BEF 
X-CRM114-Status: UNSURE (   2.99  )
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

The pull request you sent on Sat, 27 Jul 2024 06:29:14 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c9f33436d85b72b2addfd9423eae864cb8dac1da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
