Return-Path: <SRS0=+GVO=6X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFF0C47255
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 May 2020 23:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D9F20735
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 May 2020 23:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GzMfPoTs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CF45wfgq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66D9F20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JOKbRckbuJVylYiw9v+2RudO+E1phIVhxr26Rrp4ZA8=; b=GzMfPoTsr1FiiZaUEXe7bInk0
	SurZmLhYreIsyZjBm4Ew7JqLbRSmAAJhACsswUyarlSkN/Ge7ndTRcxcfzKpkeXMjb7Z4bMRJ1rn1
	rhUPVLYkHHnBlRSIy+JL+2dSmPt0YzF0sDiQTezPKWMtWasQboQdWDSJql8OpjtepRCiDU8qgzKJW
	e2DP2yX+u2fIOOM4fLH+yuUSbk7aawQi8gALbpHG/g2NG7wdELTWvgOlQE2J15NTlOzo3khCeN7Sg
	M71wv1Erq2pbmoLAB00eYyrxlfRFm3SSVYqNr8MeQQ3pCNDqug6bOIiSiciLU+GrGCJhwSmZ8oTRY
	gGzBiQ2QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXYv2-0003BP-Jg; Sat, 09 May 2020 23:30:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXYuz-00026y-SP
 for linux-riscv@lists.infradead.org; Sat, 09 May 2020 23:30:07 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.7-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589067004;
 bh=3m5vLMMt7xSTQVM1ToBPEDlQIEW02c2ZOV9SkMuqvoY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=CF45wfgqyH6zN0ImOw/jdsgSCkyi+8NPxUyPWCiz1SslEJrtTNmje8IS2No4Kj22f
 Qi8tuKxEsRXt7M7JlXBvL+6zc+8VRGe/1l9ieqaSE++9nqX/r2TQ90yG3IZdPVaj8I
 QLhZHiwalGYleqUKmu/abD65Gv2/y4WQkNZrpn7w=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-81c83c19-6f5d-4ed1-a0bb-26accf4b7d3a@palmerdabbelt-glaptop1>
References: <mhng-81c83c19-6f5d-4ed1-a0bb-26accf4b7d3a@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-81c83c19-6f5d-4ed1-a0bb-26accf4b7d3a@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.7-rc5
X-PR-Tracked-Commit-Id: 73cb8e2a5863ccc5215660f5123db621bd57dff7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e28f3b13a41b8a7d36a73ddf4bb41972a9c1dd9
Message-Id: <158906700480.4509.666765554431792903.pr-tracker-bot@kernel.org>
Date: Sat, 09 May 2020 23:30:04 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_163005_958152_07ED5C74 
X-CRM114-Status: UNSURE (   0.80  )
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

The pull request you sent on Fri, 08 May 2020 11:47:13 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.7-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e28f3b13a41b8a7d36a73ddf4bb41972a9c1dd9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

