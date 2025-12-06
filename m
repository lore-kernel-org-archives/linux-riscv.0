Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B93CD3ABD5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 01:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5BdJllz78BkBStW2nLpKJPdAMzKXckJDD9Y3HGMxZY=; b=tzybsCQCji1f69
	4/nbiqat8tfJmXYUKs6mk+eVSdb4fVnLKeHEN5XMHCCx9B7PBpHiLCXx7PfnYFgjSMZrhEsTyMJTn
	x7x/SAPqmx6nCV8VJhjsywWE8PO3/pJYncHaqApNmFs6dxAcDH6sDhr9AbZfvlQdZflIcHGA4h0o9
	NccZ2bxA3M694qaSaHvruU/9pthcivZtbMFz8ySaKQlJ1UjjVzZai4Z5wwhr2B8E17AJP1NGDUQn6
	8Kw1sXKyIpIRPTAVEXSDDFW3L0IubwMasDnwcFizv725jIWreSgEeGrY3qa041M3sF/jGr10ZtYDI
	qsM3j3zDxYKu82pA8J0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRh1R-0000000AQ7w-1886;
	Sat, 06 Dec 2025 01:23:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRh1P-0000000AQ7m-3Nw6
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 01:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9D3D60127;
	Sat,  6 Dec 2025 01:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0F0C4CEF1;
	Sat,  6 Dec 2025 01:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764984218;
	bh=vNc7EiYFdBnK4eun6xh531tyyEP2yw2Sjg3Dc6e7o2c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KH8mrp2PCwSR0jUszro7/Gs4OZXn4NosECk8g1o5nwrLeexLPa0unFqY1aeC5/eWY
	 T3jAxFnKAsdXbSn3wJ2oRp9XudUMaiUWr6tg31Tj0f0q/CLliKlYp9fnz6d5sS6Il8
	 wCkAq07Eg+6X0Fe90pRcdK9qxsS0evQfO4AAQjM8S5UIYNQo0SWROby0wi0rTsWtWI
	 q7tp9fajNAYULBdI0X0Im9Qg9ybX3535ZXx7sAYVko0nLLi/aMQqrqqTVuCROWA8vL
	 4xw5mK0C9O2WN4tiOm7N/pOTOYV1nPoO85cI1r2qVAfi3yVFAAOo5T57rGsOE7HHHg
	 s3u/DZrfUXG3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BAB03808200;
	Sat,  6 Dec 2025 01:20:37 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for the v6.19 merge window (part one)
From: pr-tracker-bot@kernel.org
In-Reply-To: <6b437742-e1c2-f6dd-61c8-fb3de45d3351@kernel.org>
References: <6b437742-e1c2-f6dd-61c8-fb3de45d3351@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <6b437742-e1c2-f6dd-61c8-fb3de45d3351@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-mw1
X-PR-Tracked-Commit-Id: a131fd60796dbfaa6297c0c8ca8e2a7610a64281
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 07025b51c1149951d64804c73014499bb3564dca
Message-Id: <176498403571.1907434.16735367819986276747.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 01:20:35 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Thu, 4 Dec 2025 12:19:20 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/07025b51c1149951d64804c73014499bb3564dca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
