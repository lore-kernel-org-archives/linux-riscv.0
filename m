Return-Path: <SRS0=2IPI=RK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3C0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 21:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE80D20851
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2019 21:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyNsVH06";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRFvUPF2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE80D20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hoLt73YRQ496+/HgAjKf+qa6GOTNyboRYzdV4RUpaI=; b=nyNsVH06ro3q+y
	moO+kG0eWOQP/ELLhazG8IcOzM6oa/R2xcnBU9lqCz5lSY2FB5ULNGCJ83WEgeGeY5DMyc0Efgk+F
	pOdWSiWzSPLvbjRs+jAqs4KXKtt3ZfZsDPeaqhsKWbcyvuubllT2scih1mr/2vQTac8STRKysuoeq
	pw210CaMSghpOlnO4umZM5hJaFNkewjKucWBhlIGrKVd3g/bTOVR039PPSL1OkLM6WFuG3qVHbXlz
	RyirshqEHnQ1JHZl8pBzwS/egdtoATWQUj1VJN1ILB04erHPAjyIjnRHJlQ4GFjsKm5y+dgmj6YBD
	/ITLDVkd9wIoKICzav8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h20kX-0006T7-53; Thu, 07 Mar 2019 21:40:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h20kT-0006Rj-Gr
 for linux-riscv@lists.infradead.org; Thu, 07 Mar 2019 21:40:18 +0000
Subject: Re: [GIT PULL] RISC-V Patches for the 5.1 Merge Window, Part 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551994814;
 bh=+0W1NKR4TamGtIAMvXEiPmBsj+CPBLNLdNmHR3ORXlQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=mRFvUPF2NJ/589c21YVId8mhP8pYosd0OJy/81bEt43IRtGraRzWrfDCft4lbXLVO
 mAqzyl+M28+yhUTfFa1GlAoo+Sht0lJ9s3ybu4iF8UbIV4zi288GemEg/kqtQLUJR1
 6f7mIV/IKiALMA0kAOemDbO4hKRcRdDrIZL/yvj0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-abd0b24c-3a6c-47bf-9b0c-e069cef41489@palmer-si-x1c4>
References: <mhng-abd0b24c-3a6c-47bf-9b0c-e069cef41489@palmer-si-x1c4>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-abd0b24c-3a6c-47bf-9b0c-e069cef41489@palmer-si-x1c4>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
 tags/riscv-for-linus-5.1-mw0
X-PR-Tracked-Commit-Id: 13fd5de06514458eb320188b7a815d65696efd99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d72cb8c7d9dbd9ce820c80f3fddb56b296ba96fc
Message-Id: <155199481451.1630.17073118464271664401.pr-tracker-bot@kernel.org>
Date: Thu, 07 Mar 2019 21:40:14 +0000
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_134017_578232_78BB1085 
X-CRM114-Status: UNSURE (   0.97  )
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

The pull request you sent on Tue, 05 Mar 2019 13:42:15 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.1-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d72cb8c7d9dbd9ce820c80f3fddb56b296ba96fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
