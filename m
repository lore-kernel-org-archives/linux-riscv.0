Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60828C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eSiFZfvkoXcCpQxN6NCN/Zq8f/FjdqESSwdbX5tyzc=; b=D2OWPPUA5RT+Re
	s/Gdf5ZHNUSdRIAqFApxGD4KjQnF0ORwIwMVEtDhhCS7d96UoJQO9l8w/sKmKNPOn69cpRKnQK5HC
	1I39C01f8xrm0oKfdeWp/S/UbyJPZFQx+wBuDRGr/j3aeXsyHr3jZi+ZcxXxUm/YyyF+gt00sJh/s
	KVZ9Zjw6oJ3c2Q9u/wfSJRFbeS6OYCDlT25wCwdlPfk8pcYJTaCsKF767xp8IDwH85oEEwSOoEOFp
	L981WqinRs+sLcAONmXpdXiWRXbqH98QwBxMfgRpjVeWYhEWoldm1VbdgP7CpoHOOgpp5ln+f2mW+
	hnIw3FJnvTCBu3xzzRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5b9b-004JkV-Pl; Wed, 14 Dec 2022 23:27:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5b9Z-004Jhf-2B
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 23:27:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FDA361C58;
	Wed, 14 Dec 2022 23:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3862C433EF;
	Wed, 14 Dec 2022 23:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671060427;
	bh=Bk/6T0xJfpqUaFErXxHCWGAyejbt5gi8N/dlodCrvmE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O0npsNKRTBv7xdfSHEFonm1cec2iBIlthaHErQt+/sxSkxebLKQW2YCXAUgXATyTP
	 BnR7mByArsCn7lje2HdIaycVcP3OHVtSv0JpB9YK/amdDU4oc1SyME8QqRnUaH82s9
	 Vk5hwFOD3gIkYqxnP7AdPsOwLbxsmFoS2bFTkP9gT+8aik2iTvLRVH/amrLvLQxXoC
	 u8Sbsp5oKoEjRa8vnuQm5X/qHyzkTkVU+/KTI7YD8GaXiU4MiXTa79u2VMCtYVFIn/
	 dPMJbtjCmYkuWK+vIxWidIQjYaTuQj3fTrK4GHH9TXSizQV+vmhEHqNJjuU7YvngVR
	 QCmoQQt5jz/jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1E1AC395EA;
	Wed, 14 Dec 2022 23:27:07 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.2 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-f76eb33c-7cc1-426f-8f29-37f6bb78baec@palmer-ri-x1c9>
References: <mhng-f76eb33c-7cc1-426f-8f29-37f6bb78baec@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-f76eb33c-7cc1-426f-8f29-37f6bb78baec@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-mw1
X-PR-Tracked-Commit-Id: 6e66e96e31b81fb08075d18a3e2c201f1e2171da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb67d239f3aa1711afb0a42eab50459d9f3d672e
Message-Id: <167106042785.23862.14625886517446517728.pr-tracker-bot@kernel.org>
Date: Wed, 14 Dec 2022 23:27:07 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_152709_184196_38CDD9B7 
X-CRM114-Status: UNSURE (   4.10  )
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

The pull request you sent on Wed, 14 Dec 2022 10:40:05 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb67d239f3aa1711afb0a42eab50459d9f3d672e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
