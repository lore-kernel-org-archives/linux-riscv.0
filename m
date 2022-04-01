Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE055C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 21:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=em2U0ZZYqp7dRogu8bfvVq1PTwt8RAL+bSuy49h6Fd4=; b=HTUCw+mY5gxuZr
	1QUaazpFWxaAyJrXvPITW5fXRSIbu8Mex9EZ7UzrnkSLwaM4hQonkmhwTyf6ccow6WO+xKo3jYtfi
	DzktRtjMm60p/QcKZCBJC6iJh44ylqSIVumbS/R7MCcHYGaAd7Nhxxw4/BNRcmL29/igQnQrZ+Rrb
	XfQqpglkVLZoRbQsA8XkIh6CwiQB4cIyIKO2YEJ9zEL0Ung6/ExyW6fhYqroYV1Bls38T/IlZufCf
	TOH64PV7j2GJA8zRR+f4pzdGe/DUnNEvBMuDE9iTf8QCmdpRPTqjD9S4aldldewB5VH/AypRrKUAn
	O0GpDhn4mpmev8nkml6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naP58-007Qcq-Mz; Fri, 01 Apr 2022 21:45:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naP53-007QaB-87
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 21:45:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4BC8B8267D;
 Fri,  1 Apr 2022 21:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 960ECC34112;
 Fri,  1 Apr 2022 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648849515;
 bh=qXpc7b+dnomBykoiIuaYy0tmyNQ81SqJXueau5yIcms=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=J73Ng406uvhzvr7P1x61LOL7SkgegSKSyd+LFDzk9MmOPHdZwVjA3/zKVchvOvrj3
 c5hL54ldXgIL0BV62J+v4AVauqrqH+HEom9HiZsYPxRFj4IY+k9X4ZcPXao0Kdrb2G
 pHoN69C1EugmWsRUXdzzmEFJblnNnpAfvWcsmw6XgPMNG6XSnN3WDvkeJ0OBzd0Edi
 xVeO19vIiMy4kgfxQacPRqsMhfhywR3LYstrxRCrwfBUevWnt46tiXVrHet9g2ebZA
 6CUB92rtC0WS5gcqPg7kAEgFaTgTDKefS+sGGzjwiMSLSvcblLpVxRJoCYCX6G478f
 dBGw9Vkc+sT9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7C4D7F0384A; Fri,  1 Apr 2022 21:45:15 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.18 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e0c01ab7-020f-4264-91da-0852f7e89534@palmer-mbp2014>
References: <mhng-e0c01ab7-020f-4264-91da-0852f7e89534@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-e0c01ab7-020f-4264-91da-0852f7e89534@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.18-mw1
X-PR-Tracked-Commit-Id: 1464d00b27b2e29a5556f6a4099cf083886e883f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3dfc532b8731843c12bdc45e804eacc47e51e50
Message-Id: <164884951550.9554.12842077645290708402.pr-tracker-bot@kernel.org>
Date: Fri, 01 Apr 2022 21:45:15 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_144517_467115_4DC2368D 
X-CRM114-Status: UNSURE (   4.72  )
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

The pull request you sent on Fri, 01 Apr 2022 09:41:50 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a3dfc532b8731843c12bdc45e804eacc47e51e50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
