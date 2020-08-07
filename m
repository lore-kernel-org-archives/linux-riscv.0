Return-Path: <SRS0=fari=BR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628D3C433E3
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2020 17:48:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E67E22CAE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2020 17:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SuwY1AW4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UR0bbyog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E67E22CAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wU3FA/2/OfrbGNmv1oZJJHFIuwnCRFr9KZ7cSgd0bKE=; b=SuwY1AW4ehFl9vym6xD+hauEX2
	bxNq/JACK1Owyn7gVOP9hu4tUkRTIR4CYNLxzWpGlyhvaCkHgoiTA4VPSDilIzhrMz0KM1KevtHtk
	x/mEjfer5wHwGKTfA2MpeMJi2iDQgSYGLxomdmAFY6//7PVqNVXE026RVu8otuEX19CiTb1pnagpC
	NTMd0bryCXxglCtvbfXUpLDWTVtRUe7YrJR6DMgzAD4/FNRT2WRXI2szn1cwYHxiS6KZhs2HaO47W
	F0UzSpM1MHwfF7Pp9A0dQ8qVPNn6rUvgfXjjCYy1+EKYyYF6iouSxbwQsAR2RgOoc/wBsnp/eixtR
	s5etg0ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k46TI-0004gO-4F; Fri, 07 Aug 2020 17:48:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k46TF-0004fr-8n
 for linux-riscv@lists.infradead.org; Fri, 07 Aug 2020 17:47:58 +0000
Subject: Re: [GIT PULL] RISC-V Patches for the 5.9 Merge Window, Part 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596822476;
 bh=aiSmJ6M3m4KFemyGg8H54Z+JLkfPFuM4Lq/xrEW90Jk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=UR0bbyogQ7GFaNNHiNuAMp3B3yRQaP11+9Qj73XHH5VVpvSw3cd7FCzxQuUCpzHsT
 bSRn5eKMDrCg4Pijw6LOSDnZ+d39IDvhm9aaCvfEf0JCyTqpvilLT+hz35m6qBKElY
 gkMxbKz/lqPXBWx92/IgxAOFbqKINJ5CF1ImOEUo=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-bb218bf7-4f63-48f8-95a6-67ff0d32a166@palmerdabbelt-glaptop1>
References: <mhng-bb218bf7-4f63-48f8-95a6-67ff0d32a166@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-bb218bf7-4f63-48f8-95a6-67ff0d32a166@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.9-mw0
X-PR-Tracked-Commit-Id: 40284a072c42f6177184fb1f62ba94c69e0c0277
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dbf83817315d9ce93b3e5b1c83a167f537245bd8
Message-Id: <159682247650.18750.12723959783536094211.pr-tracker-bot@kernel.org>
Date: Fri, 07 Aug 2020 17:47:56 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_134757_402936_3364A096 
X-CRM114-Status: UNSURE (   2.80  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Thu, 06 Aug 2020 16:17:49 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dbf83817315d9ce93b3e5b1c83a167f537245bd8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
