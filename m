Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE97BCCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUrZPKYLECqJXtPoWM/Fzy9g6u0EvwCenLrJMLN8uVM=; b=qDmkdBUrASgwra
	DqayDH2EGij5rdrnE1jaeC9yStGyp1HMChRAWNwXm5qQgqoIvh0mS2tt6s32Nl8HkELNciUKHtmbq
	CdZuAvOMng2xgHmUoQDVNpushWbo17afXq9vQpltftrKWjVVcla1wznPwbZ8zO7ZZDxwARVePGgG/
	lvfoAH3DixzZOYeRLoYbRfQLwoV4MI6PvvdQ96hXONFMQP1A5HQDckUQbzo/4uQPArlZOIKnDvcj7
	dK8DhKgqGheRXVJq31Xmm0e0VlVvQrvH1r3HFsg/rWafn3Q5AQ5tPaqsOhE46Fol/1dnMbK7OSVTI
	ssaOaqYP8fL/OIoB3epQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tXa-00000009AC8-1UjR;
	Fri, 17 Oct 2025 23:07:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tXZ-00000009AC1-0VaY
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 23:07:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CEF76058C;
	Fri, 17 Oct 2025 23:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAFAC4CEE7;
	Fri, 17 Oct 2025 23:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760742436;
	bh=mUv1hB7hSxDM2HNM3x990sJvp7BySywC6rGZb569+S0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LXe2vwHHbG1rrrIzhCg11tyT/+A/AoQn8Fike0su0o9WDNqcsEcxYO8B39ua9YuBV
	 pC0m1By3xl9k+eeYR7XEt6hOrTzi7q/Mebse7BGKgecoPdiEBMcqncXMn2Bro+3j9/
	 f3aW9JMvO6GNqm9j66YQz2Y/VC59RiqojVb9dldsTHrGNxJTsrR2W2egcpPCEKwp5e
	 4609rOTvUERtYNnrG4koibP9jBbgT8XdWbp7tYO9B5jcnHGb0Wv0IC65LmzY3pfu3U
	 3t9pg2o0LqkvVY0YVlmMNm0B3fay+nK/yEAiQQs9BtADLoRCcbOMTcOOMonqZkOwbs
	 FAaND2QejHI/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB37039EFA5D;
	Fri, 17 Oct 2025 23:07:00 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <f21ca0d7-dd9f-3dc9-34ca-c1444702370a@kernel.org>
References: <f21ca0d7-dd9f-3dc9-34ca-c1444702370a@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f21ca0d7-dd9f-3dc9-34ca-c1444702370a@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linux-6.18-rc2
X-PR-Tracked-Commit-Id: 852947be66b826c3d0ba328e19a3559fdf7ac726
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe69107ec7d8b946ab413cfe118984dac8f1a0d8
Message-Id: <176074241954.2817248.3901691578387543892.pr-tracker-bot@kernel.org>
Date: Fri, 17 Oct 2025 23:06:59 +0000
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

The pull request you sent on Fri, 17 Oct 2025 01:37:24 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linux-6.18-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe69107ec7d8b946ab413cfe118984dac8f1a0d8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
