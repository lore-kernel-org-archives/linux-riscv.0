Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC810CA9ECF
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHXdCP8idcRASz8yw8dNf25sZqL9QOF3xWd7ojsfa4E=; b=z0YN0SfSVUz81i
	z3mU0Emd5lEJ4KrIFIdybh8NjkE7kUVo3ONZDPdCc/c9yyqLvyqDgqAJbsLpdP67EChexLy83t80e
	NG0yhVhLtkgTy6cs2JDCJxLaYswkuj5S4ek6fUip7lkmbQ//Du6uAM4V51bUrbNKS8BnvmN8dBFh4
	GzB+AnsEtYGDmcx5ECpWSLWhcSLh6CZQYvXOs8f+XuC2DKbSeZ/wtV8fx5a+5HQt1lnhyzADJUO88
	ExuIDNJr8oZCQLc3SdU0t02hC5eDoHa+Hm7w7PUuYb5fgGtnMbLP9PbfOlfog9kKcEAJ3QleWk0iC
	9acekBaALSDPSwfHIkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFy7p-00000009Hbv-1Db1;
	Sun, 11 Oct 2026 18:18:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFy7n-00000009Hbc-2vQh
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 18:18:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 230354358E;
	Sun, 11 Oct 2026 18:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0731F1F0089B;
	Sun, 11 Oct 2026 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791742699;
	bh=ZKEmvDJnx6NGHK+Bl2KQCCd4Yff3QfaN5Y9Hr4EoNOU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RfC0ISVaXZg1YvBBmI8x79ykuEJuJyBhK8pdxloJb+nd6inH+0MebsfJ5Maqmeata
	 B5iuUESSYdACI+Gg+Xr8Hvh5bnjTqOojjEJgOMDgnjglJa1aVBEzAdH3RzwkfJeOOo
	 q0w1As+UnFeEZ/q7JX7X24J1Yz6u6bZ6CRJw5UJNygu/wXzSh4M/idEXRKcH5UXhOV
	 pUJ64rLtP1v5onKYCwbbtIw37Id6pAjydvqTMLCfK2PEpQZaF5FMzvEl86+srwtblB
	 eUnhAiehC77FP8fQZKSDSvmVk7eUtIsDBtFPx1tyoGQvHaj/3SlP4t9Nf/LJDwiEGH
	 WzWtTVPXzkhig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F17BD38119D3;
	Sun, 11 Oct 2026 18:18:18 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
References: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc7
X-PR-Tracked-Commit-Id: d4f25b097e46d82718bb737d4540c99b7ab0a408
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2d929a1c2a887dd046e0af2d4a06dbf4e7d87a6
Message-Id: <179174269762.2129915.6869966200607064657.pr-tracker-bot@kernel.org>
Date: Sun, 11 Oct 2026 18:18:17 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org
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

The pull request you sent on Sun, 11 Oct 2026 00:05:14 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2d929a1c2a887dd046e0af2d4a06dbf4e7d87a6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
