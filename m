Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84238C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdGhOmrXvAd8ARLVvpLLLOd+yEraEbVLgCnzaLhaFwo=; b=brhuLu3dOoU4qe
	AEIZGBwgDcXJeiizo5D3q3L346M0x5Clxydra3wnibbppI3UJcriWVps3BdX9lAIFnU6cDjYZmJXk
	6TyN4Mf3zCr5Dw/VgoBMw+h8uiZb5CFTjMYclD88zJBLneDiPNTKv8HvmVpPARJ8x4XzBuggvk1qz
	03LVB1iF59vHjbMvnz3f2tgoPqXuy1/DASMqbfqqbD5rq9eoovBXCGSqoyW+Xi6jXnyx3gFdFIWtF
	q8pkQsnkIAK8buqK89+bR+dkzLy/XRcRQav7OFXixw2Wn+PG3JAQbScLOE8BfJikVKJN+5j26QFYr
	3mABnQgojgui7+2IaSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRHF9-008J6n-1T;
	Sat, 20 Jan 2024 19:43:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRHF8-008J6Q-0R
	for linux-riscv@bombadil.infradead.org;
	Sat, 20 Jan 2024 19:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Date:Message-Id:References:
	In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Sv22IpZBauvEo2j4dAunhO2n8Mn/MmgpONXlC3zwN68=; b=evFG5uUMhGX338SjOwPDQWwNhH
	tFMPUhROle/SB8ppGz50WQYTKqb7jG1fb9Sse4vDmAzO3FIfYTElJmdLlVIhDmywmhfxT2X9psJXD
	9qsnLUffgrtfzNK35a+ogb3brNSWSFT4aUovNXBycdxTJ0AlzNoMhUIhzTFNvPPTOlm385TALykQj
	bqaDWSg+NOxddEAKiiAeg2dB69G09qUSFBY0Mbuw4vL4iaI92IS6HgVr3Dqu9Ez8DVI6KPqQv4oM4
	/aLBHpXUVm8k41MjaiQ+HW3YIKZemT61lHj5rHWD75IVjFz6XidPjW96Kr3m9wtfnizoJxFmst5dd
	uU2ucwGg==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRHF3-00000002GWW-3En4
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 19:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5B211CE1BC6;
	Sat, 20 Jan 2024 19:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 990B9C433F1;
	Sat, 20 Jan 2024 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705779763;
	bh=Sk7UgdRKhW4n/h43PHK7+DFlzz1yfIvQpgev0Ft8LZs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gkqlhoy9iMWviJj2/YIwskGQz3wZCxiVpgSjT/FnFKEY6aF5g++KlirYnGFAMxOkC
	 mZZIbJxj6QakZHM+hva7n8rP7O2YXMcIgTxJ92vRnQrbjAyaTf0FD3Rpwwr9RLlpkP
	 X/J8+7PmH1f3Gyn3AOY5aQnECRL+ezloXRdAxNi//4OZHiLvkKcLZlTI5XrE3NfZQm
	 PtsfkIJrW33FF0ms9C5Yz3/ZiMrIFxwz7h9q2ZRbFY7xjpMF9fNj9t01lLxepX6oAC
	 Mj5DFzNffU+heLiTB5iFSahn8pCUiAexfmJ5vEyBLLlvJV+igrswEaKHP8NyZh7I/K
	 8TXZWIYByu7aQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88BB3D8C96C;
	Sat, 20 Jan 2024 19:42:43 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.8 Merge Window, Part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-690cf774-fd28-4d25-be9f-69e19fb84d5c@palmer-ri-x1c9>
References: <mhng-690cf774-fd28-4d25-be9f-69e19fb84d5c@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-690cf774-fd28-4d25-be9f-69e19fb84d5c@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw2
X-PR-Tracked-Commit-Id: 4525462dd0db9e86bb67c10dedbbaa4f8d62697d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f24a70106dc1ad2a755b2d42f47cf1dcf24f0b27
Message-Id: <170577976355.29448.13004086407544849913.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jan 2024 19:42:43 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@subspace.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_194258_244657_DF68A102 
X-CRM114-Status: UNSURE (   2.73  )
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

The pull request you sent on Fri, 19 Jan 2024 05:53:42 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-mw2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f24a70106dc1ad2a755b2d42f47cf1dcf24f0b27

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
