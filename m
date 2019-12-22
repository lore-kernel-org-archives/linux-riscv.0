Return-Path: <SRS0=D1lF=2M=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CE1C2D0D4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2019 19:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492452084D
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2019 19:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TetQzD4S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsD1f8Rp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 492452084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CSxk2lYkfEMeh2VzYkbTjL7M+gInLN5RMei88Y6MAX4=; b=TetQzD4SKJe0YqBUFu30C2jnS
	jeVLg5pAH3RNxkSDUwtjsDbgEqL2kVsiXSoWTuVWdhfMGvLPmq5r4zLTUc03qsIhIhC+OBSJdxCrh
	EWLkdonMiWz/h/gr2bTg13rOVpzvUyrSqK26dnwJTnuKvznLFYMKaK79dSbw9jHgSVW+RuhBWA9dY
	oXTpJ0YZ/zibAT7d3JfxBt+7+qIiQfOZEadKJTcKeNvusys9o7ptdHcB8jNZkseYBxndcYZ4fijzy
	99m2rtKNbfAGmnAsUpFVgpdWuTsy1BlDpAy+S4eQD16SQyJHqOds1BOh+I01RDnOuPnbtaNxlnijj
	9+Iy/IRzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6cI-0003RB-1f; Sun, 22 Dec 2019 19:10:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6cF-0003QG-Kp
 for linux-riscv@lists.infradead.org; Sun, 22 Dec 2019 19:10:12 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.5-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577041810;
 bh=ScRRJJEPWTofBaOZWjnSQVNLkENmzibt2MZHv4Bp+cE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=lsD1f8RpkYewEVVKKSPz7ekLnTYB1hcl7SsrqO3JpB7Bao3ldMoswHYXqIJ2b7V2e
 MZ+DKdJAEdBGb6YgO9KrgHntS7urNloPDnyMHZaIBkXI5z6He3E+cSOkdeRANRC22K
 GJmekekflRbgJHNTOf7qP9/2ugE55AqSHj8Fw2KI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1912211854440.57866@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1912211854440.57866@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1912211854440.57866@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.5-rc3
X-PR-Tracked-Commit-Id: 9209fb51896fe0eef8dfac85afe1f357e9265c0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7214618c60e947b8cea12b47d8279bd4220f21bc
Message-Id: <157704181043.1067.2754149951561806766.pr-tracker-bot@kernel.org>
Date: Sun, 22 Dec 2019 19:10:10 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_111011_710620_4A3B97D9 
X-CRM114-Status: UNSURE (   0.38  )
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

The pull request you sent on Sat, 21 Dec 2019 18:57:50 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.5-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7214618c60e947b8cea12b47d8279bd4220f21bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

