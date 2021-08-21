Return-Path: <SRS0=a5+H=NM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749A3C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Aug 2021 18:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EE06121F
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Aug 2021 18:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35EE06121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffkGusrp3TIBJ2C1wrb0GL0cjNM7DxXezxL+60cW4BE=; b=UDMWCPZ8QqXEFF
	KB1mYUJ6GjGkmzzgv6j7R2Nr8VWjWq9P0RvOCbBz1Fyuvi39eOfyCmEvkpMtqNfAHYNk258c7/1mJ
	VFLzx27H5cI4Yjorhlw0o9bdJ3vBPONKZ1Wnk/GMJGLsMmUU5HSJzwakhfzgzA+xOHB+XyY8MwUQ2
	dszmrC4eWb5pB1dNuc3nZLORJRaNuCGmoxRlugPL4zQXGJah8d0mYm19/Xc/TLJglPVsDEe3xDmw0
	dz2HdE5k/Cto4Gsc8l9nuZU3QdJ7FYjoTj+nukvxdl88C4yRhqXWIRuszzLe/eVWPT8TFNs66JQlk
	qshWATWxhLcHoUM09N2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHVmA-00D5HK-LA; Sat, 21 Aug 2021 18:31:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHVm8-00D5FD-Ay
 for linux-riscv@lists.infradead.org; Sat, 21 Aug 2021 18:31:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1BC0561184;
 Sat, 21 Aug 2021 18:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629570671;
 bh=BpQqXvAho9CbXg0NpQBYb1l0B79F8xSK87cdIzZ/PgY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qThNznKKx7fr69LaqCCC5VAjnYpjNOjFWajNChqAJ0MYAUpcICYCHdkbPh06tDuHJ
 o1gJCGQITw1TI/qmsa1gfVzhA6rwkLVmwvZmsVRzikMrDh40Ix0U3/5//bb6PerLg8
 vF+kPGx0K8xF+8lNxygdveqmNVOw5kpib9Gvkw/HHGUlyXrYOYPe1vSHXIsTJ5oFL5
 6415sPE1Mwdijd5Sk67dtwQKGYyh09LX0OPGLRXFjE5zWPyXBtbIt33u1E7AOKQgSd
 R6v44JaaZ7TvndauQpVCB8pzbaNdONLxS/Em2cn0l8cZMbGDhmGxbtzEiPtQPOxSMX
 8EviSncGHBisw==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.14-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-182cc50e-78d7-4a85-a5bc-19e7a4648e87@palmerdabbelt-glaptop>
References: <mhng-182cc50e-78d7-4a85-a5bc-19e7a4648e87@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-182cc50e-78d7-4a85-a5bc-19e7a4648e87@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.14-rc7
X-PR-Tracked-Commit-Id: aa3e1ba32e553e611a58145c2eb349802feaa6eb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a09434f181f3ae3a0a6a42bfcf0dc375f0eb26a2
Message-Id: <162957067097.18934.15011514073992976615.pr-tracker-bot@kernel.org>
Date: Sat, 21 Aug 2021 18:31:10 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_113124_444427_8BCA1DC7 
X-CRM114-Status: UNSURE (   2.52  )
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

The pull request you sent on Sat, 21 Aug 2021 08:38:34 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a09434f181f3ae3a0a6a42bfcf0dc375f0eb26a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
