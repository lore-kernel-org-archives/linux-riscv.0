Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1A8C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 17:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBQOeZKdorXCk0cOnRNnZEFK7wWuDpyyatNDSClhkrA=; b=amYYpa0JPSYk1n
	dDupXbP0hu1FOgfE1L/vUA4rqUw15TQlpJlom6n3xiuiS9XYCqQ1q9yQWU/mfOFobcVd3WAfHx5Mn
	Uk4aPkDK520q5xK8iMj/u31eI+5u/291BrC4B8XkClryj9lry1XRHz+vMdXgO6rkGTBuALVMqjH1C
	jZfrdUNl8xLoMt/ZJSPI2XygqCJLmslOzSsmOw+2LdZ04fkRjH52LdIOkUh7pYt6mLn0fsNFpuzFS
	Kk2h2lgfUS+hj+hQ97BYA8FxQklu/ypCWRiTH8ml3k9LQXHVZEMXGonwleE5R3zNTHRniOTf3xdqm
	86hZMnjC9ZOBlE0x0tAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdE2b-002uWO-0S;
	Fri, 17 Mar 2023 17:38:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdE2Y-002uVH-0f
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 17:38:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A2D82B82668;
	Fri, 17 Mar 2023 17:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C204C433D2;
	Fri, 17 Mar 2023 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679074731;
	bh=hom0UzpZvWSPclZjmUNXiy3XOk7iOqvqrLDTC0tTDXc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VqTj8vtMg67wnx6C1RWMDs2e2/ARWeAJ+1SkSfE1guRtEmFbhmMgZIa4hgFt/ATR+
	 ZkKzZDdOAUlrin+H6JGSKg6dYgUaZ8Al/AYhsdNUoOosOjYGWCU581PR9unwhCOXID
	 rfP4c/hN+JKxpSiBvviXnuOzDIpvXbnD4A1aXbI2iRcUo7BdbjI9GOz1IXZdKsgBC4
	 8ijYFHAFJ2UvPrNTrXcgDBl1eQDhEmFPRM8hzTOhCV2NMNS/RKu7LFkQXHmAsk9dxm
	 fbiS2kfELrL5eLKPEW6sdTmfdhjRv3PPwXXBqdWf51JXxAEqfzERJApZnTgRb9FOtQ
	 texMASKWwa48g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5B7E2E66CBF;
	Fri, 17 Mar 2023 17:38:51 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-70404d20-e840-40df-a6d9-0d67003e3ca3@palmer-ri-x1c9>
References: <mhng-70404d20-e840-40df-a6d9-0d67003e3ca3@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-70404d20-e840-40df-a6d9-0d67003e3ca3@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc3
X-PR-Tracked-Commit-Id: 47dd902aaee9b9341808a3a994793199e7eddb88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb80b960ce44e3e4e90985bb65a84c1a10c450ee
Message-Id: <167907473137.9394.2003960680286372278.pr-tracker-bot@kernel.org>
Date: Fri, 17 Mar 2023 17:38:51 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_103854_397874_E4CBAF44 
X-CRM114-Status: UNSURE (   4.00  )
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

The pull request you sent on Fri, 17 Mar 2023 07:56:26 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb80b960ce44e3e4e90985bb65a84c1a10c450ee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
