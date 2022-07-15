Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA586C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCH2G80GQrFkmOI9uK+1D4LxG/pi1lwXo2mA+RC+cb4=; b=nszH7vQ+P5Cdg+
	gbvOXwJybNLMJjyjKzdnpFAzZZnyXss+TNgErLmFk425t7tFjUyv5hYYVGs1dFOARMyQ6mqd4kQVQ
	YHqlFrdLH87mOqsU2p/xb7qxszGMlkjZEEmR41O0H2LkeqoRqXHodWBbgpVaVKlYir/rx2hP32ZJ0
	sr8W/Jm1yG64ZloU9N3srsqn45K+rXBAeblJq3szE32MP7TrexG87YW/E8iPjVg3VMhNuVG57Q1kt
	Sx0d8K9gaN0nsCPhFS0SePCbfT4e0R+Ncb4JfvmOtgXNLZp+hWPl4vlz7SAiJIXlTuJ59Zyhm01Tv
	y8UyJnTjd5iY5r5X0C4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPNl-009FO6-1j; Fri, 15 Jul 2022 17:45:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPNa-009FFV-7X
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:45:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0FB45B82D71;
	Fri, 15 Jul 2022 17:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9246C3411E;
	Fri, 15 Jul 2022 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657907124;
	bh=4bmwIl2o7x4YCO14Yf2yJMsubjRYvJUEn6M6BhjyEEU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DgbcPaBJHu0OEOPoXOHrdWcLG4VNqBef7AFzFVEesezf0yOfW+h6IgghroXdxSi7s
	 SmM/iOxOtyPwqjzHWczWTnzfUwvTTk+R+Ipwm3sibhi99ZKzQ/P9K4+88LOWW8dcUB
	 2YPDcWoIe5oj0rBwrp/R+A+GvkcyS5ch6hv81z0RhG4k5O7Aa87L/mSY+/wolpbYDe
	 RhKcXrfGtD6cwn0bVvJ6uxf34W3udvMOY1iZ8YYVscu79MrYxi2cCmTLC0dIIuSr0w
	 9y4XZ90aUddX8yr9O4gHO/K9u6C1Hz0CrhBgDVE/qQXKE9vrschyAxAx+Q+5GAcxpn
	 4Sk1RYsjb4ceg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8419E4521F;
	Fri, 15 Jul 2022 17:45:24 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-077c44de-b969-4894-9547-066c73040835@palmer-ri-x1c9>
References: <mhng-077c44de-b969-4894-9547-066c73040835@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-077c44de-b969-4894-9547-066c73040835@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc7
X-PR-Tracked-Commit-Id: 7fccd723912702acfc2d75e8f0596982534f7f24
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b59ec8d50a1f28747ceff9a4f39af5deba9540e
Message-Id: <165790712475.27298.12426922399606935955.pr-tracker-bot@kernel.org>
Date: Fri, 15 Jul 2022 17:45:24 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_104530_458288_C6CFA853 
X-CRM114-Status: UNSURE (   4.20  )
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

The pull request you sent on Fri, 15 Jul 2022 10:31:09 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b59ec8d50a1f28747ceff9a4f39af5deba9540e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
