Return-Path: <SRS0=gmBF=KD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430B6C433ED
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 19:00:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE52A610A7
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 19:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE52A610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1I9pQZSqleqYx3z5kPfzFDmWyvJdXQVwekO1xC0dU7w=; b=mnPVrCm3ocOTOGj9aWHKcKrP0K
	NeDiSjuE/D3ELfc1hQc1MeGYqK4z4zcoMZB3YoKQIjGPnvMSrGspnDKr5B1HPYlW50YV8PzlenjcJ
	fV017KtxqBcL+7lHU2muTpSFiRzeCxjTh9RzpC83yxU4bWm0PLtXBDi/HrMIFT1eBFil5E24qj9vx
	abeGDysKcOZ0umAd0dYS6rgMzxvkRR9YRN0iGjF2Zu2+1yVnYtvzttrenB45aWlaJegyYLSnrRpqY
	q5njaD7j49LlESJxDEHpltRLRfHbI7LT4gSplwk0XbPo/8oS1UdsV+rjnaFqyX+d5F39W+xAcTRTF
	ocKChi5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfSB1-00A8JF-MU; Sat, 08 May 2021 18:59:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfSAz-00A8J5-TQ
 for linux-riscv@desiato.infradead.org; Sat, 08 May 2021 18:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j27HxNV1dD5MvEYi65hNjkmOwjliD+0l24Oyrmd/UtY=; b=RhbbEo/PmlnMksBxncx0UShlml
 LLKw3c06l8F5yQZDS+s0WiT5DDI4zfPnZgJr6kZ8kQ/a9GZ6ibOJzlWHCCrW56qGIIcR9RxPslj5l
 mR9Zad05Vhr3v3GSIU25OYSKWXL/SYstFat93sONUEcTub2JTzDLYk/frffKQTuKHNoEVleDtrIVT
 V4lWigQpzVssJTf2jA1b5HrBLDrOFP+wnzSsqf5gf0suDteQm+POGJZMQ8cypzXr3DKPZa1J0/1WU
 pNFof+WbQ5uoapt8Oua9lIcqzL+l8nXKTUxujudaMOe+n4DHAI5hp3QKS0tjd47wVxkmaQpz7gTlw
 F8NC9nbw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfSAx-007fz2-7k
 for linux-riscv@lists.infradead.org; Sat, 08 May 2021 18:59:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 86C4B610A7;
 Sat,  8 May 2021 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620500382;
 bh=tx918tkZbZwk5k4/pxpWS1CEZAX0ZmOIuptimUUWpZU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=UtRDVlrN+0I7NVTze6fxdx6ZWB8SR7HcB0rBVSwzCyNtvsk3nUlRGtdNGXwbZd+7Z
 OJq235Ii5ziA/UAN6xnDpH0pGcwK67KoqL0dJKjZfw8M3Gb6s7RAGAMtmZ0r4x/a2v
 ltaeb4Ppmv+3F3q0kUR4hCJ7g6Zl+tg3E4o2eV2UJJISbwD3eKBu1zWDHOASShv1xq
 GLP5hcS+u/6xP2bHkPRWh1gZdjj0C8NIDPsbv5ZHlNYl6p6xQxjHi36l35QwMwvevv
 Nv7qYfMxelixm2/yKpUrqqDWjjOEVE22Q7vL4MjjOuXDLQ6QayUGhVmtfThRu+l1Ff
 55gRINx2g7zPg==
Subject: Re: [GIT PULL] RISC-V Fixes for the Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-00f4b683-5870-489d-b713-aa5f18aaa6c5@palmerdabbelt-glaptop>
References: <mhng-00f4b683-5870-489d-b713-aa5f18aaa6c5@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-00f4b683-5870-489d-b713-aa5f18aaa6c5@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.13-mw1
X-PR-Tracked-Commit-Id: beaf5ae15a13d835a01e30c282c8325ce0f1eb7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b741596468b010af2846b75f5e75a842ce344a6e
Message-Id: <162050038240.29908.7380888985130805845.pr-tracker-bot@kernel.org>
Date: Sat, 08 May 2021 18:59:42 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_115943_317978_5704AF9C 
X-CRM114-Status: UNSURE (   2.41  )
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

The pull request you sent on Sat, 08 May 2021 11:25:56 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b741596468b010af2846b75f5e75a842ce344a6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
