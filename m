Return-Path: <SRS0=kGhb=SS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1E2C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 21:30:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA6320880
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2019 21:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IN3YnGdd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYb0tWEi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA6320880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERdiZ6wo57FC18bUQ7CpEyPm1Ywdek/IAMZgffdkMmw=; b=IN3YnGddw91U1K
	uZgruUEAAVYwfFlCX56weWAlNtpkLWUkGtF7Gwak+qim1kiHyQHyOIHTDiqjy3JWz7LnLUkQaShYU
	vQRDqE5lJAxDRHv8tuuiRf/r2EcxZT21cgAeS+qoxPv67HZaSfcU+qqCP+J6jvnE+Vpda6+/nUzKY
	OP7YBBCzg62qguQBiAGJ9sLz0Zd/k3NxfIEQLrW0vQjzF1YJjesH3HmTCHxYk12AsdqPXpKTP32iw
	xirBYYNFQn7iUe+9WNZv4mB6jfdiQO77xdQHpKH526yBurq8Hqkn6AKDHpWvKjSCyD0BURGpEzoVi
	GbWWbW5EGmnb4cVsRd1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGVea-0007TY-3b; Tue, 16 Apr 2019 21:30:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGVeX-0006zC-VO
 for linux-riscv@lists.infradead.org; Tue, 16 Apr 2019 21:30:07 +0000
Subject: Re: [GIT PULL] RISC-V Patches for 5.1-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555450205;
 bh=RzVuj6aVU6nIuQwLZh+nxY08N3wUD985RYt5zBJKFWw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=uYb0tWEiEcdVr2HZjFzSyOEmqJW7m5843OJR8aou7IlcQGBtBjW+vYVQqDx3i5p4h
 kHeqE4Jc9AWAJxsqTQRm1jDGGu2y0jQXi6AeYRtd7kME4NIBkll2n6eEVVIg0GmctI
 8tjJbxjeCQSAYoEBQwrRse9jZf10pa6+Il+IS6hk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c5019c5a-5f6a-43a2-b376-6a29a824e260@palmer-si-x1c4>
References: <mhng-c5019c5a-5f6a-43a2-b376-6a29a824e260@palmer-si-x1c4>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-c5019c5a-5f6a-43a2-b376-6a29a824e260@palmer-si-x1c4>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
 tags/riscv-for-linus-5.1-rc6
X-PR-Tracked-Commit-Id: f05badde4e20d2e0f8c39d07a6873b2bfb0754f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 444fe991353987c1c9bc5ab1f903d01f1b4ad415
Message-Id: <155545020503.4861.16520339466805222893.pr-tracker-bot@kernel.org>
Date: Tue, 16 Apr 2019 21:30:05 +0000
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_143006_036051_8B006E6F 
X-CRM114-Status: UNSURE (   0.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 16 Apr 2019 10:24:46 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/444fe991353987c1c9bc5ab1f903d01f1b4ad415

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
