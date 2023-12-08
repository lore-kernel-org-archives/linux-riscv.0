Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8CFC10F05
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWBndvoVYHh1ddxFkO8eAqrGb/NFaYypTvLllHJeRRI=; b=QODm1+Dujxmh9e
	usX2O8QdaeY5x5EObpPglyN2OfSkWWJsUZino0+9rIjskiEtEUUmsa/3dD8h3UIPZ/eWscXw5o0UX
	5dg7ip7afKGVbDfkBAyg5ZWMnO0lFhchX4C/sbAXb8wlupRsKVUXhoj2j5ucjlCMuozlw79cHywR3
	Zm0BZTLtVHpjQJR5YBNExNquE7rWoQJ2M13JHt86b6OL/0ZgbrFlBQn3PLft8M6+OXR6slJLn+kVt
	2sv9aFHKnm/1w7EGBelxq1q9ZtfjfWwBZ8nqD1Jv9j42zvlkhavhd7eV8O5lzzbk9xsABY543sfMM
	h+pq17+PLougAaCmwsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeLD-00G7k3-2r;
	Fri, 08 Dec 2023 17:08:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeLB-00G7iR-1o
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 00635CE28BD;
	Fri,  8 Dec 2023 17:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E1FEC433C9;
	Fri,  8 Dec 2023 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055318;
	bh=FlIdJCa/UXaESEyh+p8lw9JH9iwcDM/hgfUOTCeDY/0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HbS//9adsc1QtUqJGVnaCspRwIRj7Br3OFCKinNUbZayXnI53F4qdnNhgRymEfP9o
	 sbuK3F2/M7kfkdY+drvqVWG6vRX3/i8490i8E0rbR3uX3Cqo5JB4AEAS3nIMODO1G+
	 ztIbtgOZqr9wtKEhNdAn1iI6oK9JAn7KkFNEEB6bhKgh3JIDr/iQ+SH2kFtFerQVEu
	 ig1VdaReK54+hXV0IMvxg+flxXGCj+8xLm2tpyxcgSOTvNV6Kkh4DcMRibadMw8TQz
	 trr747cfS0RJKM70dAL0OXRTbc6410w9F92sMBCVhUikshf+FYSfNzNPEVSbvyzu3c
	 QU4gxWIvp48iQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2DB48C04DD9;
	Fri,  8 Dec 2023 17:08:38 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.7-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-1c062b80-96c4-4146-a689-9338ce7c524c@palmer-ri-x1c9>
References: <mhng-1c062b80-96c4-4146-a689-9338ce7c524c@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-1c062b80-96c4-4146-a689-9338ce7c524c@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-rc5
X-PR-Tracked-Commit-Id: ed5b7cfd7839f9280a63365c1133482b42d0981f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4df7c5fde316820286dfa6d203a1005d7fbe007d
Message-Id: <170205531818.9242.16251848338049388170.pr-tracker-bot@kernel.org>
Date: Fri, 08 Dec 2023 17:08:38 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_090841_771210_15D79A92 
X-CRM114-Status: UNSURE (   3.17  )
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

The pull request you sent on Fri, 08 Dec 2023 08:09:19 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4df7c5fde316820286dfa6d203a1005d7fbe007d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
