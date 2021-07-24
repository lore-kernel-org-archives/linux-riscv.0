Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05099C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 22:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80F560E8E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 22:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A80F560E8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5uNVX34sL2KV37HGCkVia+tjDqNzZDNoGJjE74GksY=; b=CIzsfRBq50Gq8Y
	bInHCJ8GrCeeOeWxfWP03LJn0JxufyaY0bPVoG3mEBG9UpIJkPk7YUapsGt5Is2SccuzVrcEBBMlQ
	j48BYRD+2CSQLyJBkfADL7dr2DFVD17Rpm62rnmLnDj6VgR/kHObj67CnXNm0t3N4ZKtPcEZSdBft
	k6bglfcKAGSf5GGDu1bZ0x1k2oSF+CCmfJefoXC0xNXsD0bFvnIPv67DtAc4K/bZPyz1tRNFY6UiC
	o+FKT+dl/oA85KGoXXkysbk3OI6ZZZfXgs3VIa/MvEuGHj9yZVKQz1jyiyxn3gSlDgf6nkJhD+CCK
	B/q5z/6lyqR5B4CKm+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7QGH-007uIo-7n; Sat, 24 Jul 2021 22:36:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7QG7-007uII-3l
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 22:36:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id BCC5260E8B;
 Sat, 24 Jul 2021 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627166197;
 bh=+eTds5OYF8X7qt3SB/xIKyAKtIDCGCpqjkJ/noOqiyU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Nax7lVlj/OdKUGc3ra9wFoqRHjoZqAahfSSIVkh4vfTO/x2ykjsSjJ3E1sf0r3PU+
 cb/iQ6eyLmgkQBPi+soX/qEAez460aS6LUpM0xhomzgObwGBMHbzLYURHQAFM7f+8R
 od7Q0fWuLcxpZuFpfvfPSvu8FVQoTbbxeCQ1y+hLXLtXYKnOnw9aNLbHCWsVcyTQhH
 qUSxB2bls2/JRX8HFBLIEj0aWe25hdzneURTWiBV7Pa1/fJk2P+IzMSXksbv6L7xFF
 Z8qk6r3+v2nvGhqF+sKdDmvxqnVhsa+3oEMmoPbMl9ERnOpaWZvna/liBuZtjUFr3l
 BjbJtSpyYiELQ==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5cd676be-7ed7-48de-b740-0e809ae67a56@palmerdabbelt-glaptop>
References: <mhng-5cd676be-7ed7-48de-b740-0e809ae67a56@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-5cd676be-7ed7-48de-b740-0e809ae67a56@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.14-rc3
X-PR-Tracked-Commit-Id: ea196c548c0ac407afd31d142712b6da8bd00244
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6498f6151825f1e5aac5543fa9ea4ea218dcbe8c
Message-Id: <162716619764.31495.14247900326730279549.pr-tracker-bot@kernel.org>
Date: Sat, 24 Jul 2021 22:36:37 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_153639_212040_004AEE9B 
X-CRM114-Status: UNSURE (   2.40  )
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

The pull request you sent on Sat, 24 Jul 2021 13:44:02 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6498f6151825f1e5aac5543fa9ea4ea218dcbe8c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
