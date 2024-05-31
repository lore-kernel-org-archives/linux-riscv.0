Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E58FC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 19:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHgvqwQCQOx3fycB5OjoJyA52rA9kluo0dckMPaX0uU=; b=UYcv7t/oDfxdtO
	DGIOOL6Mm7/BWfUmrwWthMmGTinWTm0KF+XVw0id73MniMAy6VDjusw+OkExuCHSzPWruoghJfrHx
	1e144NpTF8H/wHjw0AR6jRu/buVelSaxd6bgAQ+TRwIpHdCmCYXs4Y8Hkw3DD+6n9rv4DtIGSksY7
	SK3leKscUg9t3/DRfHVyWAvN9ha0M2jNAChV2/xKVJqwnaymYBZYipmXlyy4lzxHwgfsMBgwFdwzw
	tLbMA4+BTrB0rKSZM/pgdMME6tGHuCNx6+eBCU5efb0IKQGLrlD4Jid/7E+yDnpMn4pMsJHYgpNwA
	ww2peqt0tcgot1O82IHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD7nh-0000000BEzk-2wDA;
	Fri, 31 May 2024 19:20:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD7ne-0000000BEvf-09PT
	for linux-riscv@bombadil.infradead.org;
	Fri, 31 May 2024 19:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Date:Message-Id:References:
	In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x5N2fLIvlPKF4dxhifO6O1Uv2N5YEKUAbJuwliptOto=; b=oXi6MFldgPI6snq2tLtmmLEU9n
	3XBzBBcHvR1wx25SaD01HOGMtyWdsxwv5pi4jLfgm/uvM6KLxebFdtFF+4pnsg+ZN3VuYCzMuhp0l
	1PbAcNr67GKdP5W9BIFURbLs9ci+8z9SSBhILUQbpdZ6ZXYbPhMvCE2FORaVYSkAa5Dli1ldfPOta
	uGS2v947hDH1xbs4WaDPJAvfpJJTzaJGLh/UPEqHiUs/qamtKZWBeeSIeRUG6TyQLJsK0LyYTsHJj
	ikK5aakQQ83dL4gzjRt0kKtSPWZT+fkvsbJw3TsVvOuO4pM7zrmQ6i6bC0U/bqdltX8/npuGBeC6F
	xWftP3Tw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD7nZ-0000000Es9q-29MQ
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 19:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B2BC62E00;
	Fri, 31 May 2024 19:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D961C4AF0C;
	Fri, 31 May 2024 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717183208;
	bh=uvgNr+17dGAuta3h+AvGUhyHsaMfOoqD3cJPO7N8Dso=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h/gLOADhfnPFaTr3kF7dumdjE+R3svsY6PSWoImYWpsXMF/BKicHou9l0aaNdLKNh
	 /4iV5Ig8hWfioCTMsP+TewrJQs0pARlbxMAC1a23OmN9fCGvOf5GGBdnasZpmYZVRD
	 TgVQlf8w4xbDRIzwlvY6fW3gqC6vedKk3m+YVwdAn/OV+hwrdlbnXXmMxiJckbXehg
	 OX8/BJ80qdzhTl1DReEbewJZ/le5Tr/Ar/CEl0z2Uahegl9K1I/qwu3qe6QPoWnnsX
	 lBo23Ohbn8nCcO9OZ1ytZSdP2Qa4S/ZVuQ/4uDHzjGVJHi9FUoyTdy+HOBiuLudDQx
	 hii0DW/wuu3Pw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3081CF21DC;
	Fri, 31 May 2024 19:20:07 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.10-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d5ff54e8-e0e4-4b50-8461-c23eeb95b31d@palmer-ri-x1c9>
References: <mhng-d5ff54e8-e0e4-4b50-8461-c23eeb95b31d@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-d5ff54e8-e0e4-4b50-8461-c23eeb95b31d@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc2
X-PR-Tracked-Commit-Id: 1d84afaf02524d2558e8ca3ca169be2ef720380b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6cc9799b4c16b1bd42de35be563d4fa6ea43799
Message-Id: <171718320798.20247.3141512146525127618.pr-tracker-bot@kernel.org>
Date: Fri, 31 May 2024 19:20:07 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_202021_896537_59D51B31 
X-CRM114-Status: UNSURE (   2.66  )
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

The pull request you sent on Fri, 31 May 2024 09:06:48 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6cc9799b4c16b1bd42de35be563d4fa6ea43799

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
