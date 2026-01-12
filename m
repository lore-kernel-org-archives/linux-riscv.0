Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20414CF45CC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VAELMVJGVqCfzuxPwGE7wkUopilHy93KprMiZhmcuw=; b=iTxAKnjt98M7Bd
	N8Uv7ftvVrMVeMnnkaOeNFrNytI78dKp2XE5c/A/dK4GJuxrOBbibc+JhZRG19ZOQu2HqO4gAlGOa
	aKV4PTsWPKh8qUh4r8xBYxg5rcybQkWbEFV5AlceRQUfdyTdzeOpusDCNEpt/tgzYXJ+tAWFoglQO
	ctmm0phHqcGFq5lkCgcvAP3rmuDALL5JptKEEMA9UH6suxNpuLkFi7bm6kqP3RcfqxhgT51akoIdY
	31sO8mmBK4DzeBXrSpZCuZISdFjw5KwN2coKRqLB5PaydApHn6wXqJtK+zXZ03Zh/PNlu48sq7yhq
	S3qIDJ15o2GoUYmyg1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNnS-000000065ev-2V4V;
	Mon, 12 Jan 2026 19:41:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNnP-000000065dv-3XwA
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 19:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B192D42A0A;
	Mon, 12 Jan 2026 19:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900BFC116D0;
	Mon, 12 Jan 2026 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768246906;
	bh=jrOmvY2hx6JJM77/GlzyusT9p5jHX7fA6FtfutxAemo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q5GFD2EHYAV44kJ5STs0n/oOvF97itWFW83QM0RK2fCcmFIqDy5j9Pn1yR6KdEV+2
	 ri1gNYbsri4ukbNorS1Yw52eSzMDrrgElygf5mYPmN/eXowlh1qIeBsXMgBae90q8v
	 aGUaGIl3Wq08fSZdJRmPI1VZcYe7ebkxfbLrderaOAkFJJrk6F9DjXX39rNBAdwUT7
	 +g2NEN3vqYXNjsG7qE9RFPssnENr/NkTX4eBK60aVQzIrM4gyW94eWP7xGwJQhp9dd
	 pYn10w17tt7RQzbe+mlMNCgwprHhfUugH4k4KjZ+YMi70aIWUpakNOysLxGtrPoBih
	 tb2qn7d/9SsOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B61A5380CFC3;
	Mon, 12 Jan 2026 19:38:21 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.19-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <f8bfedcd-751c-8270-df86-e49426b3a701@kernel.org>
References: <f8bfedcd-751c-8270-df86-e49426b3a701@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f8bfedcd-751c-8270-df86-e49426b3a701@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc5
X-PR-Tracked-Commit-Id: b0d7f5f0c9f05f1b6d4ee7110f15bef9c11f9df0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 755bc1335e3b116b702205b72eb57b7b8aef2bb2
Message-Id: <176824670039.1091852.17270811333711802733.pr-tracker-bot@kernel.org>
Date: Mon, 12 Jan 2026 19:38:20 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_114147_899866_F416031B 
X-CRM114-Status: UNSURE (   4.15  )
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

The pull request you sent on Sat, 10 Jan 2026 18:50:16 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/755bc1335e3b116b702205b72eb57b7b8aef2bb2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
