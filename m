Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672E3C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1xCwmU/cMaLsMeNpDMKi5OhwyEYezqAAOLmwUBANdY=; b=R7joxOWcZ0RkfC
	nojE5T8OCEcrrwcBaNofS6f0E15Sc2bv2je0M2JLVuzzeEyFBk1OOVjaT1re6uGQ+HmR0p1xfybtc
	VuzNGLcYDkBooZKjEl3SWCRaUDK7i7xnxESlp5VxXIySma+iNlyCD3z5T2pec405oW9aU+dCGmNJY
	+cXwysIInsygg+/wOFCFBgh6myMUF/h5L6Y2QBf3IdymmoB6AOXV7ywHd1ROhxFI1SJKMx02fSKkA
	8DOsa6JAsv1ltMUKeGmu7LLhFMak6Id+FkytxdLOU7ZRwoNM1GXZm328LGMhxLVcNks2U+eS+6n7G
	d39Be3WMT6hSZ6gdtBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEywN-009maq-8n; Fri, 22 Jul 2022 20:08:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEywL-009mZc-12
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 20:08:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADF6361FF6;
	Fri, 22 Jul 2022 20:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67239C36AE3;
	Fri, 22 Jul 2022 20:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658520478;
	bh=047vuiVh4+fUv3R154SIkND9ErP2jOTV1nb7kERwWyY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ltSWbRFuZPSAb7I1djmAzkCi3V/IISG/hxhZntTTTA7F4GYy2ZDp/H/1Jxj3ul4Rq
	 qB//eQyMKBLEWPHdzFlWrz3LgSyYT8Kp9T0Lrfnqo9JMNWtn2cY4j/vQ3ejCY2VKu0
	 05XBIgX4u030Y2z+8XcoqYFczVpM0eQoWdnPHdqqONBms29JjwFi4q2jYmXfMi6FXZ
	 7u7dUrPXAprD9c2UiCMf5rdT+CVIqPfpI2gH+YbqZeGjQZuQ4P7V57eudp4NlzP/fK
	 3sBZGCkiChEPirjfzl+t5I+CqhBCP9nNYs7jvv8toMByOBPOupBicOUxTGv1bkGkiH
	 W+fzHcCRSbJrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54C20D9DDDD;
	Fri, 22 Jul 2022 20:07:58 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-84a83727-f880-4d8a-b9df-0c45accff355@palmer-mbp2014>
References: <mhng-84a83727-f880-4d8a-b9df-0c45accff355@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-84a83727-f880-4d8a-b9df-0c45accff355@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc8
X-PR-Tracked-Commit-Id: c1f6eff304e4dfa4558b6a8c6b2d26a91db6c998
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70664fc10c0d722ec79d746d8ac1db8546c94114
Message-Id: <165852047834.15752.10120575058452443828.pr-tracker-bot@kernel.org>
Date: Fri, 22 Jul 2022 20:07:58 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_130801_143600_3D88B88D 
X-CRM114-Status: UNSURE (   4.39  )
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

The pull request you sent on Fri, 22 Jul 2022 08:52:11 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70664fc10c0d722ec79d746d8ac1db8546c94114

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
