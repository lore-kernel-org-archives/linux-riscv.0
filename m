Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3245C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 22:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuzF6c1YJ5V/TaZFMcRglVdxtXHEoIW8rLbOue04bcA=; b=jCcth5Bggpa7N+
	zgZE2ZNjK+A5mbc0KQPmKqLMUZ7+NwDQXJrwSAGza3+PoBk/ZScum5/KH8J1vwyGpGAS5LBWeocd+
	d8tFgf/qcRCklfIef8truNVrr2RGlA7zGjt6SLm9Un5hPzepeqVqpoB4fjE/rmhlb5OD2jk895p5a
	5WSb2WNIchZON72ZyUnfN2SH8laOjod4QOrPxQnSUToZWJZaXZ0Nq8BMKJVPNNV463/CuKO2anm/q
	1SYIyOa7xscAtM1AqFattR9CB736DWa/3Poz0H8IVNv09eTi+Gq4yhWGgoGdCx9Nvi2A0TLKBTy05
	O6w+6RUtUfteLzPWquwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovnFl-000JnU-Om; Thu, 17 Nov 2022 22:21:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovnFZ-000Jiq-Jf; Thu, 17 Nov 2022 22:20:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 00E1ACE1F72;
	Thu, 17 Nov 2022 22:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22B2AC433C1;
	Thu, 17 Nov 2022 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668723640;
	bh=rrKtlNK7P46kKtCfzbSBnIol3PtJWk2C8X6rYNdLo2I=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=rcvr2TmUvHiymQZ9f+986gUTT3XAygbaiERa1dbCNb81NYw/I/iNg1BsvDjzhJmyN
	 6ztKxjxb9RjuTPNa4gs0+tk2cnhyrble5C6hCSNS7lZh6RHbV1Y93KwMAkjt/1qgVH
	 jIL25Fy14eOkfH1o9yDU5gFkCnfI8F4/LIsFAU0sbK4yOxYpxTwcU1oeyanbLF9vxB
	 inMaVJ9d7UaFf4OIGVI/mfgH/AhCa6YMviQFjvhYaA/TgzDN5aywrUqv8elCuAWUvl
	 J/EUZhetfxAwwCWaiAkJcAO3gyURdjvjXHv+GttAuCz2LMjot3swGpxcNflBs/bmLv
	 XMpGYsDquNl1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D113E21EFA;
	Thu, 17 Nov 2022 22:20:40 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <f376fae3-fb50-4a79-9a90-1ee19cafe1ad@app.fastmail.com>
References: <f376fae3-fb50-4a79-9a90-1ee19cafe1ad@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <f376fae3-fb50-4a79-9a90-1ee19cafe1ad@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-3
X-PR-Tracked-Commit-Id: 0d6a10dc2b971cc3a192b47721ee8270afc2d104
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 84368d882b9688bfac77ce48d33b1e20a4e4a787
Message-Id: <166872364003.24282.15521017055224742067.pr-tracker-bot@kernel.org>
Date: Thu, 17 Nov 2022 22:20:40 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_142049_876903_9F4CF0FC 
X-CRM114-Status: UNSURE (   5.43  )
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

The pull request you sent on Thu, 17 Nov 2022 22:48:26 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/84368d882b9688bfac77ce48d33b1e20a4e4a787

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
