Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A026CD37A7
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 19:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlmNyeHZHMmFzFj1fOZ6Qo8ENo76DgMGxVB5aekrpPM=; b=1kPd+j+zSUrLoj
	lCsuM5cTLdQVZ8pvV1oePs6zcCrOxUvDKhgTXUnQFZ8rr3xYl1IZ1OsXF/Fjg45KnMytRGdUtvKSo
	PkZuv7caMII8boLJ9qv3ZQHqkzZ6STm2DP/Na+j4KsaByg7B2ceXMMt1cF7XSYAKhiTPuf8zZWjiC
	KOLR1nJFeeBTZTSK4TQlJFD8wMD5uFb0gMjrXVfDxTn35ng0CiqKd9DCWdoT31xqkX25TwlzNLZj5
	qkjEz7sQXCoLIYGV31K7EK8E9q0mdbl2pSARRlG5D9sqtIHT7IPFsQEcZ7Y5N6ZNEmpNG4Ez9bChN
	xXSf7xXV8L0cKxaOVzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhEmf-00BH1C-0E;
	Fri, 15 Sep 2023 19:47:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhEmb-00BH01-2b
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 19:47:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7193B62178;
	Fri, 15 Sep 2023 19:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABAA9C433C8;
	Fri, 15 Sep 2023 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694807235;
	bh=HTwJDE1itbMhWqMseN+yvhY3jCEDcg8wm4o1L2FiZ24=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZcJxhYryKDtdCWe9KZrqWLhR4b2gpY9IzfTWrLNl+HZB12hO8hjwKEJph30AqZ53j
	 HCbRK5Q4hy5IrkCn6DdUO8IAQgwoklBhQeHC0pseSmCGVoJ+zOJ+toZVKoZB9xrkrP
	 20ydClb7PHp/N9JnQ4xBsGVs8TsZjygJSgTreygHZEv0gMycs+5pQlEvM7CysyrS4j
	 jb0+6TwQPGPSswtliTaFRJ0cgXNAINaK8aZO0Nl9R4tXNqJ68wFqLG1t63Id4rBy4/
	 XgCecEPndDXT3ksC5CdhHQVyFOUmjTlk7RzRmLov302hcsgN/G8YlDgeCyKLAflo3Z
	 +QkKPGWNg/efA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 953D3E22AF2;
	Fri, 15 Sep 2023 19:47:15 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.6-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-28c66ddb-6068-4bcc-a1be-28c830775838@palmer-ri-x1c9>
References: <mhng-28c66ddb-6068-4bcc-a1be-28c830775838@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-28c66ddb-6068-4bcc-a1be-28c830775838@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-rc2
X-PR-Tracked-Commit-Id: 8eb8fe67e2c84324398f5983c41b4f831d0705b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82210979f3dd210d019ebec2a59af0ae8be596b7
Message-Id: <169480723560.21547.9380714855077130866.pr-tracker-bot@kernel.org>
Date: Fri, 15 Sep 2023 19:47:15 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_124717_907614_42080DFA 
X-CRM114-Status: UNSURE (   4.01  )
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

The pull request you sent on Fri, 15 Sep 2023 08:12:25 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82210979f3dd210d019ebec2a59af0ae8be596b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
