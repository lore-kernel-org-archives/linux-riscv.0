Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6249CC02194
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 23:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwFWml85CZajKOeaB1Bjjx3m2AUw/fXf0I9BmCEie/c=; b=dcWTgR1WpP2t+5
	QeY0pOFRbSuE7Mg+LLe9lbEQy908O1IWiyN1q2snoLIlCDQ9hU9LTtkXZtobL0FFZQr6Awu92PXsg
	bdu38z4ZlCmX5zG/ztSyRMwuZjMX6nNCGpiKSDIRvV2S7F2pTppL49i+fTS/EE4gkQc2KQBROlE0I
	1xjwINsNyCrVzEnJSMzKc1WEse8JSjXcQAoYXne28WhwQ+sjTxHBoC0iKouEGb8ZA1AdBSNmLO1RB
	+CpDyckeHtfezZTAQSdQr+nRbl1MkoKKUYuL6oMpVTSZeo1HhAOPBTVDOeKZZbarKrc31+1y4jzfz
	FnQxOU7l9Wx5uDS13bQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te0kN-0000000BeZS-28ev;
	Fri, 31 Jan 2025 23:48:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te0kK-0000000BeYc-2a4t
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 23:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05CAE5C57E1;
	Fri, 31 Jan 2025 23:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88E6C4CED1;
	Fri, 31 Jan 2025 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738367303;
	bh=/lTg9RXsjupqpBSfKJC/jK0qjh3t1trdN6qvQpo/DAM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VFnpwGvNXdbQwZM+tzbUsTiTRLMkWnuSExk4xmSpVj7QNISfZ5LoT5Tj++K9yyqgw
	 MG5Vdn5R/aVMkvy6avyOTyrgklTnbSB3kRtzdWfzKGrk6XaP7s+7pZu2kZREhR2JxU
	 6eYwaDMx3ZSeq8obTyaADGQnAcnSiBvVEemTQm/IArhyjnhfsYtgIE+6TK0u/1XytP
	 21aaFm3cTOnofNHN4KA10L3LqAlZm0vim9L9gQHT7bt3KwsvBvQBSSbVAcMivd4D9L
	 tgYD2ZidNs6i9pKHyBs+SUDhWO/zImRnS2ygm+63m3l1rqw+7t+l2s0WieRMlnXTg6
	 9xahUOUnu4Qww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7102D380AA7D;
	Fri, 31 Jan 2025 23:48:51 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
X-PR-Tracked-Commit-Id: 101971298be2aa4706c8602bd81066a0f6f2ced5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b5f3c51fbb8042efb314484b47b2092cdd40bf6
Message-Id: <173836732990.1763875.667378817259432059.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 23:48:49 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_154824_696278_DF437214 
X-CRM114-Status: UNSURE (   3.20  )
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

The pull request you sent on Fri, 31 Jan 2025 12:08:40 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b5f3c51fbb8042efb314484b47b2092cdd40bf6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
