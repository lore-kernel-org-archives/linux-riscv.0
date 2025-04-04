Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DA1C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoXbSUAJd+UvJU3IzGVkSLTF0pDvY+i33XKMZQkMNN0=; b=CgMPF3rx2UwX4j
	1GuzQ3H4W8cn3s6cjJQc8mQhCoI0fIG6x6HAzejlyjzbCoFjhyAftdPTh70tW+pBq4aiRFLbuUZ3r
	kT8KB39OAB5+gIji4cbzFxNlMW6mBQfcSk0WhBga+oo3qJl4FVKlp090TX3nNkTowcwhHa8rjbG/v
	YtLb2B7f0Lz6NSZmmn6znPD/303qL/gHWWgSCBP5S0pB+0sM36y7tLrGdZJLCabe/CcsjNBnLFkul
	x4P1kfRxzpjGhQKOMvjbVixWe7yUs076GGOu0mbcuPF5zrGTG4t8CAshWvV2c+XqVNGDnLDU0sgCK
	ApTCvPWUYETRUc7RfBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kQN-0000000CMVp-2yLK;
	Fri, 04 Apr 2025 17:01:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kQ8-0000000CMSZ-1LnL
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 17:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E00D5C6742;
	Fri,  4 Apr 2025 16:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58293C4CEDD;
	Fri,  4 Apr 2025 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786091;
	bh=hrukEFpy9+Jy1KGZ/zOcraALjOes3wwq2y1IvPEmVgU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ufgNuT2+Z8pW6YujcnmcUxLdRXczWBB80yEixaJhbST/+tLYkJb53knCzWV6Iw/gD
	 3INbTLIB6yb9GJmnJfKosKhxtUnfy7tBVEc3Zk+Hh7x8s/zgkfMLw5BqT7LgbGjY2S
	 JqI7l1zcNfxqtx2FXxzb4dwo4wO/dA5bDmAy8W4nu54u5Vd5PGzvk97+v6n7ZKI8YW
	 QA2Jt5g50vWleSs/PstgmY4BzLfEHB/ngFGAXrAVIlvTWcgFmiz2T7dbh6zQITc5Sp
	 zyrxzUmUGpMzaBeunkbyf5Lm71EfKDgmB5YP52M11JBlyqtsdNpMQUls0uEIkYoeTy
	 Kv0AKK6iac/nQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE9833822D28;
	Fri,  4 Apr 2025 17:02:09 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1
X-PR-Tracked-Commit-Id: 3eb64093f533a29d3291a463fd65126bf430ba60
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a1d8ababde685a77fd4fd61e58f973cbdf29f8c
Message-Id: <174378612858.3331400.13861432422726874558.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:02:08 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_100132_411814_0F73F032 
X-CRM114-Status: UNSURE (   3.38  )
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

The pull request you sent on Fri, 04 Apr 2025 08:58:06 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a1d8ababde685a77fd4fd61e58f973cbdf29f8c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
