Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D5FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Mar 2022 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jJ+1r8wQ2oKczq2cU+RBVhw/O9TeEN/R0PCdiP6Z/L4=; b=paP7LJ39KYnOLR
	b+QbYQJFHDokcwqY1qxcjuQbenEU9+pqYQAyI/UuwR4Sx0176q9n8c9RAXTX/C7h/MitQmAQHQP6T
	lv2AKIdF2XDjcdoIQuABqnF7/fTdJ8aO+GNt4HvckEbDBV/q4jBg1lff01tSZP0xx7yfgHXMQ3xJX
	Mm76HuUiGAv/pJI36bRCJ3JgnA9p1Cf1Axyr7rqIHhRLbryJZVRqE9QrdJVIla1/76FDayN+cP40k
	xXVACPGpSGSE4StQoxD8/d8PK4AeiKo7S/V7/dF4tm35b3tsvihNGUWWliu8gb5dmRpdfqmg1TjBn
	cdONzfZBCM6ltww4ktBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnnA-002pDh-Jo; Fri, 25 Mar 2022 17:32:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnZg-002iLB-7F
 for linux-riscv@lists.infradead.org; Fri, 25 Mar 2022 17:18:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08C48B8298F;
 Fri, 25 Mar 2022 17:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F245C36AEC;
 Fri, 25 Mar 2022 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648228684;
 bh=hyJGO56HSjVwh/ZwNkn6sQFn7qXrmlFn+2JV0hzhmP4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=S2iNMIX4hHMfJUaDIv52TnhlPuth2/IHSV0vTgDqTpZt0FGa7PfFievFGFt0cIvfo
 n3KNTfRZh4P0Ux94SJyb+J1hcKDAJtMwX6DvdRfyVP1jvdy8BOwt49sqaxuuij1UwT
 kLSaSZmW3NljRSfNvu4hBVV4qwqnpRp3YIYSSC1SFn4bZaMDHP8TJCpuk3TKdhJZbj
 ULkaVknxufLkZPSNyEgSeh6JVxsVZPnf6xuNqS4JqgrYTqvKld3GaVn9A36BNj3Qce
 Y5Gq/78A49NPqFQ1qjvi1eyqHyDQTz+LasWEf00MjClUUEUhvJU4mxXACcJkPmMjYI
 CFQjrEoaO+TMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1D5DDE7BB0B; Fri, 25 Mar 2022 17:18:04 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.18 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-d6e408db-0c83-4358-9cef-831a694d582e@palmer-ri-x1c9>
References: <mhng-d6e408db-0c83-4358-9cef-831a694d582e@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-d6e408db-0c83-4358-9cef-831a694d582e@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.18-mw0
X-PR-Tracked-Commit-Id: bbde015227e89f1da21bd3b84523d62c4a445c06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aa5b537b0ecc16992577b013f11112d54c7ce869
Message-Id: <164822868411.13188.17412957672278212582.pr-tracker-bot@kernel.org>
Date: Fri, 25 Mar 2022 17:18:04 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101808_473937_817BFC11 
X-CRM114-Status: UNSURE (   4.43  )
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

The pull request you sent on Fri, 25 Mar 2022 09:14:40 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aa5b537b0ecc16992577b013f11112d54c7ce869

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
