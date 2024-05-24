Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF60C25B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+EX+Sx5uxLvWuzxCTtPbSLLYSP/Wp7jXmBmGsyKdcQ=; b=yj5DJ8vRyoWyTO
	BfcS00OvXlnWlA/K964aH36B5+gN/1GWSN155qwiP7l0OS1sYUVgJu40hzq2RIC6StEZVkg9y0XQ1
	T//HNz6/ppTwQ8BU73m6nO4Li7QZ1cNq3YFr/WenWU49LkSC5iP893y61A6sHgEauVQ5l7A7TPAXa
	QhZDbOfq7RHy3IzBWieHzn4kYtYootvilFB1nb0Ouv/s/xfpkMB7DKO/F/aniBiTSNuh7ZBwNc/La
	Ot45SfxM0uaDtJDknExq+gJtrcRJzZA6Zg19nboSp6LLpXRKtS8q9+r5qWrTw8lPo00dEqWA/KhOm
	w5vaoC2xshAcre1M85qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZ7J-00000009W1J-0Oqj;
	Fri, 24 May 2024 17:54:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAZ7F-00000009W0j-3clv
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 17:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDCC163220;
	Fri, 24 May 2024 17:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CF90C2BBFC;
	Fri, 24 May 2024 17:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716573243;
	bh=a8FRGjwS7yVe1x4dwsLgW7ohOOtu/OgEm0+BDao6S58=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cb8NE7lorRw40C+JkGbg7opxcHXe06A6eV5c0eN7VH0OkNI9cwAAa5IqU0b+xTkBU
	 JtUWdciILuzBbvF5wmknkNIdRai4p0j9iCl52TJJsBWntd8TlTHH/NzAbDB4DqJxDv
	 KPaldnsirqbv/eA1oU0D8vHV1qT2pcowQtlFY0R0/0LoNYZ+6wVEsJH6e7vuwEVoys
	 lblJN2N6VkxDGF14akxqnKzKDM+wywNQYQ14vMY2b/8ZK8MtJarOvMgRIK6LCK5oYc
	 SWfASo0gIs9hu3GZUR9N+yyNLT3yxjmjo9o1JhCGFiEohMftEEu/hmMGEUAaEOv0gf
	 2m1TAj69A6/RA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8218BC4332E;
	Fri, 24 May 2024 17:54:03 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-3c77af8f-340f-41fd-86db-a2add39fdac2@palmer-ri-x1c9>
References: <mhng-3c77af8f-340f-41fd-86db-a2add39fdac2@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-3c77af8f-340f-41fd-86db-a2add39fdac2@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw2
X-PR-Tracked-Commit-Id: 6ca445d8af0ed5950ebf899415fd6bfcd7d9d7a3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1f9984fdc5e37303d7180ff7a85dfecb8e57e85
Message-Id: <171657324352.4634.9284203217407590763.pr-tracker-bot@kernel.org>
Date: Fri, 24 May 2024 17:54:03 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_105405_958371_4CD8B2BB 
X-CRM114-Status: UNSURE (   2.37  )
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

The pull request you sent on Fri, 24 May 2024 08:53:40 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1f9984fdc5e37303d7180ff7a85dfecb8e57e85

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
