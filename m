Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FB1C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 21:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8zvgtBP6oR2k+QvpH1YGrlNoD4Vm5kl45RBMJm+GR4=; b=BitVgKChlSIcmK
	ZgL/C1/iccVRzXx4BYm/n+UHQEGcToDt2w/Wy+24kil4tqy8f5qctskhmEjfB1D6zN0aNK8lUuOQ5
	TUvwkq/6MFOyr9lGkf0PNlkkMxfrr6DajjyPw+cglJ/kg71NoaBPIDbYR5BmKScDXDyErZLwbp8og
	1rxTR0jCc1dn1TjsmibkqP+EXhbC8pCWG21hGZzFaqf3NLx0AoUEepztZfog3mu0Zb2LUsEcU5Q4B
	+aBoyQ9N8z3faLwaSo/Bv0EJF07JhtWrmT3dgW/9NnN1H4T+VFB46L5tCRIsl/IjTvNl+DXC8n44r
	SnVih2UI3FPZqrz9Ebww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9KT-00CJQe-CN; Fri, 19 Aug 2022 21:14:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9KF-00CJCu-TN
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 21:14:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3118361741;
	Fri, 19 Aug 2022 21:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98444C433C1;
	Fri, 19 Aug 2022 21:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660943681;
	bh=GCa0IDVBdMQYrcNjZJ2AAdGVMd7ovgaNFED0tmvuzXc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fK+Nw4MnjAjQzlbhmNEvvwWbi0hfkY3DUcc0+14B9mjOn/7lEyeDSl90Gl6Yhc08a
	 QU/7KVVSaXm0TKmfyK/cxcoDi3JP5bJTGrMLzGMRaWKxGhw7CwG0MO+G8BOTrgnlnt
	 uxT56JaiK6rfq/sfvg9h0Iy2bK5dWxJ1vS6F7hcXUv4HDVva98SCmEaiH841eg42cf
	 kKPl+Et0F8mKUOa+KysUK5RGyDTcZGguNJ5qgUdMgecxmGCm8zI8t5rHGkjp8h8nsD
	 9kHxAxN+NRb6BfrTwYlMycEHy2pVDzTqTSUDIPNS8207a/QA6u/XMGZxglmJhJoTys
	 4oAa4cgXlHLYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85C7EE2A050;
	Fri, 19 Aug 2022 21:14:41 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-74337228-62c4-40ed-b7af-0d988ff94993@palmer-mbp2014>
References: <mhng-74337228-62c4-40ed-b7af-0d988ff94993@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-74337228-62c4-40ed-b7af-0d988ff94993@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc2
X-PR-Tracked-Commit-Id: 96264230a6817bcd4a7ae0fc30c60bfb46499f68
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8fd00059cc13c7f170451e9318a9a5e772b88e17
Message-Id: <166094368154.15089.7972422322159327730.pr-tracker-bot@kernel.org>
Date: Fri, 19 Aug 2022 21:14:41 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_141444_113792_1DB1BC4A 
X-CRM114-Status: UNSURE (   4.45  )
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

The pull request you sent on Fri, 19 Aug 2022 09:28:44 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8fd00059cc13c7f170451e9318a9a5e772b88e17

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
