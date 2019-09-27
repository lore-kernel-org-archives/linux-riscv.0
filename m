Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A790C4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 20:15:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CC020872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 20:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LQXjsjbp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOZKTLKb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45CC020872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Axzd+uw2HN05+cRGRPqbQ3DmH3hghJERMdQrd8imOQg=; b=LQXjsjbpgftUlE
	0EaGaM45eHbbsYwOo4FgpVRRNPBjRCtwUsEytvo8nLOBvHVckb+vZcyHjiGoqZjf/pJlLBWQdPAFo
	ILnwbZLfiNFqiA4ijwrayJgXwfHAL+W9Mcfkwt7ORl/4xVkp0MXdFCfIZe1uTpydJ9LOW66uk88JH
	wTeaNJA2FMLH8ssIMZu8fqakZ9xgbaejYdKDyC8GmUnagWiM5yX74a1bCbH/s/YvdCAlJ6BJeBSk4
	HEW+JQT23pFysHGWCqWDZ3xB77nXu3zuEUS1BCz2xTLmwylP3PzbzFD5cFP9z8E4FNJwCSuPALZAU
	EsAoWFSvqDjexscCJU6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDweM-0006DD-Fr; Fri, 27 Sep 2019 20:15:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDweD-0005qi-Ii
 for linux-riscv@lists.infradead.org; Fri, 27 Sep 2019 20:15:27 +0000
Subject: Re: [GIT PULL] RISC-V additional updates for v5.4-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569615324;
 bh=SwDH7HOQCXwqvoE/PXOXeg2Huipb2qJ2AhfuVGYaeRU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=qOZKTLKbemVfI9oSkqtCpFRQN+x+xuHXtdSyz81+LqihP/EKbT6T9l3mRW7Ey+zkX
 8jfcOd9SrSqs6W9Q0IaItsMzP7hnphU5ZI+4T9FPapGKnq9ItVdoVZtEWfpt24/Suv
 +IfgANDXSHrgY1Rin8R7MD/x4z9ddDvftN5UcCjA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1909271123370.17782@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1909271123370.17782@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1909271123370.17782@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.4-rc1-b
X-PR-Tracked-Commit-Id: c82dd6d078a2bb29d41eda032bb96d05699a524d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 568d850e3c6015acec8f854f5be97766497a676b
Message-Id: <156961532414.31800.14952198314598782581.pr-tracker-bot@kernel.org>
Date: Fri, 27 Sep 2019 20:15:24 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_131525_692273_4A2E3B52 
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
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 27 Sep 2019 11:25:13 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc1-b

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/568d850e3c6015acec8f854f5be97766497a676b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
