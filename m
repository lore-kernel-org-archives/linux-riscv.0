Return-Path: <SRS0=YGwO=FQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B221DC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Dec 2020 19:01:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA6822DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Dec 2020 19:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA6822DA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIB3ess++d/bV0q7bw/MyPbq5CTZvF/4JHu0MZM1dfo=; b=0upOtooxUwOIXyt448DHSgWu3O
	CejtBHQN1zkKNLL9FXbrRJ5Sn8peHFJuAsI4HV3xe2eRAFG9HAYsRgKpG14ZjAyhztNjhQkWwN1UQ
	HQBY/sh1ZSWCEq+K3+7Y3dFJc6rlVhj6VWNwHkzeQBv+tk6sk49ElrIb1zwQ+Od2cBzZyhflCTVzC
	7bID3U9wbnO2wvofL4giRxdrowOfJHNoOUfVS78oYabzpQ0LBC+y0+rLN1Tm+zaeeFRfaIc5QVeko
	IO+qt+CnyTN5bBmpj5ANQ5qsB1iVrUYSry3YXEjPqng515Mswtetpe/ZfqKAvINpdXftSgs+55DJK
	qcgvfVLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koA8q-0001M9-47; Sat, 12 Dec 2020 19:01:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koA8n-0001Lr-E4
 for linux-riscv@lists.infradead.org; Sat, 12 Dec 2020 19:01:14 +0000
Subject: Re: [GIT PULL] RISC-V Fixes for 5.10 (unless there's an rc8)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607799672;
 bh=Qymi6OWabOo9at3IXqABFyAKwXjko8RP497ekn2RpD0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EJ8qaLF6pLebNdv0lt/Ax2JCzz91OmGz9w9d+zw74ZUKBWx64ivxKhP0rEHD8TTuj
 KuR0Mu8ljchHIDLEszBaNU8dv2bA7LyBHlOo2JnQF5Urq8+Z4+kezTWfesKC3gkI0D
 uikaRCgEqRAgiBAevAMnjbgFhGTws2zx7wtAy9VsA1Yj+rl9ODEUwiKZQCceg+eZwh
 tx1k9ZwRSURu8qd86Dumspgz1aSeGFudToPIhRWeMlHcuyhIMBnuwVH3I05cZBatHc
 7de4xN1wmz0W5oMEPgnamO7H+9lJyKyZ8WeePgXOeojszhiL7ehuwLpUAIs8ShP0ur
 ENAvrmRrnhutA==
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5e629583-5ff4-4523-bfdf-c4254276d95e@palmerdabbelt-glaptop1>
References: <mhng-5e629583-5ff4-4523-bfdf-c4254276d95e@palmerdabbelt-glaptop1>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-5e629583-5ff4-4523-bfdf-c4254276d95e@palmerdabbelt-glaptop1>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.10-rc8
X-PR-Tracked-Commit-Id: ccbbfd1cbf365b38d014351d1482fedd26282041
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b01deddb8d3cb779ac250978afd200931fd91dcd
Message-Id: <160779967212.16081.8987627923420642735.pr-tracker-bot@kernel.org>
Date: Sat, 12 Dec 2020 19:01:12 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201212_140113_579587_28A62B42 
X-CRM114-Status: UNSURE (   3.04  )
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

The pull request you sent on Fri, 11 Dec 2020 13:41:44 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b01deddb8d3cb779ac250978afd200931fd91dcd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
