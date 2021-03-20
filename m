Return-Path: <SRS0=59R2=IS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AD8C433C1
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Mar 2021 18:06:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6521861944
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Mar 2021 18:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6521861944
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgWIxa5Eou6snhEemgLTOUGPIpd/taiSy//2zNqq1pM=; b=hti0R3fTsQ7HLu5wE+B3B66J8G
	+giwyDLzcYcidRJmRn4mp5VUGxumfDMPwPfcdcnYvGWBAsZHGEPSyLmJ6y7zAZUzWswU6eCwDNY/Q
	abiEl4U1ROJZywap8yAj2JCPWcRZB3M8MiIhOUe1+BLBzlaLmfGtU8S80W2mNOVeONE+4mmKCQ3Ap
	JxHIT/9Ok+BKwLdvSlEQtI2E3LxCUHm6YzeCVQaNt1qXaLkpRVbgQUNOIwhsUEPHW9pppzo5qHZXw
	rYjjs1HM89HFyR/Uqzh2Y6JZj49XusEe1koLhp9bUCiafXIecIdBJYj68EWhIGNEu/YPibF/I9I8H
	R8jBwZug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNfzd-0096BL-0X; Sat, 20 Mar 2021 18:06:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNfzX-0096Ar-8K
 for linux-riscv@lists.infradead.org; Sat, 20 Mar 2021 18:06:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id BF9D361935;
 Sat, 20 Mar 2021 18:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616263583;
 bh=l/dFfg5NxQ55PxNwRp8gJUtrRQ2/YWk39vMk1+eRi9U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=E5yaq0AjpI8ySz6gjSYRTp4gmppZEXfRwEuVIPXhFCtQ7GRPhFnFwIchNCe3ckMRl
 RWLqMOeALSc4+XVT3kyTV2MHoXUhDvljaAqldkVfyBOKINs+/iI1IwXpPB6L14PxWP
 Y7u3J+/I7ZtEJ2VLxTHMNo5EMYca+EPLu6HaggTVQPJKXAgcz/cmDCXN4oJUfJzwSG
 E/SZwuju1SCZf554RYg/3F9bFE12qLMxFkPLNwUCjN64mGHXgSXk5k6C0T4aAaGSW1
 CzjjF7pWV/XCUz9vAmRtxDRr0jDx7zVBHpE7HNInwUD9Cc1pxxAyAeGWfr8Fbsljam
 BRid+gjNjgGfw==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.12-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-b3197f76-bb8d-4834-810e-3b255c26a5fd@palmerdabbelt-glaptop>
References: <mhng-b3197f76-bb8d-4834-810e-3b255c26a5fd@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-b3197f76-bb8d-4834-810e-3b255c26a5fd@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.12-rc4
X-PR-Tracked-Commit-Id: a5406a7ff56e63376c210b06072aa0ef23473366
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 812da4d39463a060738008a46cfc9f775e4bfcf6
Message-Id: <161626358362.25184.15422694224081714197.pr-tracker-bot@kernel.org>
Date: Sat, 20 Mar 2021 18:06:23 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_180627_563863_F250ADA4 
X-CRM114-Status: UNSURE (   1.79  )
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

The pull request you sent on Fri, 19 Mar 2021 22:39:23 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/812da4d39463a060738008a46cfc9f775e4bfcf6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
