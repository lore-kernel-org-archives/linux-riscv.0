Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68566ECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDNSHrGivs0wPFAAZm+BKIufOtot43Bf4Lu1U2kOPa0=; b=xTYBGxRqj1FYD1
	WJelyByaGyI6Fjymf0Tf691/G/rVZ3ORwykwtutXYN+7CQ3wEKIIPh/E+I4xIxjq3HxFfbuOhDx9Q
	PCpdws6OiU+mlZAzNMxAag1ATiddnNyOitEdxj3+Pz5PU3kjkDIxuUT2ew5mM82oiI55TcR5Vlym3
	/9ASzoeKMRFooqT4YLKvn2aBrsu7c09KGEn9wWW7bTIzX3yI/86D7e1V1mV/uORc5y/L7aWWhC6hF
	QbgsNJt+1T57fKWeABHF9z8RRibNOI4clEjqQNFDtsgnWuWyuHQchwnrMrdhffe/XYsC+dohs6HY4
	laSk97oEVFPmFmomZjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRf16-00AfvK-Bm; Fri, 26 Aug 2022 19:29:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRehq-00APpd-Pp
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 19:09:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E745061ED9;
	Fri, 26 Aug 2022 19:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53A4FC43470;
	Fri, 26 Aug 2022 19:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661540965;
	bh=q+4Me8XpP5l2dtCSAqvLCPDCu9ahJZ2IXskzO7Z1Vwk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bcU6jhGfH6XiPe0b4cXKDIclp0eV8YDvjVM/k8igY/3oUU4lZJUdUIIX6lS6eVUbx
	 FOByKPadJBlhfqz8AdZK4fAbexE4KbdpUPWFIg82NQyEC5M50dbR1xETcbxud4SrS5
	 DoSR29+mJQ/A7AwwPI+1tXP4F7tZ01UXPr8kGGo8F27bIBkNL1I7pJvF9e2joDazB7
	 BzyYohrk7hqHBoNh6FOpnH5qSv9dzG4kpPxCemVc7NOB8vDwFHXsPd1xIUX+dql4e+
	 o+8PtBr10HJD6pN7DEokl7xls0jBAnwvQ/CxQydqQ+f1HreeTD0uF5eAHvOhPmlhAQ
	 CJk4fa6fr4yww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40599E2A03B;
	Fri, 26 Aug 2022 19:09:25 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-b5674eda-e816-4e5a-aea2-22f8dc6617fd@palmer-mbp2014>
References: <mhng-b5674eda-e816-4e5a-aea2-22f8dc6617fd@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-b5674eda-e816-4e5a-aea2-22f8dc6617fd@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc3
X-PR-Tracked-Commit-Id: 1709c70c31e05e6e87b2ffa0a2b4cc0da4b2c513
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 012bd7e859df9d6aa0a8ab4484c00aeded108071
Message-Id: <166154096526.10698.2507268314030595927.pr-tracker-bot@kernel.org>
Date: Fri, 26 Aug 2022 19:09:25 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_120926_907920_1C8368D4 
X-CRM114-Status: UNSURE (   4.18  )
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

The pull request you sent on Fri, 26 Aug 2022 09:01:28 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/012bd7e859df9d6aa0a8ab4484c00aeded108071

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
