Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367F9CAC5B0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 02:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcVZJsVjzYT3iGFFiDrC1IKR1oLhJYj18+EzWN0yJ4o=; b=jllPGCwf3YipxQ
	0TRaxKi1KeUFwP9KO5WnNp/q2/QqywvL+RseCRiRWcW96EmFdmkBtJGr/7c+F40oQzWSI60EZm2iH
	JVAtoLpBPeEVtm1SNnCBQRSLakLddTdDmEFgyHvyZXho+VtUU8oY1KE048nRMrYcfvLtVy4fbyk9B
	3U9TDTco+tuDEFRgnL1AWfSHI8X7ZJDhqz23NsmvrartUrjsT5ErTOrkhkUBKeFv2TvTaHbOhooBt
	/hYhuoADl7KIupfwkuMHzoQz4GYd4NQCJ7bo3xrgcZaB5/8ZPsZm1TDdDBM2R1XKrzIUTxNO769wl
	ciWoeLZqYsnILOamkpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QVr-00000003yla-1QqF;
	Tue, 30 Sep 2025 02:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3QVp-00000003ykK-0xPX
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 02:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A81CD4184C;
	Tue, 30 Sep 2025 02:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CE5C4CEF5;
	Tue, 30 Sep 2025 02:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759200884;
	bh=HL+THJGskFVL433eKDDlQSm0NvfTmh1ckVcBvXfN6vo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BARO6QdbrN8WCShhkUT5OCrXk0WT7AvI6EFS4B5r3YgQigzKYHbc6ffhuEHKG4q26
	 4InVRpj+vo6/Gx6snGSmm8j+VAwEdcZoIlUxUozPJaU2KH3kdRDirma3HWmTTX01mC
	 PQMj14ejEBRUmTuV+v6uEx7Whl4lnxxETl0TVSWKZBASmo5JLgX4tQXDetNHfldyeZ
	 tc1WEJa64PGj2g977zaS4GWoOHj24VFfTruWHr7U+Sa1iC6bywI2+okD4OMv5Q0Od/
	 H07uS6SgkhmMAvxInjBhdDMXLVyUHcWlws6rB0I7iI7wCwYwU0CY+zG2w2YIVLjIUT
	 Sz5j5AUiw/HSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FEB39D0C1A;
	Tue, 30 Sep 2025 02:54:39 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-mw1
X-PR-Tracked-Commit-Id: 0b0ca959d20689fece038954bbf1d7b14c0b11c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb7e3669c683669d93139184adff68a7d9000536
Message-Id: <175920087774.1805104.1478127226373607827.pr-tracker-bot@kernel.org>
Date: Tue, 30 Sep 2025 02:54:37 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_195445_314177_5670099E 
X-CRM114-Status: UNSURE (   4.03  )
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

The pull request you sent on Mon, 29 Sep 2025 02:00:17 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb7e3669c683669d93139184adff68a7d9000536

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
