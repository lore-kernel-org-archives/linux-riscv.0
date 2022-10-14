Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087FCC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR30Y5dmzrZ5Ghw6+Nw0mJFzs93PuSe+EJSk2aFRc7Y=; b=I+aj0AuaF3aGKB
	+Itw8AYwUNLa006Kz5gvtgXw5Ac2Ys0h2PRaExXGHY2U3htxmJbW5WGbtKPVLB6jHjwVddwSRh7pI
	B6AXSxy05Y3McCAIG8Wd2lZ6pzDqGqG7lKX8qOtCYbH+EAVp0d8hDa3K04huMF1s35ObFN++r9H4T
	K37oqEda1Wyo7HNySNHBO/+a7qCodkxrauyHxDZXL4u2cfxspjALtRuv/9bLUeZ/nPVDNNPcK+eDV
	Hyr9iha1HXNaQCiEbsNrgXTZgp+beoJ0wI0MXpduCSffssdeJJJ7ebppSPa2WuikBddvXNP3e2V23
	B4qolnab4PNtKjL1Ch+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojQ85-00FgIm-TT; Fri, 14 Oct 2022 19:13:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojQ83-00FgHk-JV
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 19:13:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26ED56158C;
	Fri, 14 Oct 2022 19:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C612C433D7;
	Fri, 14 Oct 2022 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665774831;
	bh=EFSHnKiwm0zo32NbLIshfLknh2Dco1ndFuQR/dD8wGg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HP2Mani4PQNQDkXXUrbs916bqp6bnNY/6uD+sNHOj+kJaI1MFAolo/4ChfBI+AqUy
	 4i3pcZ1HYLZD3gIRq8HRDtANbaknGVK8BE5h+Mgfz8AEi+5uBouLytKEV6TN4L1rpw
	 6JmBj3h4buG+bd1BVXPV34Hx7SfJaig67oSVLzbfLCOcxkwzR10n9+VoFuB3Zm14Tt
	 TnTM4MmEZPzN8C5bZhwtdmbNy5ZPXmd64NHsmnlaWApHpAoyPn+bcgoM47i7xyYae6
	 o2U+sE0s3r7RkkVC035MNKtzDioWOyAJI9db/Dc4zG+5S5XVg56NisEA/qR9QIM0xB
	 O/njsMoIqq3Gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79140E270EF;
	Fri, 14 Oct 2022 19:13:51 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.1 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-569ea3ca-5e4e-4339-b3fa-84723ba9ca77@palmer-ri-x1c9a>
References: <mhng-569ea3ca-5e4e-4339-b3fa-84723ba9ca77@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-569ea3ca-5e4e-4339-b3fa-84723ba9ca77@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-mw2
X-PR-Tracked-Commit-Id: ab0c23b535f3f9d8345d8ad4c18c0a8594459d55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 498574970fc968ee17cfea9e6959b78c094c00a5
Message-Id: <166577483147.24477.7861029463816667257.pr-tracker-bot@kernel.org>
Date: Fri, 14 Oct 2022 19:13:51 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_121355_719630_0F7C5ABD 
X-CRM114-Status: UNSURE (   4.23  )
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

The pull request you sent on Fri, 14 Oct 2022 09:35:43 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/498574970fc968ee17cfea9e6959b78c094c00a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
