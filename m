Return-Path: <SRS0=cU8Q=22=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5D8C33C8C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Jan 2020 19:35:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 778A321582
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Jan 2020 19:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LnAzlMF0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HebMboWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 778A321582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TWumvLBMNIVIfWED5qrneh9LdeFBgVl4f+T0G7K+2NM=; b=LnAzlMF0NXMcxU2FCKI9ddZtA
	rbANkfpjXXO5bh4jX9xt25zPwbcsSN7cd8ZV1UAIQXHVSUxxe/SQNCsABTLQUJt65DLAWi+nw13qu
	w43IRYJzvlaW342WaprQU2JKHnbmgv6/rH/IMRBzvLfQUdVh1wrw6pCLs95vsHOpX5qXB1CdivuPM
	M8iVeaHg8/NqGTIqNOEt4to4tcB0L2KuShx4pVvGUKTB+02x+xZ7dZLdE5cfhZn7vvexMxOonvOKJ
	KBc0BZCfZszw5KxjEDCgOlQF0UWqamNDicxd0YaLVNMIvv4jwdXUGPvXa0O7JC8NvfIvdqnOJ/d+6
	ZY24Rln9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioBg7-0000sf-53; Sun, 05 Jan 2020 19:35:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioBg4-0000Li-My
 for linux-riscv@lists.infradead.org; Sun, 05 Jan 2020 19:35:10 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.5-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578252906;
 bh=xtc1k9LC8YlxPU5m185HhvHlggNQUg5qFQaHxbIEyZY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=HebMboWQTGkhA1i5LKUnQd6ZK9W213Zmx1CcZDax6hfQtbeEjrTPiGh72Kt7YVut2
 QY/GI/MGk3wrxbqaCnf+4GMEfZPLGvksGPfY3Mxwr5NwaiJahbP3brlHmj1R3zcEr1
 3PSPR0Ioj7fh/OSvbDf4sLWfW1DypgmbuFY5H5Vc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.2001042202460.484919@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.2001042202460.484919@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.2001042202460.484919@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.5-rc5
X-PR-Tracked-Commit-Id: 0e194d9da198936fe4fb4c1e031de0f7791c09b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 768fc661d12559b0dbd99d941b3bf28fe92fd365
Message-Id: <157825290618.9386.2695929445683299126.pr-tracker-bot@kernel.org>
Date: Sun, 05 Jan 2020 19:35:06 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_113508_781549_41C86BF3 
X-CRM114-Status: UNSURE (   0.73  )
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
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 4 Jan 2020 22:04:16 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.5-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/768fc661d12559b0dbd99d941b3bf28fe92fd365

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

