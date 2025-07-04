Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16337C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9R0qJCDvUaKAvkFDqcPMaJXAp0dle0tBuCkdXuoZerM=; b=RHdyCUyDQ1Tw79
	90HEGt/H0JWHVE/DtOb+YY8iO9hE6ImTCuSrEVWZmdL/2KJRbgzU3SR/2G+EHXdWZ9UXmAzHcXG/L
	oFv6OtlGRDuMn043DtMiWQ9HKhQRlGt1LXcD6+u6C9sdyOD+8tEcBJHWCIO75DctHNPdxwqVm9mcU
	Xz3D6aG6wQWotUVBB+V0b1fw2By0C/+dNGBg0j4XtDAB9UCTiMS/3BXT9iz7/I29kuCerCEkpLpS7
	gLB5NG3XI9Yvy4IjE2Qre5nCpZ82FtoXBxvIaEDeFnk5UvhtzfEkNtI8fdXesfeABlw8NYn0yQ+27
	sTQzuDkFqJRlJ4J+UOCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkNm-0000000F7FH-37v9;
	Fri, 04 Jul 2025 17:39:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkKn-0000000F6Xk-3UY4
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 17:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D99425C5B63;
	Fri,  4 Jul 2025 17:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0A0C4CEEE;
	Fri,  4 Jul 2025 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650584;
	bh=Bq79NU/8E8pVje7lvnbP9wWY0gzPyfZKzzvZkJ5XYrM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gzmJJ56VaEP47cU46sdxvctBmiHXvYlsfcNlcpJ6I4VHdlKhump5BukDApyJgLwVO
	 9i1v39v4AEKLBNusbeOiFyHLMrqwOwTpJFIpuGRUgi694cjJ87QleBU7N7RX15LQfE
	 MvtfWQFY972vNXLDs36/rctNA2icHc6nKSv41h2HtEqCGgFr6OeSUXuq/gQu2cqY6X
	 FwhwDOJ1bI+n2AkXl1RnfaojitUWMKV4014dcgoN1eOE6eMhnB+FQNI4oWsHbRbBr3
	 lsBBcFowbMjfmuRLvonnvoyBNzeRym4fHiXw3w236CMhKYvSZ2Gh3fyyike61Is7hH
	 /7Az/FCrc6vBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0F5383BA01;
	Fri,  4 Jul 2025 17:36:49 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
References: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc5
X-PR-Tracked-Commit-Id: 5903a7452e642f1475f274373633522db168b60b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c435a4f487e8c6a3b23dafbda87d971d4fd14e0b
Message-Id: <175165060863.2287194.7557328427443226609.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:48 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_103625_915546_C0037EB0 
X-CRM114-Status: UNSURE (   3.77  )
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

The pull request you sent on Fri, 04 Jul 2025 08:43:50 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c435a4f487e8c6a3b23dafbda87d971d4fd14e0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
