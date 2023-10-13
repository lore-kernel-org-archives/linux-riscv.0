Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11236CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3O9G5wyUr0JVvXCHAQcij/oOFMq6BSbq5t7p+DudY6Y=; b=xgJg7RJ7oFaHAZ
	Q6XaYQbbqfR2nskBv82NL5Xrg+Y9VnEmiKRAtdHbmm0GBr5zCgwl+pAdQgwPCyt8o9z0ArkkqTVoM
	+XVpbkb0UKYvIc9UKMakB+UvkWFoaabKtcIdG3lWs6/wNg3M/N9WJi8wV9/+j3RSTWsfxgCtk8k7h
	GBqxMlsys8D+43MqSkssBZYzhzJIwmRu2X/6CzQp0Z/L0u/urGFCKhOYLKNJjiDmIiQ2SmP2m4lyx
	z1pGxlC+NphOKKbJ8hMGLJgcYxXWZao0KPkOz4Umo05alqlbQIlPEuLXGa6RYv02oxCIBLYLt+IeY
	9YLVs8rmGY0XLBWBFOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLCj-003tL4-02;
	Fri, 13 Oct 2023 16:40:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLCg-003tJo-2x
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 16:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 522F2CE3074;
	Fri, 13 Oct 2023 16:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F5C4C433D9;
	Fri, 13 Oct 2023 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697215196;
	bh=Sv6lsoYwtFe0Y+SPz02c6oHW/S3tjRNc+gCICBeMoAQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=baXEoQK3Ro78LA1IYq3JIVkMfGh1HS1d/nodq6QWaTbQEmlIrfSqUk0If2wbBxWxJ
	 Q0gQVbAEznbD6jiXTusbtcEoUZWbnoXeQtUAyCABeJVcXi48IKa3qasusri2yA8uq8
	 T3OXSAMUrJbaIeWUXAhfF5QRVkpmz9CpttLfW+THvF5YmVQnzd3Oz00odqrUTqOm2B
	 rJ4WGApqAZbVl3LsVpSAuI5dNTFT3URvS6k2S9KqCXzzc5MMt4zS+Xjiib+O87YVqh
	 CMcXuWFM3+JtMMjUs5dnSpPYFWFEZfMYmj5Q6ddCpGo9DMGGk++BQgYFdkR+GlGUiT
	 8hP1wZp0a2yBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5C597C691EF;
	Fri, 13 Oct 2023 16:39:56 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.6-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-429a0f54-5269-417c-af90-7edef235cd7d@palmer-ri-x1c9>
References: <mhng-429a0f54-5269-417c-af90-7edef235cd7d@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-429a0f54-5269-417c-af90-7edef235cd7d@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-rc6
X-PR-Tracked-Commit-Id: 3fec323339a4a9801a54e8b282eb571965b67b23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b82fbd8f39e2d3f2f6860f80bb888c5dbc3ce607
Message-Id: <169721519636.5219.12460477859107804908.pr-tracker-bot@kernel.org>
Date: Fri, 13 Oct 2023 16:39:56 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_093959_131616_2B8C744A 
X-CRM114-Status: UNSURE (   2.63  )
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

The pull request you sent on Fri, 13 Oct 2023 07:12:59 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b82fbd8f39e2d3f2f6860f80bb888c5dbc3ce607

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
