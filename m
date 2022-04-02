Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26B7C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 03:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQG+GhUv1SSPQyVR3bzsJvZArjy4wrqJk7LboOdhWso=; b=eGueAXvfLtNEo2
	soW3x7DZqui9dST0rIVXQUztKYGMxRPAYmVGqIQRGPfd6T4Ff7yhEnytFXyO1FxWYIMnhLswMPw5e
	goFON63KnAQPHpch2L81j9fhC7jwBHwtWLMI72FShxsgiSYcpAi9ihWwlYKDP9UCH3OJsTGLjO4yP
	T9OgFzyelgPVF93G5fo7QZfKfbvAVe0VSjwqK+gkzSoKfGwXRDOvuqEqedIsIyrrP+F4trCgs/ysW
	f5gFkLKw1YqgyLZEJPVQjPnZoIOwpFiUJX/oeGCXNyTy4EAT3EAhfqMUcFknQHK2cjVwWVMcUwU+W
	CLC3EnR2gFRh92qi4T9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naU7E-007pQ9-9X; Sat, 02 Apr 2022 03:07:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naU7A-007pP6-K4
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 03:07:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF33F61CC1;
 Sat,  2 Apr 2022 03:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3423AC2BBE4;
 Sat,  2 Apr 2022 03:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648868867;
 bh=aOPqVZwUVsgERE3HUZjYHTEIcl0gPbx8M3B7pyPWPpU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=H966k1Ooi2MaCmtNfvrJ8IKNarQ6dtWTGEJ18vsI0pjDlGh9axYiGMME10O15ZWTy
 ceNAd8Oeg3HicR0G+BAEJ2J7xTabgBudguc7XANh9ASLAqIJGhwPi+xkAl2AsA+pO+
 5+GIqowIYM6tSkU22ej+Sl0bPk5XJ2WG5SM8UxM9g9wjrynT8iFU+GNlu4JZWh8/Kw
 6XwXQqvHx2QpBfba28rg3B36ewp5a21gne0JHq/OtS6hLxJCPBjETWjKu1Iv94lEmT
 hj5Vgv7PeudsCB5jH10zUhx2+LIi69KtbxEIe+irFiBVNTcWOHjD4bphtWa9tOGRUx
 BJpNIW2FHXT0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1913DEAC09C; Sat,  2 Apr 2022 03:07:47 +0000 (UTC)
Subject: Re: [GIT PULL] A single RISC-V fix, ideally for 5.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e799956e-2858-4ab4-9795-1255abc93c39@palmer-mbp2014>
References: <mhng-e799956e-2858-4ab4-9795-1255abc93c39@palmer-mbp2014>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-e799956e-2858-4ab4-9795-1255abc93c39@palmer-mbp2014>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.18-mw2
X-PR-Tracked-Commit-Id: 2524257bce43610f5ec14feccbacf7a103cae94a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1fdff407028c6064be96343f4bac31a0e679cbd0
Message-Id: <164886886709.20951.12719267433667674431.pr-tracker-bot@kernel.org>
Date: Sat, 02 Apr 2022 03:07:47 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_200748_729970_C82BCE9C 
X-CRM114-Status: UNSURE (   4.14  )
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

The pull request you sent on Fri, 01 Apr 2022 17:21:25 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1fdff407028c6064be96343f4bac31a0e679cbd0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
