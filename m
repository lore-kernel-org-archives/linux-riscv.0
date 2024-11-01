Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3787DE6F068
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 18:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z958E9x1cfp8u3Bu2TI73FxQYoDmN9H4/gbY60qhR2Y=; b=Hg5qVh9bQcwCbS
	EnSc+n87kH7ZxBf2tKlrTAMJGFRXbbB1XM9Z4gYQZ50Y6DKwoJDs27fDx5LiDyVk5z8KOPIaEsaZs
	7K80Aqb/5sNNfPk9oFM2GxlLdUs7/QB3297CNOyd8tn3XoHPFRvhy5FDh3JGockhb0ubxk3y2oWSf
	7qH56mU/PbQhEWLsF5Op/5rqqjkgH0cy/BG8Dna3ZryvGarvfxF/4nMMG48kBEqjkibW0PcfCkId4
	EvwPH0g68C7wx1Kt+995ZhOa1InuHuDz5uAIdDmedwffX/jkesvhQOSRjW6CEzCv6ba3hgXrpEgt9
	rsZFY6UBVsph3glc95uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wV3-000000080L1-02xM;
	Fri, 01 Nov 2024 18:35:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wTL-00000007zwW-1LQE
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 18:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07A7FA44B0C;
	Fri,  1 Nov 2024 18:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4BEC4CECD;
	Fri,  1 Nov 2024 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730486050;
	bh=MbhXJ6KigiiB9kcgFI8fxawUNj7X1a6YEFEE3dOg2HQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kk0YtDxqMd3WNWxBp2i3MJVWodInY/669lE4RSZSs5b3xWNjk6OZXYIRHi6CL4WD3
	 c/wwGOKYcuk+GN6RRALFt/lntkmFcj8KvSQaBgjKqOAHyLirXaUVSWqyx6ko3v+U1K
	 HflSBEIyGgUKDCMypj+jqjhPTfc8J9F77osBQscZVMO82OZ+bQtmMIYc6xNn/20gyi
	 my7fX6Vcih1ZwKFntiD8PrI/VZlZZqqmlGxC9eTsYaNvxRXJ5i8rHhv/DWmMu5U82n
	 eFAWDe9XukEgCY0G7/ZTgCl7k7t1iKrPrRWSF6JJHmRgsliYbVl+12CYE6l6HtpLj9
	 nwZDhrR1Fzhtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE323AB8A8B;
	Fri,  1 Nov 2024 18:34:19 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.11-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-26039e8c-5759-4214-aaaa-765d5736b6a4@palmer-ri-x1c9>
References: <mhng-26039e8c-5759-4214-aaaa-765d5736b6a4@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-26039e8c-5759-4214-aaaa-765d5736b6a4@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc6
X-PR-Tracked-Commit-Id: 5f153a692bacc295f213e2c632ca557979fad7be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a031e154043984cc5a073c1b7fe62abdbe25c0c6
Message-Id: <173048605836.2776063.5580936810338977798.pr-tracker-bot@kernel.org>
Date: Fri, 01 Nov 2024 18:34:18 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_113411_440890_9C14D883 
X-CRM114-Status: UNSURE (   3.36  )
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

The pull request you sent on Fri, 01 Nov 2024 07:55:27 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a031e154043984cc5a073c1b7fe62abdbe25c0c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
