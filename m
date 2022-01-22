Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89E2C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jan 2022 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUWmZh2EuF8BWSiS3A+bsrl9LZpXfmtJeJw8VdI3ZMw=; b=h2AG+iGbVtj8qJ
	7BebCYQqlPI6WW80wTus1wd+BIn1c9Cb7xU9zBAJ/ecybtuJkIHXWUTav6cNdSnuAMJx4rZUDbt8V
	0mklFslbb/HDyIpw2hU6J4KaUz4snlJv4LnKvOQ0+M4um+Z7dSmcyOndXc6mu4A30KQ1qxv0n87H9
	JZP1qTu1uOGhDm3JScadPRQRa7MlWAEeY0v4t0ZGbVPw4nZ/CmhR4/S+7MBWGSWRfel5I1qtnW6YK
	xpYCtqjiF85qYnWTaMmw/u/bP7d1/a4lwA9AF/q01cx7UPNvEweKfECtYRANn8UMpkpieoCZp2cog
	4Am/HeqF/YUYO1b9EC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBBQ0-00GmOw-Gy; Sat, 22 Jan 2022 08:06:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBBPx-00GmO1-Dm
 for linux-riscv@lists.infradead.org; Sat, 22 Jan 2022 08:06:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 439AD61190;
 Sat, 22 Jan 2022 08:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB30CC004E1;
 Sat, 22 Jan 2022 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642838795;
 bh=c60Zu0xy0PlzQ+AwuKfu4dOWan3Or5E9fQCAiVtygnY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=a6VIUAZgBwe2Ki+xLUoQ0E+AM2QCxcGqAbUBGIHGvJsvU1v/oGWHi/Rg6BcvW1X1B
 4dZpBcAuYTatBzW3Gr/VF8ONgg0ePWE9Rd1pxb8iI1485ng0eMmf38OnkCWQtceP4l
 Rpsut+FJ8dJa+fE7BcCnP13Nvea345gAGs3v9G5zXPQFbOR0I459ZzQAnnQCCTv7ok
 c4L3mXSLcs5rrBd4iSeYpEVONVs0NYGNP1/3GIPjhiZxi6hrqorrUEKrdL17jxsrJ0
 X1fhse/tYr9kshGuX1BU3Bh4Rx4u9LFuPFKd3Lf9CMQMH6N6DaIjvnz20clQOWMkdA
 1lqr39dk8aGIg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9759BF60796; Sat, 22 Jan 2022 08:06:35 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.17 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c8a6625a-625b-420a-9399-f69d027a43ea@palmer-ri-x1c9>
References: <mhng-c8a6625a-625b-420a-9399-f69d027a43ea@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-c8a6625a-625b-420a-9399-f69d027a43ea@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.17-mw1
X-PR-Tracked-Commit-Id: c59cd507fb640c2acc6b07cb60d7f765839e18c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7867e402787a23001cfb81ff298b7d023fee676a
Message-Id: <164283879560.17909.6530907772023366710.pr-tracker-bot@kernel.org>
Date: Sat, 22 Jan 2022 08:06:35 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_000637_550607_5BC124D1 
X-CRM114-Status: UNSURE (   3.94  )
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

The pull request you sent on Fri, 21 Jan 2022 09:11:14 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7867e402787a23001cfb81ff298b7d023fee676a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
