Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FBC6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/fHw+qvnLgLR1t+FD0NRl0wClq2rCV+xY5ihj2oUrU=; b=1jiFaU4OMv184c
	zwPKvNhcTvLBVwwGtvqI+QIJJdHg7O3fEaa40xFNgxF9NOE99jMQdOrvI0HtOTzMM5/AzEFA+zZ1w
	oEnZwzFgDdWpG6Woi3DEBrbb2u1TUNGGfZLfMgoQ7EvSLJSBjiehoFyx+b+aYRcMaskTh48qkAeFs
	t0b+RZqSTBTJyHkTM7z+2UNkWlng0w4T5eo9xPM/rRHuuSIaQscSE+MOJzm/PJWKtu4hjZ2GG7Hlt
	05Dl8FRgD1xfvu2eNy2hnx+00YFSvqXRVb6MPf1hLmHesu5Z1sUqhyia9CS5q3N/+exYcibYppkKy
	e3hBqpInHCebyippXhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oblV5-004yCJ-6Q; Fri, 23 Sep 2022 16:26:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oblV3-004yBJ-4v
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 16:26:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0863B82DAB;
	Fri, 23 Sep 2022 16:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E125C43470;
	Fri, 23 Sep 2022 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950358;
	bh=dxmbGIxIdFaOcSR4ghPkDz9/NSfj7opcrB5OCi+xoaY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tufWcqWayxeATJI/K7yIV1yafrN9pkyD52pjqxlc0JlNQzLGmIZv4vkQ3aLg9sgHp
	 eWqyYVvVYA3YG5/RiEN6l7od+Sj+2byp+CqX2U2E/wWJCfChElaqW7EZwrXKpFsa+m
	 9vFSBR9l9R1O/fniA3bWc7nBQPFwS4/EOnyeCQS7tnkLnsYunG3nQDwFO3J3y/K8VM
	 QyC/7IbjePMKnEWwOvuY18ONA5d7O/HTLf1Z530Mw//4nLt3/bHVqgfBx0dVQf+v5W
	 7kDHnPZOIqrx3MNQLdzG2oEX32Q/gwG2X57gojUrbGvbZCB7P0gEDKNSEOrZzIzpwf
	 BMUcLeG11ugmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 58480E4D03B;
	Fri, 23 Sep 2022 16:25:58 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d96d9461-4a76-47d6-8a6c-fe0890247b0b@palmer-ri-x1c9>
References: <mhng-d96d9461-4a76-47d6-8a6c-fe0890247b0b@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-d96d9461-4a76-47d6-8a6c-fe0890247b0b@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc7
X-PR-Tracked-Commit-Id: c589e3ca27c9f608004b155d3acb2fab6f7a9f26
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7b7751aeb1348a4358724719aac5310597144fc
Message-Id: <166395035835.8411.1458593398657878309.pr-tracker-bot@kernel.org>
Date: Fri, 23 Sep 2022 16:25:58 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_092601_357692_7CE7F2B5 
X-CRM114-Status: UNSURE (   4.49  )
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

The pull request you sent on Fri, 23 Sep 2022 04:23:28 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7b7751aeb1348a4358724719aac5310597144fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
