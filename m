Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/Kp8irUOW5CgM5KSbq9FveMQYM3VXOd5EMnEWxA7Ds=; b=vBB7CAo9pKq62z
	GruHwzX6bRB7Cf9S1GajQw8rnipJBR3/25G6UwYjNwSIjG8k9HI4LsDbCiw7QBIoAiycLZNdIX6om
	wMD5pHIlTrMDcneRRoewB+pasC7ieTNeCivyTt4+B9tKP17fJPqjU+G5T4rgiL/b1fsv2Zmi3+nLG
	XENlsOOmQ/sPCEFEo9SuHBaa2QKnTl2OUDJTs9Hg9wW1txh3SOJZW+K0fABd789Y/PKuAWsvKG8ls
	b2MihAo4jfLL6UXjEjxaaVyKWHS/FnhcaFtGdgkLzckFHWvOoPWRq+YPfVxsDeCJx+vYxcRpXoXVT
	3Rl4OZHehdMPGCQG9w3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQERE-00BwnF-O6; Fri, 04 Mar 2022 20:22:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQERB-00BwlW-SP
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:22:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1607EB82B91;
 Fri,  4 Mar 2022 20:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1558C340F7;
 Fri,  4 Mar 2022 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646425321;
 bh=H423vNR5/GHC3sZBG5YTvZoSdAAdPzHDpUFsfHOwgok=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jL9fKtgNT8RUuTmyLKe7OtTOkr/n78NaDX2BqRILI89Zx5rEqQeh85Bf9+12pR+Fa
 r5r83WeRQquK7yxKg89WaJwnHr/ZAzAZq7A0kb6BUG0exPSkzZ42QATSPqw9HqvYEY
 4IZg2N8Y8K6Pkj6mPPLJ5L/SmQD3EtUrU35xwwmFX+hBCFtFaDdEEAxSUVFO8tnsxM
 tC1cYoe20nSJi9c9Ud/RcAvHmW40GIlvU8FiyYVfy7ew0Sk5+37nUuSE6LsCEL/VJB
 uDpINQR6+5SSUAp9/IYxKhosdeBFFRzSKEJdwhriXKtqGjBFJDuLQjC+2tGeM0a9oO
 vpixXhdKPoaqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8F135E6D4BB; Fri,  4 Mar 2022 20:22:01 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.17-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-35bc28f8-875e-45d8-8c8d-869bb9efce61@palmer-mbp2014>
References: <mhng-35bc28f8-875e-45d8-8c8d-869bb9efce61@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-35bc28f8-875e-45d8-8c8d-869bb9efce61@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.17-rc7
X-PR-Tracked-Commit-Id: 74583f1b92cb3bbba1a3741cea237545c56f506c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 07ebd38a0da24d2534da57b4841346379db9f354
Message-Id: <164642532157.24805.457490534031372221.pr-tracker-bot@kernel.org>
Date: Fri, 04 Mar 2022 20:22:01 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_122206_107144_28B09F89 
X-CRM114-Status: UNSURE (   4.57  )
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

The pull request you sent on Fri, 04 Mar 2022 08:54:13 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/07ebd38a0da24d2534da57b4841346379db9f354

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
