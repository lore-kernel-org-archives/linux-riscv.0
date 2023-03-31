Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D969C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 17:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrwPv3HPH5lxonzHBZ2ZFvV7Ivtdg32wcaC4LJaQjpw=; b=OiIBeYhoMXxL0i
	QDW7Q4uskPJqRpsL43rOht9Yh3R8+18cmWYpTfmFMgVsPuyZ2wQZTMk8bzpJgEhOySP38fAYf4lGC
	+VyzP0tMQ8Ylh1gp6gpJs2fRI4zD+FuBevs/xWQIunT0PqTUng3iqOW7EH8vgErGH0XQXzFtN+cMw
	kVtdDpjWdFAO97jjlHIHWLGp9urvdQuguPs5VmnMdV2mC5Bj0GTxrM1zOLox9gVRaZm4rhot1iFdg
	j3hbTrJh2JGYkusEaNeEAp1fhdO7CAcKbfZkKHhAdoE1kLEDCxwQN+IIn18vzOGVTzfLWBII2Qma4
	bUEycuD8xpZKYl8WmFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIWi-008I0X-1u;
	Fri, 31 Mar 2023 17:27:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIWg-008Hzp-0q
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 17:26:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FAB462AC8;
	Fri, 31 Mar 2023 17:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CF07C433EF;
	Fri, 31 Mar 2023 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680283616;
	bh=/dM+IjqDVKCbWfVL0N2lP1q7XwfnF+NxY6ITegE3JmU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GzjVDpl8xX7Hm0iF2BlE8s8Bc3MSvjRzzy8fCEFLBajz4u0Lg2tynJPaqWyx/LJ9H
	 TxH1SIOM7l4RF9qF3lltueqXTj+DWnl+XxnHmO+g/H/gkOzRMJig9gPH6KfvosrTEj
	 lq/ji+/E5NSxKX2a2VXOW/r3GoAEJs363dYAxAQTTAyFRNolcIS1a9nsvemASuchJ+
	 WJcyvXT1ZRRG95XxA0B7an8Ht6ETimc+Pov7yODyoaMGK+8YAl2kDH79+1z8ai0I45
	 CdxI1fVRyFhsLr3eQfFXuFMR9BWuUnfserBjT6Y5LgZXO708bd6KI66petWLfpZC31
	 QCsp46J9w4zDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EBFD6C43157;
	Fri, 31 Mar 2023 17:26:55 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-39dd74a6-0889-4b33-b276-201f02823d17@palmer-ri-x1c9>
References: <mhng-39dd74a6-0889-4b33-b276-201f02823d17@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-39dd74a6-0889-4b33-b276-201f02823d17@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc5
X-PR-Tracked-Commit-Id: 4622f159098e098611f393cccf73d52b007e70bc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 39f692125c388aa657e77e5ae07ea72be02d99a5
Message-Id: <168028361595.4567.13902678577977519217.pr-tracker-bot@kernel.org>
Date: Fri, 31 Mar 2023 17:26:55 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_102658_339166_C3FF86C4 
X-CRM114-Status: UNSURE (   4.84  )
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

The pull request you sent on Fri, 31 Mar 2023 08:01:05 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/39f692125c388aa657e77e5ae07ea72be02d99a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
