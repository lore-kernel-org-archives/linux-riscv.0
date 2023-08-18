Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5712EE498B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSFB20zhth5aYqb4rook4A4v9BkTHYDvTR1KGw/W4WQ=; b=MI/Y2xgu3/MODu
	4tsXS/fIBzv3pnk6XqLnkCoycSWKBdCDRboBwWXnS0uLvdLLn4LS3j80UaY4FNL+P3Yue0uqR+9Xz
	ozXF/Yr6Ki2BIaOUb4IZ7ki9w2RDC6tnPVCrqeraUSya+HvRedWC2spC1mGes38VC67iedFdZTgZ/
	/17V3BY1pF9PnzOKK1rvjR8itB01DYiLqexCHgZ6CMwSsjTo8T7Mw2NQ3aeg02S7KY/UeGLQIHilz
	tcCh8S4L46RHzocFY+k3VuvUSEIOYWOmKzfFSSPTXLKUT+0eR+9l0TL4peU7kwYU4vJJ0JUz8fLq6
	HIYVTTFhNa0ECoLMsqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX3aV-009ony-0M;
	Fri, 18 Aug 2023 17:48:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX3aR-009on1-1L
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 17:48:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E30D626C5;
	Fri, 18 Aug 2023 17:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E2F8C433C7;
	Fri, 18 Aug 2023 17:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692380917;
	bh=pad4GBDqA243dE6LvLTYbftOopFzodX5JXZWRbucixQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=U9yB6KvfgvfOaGwKv0aLKsz8tX8xRouMYh1arbOKHUbnX+LrD+d6FcjnNXWYc1Ugn
	 WujEKrxLGQ+3PRowiR/4kHYA0OZudelYMVCiIpjYd4SFCR2CB1BY6qybZe3UVZuIqA
	 KQnwfsaItT2w2hXDgRyyX1SneW4faq1IFaFzV5KpzewVwMyshpBn0btumW3fcCaChv
	 +hM0K7eUdpVhIUzzKpNol+abcWGggh+j1C7ROvkaO0MyrgtNPHoAjFNFxzkzupusrf
	 ZaQwZwzKN1f34EwJuiKOZmZuy2zwiqAg+EUiK4QCA6C5m8gSVG2OvniRRqova6cRZm
	 PQo7dCmiP7n5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BA10E93B34;
	Fri, 18 Aug 2023 17:48:37 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.5-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e50f03c7-2a36-48e9-bda4-8f04ff461826@palmer-ri-x1c9>
References: <mhng-e50f03c7-2a36-48e9-bda4-8f04ff461826@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-e50f03c7-2a36-48e9-bda4-8f04ff461826@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc7
X-PR-Tracked-Commit-Id: ca09f772cccaeec4cd05a21528c37a260aa2dd2c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd479d9c72681606cbfaf1b77629187fe904cbee
Message-Id: <169238091756.10816.6116178516700260433.pr-tracker-bot@kernel.org>
Date: Fri, 18 Aug 2023 17:48:37 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_104839_512626_844AA144 
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

The pull request you sent on Fri, 18 Aug 2023 06:18:46 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd479d9c72681606cbfaf1b77629187fe904cbee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
