Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9Cm57rGCvIkqAz5jQ/vR3BBZM4HKBgg74k7El1KLOE=; b=XZW3Wv0Y6xGJDy
	C5qaITcF7k0VzD9ycACkwXtQaVGk8Xl2TnFA4qP5FJWkM2iZjI65oSNt0FEITc8i6OA/5SeKi2pme
	xe85CmbLo+UVepftdJT+DpXA4UjnsDGTO3I1WnFtmk3Y/fea/vV4ZUmKbNbeHoU5Znm6ygXsp/MHm
	vA5F2wGbbgI53DIsnQ3xNDhdx6vkRK8LPBef4gtr84PtjCpy/xW6hr7zabuetqSwQOsGAI6kxc8rj
	DAZFFWwOPSFYlkLHz9yW2c3TRzAtoZUIRq1wGAi3w/z85mCi253yql3/NxDpa0AnJxxfpZS3Rih1Q
	H7Uhbjk5VeYsrSIz3zSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkUiS-00C7ia-5W; Fri, 29 Apr 2022 17:47:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkUiJ-00C7fE-2t
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 17:47:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7098962421;
 Fri, 29 Apr 2022 17:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7B44C385A7;
 Fri, 29 Apr 2022 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651254449;
 bh=pq+Z/q3v6nAybjJ3InPv498b4ZSVuSQkyKfQZb9feW4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DQK8DSdUK0O5+6l7q+jupD/kirGLXyqY6/dcZGrLs07QsV8WROX5tNoBSKbPLsnj5
 BrVWNucLSKT4Uk9I3cNwZjQhX7cONMSXzA++PvsNPNqKLK3l9M+ZSN/9DcIo8/Pyn3
 PHNlnvAaMaSi3fi5WGFIOr+CzhTW2PhJCE3P5yhjDIjk2fVOJfj6NTAxTjDv63jhRQ
 SbNFdgqzA5IshnM1XPF3GOrK0QKIZXn0kDbJs6kl7c4hWekOMPJhqfVGAPXOAo8M34
 pRCK8dHie9TuHi0lYfCqNBNQPgljhkcxffkkJUZ9kkWQSrZCNoPArh18QYPGNZ/kAn
 /XmgyYPRJjbTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C395FE5D087; Fri, 29 Apr 2022 17:47:29 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-23ee08e3-f500-4297-bd05-a1902598d9b3@palmer-ri-x1c9>
References: <mhng-23ee08e3-f500-4297-bd05-a1902598d9b3@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-23ee08e3-f500-4297-bd05-a1902598d9b3@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.18-rc5
X-PR-Tracked-Commit-Id: ac0280a9ca106c5501257e79d165f968712b5899
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d0de93ca2515958e717138e5ee07ec3b6bf0226
Message-Id: <165125444979.17620.11204985121141756042.pr-tracker-bot@kernel.org>
Date: Fri, 29 Apr 2022 17:47:29 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_104731_261037_F2A7F675 
X-CRM114-Status: UNSURE (   4.25  )
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

The pull request you sent on Fri, 29 Apr 2022 09:38:55 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d0de93ca2515958e717138e5ee07ec3b6bf0226

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
