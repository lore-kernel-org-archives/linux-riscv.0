Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00FAC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Jjl5qH/M8t9qUI9T+vnQfAT0n6PVMpg7fuwjl7NsGM=; b=EXgQ/7lCP1fl55
	bnmbyfjHIzVSVSIdwPe3yEva+lRjvknlKjXw+Fk9q5OaRsLPYNHihcxu4rc8fHjFH3S2frgEYmfSe
	qzmAAAp6Pwt08/hGWTZxwbpPqpVQaszrakXx/LiYnkmaCs7efErQ3EXoCVnGizlA3rMkKs3no3bSK
	KYgJE7mnyoRrqn0dl2ww7L8Ar1c4zQ7T+D6Ml7Wn6D4APuCvYE+nKHHb4fYiYpu8MAgKjXH8X7qn7
	PyCA/MwYrz1/yG7mZ01gEJnsmcZEeVpvbtqRni2zlqVOSlZcPjBLk5HvEVFbIf9FNAVrnRJV6C+//
	3wFGll5yHXviMkUvsefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5Zf-00F0yp-1M;
	Thu, 26 Oct 2023 18:59:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5Zb-00F0wa-0k;
	Thu, 26 Oct 2023 18:59:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 293C8CE424B;
	Thu, 26 Oct 2023 18:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51141C433C8;
	Thu, 26 Oct 2023 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698346749;
	bh=gcvK09doBlqnVy7TADvpkd4a+0dZS9+1jLK83mxYn20=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=fGEzdP5TMBT1Y7rolR1J2dJmwSenhLIMUpBzUlSODTvqgDGLTsnFKQxUe8p1TeTFu
	 AjNJHpN0Nw8N8qyRy9ou8gsljKvIg6a3ZUZirqZmoTUMDcA95KC4u3pu8fGJ1IfsWM
	 Sl+11yDhDSxj+d2yN0iem4MZ07Temsm7Ybkz+RPLu+YLZqvBg1n9Qy9+PPUAu4r0/k
	 E1GCyyETC9TSYlwWBfXH/NrCBrRR3Ytg8Nk4lkfuVTckC686o7qIKOuCKd8zYKqqYc
	 mVE2LY1boSvvvickyIn/4wpb13ij43TcnNGKygUDR7q4IACRQiIJNaTp9HirAQWQRZ
	 gYkFU6z7DjzWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38B7FC691EF;
	Thu, 26 Oct 2023 18:59:09 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.7, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
References: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-3
X-PR-Tracked-Commit-Id: 736a4aad8a9fdcf577ffa33b33df240c67557af8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a568e3a961ba330091cd031647e4c303fa0badb
Message-Id: <169834674922.28071.11218269544692299460.pr-tracker-bot@kernel.org>
Date: Thu, 26 Oct 2023 18:59:09 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_115915_465986_17F13F60 
X-CRM114-Status: UNSURE (   3.95  )
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

The pull request you sent on Thu, 26 Oct 2023 17:23:30 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a568e3a961ba330091cd031647e4c303fa0badb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
