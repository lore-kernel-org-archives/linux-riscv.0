Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FAFC64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53UyiOG9cPwFrMr/9oZyySOUR2WXM94v3Knd/3ZvgAc=; b=EILigZMm6KXhDC
	MKz2tmskelHjGac5phkd5O9TZjieZt5NcFOBqQQma32rL6m6bluQXTozncBZ0oSCjoiyJHe0FaAfl
	koya+Zgd94b/5xPHqzOS7Y83TWac/wPXzsAExNfV1LzJQt23qNzDSx0yJJUAHrSKC4l2Brg8vgZYB
	6eRQEyoS2SOo5E5n5zTDcGg2d0zcLCmhl3ztS2WS+Pdkci/bqWXjsrtlGXvuc72JVv1ZMP1eNlDr9
	UYJxxL5RcdxqaGyW9EJXvUCfd+BK3+xPxGkwcF4QgB4rhbgk+38DhDwQTsEUIF9ULomFLV5RPV6Ca
	ioSe/OkBuOAkEKn0j88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pagVZ-00FWvY-1f; Fri, 10 Mar 2023 17:26:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pagVV-00FWua-Kx
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 17:26:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2074561B95;
	Fri, 10 Mar 2023 17:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88E26C433D2;
	Fri, 10 Mar 2023 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678469175;
	bh=7yDJIksP2pkD5A3LIju0IAc34idp1TL6F956poMuw9k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BK1oXWYckL8LGBCJ1S00xqgZ/tciDQOUN/Idg8saL+6sf75aeAGHKrKpaeqRLlT0v
	 ylzF3i5IZ+lvYv7n7sbRia58iKBU7+HDdkdpOY/DTLp+CQ8r5wqUw+hjfx83lUgyNv
	 DhNopNy9/26An2QMIG6P4RbxJbPDWbiAz/h3gQm6TRtzFZT5gGlMTI6xZrKrpoMzsR
	 ZuYwrvH3nep76yuJ2kdl4VIxlu5Z2MuIEMQHbfDCpi49iG74XSQBlKM2XwCU5IS6/D
	 uA2yJQMqwfSPLSX2MizlfbBk/eQlsSrOH8mjq6cyYLVhlIdqssq0wTkNs/2wGnm/83
	 OLwFqv49eQGcg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7859FC59A4C;
	Fri, 10 Mar 2023 17:26:15 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-6fd4abee-eb36-4748-9b07-d310908f08bb@palmer-ri-x1c9a>
References: <mhng-6fd4abee-eb36-4748-9b07-d310908f08bb@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-6fd4abee-eb36-4748-9b07-d310908f08bb@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc2
X-PR-Tracked-Commit-Id: 2a8db5ec4a28a0fce822d10224db9471a44b6925
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55a21105ecc156495446d8ae75d7d73f66baed7b
Message-Id: <167846917548.3321.5405028351126348489.pr-tracker-bot@kernel.org>
Date: Fri, 10 Mar 2023 17:26:15 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_092617_762082_219D3B10 
X-CRM114-Status: UNSURE (   4.53  )
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

The pull request you sent on Fri, 10 Mar 2023 08:46:41 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55a21105ecc156495446d8ae75d7d73f66baed7b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
