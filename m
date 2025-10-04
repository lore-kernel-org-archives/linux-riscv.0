Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B54ACAC5B0
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Oct 2025 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dK8obCmaldTFLZs1vTxRgLu/DJ2+30mB6RV/lZrZ9U=; b=Ko/hSwgaH1VOcU
	29DuGyDP4jUomhXhS4Rs0HOsv1mYOQpOLDm1KVXeu7GuYoNThxGcwyiqkCrxPTXvHrkzHl7X5t9lj
	c23vBQ8PxbmNxEh21ipCiESD+k4xVilNihGxPZeI4vge7mct0JLFdzC9P+JYVJwm3pEMNKBz4ZgSJ
	2jmQSH3/cG6SZd0B2tn2ODoxQseNIvDqItIkrwDAf5iz83jaZc0hLX8j6Bu1esHC3E5Xp//0BSBUB
	rFO7J9+r84swmcTceeqxQYoUT7Qr9IMw9C9qCEDK5xwLs6PxOq05CcAddGf+L1FnLUlcSIWscFpRe
	gA9BBjeM60wuPlJh/NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v56re-0000000DucQ-04Dh;
	Sat, 04 Oct 2025 18:20:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v56rb-0000000DubT-1fH6
	for linux-riscv@lists.infradead.org;
	Sat, 04 Oct 2025 18:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1925B40293;
	Sat,  4 Oct 2025 18:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE35C4CEF1;
	Sat,  4 Oct 2025 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759602011;
	bh=LWyOYfxw3MwQ9nGvrV02gHWS8s0vVhG1UTs23PxZ990=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VqXMIF9SnMgW/wj3N4Pl/8shePA2hCDrJLnnkUOkVsOcw9nLfesQd0w5eZScA+z69
	 /wQ+E3aNwjlsjXUjNmNOg6OtgscAGY9t+xEnXHsth6DrMKtRpF3Vzi/83myA69Bfk/
	 ReZ1x1wIsT+pAoxOwkJWrMn1CDjA1pDz3o+mavg1gvmhT94Z9ELq+FrnESUT7is2D7
	 EdB04M2ZiN84/JY9R1srbUthYXnvNQXrEABsUNL97HVJTkkipWdEgek25PcKo5rok6
	 XtpycsvtxICl0c+UU4r/l+4o7I4EyMac2ZtnglpsrR1YS1aJPFsbikEWNs56i9C91f
	 CzM/8SFvTUUHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC69D39D0C1A;
	Sat,  4 Oct 2025 18:20:02 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for the v6.18 merge window (part two)
From: pr-tracker-bot@kernel.org
In-Reply-To: <9a4eb234-b19c-8051-472b-4bd793a9e252@kernel.org>
References: <9a4eb234-b19c-8051-472b-4bd793a9e252@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <9a4eb234-b19c-8051-472b-4bd793a9e252@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-mw2
X-PR-Tracked-Commit-Id: 68247d45c045bb7dda923cf2c8d0937ce0e16394
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86bcf7be1e26f2d7277df90857d93ce0ebc11370
Message-Id: <175960200167.404121.1670961737666843192.pr-tracker-bot@kernel.org>
Date: Sat, 04 Oct 2025 18:20:01 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_112011_457755_EA7ABE08 
X-CRM114-Status: UNSURE (   3.66  )
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

The pull request you sent on Fri, 3 Oct 2025 01:19:20 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86bcf7be1e26f2d7277df90857d93ce0ebc11370

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
