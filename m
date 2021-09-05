Return-Path: <SRS0=xDcn=N3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1DEC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Sep 2021 19:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B610461106
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Sep 2021 19:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B610461106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtZTIJUE7RpWVDwVOYzxGOsIySGlB8zHCR9y8NGb5kg=; b=2jYqgxp3tcq38s
	i+lKZbTTPfXJ79Wa+zyBuPcRVk6sXXWN6L67lknXxut8IkQYSDHl48+O3zIWTvwSH1YOe9tzO0K01
	EVW10o7/Hurd6+scWMN1ESaSqhAlGefvJhAKtxF0yYn/HWlH1Ya8nXSX55embaUbFQlClEe+JiqNl
	U+48BWu1wWXFNssBhHh8qTNC9uFcf/hqFV5BNaRcAMe1SM6Hkio6I6CatUb5audJQMoQu9oN+IaoB
	7tEiZJdn8uowt6r2EhW9f0wTILLMA51cOTh5FZe54gHBm+2Sqp82KDBgXBY27eRSQwxoTheNH70E5
	dqCb4NHck8bDAyKTsehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMxUO-00GIM3-I8; Sun, 05 Sep 2021 19:07:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMxTv-00GIJM-8w
 for linux-riscv@lists.infradead.org; Sun, 05 Sep 2021 19:07:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id C2D7661054;
 Sun,  5 Sep 2021 19:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630868826;
 bh=WAy7AwFQMkZqSv1On+4Aj57+KgG6VrmgBD9E2UYoupQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=A3E5DsU0lbllmOPugMWCsq1V7RGiLtIXkyZm9m22I7bn0luG0iuQUR8DYg1U617Zv
 I9ybxqORH6km1SRkD/I4Pwf4xPa/RFC8pkatbnYu6riuxYVZ2Ug6Lk0Kbd0JXvuImO
 ZjGK5h+NEBwLEvCa5NiHc3P64JE3vPi3l1S52h219NSBFbAqp+rawj1D2zmnNeKUzR
 x3rufHlecsYwnciCjO+41xsBYcsrl30Yj990bKyW754S93DS/JtEQ4I3XY+pB+fO5g
 86ZlVzKMe+eNhY7d6AH/rjT3lfx1sMDMtnhdLXc8IlPlCtph8itHdQkkdXxID8miC8
 lxuXe+ezEMYrA==
Subject: Re: [GIT PULL] RISC-V Patches for the 5.15 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e13c978a-0771-4577-9adc-3a4b807fbfc2@palmerdabbelt-glaptop>
References: <mhng-e13c978a-0771-4577-9adc-3a4b807fbfc2@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-e13c978a-0771-4577-9adc-3a4b807fbfc2@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.15-mw0
X-PR-Tracked-Commit-Id: c24a19674258dcc968a198d8e0d4717c8f27700c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 063df71a574b88e94391a3a719cf66d1b46df884
Message-Id: <163086882674.6256.7268690011083399997.pr-tracker-bot@kernel.org>
Date: Sun, 05 Sep 2021 19:07:06 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_120707_369646_77B1E406 
X-CRM114-Status: UNSURE (   2.98  )
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

The pull request you sent on Sat, 04 Sep 2021 17:15:57 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/063df71a574b88e94391a3a719cf66d1b46df884

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
