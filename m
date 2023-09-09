Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFBEEE14C3
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqrEpgcIdBKGp4ReBFRXfx0oug2CXcz3uQYrHhVgaXQ=; b=szUSHiklmq5LUP
	dE6LQ/7A/TQeUDX+HJJetzQz3fkcDbgiuGCEJNa0BreyBBokmyOb3N4qDv/yIt+4y4wFBXAIa1b1r
	00Q1IBDQ3mybzEMELbdd2CUD0PwFmNdQY31t7I2TUTycJ+71KXSfcWSnAmjBJ7HxIC0WOdP7YXB6T
	DlxBu3HGzfJh8NHPzscyWCBYodsb0+Q+oI6rTB5b9DYNwvELaXBXJ3/XzSGO/TArQRqNxwEL+WyHA
	zeiF+jSHdgZn0ewVtDwh70CwsAkoGoVOC6nxPUrfhe13xlK8z5h4Ro7gC3Lp+b6hQQyLaxRGBHmBK
	X1Uc+/U22/ffmOLUETCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5uh-00Fq1r-24;
	Sat, 09 Sep 2023 21:54:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5ue-00Fq0u-1m
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 21:54:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 52C07CE0A55;
	Sat,  9 Sep 2023 21:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 923BAC433C7;
	Sat,  9 Sep 2023 21:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694296480;
	bh=M4RZP0fGF69UFqpB/5dNAWQW+UFqhTOf0JxckaFLP2g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Hjx9RSl+doWPs7O7nGsP0kmBBHGVNkMED+OSekQalLUCX1Dx41RQaFqfzH0eWpJUL
	 4XiLdjx+VhHAMIp4L7mO+GbMe/pkeyZnoXOA8HMEUQfJIlt7HAGpcJKncEIyuurMoz
	 15+Y9ol3CMq70pDiMnPXtMKNHYHjqKT7nEZPoghmO9xPOrHBHmvSvnrELQfblan7Db
	 lMnJRWYNDx5i+N51HAuWJm98byTXSJtcuoeWgHFFCsSynH4oqU1jlaISpy4lj3cMQg
	 069Ozl33TYG9lu/vkO/7Oj1OCeDFhcelEROWXG+TfPNDe+R+fIQS/aGwf6W+uaal6l
	 VbMT8thpnP0pA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F9C8E22AFC;
	Sat,  9 Sep 2023 21:54:40 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 2 (try 2)
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-2cae48f5-f42a-4432-b0e2-bc1ee3e01ce5@palmer-ri-x1c9>
References: <mhng-2cae48f5-f42a-4432-b0e2-bc1ee3e01ce5@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-2cae48f5-f42a-4432-b0e2-bc1ee3e01ce5@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw2-2
X-PR-Tracked-Commit-Id: c6a906cce61a8015b622707f9c12003f90673399
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b37a0a2d46f0c5fa5eee170ddeeb83342faa117
Message-Id: <169429648051.7760.11942823102814181411.pr-tracker-bot@kernel.org>
Date: Sat, 09 Sep 2023 21:54:40 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_145444_773408_12F2641F 
X-CRM114-Status: UNSURE (   4.16  )
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

The pull request you sent on Sat, 09 Sep 2023 07:25:43 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b37a0a2d46f0c5fa5eee170ddeeb83342faa117

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
