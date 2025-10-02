Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DF4CAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 01:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7PkNzsu69wx26HSZxXmmmBjGfZtUlaZHdC+YW2CbDs=; b=ZDGP5I0OZoM/Rj
	Og+Oj0Byb6G4bi8c52pc2hOMLHYYhhLxHu0mBlb4U3hgZD6IVcYR3Eu1qiy+Lfm4otrKWXSKk1Hoo
	q0sSyThuLjO5oe98RzTSuviquMv6Jftoi7ljGNsk/GN4Lg06QqI+vaJZu7tn5boUzPGQtDReHk9Ni
	bSSHw01csB2pEozz+TR87Y1sx5J0oCaWUfIzw7oFy4DctppXJlYoo5tmoj1hT6FsPvWEMfbqZya8N
	Ks0QBCW8A3y6kfkpa6bwRCMLNjMaEwTOJ3v4eUOUk6lHSRe6x3n8nJL5nGSoV3Pe+oAF13lJgQ84X
	hJmCgHX7Rzv6P/7zFB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q6-00000009Mwc-3UBV;
	Thu, 02 Oct 2025 01:10:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q4-00000009Muo-41d4;
	Thu, 02 Oct 2025 01:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6344C63D0B;
	Thu,  2 Oct 2025 01:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E9DC4CEF1;
	Thu,  2 Oct 2025 01:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367432;
	bh=PLfM420PxrY0mdehQk/ezUm7VWZZHTn8pnpL4XNbs5E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Di5fmUP1JABJJ6rsid5r5g8foBFaj7eR9AZWOwYerm/LLyKKipcUzXB5R5deDtcbp
	 evahpPssdnr+CegaOLjwY0Dede0aTMjwRXpc+esASKZenaKOVgsBnfKo3UTwl6YOCy
	 928cAY84NLQ9DFPeZtx+7k+eGlD5+4IBjuL5iQ+gYfQGCl7f2g8CkMHUc/KfjcrDIo
	 sViVqvZPg9alV/p/R44wcWDTE4PTuoASz/Fuqgk7HnFqGGguTxw8Bfn2lY4p2Hlulv
	 GhyiDbHrh4e4x/IGG1JGFi35p0aa9DzREjM12lZRZyHsh0xFA/lpL1kicB6TmqXTQi
	 SuJ/6NbpWjjig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A6F7439EF947;
	Thu,  2 Oct 2025 01:10:25 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] soc: dt changes for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.18
X-PR-Tracked-Commit-Id: 8c0650e0cef283fb31aca5dc7c72b891ff121a88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f048c878ee32a4259dbf28e0ad8fd0b71ee0085
Message-Id: <175936742455.2689671.15689552155579066793.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 01:10:24 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, soc@lists.linux.dev
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

The pull request you sent on Thu, 02 Oct 2025 00:26:22 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f048c878ee32a4259dbf28e0ad8fd0b71ee0085

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
