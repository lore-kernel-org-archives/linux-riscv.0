Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69334F45A1E
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 04:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTDPNHls0YjqlvMP/nf+Uu2IlWkywROac+6xyPQYv9o=; b=1l3vi2PLwHOA39
	0LKQHUmj495iQ839QZf/QGoucE1/wxjJzphY5FLssS0vf8jtF4qkqgBqlkTW+n6TSsnzrR9+S3LLn
	OimZaKPT8e4QG1cOEetmi781fvleRx/EbQj72qfC2yTfDb7jbMrzaV2keQ+RTwxXyfVRec6b04zOU
	92+q+lwjYvmr3QaV+V1el9Exyh8TBH+mi2AaRgnCeSQSLkWRrijIYWt0KAs3Kh2KJnOzRDnAnJ+U3
	wcNN+t4d4u35/j8W6JHdfMVxGzgfLS87/3N9e6OsQIPbxWM/GmRlcI7Xn8HeDEsnbATlUIcE5qGT2
	IDWzyoa+GdxPa11gPHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBPab-0000000D7QD-2LlM;
	Sat, 11 Apr 2026 04:04:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBPaZ-0000000D7Pq-1VDa
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 04:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A625740746;
	Sat, 11 Apr 2026 04:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7892CC4CEF7;
	Sat, 11 Apr 2026 04:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775880293;
	bh=c9uI5EPwk9NGpOCc9aomuklcP+uL/kdrpOD5rONhe90=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iSAAW8vK9N09jOpIcpS9dl55qz/c7ZKWLKh2jSoAZNOKKWN1/PK2wGc+nXEHYgnh4
	 T9p/lWYqqGisGDJcSSl1Uv1O12M5XswG8ZZqVx5LY0sJFQeWn8a9GV7OT50Q/lYU9c
	 /dqpNs5wSsLY3OGaBk4TUN8UtBy1Gq4qMzYrcFu/ZP1pz0iK2ondcnGlg4JK8DINvD
	 lrDwDkfsuB4NtLpEQEUFHMh/wFMIqoOEXywuPcjM/jNan+aiBwfG7equEIwsly8Hg6
	 /IaELLPAJSG3piGU/mZHLmmeZLK9xAKy8qBd1PdAl1CoEJQQjhrVxhvrYsDdmaksAH
	 wXdUm+X40uOSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FBB3809A88;
	Sat, 11 Apr 2026 04:04:28 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.0-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <46ab01fb-e1db-1cd8-4d85-3ac68c7dddf5@kernel.org>
References: <46ab01fb-e1db-1cd8-4d85-3ac68c7dddf5@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <46ab01fb-e1db-1cd8-4d85-3ac68c7dddf5@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v7.0-rc8
X-PR-Tracked-Commit-Id: 08ee1559052be302f1d3752f48360b89517d9f8d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e774d5f1bc27a85f858bce7688509e866f8e8a4e
Message-Id: <177588026732.2835532.4339617426741010450.pr-tracker-bot@kernel.org>
Date: Sat, 11 Apr 2026 04:04:27 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_210455_427510_F52B4527 
X-CRM114-Status: UNSURE (   2.99  )
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

The pull request you sent on Fri, 10 Apr 2026 16:16:33 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v7.0-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e774d5f1bc27a85f858bce7688509e866f8e8a4e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
