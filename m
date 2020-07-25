Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD441C433EB
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 22:30:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76EA206C1
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 22:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e2jQceyA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iy+zFC9X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A76EA206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdP280TSBB3TCNesLoeZzdQ/xDn9u6pXrKFyefSmh68=; b=e2jQceyAHP/IsXsDR1KrR6C0ay
	a1xYxzNFHKXOHXKJrz2W1g1bVzfLAN0RDTPKGcc1DexIceqAVWu2Se8NeXo4z6PiOJN+kUjGLXBYS
	jLFJx4qzVw0nu5qQnk8sKhi2x3cbdIjvfSM7Xp1vkLzTugy2NCdlZ0Hu6RerZlkLX3osFy5vf6iT8
	dtgc34S9H8CJvK8ny2MypqOtui/tvNqQ59uQEYiLozRXcWwCSjBj+se6U6TFC0vHis4wqKQB1JqVt
	i26PCrc2rMf7OyJd0REjhG7fw6AVGNgcv2Vn2Hfpv2CyqVqZE3wxR+FSzvJ7A+30wW/uiQSMj72cO
	i75Kun0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzSgF-0007IB-3K; Sat, 25 Jul 2020 22:30:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzSgB-0007HW-Qg
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 22:30:08 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.8-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595716206;
 bh=LiH7ghpFyjIxyFjKFEpsMpPqnVCzGwVcSJlmToPZAAc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=iy+zFC9XEdxro1O25f5vVsUzSczJ5EWorn8G9q1yh9/j2OUL43vSoetRGWxlEyITR
 oSWW6DGMvnCzujWxDLk0viFLg3a+CBD98/vdc6+bCnJBTBm0HdEeiYsj+isgJkvxsw
 4hA2HCWq/rZpzgGq7XxO16L0bS+Lc00XEj29JRBs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f2bb3f7e-e2d6-48e5-a8f6-5e47edf5441e@palmerdabbelt-glaptop1>
References: <mhng-f2bb3f7e-e2d6-48e5-a8f6-5e47edf5441e@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-f2bb3f7e-e2d6-48e5-a8f6-5e47edf5441e@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.8-rc7
X-PR-Tracked-Commit-Id: fa5a198359053c8e21dcc2b39c0e13871059bc9f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04300d66f0a06d572d9f2ad6768c38cabde22179
Message-Id: <159571620619.7388.9227787519310326935.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jul 2020 22:30:06 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_183007_940093_813FCF03 
X-CRM114-Status: UNSURE (   1.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 25 Jul 2020 11:30:54 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04300d66f0a06d572d9f2ad6768c38cabde22179

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
