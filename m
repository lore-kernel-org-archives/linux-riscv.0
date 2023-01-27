Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8EDC38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 21:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2OhMqjg94ZlUy6jtCMIQrq50QyvP3eD3ur/aKwEjU0=; b=adyrLiB4FoXSKw
	jhGpXO8nDJLhfYuca4v7nFjPViq7O7wweL/LaC5ycV9BNSAzuLHsYu6emOzJ5jcbFML0ivWR4LxE+
	zHMeC/tzLzCzIuxANBLYuRKe3aZw/9UZWV7sK+Eg2har/4FDwBEujooq5xyPd3jF+J+DzDm/Zfhak
	oo2vwAC6aEw7yEpUhIWS7DSDcuTTHYT+HodNbm/LSbYv8tCEIvx+UqJL4KuJSTTYL8DiHhSj71nkW
	lMkUcEY0AqXxGLWJnHcyVznxEYHcwcEvoS1auXkLKVsTd9btnEMeVt0DX0AgshGSpBIr6iv3T0gfi
	6yh+wBnvM8fBfkfbW2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLW3h-00GUnq-TD; Fri, 27 Jan 2023 21:14:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLW3X-00GUlW-KJ
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 21:14:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3472961DCD;
	Fri, 27 Jan 2023 21:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D528DC433D2;
	Fri, 27 Jan 2023 21:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674854082;
	bh=777o8q30/9HQNkSmQaK6BcTRR8GGs/P5WNImavVy2rY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b8Krx6lmVPp6gfPvxfQ7vw4yMaMuBtALB57f0Tr3ADt5/I7huaQyZ2IYJ/UbuOmR4
	 yAWNwe2HVyvdSiTTiirLM0tfC2snKUFRk08HhUmqumt+Qm02mrcqzCxTOkkCnpyunR
	 KvXTfDhNYvbZczP9BFLTVVzJ6wj9MKugYdHSIqD8insafpa/ByXRX8N5w1WcSNeT8+
	 Fh8ewdXnj3CwlZylB4R5fceBvXuRBayKCd51HljpP5uw13TGhIFo/ldZEkkXPc5pO0
	 jEPK4RTvkvUgxFnrDmWViEkRsCflt08SzywKFWX1RQ/u3050xtbjKcdDtAI2cHOb0A
	 vZKkp6I+G1c4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2C64E52504;
	Fri, 27 Jan 2023 21:14:42 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e9212465-c032-4266-b8ea-a40f2bdcc767@palmer-ri-x1c9>
References: <mhng-e9212465-c032-4266-b8ea-a40f2bdcc767@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-e9212465-c032-4266-b8ea-a40f2bdcc767@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc6
X-PR-Tracked-Commit-Id: c1d6105869464635d8a2bcf87a43c05f4c0cfca4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db7c4673bbd30e54e28a3274dd50fe6a5e28a8b8
Message-Id: <167485408279.14056.11354819331577715108.pr-tracker-bot@kernel.org>
Date: Fri, 27 Jan 2023 21:14:42 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_131443_717789_0BF28511 
X-CRM114-Status: UNSURE (   4.50  )
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

The pull request you sent on Fri, 27 Jan 2023 09:38:54 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db7c4673bbd30e54e28a3274dd50fe6a5e28a8b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
