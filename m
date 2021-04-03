Return-Path: <SRS0=xqXW=JA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC042C433B4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Apr 2021 19:21:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659636134F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Apr 2021 19:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659636134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwhlu+WEXjh/BhDFvnlnH1ifmWZKMJhSXFBvujqPnFk=; b=hHJducKfz+t9XA3rfHbE5v7HyL
	owt5USl1LYsVWcoRsO8dSBboMC2EjLcGOXrBnjko9m8RKPhf/rnYdWlJh0WtDzOOR6P1ufP+CxZuk
	74Tf5SfG682nW+ziaxv+K729IaDwFe5nKqbo/Cdhrj/th6PkZlEStLa/a6Pc5D9nMICIJIOc9+C8k
	C6N+502HVkNEKLSt9y6q5vqMA4YHIA5jFZc+/cRCX5RxsDQ8ISS+jWuk4cGVCIqcblRVJ8Ios98D8
	27oR1KrLKf2MOWLbsS3KWiqZqLvHwrgmIXantl50QMxuep36WOmr9NMoHKFw9mQkhU4/OGXvbgBb/
	mjzcCgsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSlpC-00EzCT-7v; Sat, 03 Apr 2021 19:20:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSlp6-00EzBx-Na
 for linux-riscv@lists.infradead.org; Sat, 03 Apr 2021 19:20:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 77F7861351;
 Sat,  3 Apr 2021 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617477639;
 bh=3KxV4BtDB4xZSg3MbK+MqqWm+MbAf/VN6u0KjYNkXdI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=A6cMmeG7cvsxFZrIZ84axgdyEQBB5vSWS3XIUhapIz8mGqWzxYfjhXhX4KZ/BK9VZ
 SSNUC/shzMXSEaiTgNtQlhjdAKJoOOjdcZu7iAu11wGq6DQd7rXOqioGHQ5/uAxeIb
 jqWNZRcYeVynBpDFQfme5rDQ3jbTPGujpmTtK5qOf8/q91Sinhr/+hb91cbxu8rXin
 m1L6o6NADh5z1ZtFTGfPD15TyrSg87DWgK2pmf3u4ZPUeef9LaHYNNcg53Hx2DcHOM
 OM91UYiREwzNnjjAfJavITtXJOu4vT+RQIQpUfkymvDxb1XZWiCEfzKK8/CliMePVu
 v+3ayF8kRVcfA==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.12-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-7c342428-c3ce-4ed5-b311-cd79458c2f32@palmerdabbelt-glaptop>
References: <mhng-7c342428-c3ce-4ed5-b311-cd79458c2f32@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-7c342428-c3ce-4ed5-b311-cd79458c2f32@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.12-rc6
X-PR-Tracked-Commit-Id: 1adbc2941eee8acbe3c7dc6b51cdbc5a9bf19565
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fd7d5c20129d2227b95cbe567b24559f144b77c
Message-Id: <161747763935.5640.13928104203299163960.pr-tracker-bot@kernel.org>
Date: Sat, 03 Apr 2021 19:20:39 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_202045_075163_05E7F5E5 
X-CRM114-Status: UNSURE (   2.43  )
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

The pull request you sent on Sat, 03 Apr 2021 11:39:36 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fd7d5c20129d2227b95cbe567b24559f144b77c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
