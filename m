Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C2CC07E99
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 17:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26658613C8
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 17:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26658613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lmo7Y18xn5vj0Lzr8hP7dQoUKSdX5uQf6FDaRAnaD/E=; b=uysW3Gn9Ni7JwV
	ZMS6qx5aVJo2iHJ04rgfAbExhpEH1L1Blg1fH3zTq/Gf0iBtnZ0YSoex2aoDUKCpCR3J+lM80vdQL
	NLaQzzyj15Q5fPz1ITONntyoj/TpYMPgrhkjX2rHypCbior4ySZt2ECnx+6ki/suOqq/OLs1o/2Jo
	KuW8+XxiPQxPkZTQch7i9Iec5QzFo+6mopGyAYPFKi8pBCX0YqpfaTvjKxgVaqV4llticJUx8U5qc
	+Hdu68ivDRYaFpF8RXpHSSgdW363WhrrtQjFxlILfQZUOHB6hiZINMWfgNYodJrstbZLoHIM7Ae+X
	Jf33wfyfwuZbTMSYgDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1uVo-002EC8-7R; Fri, 09 Jul 2021 17:42:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1uVU-002E8l-9O
 for linux-riscv@lists.infradead.org; Fri, 09 Jul 2021 17:41:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 02007613C8;
 Fri,  9 Jul 2021 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625852504;
 bh=pJcmaCaIOLENKJ1KBUdlbNR4S7+k03oVcRerjYEwjgY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KdEuD1W0bKSp4KKyPxXXVwfa5ABTF52rqygCkCk+sIv1spd1a+HOMonipbN6Ecle0
 JLEREbD3lgB3ORLEi2X6FzEej8p6leMmrD7eLLtN7dduyNEjH5TYiy2xKl5LvUf3gH
 3lfXTncDpRhJT8jvryLy2VzJLmFKB6GmUiDFuV+qSwJaaQz3Y2Hhxj58dvBMnX27xY
 WC6uCACalNu+KgPqg00lVyM1zaZC9Q+a4XHzqgoSxVhtL02I8L0HSRnvQY3OJ3x2u6
 xZueEA7yvE2aO5m54DTR5YEls1BPk7M8nlMaraPqFI3bwwbF1J1FqcvYVYg9vYcyGn
 m7+nF85hNfz6g==
Subject: Re: [GIT PULL] RISC-V Patches for the 5.14 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop>
References: <mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.14-mw0
X-PR-Tracked-Commit-Id: 1958e5aef5098e28b7d6e6a2972649901ebecace
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b76d71fa8be8c52dbc855ab516754f0c93e2980
Message-Id: <162585250397.25269.12449826811960534294.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jul 2021 17:41:43 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_104144_394633_EB7B693C 
X-CRM114-Status: UNSURE (   2.67  )
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

The pull request you sent on Fri, 09 Jul 2021 07:53:58 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b76d71fa8be8c52dbc855ab516754f0c93e2980

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
