Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8262C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 19:46:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5775161B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 19:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5775161B6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYPLcft5lrixwqYQucAgGGm/G0T81IEnyZkBowyBoxM=; b=ADw8WFga+y6PI9
	d0QUO+LvJhc3k7Oip7Tj25P68GAN4kEpekZwYvMSR1TdXQZljuyMAWi3d3GNQazZY14eF7EYG8UhP
	H6g2LniCff840K0QhtV052LjG8TFuKBAzRDz+jnF/dZKPj107UUxKR0VOdQQyiCoJoh9cShNTErSr
	Y8+4I7q0Q2iXk+WK3Q2MJR/yV9Qldw+67OX5XcLY1bMQdsGok3zw2YK5oZHwTk+bjniO5jJZUscjW
	sxkG9/eJlj6RRlPdkS2Ga4mdvAZBsY7GWNO0u4/AvUvsKpGEKgmuKriG0UmUHCK089K0uaXKnoLw7
	4AJuyFm5gMqeQWv8DoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo9pw-00BUcQ-RT; Fri, 19 Nov 2021 19:46:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo9pu-00BUc8-1W
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 19:46:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F14B61AF0;
 Fri, 19 Nov 2021 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637351173;
 bh=BAPSiMNf24oxFkbo20Vax0yqWQI23M7l8iPHUj2eZGE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=tDOW7zZN8PmiCe5cG620D2bsCBmgRi3AokGIp6kXul9p0Xk5oxdfYugn8lxL1qUVZ
 nOa3l2p1SfwvwXOKf8Bohy82l2QAIfbeZUB2bZeEnBHAgdfv56zbrDRCAqUX405MuY
 ediD1B+9rXHuXA5UGtA2Azp68O93hEmMeYjZIXKkhsEJcDYS1eqNdkzZK4o0SFv8in
 ybJkIBAPPUw+I3Lp2n3I2HjIIAmaa5CaT5QtqFCNEWSVgMEhhqZh1y7K+fBtF/AI2d
 zwi43NVAyCaHrIB+9+siPu9/WR8ooraOQ6OFEHrmbDZ+gfy4gOChC6jNWBw1YunvrG
 73bKXdXbL7cnw==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.16-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-fbf2cd0e-320d-4e42-a2f2-d5343d0a58b0@palmer-ri-x1c9>
References: <mhng-fbf2cd0e-320d-4e42-a2f2-d5343d0a58b0@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-fbf2cd0e-320d-4e42-a2f2-d5343d0a58b0@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.16-rc2
X-PR-Tracked-Commit-Id: 5a19c7e06236a9c55dfc001bb4d1a8f1950d23e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7
Message-Id: <163735117332.2946.15185064032950139254.pr-tracker-bot@kernel.org>
Date: Fri, 19 Nov 2021 19:46:13 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_114614_123942_A30F3180 
X-CRM114-Status: UNSURE (   2.64  )
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

The pull request you sent on Fri, 19 Nov 2021 08:18:46 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
