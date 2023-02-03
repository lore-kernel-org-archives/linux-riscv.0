Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F6BC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irxHLA5KUnPGf7KG2mvieiwWdSyEjt5F/+02lOU1flM=; b=i+2LMaztBjU6Xe
	+f6B9tWpZXgUA5c1Od404YUiNdquBa/hw3ztb+WPK3EOjk9oi/h4RI1AF6/Yu6djNFEcRjbZ6VqP9
	AnRRs8eUOTznJHCrrwts2QqKQXnEGdtSXr9PYzI36EEKQ+y8HEPCvFFhDLQKtqs8g/nZiDS4b1VR0
	GAvgGHCaocQTEOpe0RAh2GMAyMOgAi5oEW4/cnKbG0ZZa/Batl90MDrTl+tkpGR59MSF3cbNZH4yO
	vh7lWzn0pv6ZJ+tfZrOyyrnMDX3KCx4Oa+EAHc/2hYmZnMNjnjAln9auVEmkx/84PjSslYSjIMDuU
	oU+1XzauoLBVLFIrzR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO13p-003J7C-Vm; Fri, 03 Feb 2023 18:45:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO13m-003J64-7b
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 18:45:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 691F261FCA;
	Fri,  3 Feb 2023 18:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEE29C4339B;
	Fri,  3 Feb 2023 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675449916;
	bh=jQULm9r3FpT+fvxAr7YeNejU5uJaiysClB3lHLL2Bfo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eahyT1X3MLzg5md53sBcpdnHW+C6y4w9B2JYMxMGyVWdq9z1MfGqGH9pTAdUms4E3
	 J2smldsUq81jgtCs3VIi7Kxrv9fOIp471EuFsYA4im3/n2kdy92oTtdRw7hyAd989C
	 r9Xn2De+KzfSgFhENgB/dJal+oheSCCph9fPg07UE/PH6JD8/vcuHtt2KrFE35BOB+
	 +HStTXPNV7o3dGtKeGf18K1tLoLSmZdNwXeI5ErSCi5lSYvde1r7yRPu4dzB4tTeGF
	 gKlxTf3so/4Ocvj+LAZIBy2213mysux89JjSanJPnUPFbfQt5hx5cnLISMNCpSb696
	 mILymr1Z8OZSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA127E21ED0;
	Fri,  3 Feb 2023 18:45:16 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-6f088575-34c6-4eb6-a52b-5d23500cff6e@palmer-ri-x1c9>
References: <mhng-6f088575-34c6-4eb6-a52b-5d23500cff6e@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-6f088575-34c6-4eb6-a52b-5d23500cff6e@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc7
X-PR-Tracked-Commit-Id: 2f394c0e7d1129a35156e492bc8f445fb20f43ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a30df1ea94ad35c7b42d44199fe1376b4d648862
Message-Id: <167544991675.32203.10293247722020816439.pr-tracker-bot@kernel.org>
Date: Fri, 03 Feb 2023 18:45:16 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_104518_345622_AB87AE01 
X-CRM114-Status: UNSURE (   4.41  )
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

The pull request you sent on Fri, 03 Feb 2023 07:26:53 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a30df1ea94ad35c7b42d44199fe1376b4d648862

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
