Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45BECF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Lfr4uO1xlE7/cPH6N5/EXQgBPW7TKjDs7IlNRJDCZY=; b=Xi9lxEuoHeZZsr
	3+jDyHZd0h/2uV0Ka3YLhv6sIpWEnOSiMtNQCgBKCe6/nPCqKoHuqLeh4KQYjVCD4rqpNBGcQPEPL
	zDnzUl06vd5S15JPOP3DmH1jEvIORWR9sxfmusYGupd7AKd61NYrAdCMYyfOlUe7DEhp0Z/rTw90l
	LjKVyrsIaW+vW6zR8FFj97BpyGBG1cfYrsPdQArnNgGogZeOhEns2U4aqO1q7iHCs5XV7hXcSVTiP
	8+V062Y4QBAmwh1img3pvWdx3tzUPlAuO6UYU9Op7ByfU0dn+CF8Bi3I8ZfNh+1UnPf36SrxkxaxF
	6e88xdD0zAQQ+GcHFXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st9t6-000000030Nh-2twK;
	Tue, 24 Sep 2024 18:03:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st9t4-000000030NI-1Y2U
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 18:03:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A898E5C549F;
	Tue, 24 Sep 2024 18:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18845C4CEC4;
	Tue, 24 Sep 2024 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727201025;
	bh=5GA3vak+vcskMnKFtGHLzUYkEuM3WWPC5NN6MPyg4Kk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IoEPYdVGt3Ca0EdNEt7d0TZeUyXVAqXL7/i3i0Gg70FkMK5G96GQR26i4At4jhou1
	 NpMs1LfCya2oCagxA5jq4bBMD6pD2JivfKjLPE1YC1mMw6+gnbOzDjRkVIZGngUlcz
	 eGzeKM+LKG1lusy9y4H6kEMBm5rC57Qt2Ujex3998wNwHruQHgqlhsmqQgdV3YBTVA
	 hXhst2/mXWi2eHUdJy7yT2/+lz9jpbURy48LRHejMF+jxiD4nadOI/4XTLQNhAFV2Z
	 WYXQb9TyOgNS8MnTpQBzErddcOEOYOl7GqOWzxyK7IUUMEcUs22FsopbTdKOlTT1wP
	 RufONa/pZ4OvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF213806656;
	Tue, 24 Sep 2024 18:03:48 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.12 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-664fc7b8-c82b-414e-9c10-8fe7840f2c76@palmer-ri-x1c9>
References: <mhng-664fc7b8-c82b-414e-9c10-8fe7840f2c76@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-664fc7b8-c82b-414e-9c10-8fe7840f2c76@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-mw1
X-PR-Tracked-Commit-Id: b3f835cd7339919561866252a11831ead72e7073
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97d8894b6f4c44762fd48f5d29e73358d6181dbb
Message-Id: <172720102732.4145686.16906232207879534539.pr-tracker-bot@kernel.org>
Date: Tue, 24 Sep 2024 18:03:47 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_110346_491180_F1AD5182 
X-CRM114-Status: UNSURE (   4.01  )
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

The pull request you sent on Tue, 24 Sep 2024 08:14:17 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97d8894b6f4c44762fd48f5d29e73358d6181dbb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
