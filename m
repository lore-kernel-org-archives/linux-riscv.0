Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759A0C88E53
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCTCc89enr/6MdGpqx3Uog/7caIcufqdI7TBWoTKTMM=; b=ocpKswkFVHLhfp
	hi5wY0Ybz6+jMOHqoaz68HYXZTLJrLoiG8wzTCiCvAdPOEoQ9vEWL+jEKGAFw1H81D9RwqcNW7OzE
	pbRsUei7prl2QisCLa6CSOLd4rbuhL7Bpitq4HN22XcIz2nJsUrpl8/vS3vwqzhTWn4YbY1KHz7VY
	ZfH6ucNTEnKLEXYAGdRlSELuB1K2YyqNjnFKOXobPTUujGOu5F+/ALctCy8F2WD1POAT4LAQ3rm4u
	kGJY6Wg+iWY8URzOSTrLdCz89wfjzuVj08isty/wmhySocSpQiwU4vDrO3W+6g8zi/wXZIrPzlQBn
	j4upLH/w1Ke96V+zjgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57om-000000005Zm-3NBI;
	Fri, 11 Sep 2026 20:25:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57ol-000000005Za-2fv1
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 20:25:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 06E0743A2C;
	Fri, 11 Sep 2026 20:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A7D1F00898;
	Fri, 11 Sep 2026 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789158350;
	bh=zs6IpTeCkOFuPIwx2qA8uFPMR9hOsbr1wK0dg4OkG6I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YAfYmrlEp0dpeLYk+BTMudVIqg4WCZZQuelaq49bcFx+2sbNzy8QK3OUQ4p9aPEtK
	 TUY7fQbr895JLqi8IlMg6wnFVk10LMGvsE4CegR6/uux9n47Kp7ed4a7vNPkYOVJOh
	 bUj0DhyRF/VH0GR30sQSxEc6olvMpF2yEyTyFdmq91kPNQSe/K3Tmd7mv6zG0hPmO+
	 uxUvUmYJ3TzkH8mV0Tg3CuOruE71puRweG+a4jT23j1XyGSHwZZS45N/eoPh6+S4po
	 aLhxCrw1jcYYjY4//7Ex3YEbA99RjS8NoLZu+MvKTM52exviFckjEPtPACJrDbztte
	 MCZDx8oHmDWiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B183924451;
	Fri, 11 Sep 2026 20:24:48 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <bca66c44-faf3-27b1-daec-1fe594804354@kernel.org>
References: <bca66c44-faf3-27b1-daec-1fe594804354@kernel.org>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <bca66c44-faf3-27b1-daec-1fe594804354@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc3
X-PR-Tracked-Commit-Id: b94cec5761d22624d109d859467d7d4ce0a1b88b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 827751b699b79a6e569983359c02dce67f81b94c
Message-Id: <178915828749.3095760.8641038885777827919.pr-tracker-bot@kernel.org>
Date: Fri, 11 Sep 2026 20:24:47 +0000
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

The pull request you sent on Fri, 11 Sep 2026 11:55:00 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/827751b699b79a6e569983359c02dce67f81b94c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
