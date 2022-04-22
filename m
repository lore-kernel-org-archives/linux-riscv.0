Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6025EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 21:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiWPz279L46iNYR4SfFflgh0v7IYIN3alQbR4DntrSI=; b=Z00ZDUotAEBQmd
	7MKnakZc++pTBjty4JzxUkYB+xWyx8Xnv7j873YxrS5JUf+v8X3CR4BDXBG2pBBPLzDlWsvRySxIq
	GCGcs08a2b8Hl9YOTjefkn6xksLEPtz3WI0xyD1OXDShuDQHMl3N9zBGFiYtGuZadT1l/JBV5KIqe
	GAFQdp2Ocfsr9NLGkwxqPR9BRJsSkQ7LDkT9nHkNF326BrMXxz+e5gvzE3tQYkGUZudEIcDT1UZtV
	TIVf2q5cu0VTYPAiIelJLhXVsSdHVl6d7Pt5nKHTjQDQ5Dg1QnKxgQR8K8p3b2HQTZhJqfU8orMR4
	0s8GbPZdIjixeBN3kpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni0gx-002PD4-Ix; Fri, 22 Apr 2022 21:19:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni0gi-002P7r-J9
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 21:19:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19362B83286;
 Fri, 22 Apr 2022 21:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0836C385A0;
 Fri, 22 Apr 2022 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650662373;
 bh=BTTHkFr4JQtwyE40DjJEQniG8s27DNDr4HkoPfkRKiU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=L7Sj1w4+UiJfjO1SFN3p6FuiSeTVlz+3IipYc4DYpECTXIF/WTvJOPwkH6Q/sLt8Y
 6UmjHsIxl7kWhjLhLoJIzCCeQ5YvrWMAdI+GQqO/M5P0ZVKRAgpdt3Dqh9M40kV+ed
 xPa8NsaqsRB8c0YKi6K1xNk2603B1poyzGkzb9hVfZfAIyQNGIJcqqiNQe4r+3xlmn
 6sZg9hEKBNfXK4rrflsJQI41jTC6PL1nv0Nb4SQgt1NfLW53RUW+4a6SwuyHmM/G+7
 ki+gghjF7SCULwHGlj0SAJjG5y95l8NHPfV6TBE/1MteIBEGV8tx16QqkCCTT/roWe
 MapRH+HoDbCrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AE337E6D402; Fri, 22 Apr 2022 21:19:33 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.18-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-650d0eb6-fc62-4859-b713-2a4e6ccd7465@palmer-ri-x1c9>
References: <mhng-650d0eb6-fc62-4859-b713-2a4e6ccd7465@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-650d0eb6-fc62-4859-b713-2a4e6ccd7465@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.18-rc4
X-PR-Tracked-Commit-Id: bf9bac40b7635e2ce43ba0051a64c3fd44312405
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e339e5e2dbf91e6499ef65389035b2795518c3d
Message-Id: <165066237370.18077.13767875299364762266.pr-tracker-bot@kernel.org>
Date: Fri, 22 Apr 2022 21:19:33 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_141936_796043_FDBE45EA 
X-CRM114-Status: UNSURE (   4.41  )
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

The pull request you sent on Fri, 22 Apr 2022 09:02:01 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e339e5e2dbf91e6499ef65389035b2795518c3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
