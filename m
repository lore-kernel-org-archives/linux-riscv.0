Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED2AEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 17:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujvU31llIJeOPMvbLaCKKALY5rDmy+SjDNhZw0We1+M=; b=nTnrjpHtkxNmCO
	fDT6lMcL2wwHQsXKHzNojWsdv+nHtsakUA2LXJAIsAbwfQYJchF6uZnRPLtslZ4hXSZ3BVvuvRBOF
	gBlw81HqDt3AOyxHVuUdvKOxp1StattpOO7mRWn39OSNZ8hM7fiiWq8+tYKRNQjmHUDJOv6G/3QyI
	70KDwzxgFdY7Vp3HAHh4nc7oyK6lcxUcfqEKEQbNBPMOgRw0YjOblFw96qoVwfcd6+eKwECVjn3F3
	szxLdnBsj6OslHjxf4BYKoqSe3Dev74VoD4ah75/JehdRTDdscEu6VPB3PacqUMPJGWoqsHT1MQY/
	j8NEqeZ9o6EaOGCohP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHqh-004B2d-2x;
	Fri, 30 Jun 2023 17:23:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHqf-004B1h-0x
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 17:23:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83C10618F1;
	Fri, 30 Jun 2023 17:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E80D4C433C9;
	Fri, 30 Jun 2023 17:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688145835;
	bh=2KR4I/Ss9VfGmV70PDMEpHvWyGrJiuTM1ywp8HOpPVI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A6lxMDwH1UFKsx05ipSY/faG36hnga3If0owidP4M55sTcsRfkO1paTlp/XO4sxj5
	 t81no3w6IjTUzFmXUTdKTiyfCeFM819oeLVE+e2QQN+JnMOvgIQd6xt/AJFs2haP0D
	 R2Igx7Bbz8hnmkFiJSlOHhaqshzm83/lVULUnbpaMxEpJpiCT9V6DXxHhCJGOvHwLJ
	 BUCV73A3NBLVB1GaDzEhOrMaxTnrnTRae37SvuLOWFnfh2lJYF7aEKaaXO4dZ5R+sX
	 G2YQaURuu9yEdr3lcR2ehgN+ofz25vOyu9B4HsBNtkkZUUdFXCi2WYzs2NOgS6/+q9
	 NiQE96nZUbMzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D5441C43158;
	Fri, 30 Jun 2023 17:23:55 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
References: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-ebcc1b82-5dd0-4f2d-824e-8d9250374abf@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-mw1
X-PR-Tracked-Commit-Id: 488833ccdcac118da16701f4ee0673b20ba47fe3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 533925cb760431cb496a8c965cfd765a1a21d37e
Message-Id: <168814583586.9404.258443610866190315.pr-tracker-bot@kernel.org>
Date: Fri, 30 Jun 2023 17:23:55 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_102357_374997_B395B872 
X-CRM114-Status: UNSURE (   3.73  )
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

The pull request you sent on Fri, 30 Jun 2023 08:40:50 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/533925cb760431cb496a8c965cfd765a1a21d37e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
