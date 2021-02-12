Return-Path: <SRS0=T1n8=HO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA84C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 20:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E77264E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Feb 2021 20:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E77264E9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFCmX+ZY4kTu+kVK6cawG17gL9Rx2zu+/rWobJEuhVM=; b=YDFW55yn+lppPw9hMi01f2lTXc
	eLf3iDk8cpZqWj1Z42HHNSAegXf70/AiuStC7tocOoYfRmRlvgpBNxTcix3k4z2zfbAsSeZsZcI0Z
	qQDujgWpe/wGr60awNZPppA0VAOBaj85qnsR8M8wObk5HxRwgg1GQEaJdOSpd5bewD+1zgcUUzTv6
	rokskBtV6PAP1GlPGf5jA0GFZKooQVYUp0WlXLmuDqP79ZNIqBOor2h2HwXsyo/FRErToRU5DSGNa
	C4ZpBjpeoo0ru1pXcjTRL0M+dv3B5lJTvYOSM+7tyKfBF6BdL9n1bRuLn7Qv0SnwCN8MMJ32ldyu4
	IM63RpAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAeo3-0005sM-QB; Fri, 12 Feb 2021 20:12:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAeo1-0005rm-4s
 for linux-riscv@lists.infradead.org; Fri, 12 Feb 2021 20:12:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 7836964E92;
 Fri, 12 Feb 2021 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613160763;
 bh=P8k0fC9BSG9nrXSXE+Vd61XPd/KsPVIhH5V7FyvhpF8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RZk/KN34LM9J0f1Dh9l3maPRYb+H3KuqZ2gq7B5wSRGgfH86mCphZ5NBSvAlNVBX2
 pE2mfuAcerYIcqliIyB4Hi+Wgk77WEjAFN1ZQr7R/wlMUien2Yn4Wwy9BRLEYpbQBo
 iFIBDhPTDA0nRGq9q24IijESHz8VibCPjGYnt8Vp7sbszkIvHxQRhDo++LkXU2X6R7
 LW5zQPnU/M2S/VRvBIuVU0ZmLSee/K9ouVyMv/DOw08jGy42rioOHF8rnNKjH+gph1
 GFE6rS437S4SDcPQpO+2bh63MiDkZHEdVVRT8iG4+t0YKU/3PUilc74NV8k9aLfXXw
 SfiE58MrozYzQ==
Subject: Re: [GIT PULL] A Single RISC-V Fix for 5.11-rc8 (or 5.11)
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-30cf4392-0de1-4d1c-89f6-d260a072350d@palmerdabbelt-glaptop>
References: <mhng-30cf4392-0de1-4d1c-89f6-d260a072350d@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-30cf4392-0de1-4d1c-89f6-d260a072350d@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.11-rc8
X-PR-Tracked-Commit-Id: 3da3cc1b5f47115b16b5ffeeb4bf09ec331b0164
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9516259804123c416c4a9de40bc2e14d686478e
Message-Id: <161316076342.13717.9203449225320030174.pr-tracker-bot@kernel.org>
Date: Fri, 12 Feb 2021 20:12:43 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_151245_293628_30EDC53A 
X-CRM114-Status: UNSURE (   2.44  )
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

The pull request you sent on Fri, 12 Feb 2021 10:30:04 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9516259804123c416c4a9de40bc2e14d686478e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
