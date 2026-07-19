Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD75C4450A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wd5YGCceRqOrkGUu/b97eRM8qSj2H8rXhsLeYx7X/64=; b=KHvbBmu3u0I2OC
	nRNdR7JbR8YWwyaRoq2ehoIys6YCV2GTFt+nGPR4sfyLIIyfhzfQ5qtP68sGoVEbnA49uBPMS5glk
	WhlcCZ2KBDOpHUUxX7807FeG8lKf18wmYBgJn9SLi9/HuyurMVwt1nh9sy2NnT/ffOMuepVMGPRXc
	MrewoZ1astmzieyQZj/32oLqertxCpW/QcCEHmDp/9TixoBn8YJ3fY+T9q3Xra0l9qEc5tt1w4q2w
	mjnTkYOq5d6FkWS5jdJtMImfAMgOMFj/xfpG1zWZ6daF6sKnb3qFVXGNxORCkyKjTIYrTMGblW1i3
	3glaUR0XcQLbnirNCnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXdy-00000005JoA-376e;
	Sun, 19 Jul 2026 19:57:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlXdw-00000005Jnz-3Pdc
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 19:57:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 863FA60120;
	Sun, 19 Jul 2026 19:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3041F000E9;
	Sun, 19 Jul 2026 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784491062;
	bh=0ZVhjRZr694LnVsaezo1eHO3FPKZnYaz9+hXLWFvfDU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EULqxpVg9iK4+8SAc03kDemFquoKA4QNulxTOwhA/vvmIBnub+6Oi353qepT21P3k
	 pzfcsiqbVU96sFDdcM/DxoRMzqWVMJWZVnM34FkHkpLW5ItI8jmK7tw8CChpEvoKW3
	 +Bsw/assPTiE1EzmIx1rsZArCHiYrn7SS60kTrg1z8zIuBsj0FqHj7hgGaww1Ojpqn
	 5LHlgXHxBgZfPQaK1hvlEoNz8lR7OGmZEGyaFzzkzgH9BXgKx9q5w/4d/0LCOzQXmQ
	 JsL+n29Dzl1ypq59DXC3sdv3B7TUj9x9FT9DJG0AG5hh2zTCa2MmSp2+TLk492muHy
	 SSmIi8ifAPNng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A3D38119CA;
	Sun, 19 Jul 2026 19:57:14 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ad692ed9-a217-5d59-3bbf-fdd7649056ba@kernel.org>
References: <ad692ed9-a217-5d59-3bbf-fdd7649056ba@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <ad692ed9-a217-5d59-3bbf-fdd7649056ba@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc4
X-PR-Tracked-Commit-Id: 5caae1deee89a6582c761d5dcd4b924b744426cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82a47586c0b9266622657009aa30573dddf09f53
Message-Id: <178449103297.2805482.17588281248845608642.pr-tracker-bot@kernel.org>
Date: Sun, 19 Jul 2026 19:57:12 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Sun, 19 Jul 2026 10:47:00 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82a47586c0b9266622657009aa30573dddf09f53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
