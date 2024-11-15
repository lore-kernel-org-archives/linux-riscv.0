Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F8D68BCF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7OphkatK7LAK1ft186LA67+rzYVxlUP3YLI9yRbnwg=; b=DrGbyWejsoQrMC
	5v5wqFEgAqI6ZQQJCo0YuPueyBSPyZIGbhX+/2UdALysI0v7AAOcx//8LTEYS2ry6DaUpDXHNpRS1
	jg0n398I3dl+0YmTI7CPmf4McmETOf9TH+qKQhTcGu5MsZLNdKdF5ku73qZ+FrSmKNGSFJY5s56Ni
	cHBn/NSx2aTIQeXJ0tXVd88z22aWJxl2tbmtCcMV3kkQ9wwfRkoywuB2jGu84qZJY3jWb093cL8ah
	R6YNL2BFT2dbsxYwkYNH59SXk+wy9igUzIMKxCSkLo5D2jZWpl4pz9f+TLEkbdzYnYG/D2bKkg1iH
	bqFxW2yBV9C+mdlZEhqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2JH-00000003uv3-3wdK;
	Fri, 15 Nov 2024 19:48:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2JF-00000003utt-2Ka2
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 19:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6083A42C66;
	Fri, 15 Nov 2024 19:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814C3C4CECF;
	Fri, 15 Nov 2024 19:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731700128;
	bh=x3zXTofVl75+XYZaSjz/i2wGqJZbPhanzMbvQjRGel0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Dq2etV49x7/dxBcuiZ28DhU0qDmr6pTMivRFqCWJNAfzAp2QDJPcH/VA4r7muW6xb
	 gO7lU5nxUkQaF+btdd8tScVswIJufAerlIgDwyt7KlNMTyehG3f0svRaIhN4yYVdi5
	 XGuV4Ud2OBJSPn4cObebU2Mg7X2nyrc/6rnp7PGF6rN2hNkAQemjddH6AaKgaB/FZv
	 sllg+dPaNdiNOjkoDFvrQfXcdPdXgo6/8pStHvAdho0SVqxSfitD53LR/swqS3nqzA
	 2ZLoYfVi/ksSr0SttpzroiZtJGStJXfp9NcLVqwI/UwQY2Ko+iCYS8aO5dvhYgDw4P
	 ilhd5m04Nhejw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 720B83809A80;
	Fri, 15 Nov 2024 19:49:00 +0000 (UTC)
Subject: Re: [GIT PULL] A Single RISC-V Fix for 6.12-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-257c7a1f-aca6-48f9-b3ec-6a4673f8d33e@palmer-ri-x1c9>
References: <mhng-257c7a1f-aca6-48f9-b3ec-6a4673f8d33e@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-257c7a1f-aca6-48f9-b3ec-6a4673f8d33e@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-rc8
X-PR-Tracked-Commit-Id: 57f7c7dc78cd09622b12920d92b40c1ce11b234e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e8bdb3c8be08c9a3edc0a373c0aa8729355a0705
Message-Id: <173170013917.2698975.1950787133841750972.pr-tracker-bot@kernel.org>
Date: Fri, 15 Nov 2024 19:48:59 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_114849_803356_2E62D102 
X-CRM114-Status: UNSURE (   3.47  )
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

The pull request you sent on Fri, 15 Nov 2024 07:38:59 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e8bdb3c8be08c9a3edc0a373c0aa8729355a0705

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
