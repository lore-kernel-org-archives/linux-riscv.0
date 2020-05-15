Return-Path: <SRS0=LZsr=65=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07464C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 May 2020 20:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C962020727
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 May 2020 20:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlVpJBsZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0Hxihb1C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C962020727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8kHGOHFifaOBn3ZMQC6IyviJ6GpqpGKd+dvholv3+uA=; b=RlVpJBsZqnE4QNEF/cPSZCkdB
	UnlCoSMbRIUBYRH1ubijlxFSTf310mLnDcIVA8u6tRt5fBsA+bZsDwDYM8IxZax1jqFsFow1/ELQl
	5UxeWriitWZqKBoa+3K771Xxg10s9RLqWcX1cqVHvsDJsKM63+Dnl0HuSx9TeGHjsp0//mKKpxgS6
	0s1xYWQLHJJi5w7FkMuXAxnuCAY9D8x0UAg7nPsYwCnrJNVCih/mNdS5Qko1LHQV4AiIqElzZLb7g
	s+CnIHEoMukbVeTs9qIBWkG9CePqPN5QblLA9o1HzCOnarCjc9trXc6lq5Cl3dMKAKZZXtlHgphdX
	ybDrIQLAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZgVI-0002dI-3K; Fri, 15 May 2020 20:00:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZgV7-0000iy-A4
 for linux-riscv@lists.infradead.org; Fri, 15 May 2020 20:00:11 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.7-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589572803;
 bh=ukGxNID2VrjPL0mLqlzcVmDQqrmdh107FnZjZfBj8+Q=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=0Hxihb1CHr/tmFTGBDgBOhE0DmT3tl/s8Gyty7PynH0FcMrCvspYxpoo5rarj9W1p
 CSUSTTppFs/CH/rDBHop5HuUAS4S6KFd+b58pqAKUfg7OytpokeVF1rY5HWFIAIIoD
 ZDWaKff2Q6lxVvMg8O6VPt9/ES3zgwWpE47hTemU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-0786a015-369a-4f54-aa78-f4550588e4ef@palmerdabbelt-glaptop1>
References: <mhng-0786a015-369a-4f54-aa78-f4550588e4ef@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-0786a015-369a-4f54-aa78-f4550588e4ef@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.7-rc6
X-PR-Tracked-Commit-Id: ed1ed4c0da5447c5e322481ce2ef9f03336c6ffb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 67e45621af060a2de53a1ba24d052bd33c3acaa3
Message-Id: <158957280391.8762.3169691296478881193.pr-tracker-bot@kernel.org>
Date: Fri, 15 May 2020 20:00:03 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_130009_402841_BF186153 
X-CRM114-Status: UNSURE (   0.61  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 15 May 2020 12:01:15 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.7-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/67e45621af060a2de53a1ba24d052bd33c3acaa3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

