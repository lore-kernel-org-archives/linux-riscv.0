Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670ADC5CFCF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c13Kkf+qdNV9Q5+Z+a5Es+iEQSNDZ0Dh/DGMF85lP/Q=; b=EbqS2Us3S5hFT7
	EIDE6okv32uYS1pmMCJmMEJMI666JYHhN3DjMt+3ycwv7T4W/np61jTsxmrxRXcDi2Qy5dDDTtSUr
	fZqSfbYdin9TW38Y71t2T4H4HlaNcScsEhXjMcgj5mtoWrVd5jAC93mQs0E5CP7ywH2SB52ihUuvb
	IE7bcpYnO+UekPObFIxdwIbHuY+Bm3OrbSZw30MeVwf4dwK1A+GJ3sHYd5mwO7HgZe3Bl+5GVwSSj
	zIIxVDIeamXTllDQjRvNfR49feNBeLmZkzMZYNDRrvm+z87uOO3oQhzSvEBbEpBTmNgLWTl2vs5uW
	kJ6v1URsFNGo+RYU7l3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuKq-00000002tUD-2TcL;
	Fri, 14 Aug 2026 16:00:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuuKn-00000002tTj-2PrY
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 16:00:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 173934196A;
	Fri, 14 Aug 2026 16:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01AB1F00A3A;
	Fri, 14 Aug 2026 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786723241;
	bh=x73LsI8TH5oj+LN0lhu5goMaLDRpQ6ufVb63+eKKhC8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PsQFwgTLTfuhz0WnFZXWwX0TKucuOMxUZLaaikT4QnBvG28ZZhqWREBX7F7O21FJW
	 ll8DUMtqa1D56SmEbjqxnW3fecA6S5VysepkNHKR1ucjVUlOzP1+Q3GjrsMEaiZieS
	 5NjfMgYzWX94CN8DayH5727ixzDjz3xrWuOKxR3j2PYkExayh7426gcxaBkgQaqVUL
	 wuEdjGIUCfsibB8CAc03t+nPXss8Cwx2SP+9BmKiThJXG9ttsJZaAAH+3E638eJycH
	 y5KeLVfGnJyL2Z8el1Biz+vU/DfL3VDYJ1YFntP/vb9R7A+tKcWOjeAtoInfp5El2c
	 4T2JdLE0sjj3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569523924450;
	Fri, 14 Aug 2026 15:59:56 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for late v7.2-rc
From: pr-tracker-bot@kernel.org
In-Reply-To: <b2ab28e2-de86-29b5-691c-2ba47af7f9e6@kernel.org>
References: <b2ab28e2-de86-29b5-691c-2ba47af7f9e6@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <b2ab28e2-de86-29b5-691c-2ba47af7f9e6@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v7.2-rc8
X-PR-Tracked-Commit-Id: 5d588c684833e678a0008eb69c33190f01a65f4b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97a91cc439d92e1afe77708d00d30681f1740bbc
Message-Id: <178672319504.3416600.14786932597926284795.pr-tracker-bot@kernel.org>
Date: Fri, 14 Aug 2026 15:59:55 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
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

The pull request you sent on Thu, 13 Aug 2026 21:07:01 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v7.2-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97a91cc439d92e1afe77708d00d30681f1740bbc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
