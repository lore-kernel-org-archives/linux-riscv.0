Return-Path: <SRS0=HnHo=DJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E1DC4363C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 17:15:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5F2221ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 17:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taHFoYG0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6lMdS7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F5F2221ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdYyNWALc2eLOaG5ZjVS/4BSrK31zneWJJ7ifoVrfZQ=; b=taHFoYG0HV4F9qDEPJwVcd7vXS
	Pd4frL6O1N6OqKEBKYpJIighfYGnQc+EPUyhoKuRqFxqPIUis0hhR7NuD2hlnHCWJ2vWYbnII6HA3
	Vz0kb8L0aGRi8q6J8frhOwcHLN4A2DUtdt1pjSxHWusqRBWlxbsYZwkWanYdFRkwh6yzdWSHg5KVk
	WuMv6WXw8MIZ3jP6nAVYHb3qmDP+W/EQ5SewFEmdYOtCiaP5ul6twmRGkiJEMb/h5Cn0L5u7k2BQW
	SqNIRJq2YYCUYe/aKjdUaVwAQI9YDovRWkPkivBB+SsApJYyLHRAKvINzxds90dDeN4jHXn3sY9uF
	20cVAYSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOOeN-0003gD-IZ; Fri, 02 Oct 2020 17:15:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOOeL-0003fT-9C
 for linux-riscv@lists.infradead.org; Fri, 02 Oct 2020 17:15:18 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601658915;
 bh=2gOw3rFZ0CEbfGZohi7BOoFCnK+ojgeKb24AibqNMbw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=D6lMdS7+DoASzODjoms90StZeNk5uGOiBZFDU/8C3MZJlPirVUh+J903Uo5HcTzTI
 s2pxZZJB9+cUnGLaT3VGrJWcnjNb++7iHyMCdKX+Liog4IMFsgq/vmVML6Kly1YKVy
 nheYTiSq8z3uF9m/spMRfLTwDlAGb8saRg5jNun8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-c32d6fbf-32dd-45ed-90f1-ffbb7e455aaa@palmerdabbelt-glaptop1>
References: <mhng-c32d6fbf-32dd-45ed-90f1-ffbb7e455aaa@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-c32d6fbf-32dd-45ed-90f1-ffbb7e455aaa@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.9-rc8
X-PR-Tracked-Commit-Id: aa9887608e77b835d51f05a54940380391cd4e21
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db23baa28eb1f93df1fc175a419e7ffe5b6f1582
Message-Id: <160165891570.31225.15852894813234950380.pr-tracker-bot@kernel.org>
Date: Fri, 02 Oct 2020 17:15:15 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_131517_410412_DD736187 
X-CRM114-Status: UNSURE (   3.32  )
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

The pull request you sent on Fri, 02 Oct 2020 09:07:27 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db23baa28eb1f93df1fc175a419e7ffe5b6f1582

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
