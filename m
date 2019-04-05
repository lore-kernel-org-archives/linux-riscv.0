Return-Path: <SRS0=YX5X=SH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387A3C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 01:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C25206DD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 01:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M/EQTzAL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehqQUIZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C25206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=polw6NYL5NMKXt0KJNXt3K25G154pFQxCiiBdUbo82U=; b=M/EQTzALUxFUSN
	zxCudPkJSsuQvBDlsMdGBKyk7yFmVtTXwOF6L1Z+GdaA2tzojpalkdF+Mx4IzCPqMQQEcAoK4V3Xw
	x33zUQ5vJ3gQF0nUYYXg+FEhDuumQO3Tu5NPaZoI4Rvhi97bd3EK6gKotCTv5Nb4wCrMTRESduf5f
	ftgfti2JPzI2T0He3GOAXRq+nnbVGzuz/Ka+/x7eiB4MJ43XQaRZ1K06LowlQCcciKAHC9J3syPoU
	oXFDVc+nccKcII7KxlqTjVOEKNzaHW0CrwagsMQzhJudF0MpUvJI0Z0eX78O4BMF8cR3iW1y63cME
	BhsQoV9N5bwEx2v66Tzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCE4W-0006uz-JK; Fri, 05 Apr 2019 01:55:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCE4T-0006uY-MQ
 for linux-riscv@lists.infradead.org; Fri, 05 Apr 2019 01:55:11 +0000
Subject: Re: [GIT PULL] RISC-V Patches for 5.1-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554429308;
 bh=7RK7k6zFwe59aDB+ZRyHm3AIeEx5K1b8F35cTQk2CQo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ehqQUIZRzyMCmGesa4Qjvzos/wIrI6DK2pyNRavt1b+pegr9R2hCVItGhDnscJtmN
 CVzuvDLpqQ4gj8bZYbJHp6a6wFEUPe5n1gkp2BXGNp8ExtfkxoQZzBd6ge4B0fgdaM
 iyRwlITsXSQIoGD2GA1kK4RJtSOlfn+UI1Xr1gEY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-2bff106e-098e-4cc8-bdb6-48f05d1065d9@palmer-si-x1c4>
References: <mhng-2bff106e-098e-4cc8-bdb6-48f05d1065d9@palmer-si-x1c4>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-2bff106e-098e-4cc8-bdb6-48f05d1065d9@palmer-si-x1c4>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git
 tags/riscv-for-linus-5.1-rc4
X-PR-Tracked-Commit-Id: da4ed37873918eeb4e8db7f0cf55e0a7e18788c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e22ba96d44c4ad5f9970565c54ab1876448a5ca
Message-Id: <155442930872.31474.1009985731463982825.pr-tracker-bot@kernel.org>
Date: Fri, 05 Apr 2019 01:55:08 +0000
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_185509_757195_514C163C 
X-CRM114-Status: UNSURE (   0.80  )
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

The pull request you sent on Thu, 04 Apr 2019 16:29:44 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.1-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e22ba96d44c4ad5f9970565c54ab1876448a5ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
