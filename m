Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5EBC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmzIQihaqetHFtr/6GXAxkIGuDJwE5eVFDqbXjxQMO0=; b=bc6MnKmAjIdU+z
	nqCJvBjUlk3mycpoTkahEOGWmoKCdAQ3nDp4VxhyWosneiYc8okt96ENqK3ItGdqaTm0gpBrfe/bu
	DE1qdz3F6PbjyCO3f9NMwZbHgKTpBkkYE3+uN5cjjBEdsm97FGn0a8V1eIk3satLn6igsepp/PlIz
	cmq05MO0DJW3mmww6ICDngmX3Qe5wJSNbST4zFFcbxamNn4Npclm2UMJTSz0PetIds+Oi7cj2uiOw
	UppoKH+L+nx2wQDaxpZ4J7/GehV9JOA28OlyOD0XXYWDFbUb73u5szZqlmwQ/99L4Dqi+jm3Qmjp+
	YLR/OnWi2Kk8CrX9SRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQXa2-006mqX-Ct; Fri, 10 Feb 2023 17:53:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQXZy-006mpr-SZ
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 17:53:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 23FB8B824BF;
	Fri, 10 Feb 2023 17:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6107C433D2;
	Fri, 10 Feb 2023 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676051575;
	bh=MYPJJIAYtY3MLXCZqs7b4RiPIoahFIRQrSxDm/HhHZ8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KvQrNd1kupvv6MEHKWB64YlnKEknso3nCbUlbWtfZ37fNPx1tEcBX3EA9tEZqOEWf
	 Rn38zoEB0bbTBOgI8RKjn2XAhDMYq2Hgfr/FHLXKItvyfdF6HsvmdIeBTbVtWwMsls
	 nEcTxf5oSTS/yB+eCLunJoecdiMOPDPjoIKAJyiejn++0hgA7lWlcSnECZa0oey9+h
	 aWwsNDythqLr6bvAKOGsJpJwVuNMioeBhRwZos8hB82lrHXH6DTYr4I63Af7VUi+eG
	 S7e0X/XRjIALzVgFBUHzp9RR9CAehVYNStdzqwbhlcutOg0IoMyL+Wp5L7u2RS2kVR
	 cIgQtQFKKxSbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0B67E21EC7;
	Fri, 10 Feb 2023 17:52:55 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.2-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-6912c0cd-33ec-4209-8a38-3da4be55fd88@palmer-ri-x1c9a>
References: <mhng-6912c0cd-33ec-4209-8a38-3da4be55fd88@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-6912c0cd-33ec-4209-8a38-3da4be55fd88@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc8
X-PR-Tracked-Commit-Id: 950b879b7f0251317d26bae0687e72592d607532
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e9a8427a1f1f39632e2b2ccd651e499c64f59b2
Message-Id: <167605157584.13061.3796042137852696913.pr-tracker-bot@kernel.org>
Date: Fri, 10 Feb 2023 17:52:55 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_095259_099446_B45DB743 
X-CRM114-Status: UNSURE (   4.48  )
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

The pull request you sent on Fri, 10 Feb 2023 08:02:47 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e9a8427a1f1f39632e2b2ccd651e499c64f59b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
