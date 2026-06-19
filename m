Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9924CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRS04oV4t5WYpFZV9hMLUZkGBfWd+aibN65zVY0BayM=; b=3WoooJZgYNtc44
	v7B8evfO0wLFv7IkyvaN4WO2zcNdhJllGReeIJf0Mb/WH+8X832FrQ1cuYXNC+xDWmoKPYUcUwtT5
	KYiIPxcHo3qdaUild0pw0OoSwrnVKl4C0zneEOaHRW9JcEhXSAXftGSZiH4w0W6fFxWqQYWXPDi9f
	obfhMyIeh6fchNxUKE6gE0OSIxWbUTrgWiPL630uLnDaAG/3QrjEVL8p5bdHT0++uoi+yvLQPjCoc
	SAY+U4oa1s3JoNqRk3SYN5XbzG3goTw7A41WV2HtBPd+ComighkWZmg8ThzsK063VJpPFVLNmCHd3
	46MYgSbAErHyC2SIuN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaex-00000002bYd-2KxS;
	Fri, 19 Jun 2026 14:57:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaew-00000002bYV-0itZ
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 14:57:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EE87601E2;
	Fri, 19 Jun 2026 14:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90981F000E9;
	Fri, 19 Jun 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781881048;
	bh=4bndwrWbrZQau3CcRbAj6WmDt5v/5YyW42x5jDkGh7s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NftoIBKt8dgrTrC60zfdcNiwiJJueXTAqFknVM5XQo/E4AuDgJOl3HboZB+PDmsmj
	 yQDMtn5GoSiXTIZfSzWlpXNG1ncNVT9cFFpD+ZqThL029inlZrWr5nguBh85qKb6W2
	 3LULP7xiyLYp4S6HKT5CbVV7jeF/WjF1ChY08pOykIH+3aYShZYjZLKxubjSS/k6tF
	 iQKfRG+WroxbNLSgVC1dy4nupywUpqDAr4OqR/Phwyl6OFQ1utBhWMmqfaO++npoiC
	 2uPJNlA21YziF7+JD4bH9d24SuFITizRJ8DLFc274RWimGYEUGq8uXaSHv+rNgtp77
	 jfxZukFemLrjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199B63AA6A6C;
	Fri, 19 Jun 2026 14:57:23 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <2ca9fd52-d4a1-5e7b-b9d9-9d759b92f8c1@kernel.org>
References: <2ca9fd52-d4a1-5e7b-b9d9-9d759b92f8c1@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <2ca9fd52-d4a1-5e7b-b9d9-9d759b92f8c1@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-mw1
X-PR-Tracked-Commit-Id: 319fafd9a3743b617b8547d81c41c99fb67857b1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f32a375eccb7b27bccc57dee45befff6e3b3d4b2
Message-Id: <178188104176.3941480.3695901801866159486.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jun 2026 14:57:21 +0000
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

The pull request you sent on Wed, 17 Jun 2026 16:51:04 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f32a375eccb7b27bccc57dee45befff6e3b3d4b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
