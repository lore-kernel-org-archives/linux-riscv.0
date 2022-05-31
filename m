Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083A3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNma1Hw0EUPPTz0Mk9kNPHHBjX7TMbGanC39pTGFgMU=; b=jxOK//6jHFVWg8
	j3bCT6QJ0NEmAkxjDiu2OUb9oWdAwyQXRttUNYf2wAtwX/rHx+L1DjetcgmB22XUOhocXNiTpB/vv
	I60D+ubHxRfX96I+sA5J8NZ1/ZVnXjPx9O+OnEFEOQkG8x0F8fgoh9OKxHOwwsbt1uxxh7iZC/ZDi
	0THYvwmetCIBEbvHbs0UZwxQkaHfJpAqmLTVuQ2fKErXHk2VWh4EB9hb/8hMZsn9nRJ1spOqXTJqs
	kwLnEYiaYTKtj16HUFuD/O7u9Nh208n5iD77cf5dFdhTm9c9mLg1i1YQfHLXKLzUusUuMe++2s4Pq
	f1nbXVBf2bhyPdrHUalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9l4-00ClC2-1e; Tue, 31 May 2022 21:50:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9l1-00ClAr-0R
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 21:50:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6C2961408;
	Tue, 31 May 2022 21:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87BC1C3411F;
	Tue, 31 May 2022 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654033829;
	bh=zeuo1QMULipBjYnq4qVt9fhOCdx8r1VKebqnYocYO4I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WSr7eFr3OAchW0kJiPtmjdZzqDFw37MGXttdj2EtN1AXyHu1T9dMnBLPDKWYbYWIt
	 f0GGHijSCyt1XVxDXxGym3/b/85lrhaJlEzeuP/+NaZpNTik+3zkeUF0osvPkTG9c/
	 OtWZkMwQ67uZP3xPbxC1LnVCxWx5/k75NCnPbXm+md2iiGw5Ny5C5B4E0F39VgWp8Z
	 9KI3vZ/LfFnPees0BwwjTclDR+ABUwnvIkEVdVrrhcRWVgCOPtT+idPqbDLJHiwcYy
	 ZSo4LM9u7aEjirL0ljYQJ4uHZkSdWNZwBK25i8XtxiGCk0a0ssbisi/2s6ugnNqDiE
	 eCVDv/yg3jxbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 75484F0383D;
	Tue, 31 May 2022 21:50:29 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
References: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-3cfe92b5-a83a-4642-9b9e-8416ae717fd6@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-mw0
X-PR-Tracked-Commit-Id: 7699f7aacf3ebfee51c670b6f796b2797f0f7487
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35b51afd23c98e2f055ac563aca36173a12588b9
Message-Id: <165403382945.9010.13864501013200150707.pr-tracker-bot@kernel.org>
Date: Tue, 31 May 2022 21:50:29 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_145031_127792_1BEC9798 
X-CRM114-Status: UNSURE (   4.87  )
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

The pull request you sent on Tue, 31 May 2022 10:13:06 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-mw0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35b51afd23c98e2f055ac563aca36173a12588b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
