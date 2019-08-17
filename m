Return-Path: <SRS0=lGgd=WN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA6DC3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 17:50:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6DC621019
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 17:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dNaYktSE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpKqFhHi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6DC621019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4X9vId2ROythDySvBLyzNTnvpBBJ5NalKQ2RwR6+Yc=; b=dNaYktSEnJnBsT
	+9CM8lkuVweN+Ghuttwsf2AgIODy+Npk/YlgH1VpvVUgxKDxeYlleE5/9hV+jMCaumUV8kYU23y6I
	rgqa8XkpnsC8EHQ9kKWywJEqHiwZdAR0SZLtLyxBtmS3imVkJQzgrvE2W58h2Xfb2XvTSkGiImDRj
	texeGZbaGUrMotbgFseDxsoLym9+DAjHfSm9i8T0Ez1RO15Qp80/o2Xniq8RfOKg3eV5EFYa/OpO4
	nEcV+tXzNuQuHFSzUuHYx+Z7fjQFuHAnqY+pzrx+VRE6WKVQ16y5Vak58OK/6APpc0aMHdBwEKEBf
	ndnA+WRh2giNjexGtShQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hz2qA-0004Rw-LP; Sat, 17 Aug 2019 17:50:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hz2q7-0003ss-Fz
 for linux-riscv@lists.infradead.org; Sat, 17 Aug 2019 17:50:09 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.3-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566064205;
 bh=78zR3XNz15/8fX/IXVHrbZCn0tf/df5NoeperNcnbQA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=YpKqFhHigEhtgl36cZ9g9tIR0dLIcYYZ1zQS75XWy4+/zVPOAeqZvSeX0SVotWK7S
 xo9TR+oGdHtrDFRZagXyAyyIS0e6hQXKcqT35UGhDN+sqTi6TT2Rxz40gnSQ6WPGIE
 NqdM5rvmVHcd07eDaf3B8I84iHE+30O2BEQM3uQE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1908161824300.18249@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1908161824300.18249@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1908161824300.18249@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.3-rc5
X-PR-Tracked-Commit-Id: 69703eb9a8ae28a46cd5bce7d69ceeef6273a104
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f478b60118f48bf66eaddcca0d23e80f87a682d
Message-Id: <156606420515.15242.4838104817894309424.pr-tracker-bot@kernel.org>
Date: Sat, 17 Aug 2019 17:50:05 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_105007_561942_CE82882F 
X-CRM114-Status: UNSURE (   0.62  )
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

The pull request you sent on Fri, 16 Aug 2019 18:25:40 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f478b60118f48bf66eaddcca0d23e80f87a682d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
