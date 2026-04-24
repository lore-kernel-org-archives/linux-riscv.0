Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFB2FED3F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 18:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmgNt8LBvzIPQB3xxeJqrow7p0rHSVFP7U4DEqyU4SM=; b=SFLN9wRcBI6FW1
	c69GOBbjrRCoK8iTTDgvkDKKP+nCMAu3t6izTu74F5IlZKJGmbNod1Od/5jpxEDo6viWcKs6cdKR8
	3M/McT5RHmJPq5t6XNYQvOoT+11kUjI6M2ozuNdig36R+rcdltZZFNW+drSVp1vuZKyFfm1FrN+pa
	J9EZMSiMBgvvHRf5dmiViBbCNOrGohQjrRJiitlQI96Af8GW9klL0/ibBGSViGlkTMtB1TMt4J+1N
	A7UW924FWSyOeeBNStqeEX7HPwldtnBVg0+lwHiFdB+8+ELvTfjQYtZe/ALLMuZQCSIRZG/yrpMWI
	a7957dkppatR+nQT75yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLL3-0000000DeSa-2v6y;
	Fri, 24 Apr 2026 18:33:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLL2-0000000DeS4-31wX
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 18:33:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C393160125;
	Fri, 24 Apr 2026 18:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B8DC2BCB0;
	Fri, 24 Apr 2026 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777055595;
	bh=zYqwEPqOCGD4bUle9cTA5rLklwrofuT4wB/ZCancDuk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qqp5+iZ8/Dxf4qcnIJYltdaPleC8b/grHW0iiOZKgOascYXUiL/gG2QfjssZ6kbft
	 A0ONUPNqUznhLDh/gKhSWAqkRG84jMBS9ksEO9NfWILYSGhtzxB1i8ugSLlJQFTkYv
	 DUL6KNSDVrgkPzlgySsrdufP4U9/sVJLuToF1zs7ItfVh74vGOBI6OKA+vNcsZO8IK
	 S/4UUocSqs4G6OuVT0GJi6eQZbgp2hEWDiD3pdfL9b0nWU947s+F4XukpeTs2qHqMZ
	 sUhO0qJPuX5gYTz43cdowXT9VULbWTQ0V5ULr1Qb7T8tU1hkRYhOYweDDdb+lFMPNa
	 UAaIm+uRBygWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDE238119C3;
	Fri, 24 Apr 2026 18:32:37 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
References: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.1-mw1
X-PR-Tracked-Commit-Id: 9b3a2be84803cf18c4b4d1efc695991f0daa153c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: feff82eb5f4075d541990d0ba60dad14ea83ea9b
Message-Id: <177705555572.1656274.8513487580971873192.pr-tracker-bot@kernel.org>
Date: Fri, 24 Apr 2026 18:32:35 +0000
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

The pull request you sent on Thu, 23 Apr 2026 18:07:29 -0600 (MDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.1-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/feff82eb5f4075d541990d0ba60dad14ea83ea9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
