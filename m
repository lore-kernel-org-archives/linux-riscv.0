Return-Path: <SRS0=IzQl=V7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91987C41514
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2019 17:45:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A21E2087C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2019 17:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PKlb8q0d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="No2IP/Wa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A21E2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vxDWTQSqtxL6AJLF9uInUGKobwn7J8kce7JPnl964o=; b=PKlb8q0dzmBrLw
	7fYeC+wuG6CmHbHGkSVYptkaJq8bHHl8npizziDnwOsk5e2a9dtKJhOeJwKDUojerbfK08K1OOM8r
	FiK0GLauwXLqprh+cWerp28E9V8HeJOiwElgs5nQykcS8f9m667aUjECLVZjtqSnrvX7DHF4rnEJU
	j2XfHxUEbEHk/wm0JAr3A6pxptjupENZdO7YP7Ib60MzciPIlDfx4RDilshEoY9Xq2y8b42MUDgiI
	PWGAQeIY0esFfjmDnJhm++PWReyA6OEzuBaTNon0F2C6itgKxSX4MsplM1m+j/NJvLg4fSyQTJ7Ui
	SrpHiE9lnoqdikv7M+Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hty5i-0008L1-4f; Sat, 03 Aug 2019 17:45:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hty5f-0008Ki-OV
 for linux-riscv@lists.infradead.org; Sat, 03 Aug 2019 17:45:13 +0000
Subject: Re: [GIT PULL] RISC-V updates for v5.3-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564854310;
 bh=NuvhDskiUO3Cqrv4KT/gyJyunjSZIICCm7dnpPla604=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=No2IP/WaqekDnNBAwQ7Prvr668hp1g8r/wgIh8IUea+QUiltYnxI5Ig16hcyEORcH
 8IvN7G/2J3TadwJmt5W3GSpdejv1ZfWh6MvoIL9GJ1As8IVZ4kGhbjUhvTthjggLUy
 dnwfdQ9CNj0l/3tgU3gWjglDowDdalVsJzGlTGX4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <alpine.DEB.2.21.9999.1908030720490.3783@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1908030720490.3783@viisi.sifive.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <alpine.DEB.2.21.9999.1908030720490.3783@viisi.sifive.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv/for-v5.3-rc3
X-PR-Tracked-Commit-Id: b7edabfe843805b7ab8a91396b0782042a289308
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 616725492ec7519643d5638de02a92a28200d03f
Message-Id: <156485431046.24028.8435420942001719867.pr-tracker-bot@kernel.org>
Date: Sat, 03 Aug 2019 17:45:10 +0000
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190803_104511_823536_E42ECF02 
X-CRM114-Status: UNSURE (   0.57  )
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

The pull request you sent on Sat, 3 Aug 2019 07:22:25 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/616725492ec7519643d5638de02a92a28200d03f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
