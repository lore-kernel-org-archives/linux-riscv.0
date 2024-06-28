Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14663C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twP9k0RrCTekpD/3jnbIerKudwiD+ZPDUGMhE6lgisE=; b=1IWGE/V5xy6h3v
	q8P3oc2Bw7opyjTZ+TrYC11D+LJF9vRA1+XGyVTp5lFxK3U8AvBlCU3f6ZDExFoQqgIft8jf2/cUQ
	4tXUP+0huiMrvMjPg70+uDn+0JVv02ygLHSSJp8Te8s8PEvTAW7jqtulISqGIG1WdyuxdX0AmqyjQ
	d78KYkvihxqZQ7BjRrTyG6oDK0uxUvhDAa4W+R//VCDO88Mh0zRfyV1a5Rkn4/ZUGLNmUOB6X2D4s
	PAxdgv9cP7rF1olEGBRNyBjGiLo56mK1wdNm4jsmpEYSTKlOAoWVkhchHIqfzj6chNiRI/Q/lLPg2
	g7KqTEQjiyO1hxYmf1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNKso-0000000FGiF-1ueN;
	Fri, 28 Jun 2024 23:19:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNKsk-0000000FGgM-2T7o
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 23:19:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC4FFCE4313;
	Fri, 28 Jun 2024 23:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18C02C116B1;
	Fri, 28 Jun 2024 23:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719616792;
	bh=xRIRlkFHs4ikdKeslTrYZRQeZl5a+QJWiQz4aKyrpuU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Zc03oh4MSCcLY5HlGvnJ0OmYb7QH6tfJAYfclBvjtV9/Xr81ZqxMu7LzXF+yn+sLM
	 3po1LGyNeQMCSOJPOo428uWlXn7aD5XUqR1iiy/uOtOJLUkXhk5pU93yoZde/h0ut9
	 WqacqKgk/LUw96Dt8L5H6hll1zpsCURAFQfNZmA6Btub8KBnS0+wsc11CWG6Cse0R3
	 1J/47aCJpWXoyLguI3vrhtslb5LUJ8n+Ptbibnbuz0bcecsba/nZEOiIBZ4e2+j6aJ
	 CvzXS1AEmqWZHzklcRZQHqdqUH3k1wUnrjJMGEXDMSczA1lgY7+VX69wfN3Z1Wo32C
	 Zlynpo2+/a52g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0DC6CC433A2;
	Fri, 28 Jun 2024 23:19:52 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.10-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e131a037-69c8-423a-929d-e2f03e979ed2@palmer-ri-x1c9a>
References: <mhng-e131a037-69c8-423a-929d-e2f03e979ed2@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-e131a037-69c8-423a-929d-e2f03e979ed2@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc6
X-PR-Tracked-Commit-Id: cc2c169e34b4215f73c66a34bd292e9e1fcaa3c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: de0a9f4486337d0eabacc23bd67ff73146eacdc0
Message-Id: <171961679204.11498.10577613084862609780.pr-tracker-bot@kernel.org>
Date: Fri, 28 Jun 2024 23:19:52 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_161954_825138_7A82357B 
X-CRM114-Status: UNSURE (   2.72  )
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

The pull request you sent on Fri, 28 Jun 2024 09:26:56 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/de0a9f4486337d0eabacc23bd67ff73146eacdc0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
