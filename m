Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2454ECCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 23:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPzjJtwrUTXk/AqgAX1P8T8WTEqzVorSPQFa9mqb+SA=; b=aseSsZ2PxCpB9i
	Ula9wLK7em7UK9KycSscQ+pEs6n13d5k0AQe5sKBffrOYyotAARLtVVqFSmHDYW9P5D1yivH2+sBk
	ZaTpO2uotnXeirKmtpCI8rWI+hB7/Xold7TLmE+PkZP4ngbH/rwfjkEiFjtmOOLZY6dJBft6F6Xfr
	AyPUNIgZBCDt+NkwgnF+Wm8SMMhGCbuRr+/f9y9rRO0dqxEMrpuoEyAeBjVNlltweTvPRd0VGlYu7
	rW9JXB2cKPyqwIRxP9G4bwkB3ripk8P+MTCbwHocsPjnnya0L6Hh5ZvVOXUvRtmQL4GQ0rvFxU1qm
	zYGDJgWAAtZHkyX8JJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbSQ-00000006GUP-27k1;
	Mon, 10 Nov 2025 23:37:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbSN-00000006GTu-1lF4
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 23:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1BC644618;
	Mon, 10 Nov 2025 23:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EC3C4CEFB;
	Mon, 10 Nov 2025 23:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762817873;
	bh=pNcx0xabKXaB1YSBxc57Kje72bmAUQ+xz/K/8CGdd5Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PX8Hu+fSeVct17jwh0LCCAz/Uyzaoi203TumpmANr6+2OFWZU7XeX98GGxBsriOv1
	 o5+Pzda01K9klhG49ur6MtavXQGERd9g5trGmB2rbCkk2A6c1LSuimK7iudOvt034i
	 vn/Vl8LAHxLd8fOzLhrYf0QlT/CgSG0vvxviCkki3scPXqGfWJxBMI7QcCVM+EjdX6
	 4xFAZsoZ0ldMoNoEI5EnHXQUo4PUdZRzwMUXxvn7Ay/dErOGdzpllSSoanDWtjqBhn
	 Xp16KQgLNYaMYX4VptBwRyDwnP18IKNbm3I9BO0SsKa6JqU2THVbZ5E2gG4kx2iwoS
	 4JkJ+5+F1ZIEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34245380CFD7;
	Mon, 10 Nov 2025 23:37:25 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <a7d159e4-8e75-e4be-4405-f10fee270664@kernel.org>
References: <a7d159e4-8e75-e4be-4405-f10fee270664@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <a7d159e4-8e75-e4be-4405-f10fee270664@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc6
X-PR-Tracked-Commit-Id: dc20452e6caf962f04ede7f364267b0c37784ab4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
Message-Id: <176281784382.2808805.9321461270963841353.pr-tracker-bot@kernel.org>
Date: Mon, 10 Nov 2025 23:37:23 +0000
To: Paul Walmsley <pjw@kernel.org>
Cc: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_153755_496575_56805E80 
X-CRM114-Status: UNSURE (   3.74  )
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

The pull request you sent on Mon, 10 Nov 2025 13:41:32 -0700 (MST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
