Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F243ACA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gz74dX4yTMoQmgoV3F8oWPzcXMqiTp3QBPRo01jtrfw=; b=11Zcvre8cprLts
	pflGAJJXNChv/EUGDBESuMpa4HeG5Frl2mJAxdjIjp4cSdzZVIPrks2+vbg7BwCFUCKS5rAxvoOwO
	Aimw2mYd/2VVQm3iGaZ6BUBLbmvAWbdQGJdauYMGcsqw5COLXmAlF3sXb5FjNzWMcvV38z5a1oTBc
	RtmC5l63GUWoJrtGf+RlV/BmBP3CCVVmsOIeW8LRkLbUXh8nRujuqAKPTJy0wXSwSVbwMO87DD5Fh
	qtF5INXODNLAyg6wyqezohjZT0luxLBd3neoc/TBd0VKugImgNxKoar/ER2saEKlcOIgiCWO7tvA+
	YyNVOlttiQpNMcsGbPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5zL-0005cJ-1R;
	Fri, 01 Sep 2023 15:23:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc5zI-0005bW-2C
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 15:23:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 825CBB82550;
	Fri,  1 Sep 2023 15:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D014C433C8;
	Fri,  1 Sep 2023 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693581784;
	bh=zsK3hxQv9IBEn48Em2SCl8YjvJHL4gPCyfQQqAB8FTg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TD3TUbiKTnZ1N793pG6VvsEkPQQ4kw34bNpMVqr6bQ0JyPCZdtRDArJYd2LzzsrHS
	 bXSqbA4P4suxtMItZw4kZjESSnBkAmqjcDPBzdMDuMlgIi6+M12SzJHxCMtNvMLVDX
	 GwmVujd9ylkxtTaMhNsFll4kFx0rpKoYq+YKUqV8n2Zlopuqol1Kuopn0TRVzo4ajv
	 4E4LyTH3VrWOU+PymgppYukU/NKWrfH94Y40cWkX2B88SNFEBUr5iElVqfqASogpqQ
	 /zLFhfS4gnTHxQlxFMMlkKLeKh6KYANscg+yO7WZPfIcBsugThCE/C0KA36I9TWobt
	 x0eGgQ5InjHbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1B2D1C64457;
	Fri,  1 Sep 2023 15:23:04 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
References: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-d12081f2-1ff7-4f68-b320-f3aa5c458365@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw1
X-PR-Tracked-Commit-Id: 89775a27ff6d0396b44de0d6f44dcbc25221fdda
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9
Message-Id: <169358178410.20073.15929170829792331101.pr-tracker-bot@kernel.org>
Date: Fri, 01 Sep 2023 15:23:04 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_082308_861558_526C36D0 
X-CRM114-Status: UNSURE (   4.45  )
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

The pull request you sent on Fri, 01 Sep 2023 07:41:21 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
