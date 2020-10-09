Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216EFC433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 19:32:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7ADB22281
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 19:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZha1TBH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z7zt9DGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7ADB22281
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=664mA+4BCQudR0VVTQ6dH1ve2/f2XcGj5Icdrh6gY68=; b=UZha1TBHZrmCJhLbKkzZUwOBZr
	jLRwX8jv0AWEMGK5iuqdWNOd4eU2aeIGQ+k8vEIwMdJPStZ0hf4GfCoGVncFi4V33ekVuXbACFWRG
	oZwSGiRvXmqfgZPqBRu2+w5o+HGVQYFEYfeZvoyITjF5pdEQhQtDUsDW6rkvFbiCNQ7YxHq5JDxCx
	ghc/X7OaEAJG9aKheTID7ZKh7XgJbs9AaiQ2IFQR4lMEyFQGfdoFYANsXGFFCAXHL4biay9UN7YcN
	hAnezy4vsm12X6PYigxotsAgMuVMAPrJJUdjGz/FbslLYanr/srKLZDE87W0GO0gbTVkfBVueqRDV
	uaLN+x/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQy7P-0006UH-2D; Fri, 09 Oct 2020 19:31:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQy7M-0006Tf-5w
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 19:31:53 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602271910;
 bh=XjUqn/WLEETIlZm9GYVr8hFaVARPWtUKhWYC7ECP2xs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=z7zt9DGCTzcNlE38lugQzlcDyKa0SXStTpUCrU/usHhDNMgEB9pYMm0VNhhcNjy9D
 r+B+BAtK+oFwq0/9CkmuUcphNy5FD4udO95Xx04TtCbUuhOINf/aQR/rOPmb7Rh3jT
 WVzOhskqoWaUup0G7kD5nwUa1zKawkm6maiPpWX8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-9c92c420-8192-474d-906c-3f43e1f4d7e0@palmerdabbelt-glaptop1>
References: <mhng-9c92c420-8192-474d-906c-3f43e1f4d7e0@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-9c92c420-8192-474d-906c-3f43e1f4d7e0@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.9
X-PR-Tracked-Commit-Id: 84814460eef9af0fb56a4698341c9cb7996a6312
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8a5f78d98c26c8e2a79ea37224435d2b434453e1
Message-Id: <160227191066.24155.10357688116532044680.pr-tracker-bot@kernel.org>
Date: Fri, 09 Oct 2020 19:31:50 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_153152_292437_24D2FEC8 
X-CRM114-Status: UNSURE (   3.24  )
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

The pull request you sent on Fri, 09 Oct 2020 10:52:09 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8a5f78d98c26c8e2a79ea37224435d2b434453e1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
