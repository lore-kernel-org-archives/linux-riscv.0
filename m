Return-Path: <SRS0=72ER=4X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68A4C3F2C6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2020 22:45:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88A7C206D7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2020 22:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SlhUFDlK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/NfKyID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88A7C206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bvp+KWDuFob7X2NfPPSVB8eEpW2OwFvRx8zTrNl9iZ0=; b=SlhUFDlKgd7J0xXMoaeUb0R+k
	YJPfgwzJskGA46GuRhq7X35juWJImc4s06t086m1OwN30/RJg4rQXfjRTrZ48KAKY9blPK3/WR9uJ
	bY9acf0y6L1fhTANU6HLWZEasc+z/z+1ezaqtAbaMKN9ZZxkw9/F188XoiyIiSTz0DJKy1/WUl7yX
	g4kRIyTiFAptmc+Bg5ScVGYsWNMcZvo5yBfNTRECJwqtzWyR4cYX3rAyyvkssXwj585jniqc/QsNi
	T6zA0sk5xUnXRiEcKct5Lop7WC6xUNH40/fdgGaFYPH+sJZL3GazEtRt03yrHo3HFKXzgFURvKQE/
	ezF4FxMbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jALiP-00032S-7r; Fri, 06 Mar 2020 22:45:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jALiL-0002SN-Ec
 for linux-riscv@lists.infradead.org; Fri, 06 Mar 2020 22:45:06 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.6-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583534704;
 bh=yX6aPpHu7Ib0+yyhoAJCyIMSrKCwvDxeGj4jBZ4m5co=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=A/NfKyIDaH1GvuqGly+CRxQNg9P5Z6PSoqp1xsPHogX7kkyQ84vl0iJOLam7XaDB2
 o0ZPjR0ZiLHXzikX+iQuxuYS74uxl825Ygs4VSKTaYmwcYSN4rSxsTGV9yb8lY70D2
 BeIY/35XeyPi5MizzBv9L58rKqCb0F77iIS8t+V8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-ceb3e2ad-8656-4228-b1c3-b90731c84c5f@palmerdabbelt-glaptop1>
References: <mhng-ceb3e2ad-8656-4228-b1c3-b90731c84c5f@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-ceb3e2ad-8656-4228-b1c3-b90731c84c5f@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.6-rc5
X-PR-Tracked-Commit-Id: af33d2433b03d63ed31fcfda842f46676a5e1afc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e6582ef32f6cbd55b9c752727847b0ee6710e78
Message-Id: <158353470481.2424.9286208999466559244.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2020 22:45:04 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_144505_516588_5C656C30 
X-CRM114-Status: UNSURE (   0.91  )
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

The pull request you sent on Fri, 06 Mar 2020 14:24:17 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.6-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e6582ef32f6cbd55b9c752727847b0ee6710e78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

