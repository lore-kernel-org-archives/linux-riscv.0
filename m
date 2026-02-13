Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C800CEF48C6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 03:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IX67NGdGUjYgzTPg21QxMuKSgZSa0kWzXqpfBjIqYBg=; b=foUKwKA8YcqIZ9
	FaFtvRlXh2+SNZ8lu9tdJT+Ypjoms2gkDEvLa4aS7zFE3k6uQLQrLR+JfX53iJu8Xq7AnbfcUgTn7
	L2x8lHBLglwTngOHdsp9/6rAIJfK9s9dNeIzMyN44odf2ABnPWnpHp5wk7v67l4+aICRYxo1PFCqu
	bUY696ToO3sH5pu1RCjyJ+Z1WRWMmLB0LMAiuTSs8tOb4KADlRfTvGVtgcYapziCTq/N88mkk2J8P
	p83vvJ4duMKzxEL0IuJyUZPoeTE66c7h565PWNNxYW0LTgEWQdiWob6c4OKOeiQR1fVxzfqqGsYdo
	b7tbB98k6URTHWvbRe4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjzz-00000002vGt-0VKC;
	Fri, 13 Feb 2026 03:37:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjzx-00000002vG4-0T4L
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 03:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5E5C419C4;
	Fri, 13 Feb 2026 03:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FD5C4CEF7;
	Fri, 13 Feb 2026 03:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770953859;
	bh=gV6zxdyND5g4Sx4cx6eMc+j6we2c5xp08gYrfIgdwCg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dmkRAfnlJS9fcozqWpsXx7FnhEQC596I88VCIDCDM7QRTd8xzgm/jZha4DdtgIjja
	 6gbmed88rEkgDS82ll4kVd0Ja/R/h8TJrTC1dtcC+wgembTeqtB3Y08MtisoaRNt++
	 BuqGKmZIXenwd6rRe0IEGlDsYOLP0d0Y5hZmzpCJn/PypwsacjF7OVIHkx0VQ/qq3q
	 Y5iHaUW8Zf8dnZ1m3GC5RdT+ij5hVSxUZwDul5/iYeMLBfdWO440ZeGxNkKHv2j5KX
	 l/g0yTleZnmGed4GJZisqBsZgnGDhPXRbjs+7foexFwEzeOq0RNAipY+JGqguZ2FBj
	 WtwlTY8MgsIAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B41D3931093;
	Fri, 13 Feb 2026 03:37:35 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.0-mw1
X-PR-Tracked-Commit-Id: 18be4ca5cb4e5a86833de97d331f5bc14a6c5a6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cee73b1e840c154f64ace682cb477c1ae2e29cc4
Message-Id: <177095385356.1834955.12195122879286333684.pr-tracker-bot@kernel.org>
Date: Fri, 13 Feb 2026 03:37:33 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_193741_169032_33056399 
X-CRM114-Status: UNSURE (   3.25  )
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

The pull request you sent on Thu, 12 Feb 2026 16:39:48 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.0-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cee73b1e840c154f64ace682cb477c1ae2e29cc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
