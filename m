Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77A3C25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 26 May 2024 21:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GpcFDbC9wdbxQnJns4WvtR7sYfvNC0/jt4JtE0kbRM=; b=xVincN5QVbVev2
	Mm5MDxFFo9Mo6RsJMyMk07KtdD3/5XkRIxyviNT1QWofH2ohF+KPWpoh6v9+P18ex3rMwFS27zqYi
	XXFopFjmfpH9ZRq+bZRoZVUbLxxQrp9g2NbD6LKdAyp/ISJ/c8gnznnKZDbPM0bjPTnsyCTEniYAA
	nJriy7lq5m0jEqixXws35opeyjxJCUk4LD2yAgcexbr5cWda0bMrFcmvYCGVJhnTgByitzw/aTGfh
	p6Ro6Y4hacBQngozTmfJGIbp/p7kiDUjlXv5lXlblrUogR9CGcQAhtMjCrtNr71fRGcyJ1U4b63w+
	bw6FW2a90/cND/2k4XSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBLTL-0000000DIaW-1jgT;
	Sun, 26 May 2024 21:32:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBLTJ-0000000DIZt-0r53
	for linux-riscv@lists.infradead.org;
	Sun, 26 May 2024 21:32:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 931DF60B30;
	Sun, 26 May 2024 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E28FFC32786;
	Sun, 26 May 2024 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716759117;
	bh=OVrLoTT3VWRKK8+T51uPGfdBRWS6IIkjOL2Z/igbpbE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FS5QyzLoBFYerJnHpUnVAB70uEkEV4hyKXuEXrr0X1StypT7HB432u2N/TFyXlqBn
	 ijLB00tZA/dyE/cuuwZ3lbsBidLGSoeweNu9gS81DZ/2vGk/74WU1HiHNE2rBK2Cmx
	 WK+A1M7ijsLoK3cPMBPtRhaUK9z4St4slOCjzVhWkTEi8fF1VZgC5d9bSabGAlLYap
	 YjPUqfrEkBak8GFkxe7+wEKyKR+l26180KufnnQsUasOBtbCv91RCwxpPUWfTN23p2
	 HbXXIjkv23iUOnRlQfyukKAxtSrO2MYddTepLeP7fSFjL8kV1pHrRlUqO7GIksOBIH
	 Qc8pGkuypzq9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1FE4D38A65;
	Sun, 26 May 2024 21:31:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171675911785.27088.9320331335675774714.git-patchwork-notify@kernel.org>
Date: Sun, 26 May 2024 21:31:57 +0000
References: <mhng-3c77af8f-340f-41fd-86db-a2add39fdac2@palmer-ri-x1c9>
In-Reply-To: <mhng-3c77af8f-340f-41fd-86db-a2add39fdac2@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_143205_315289_2916A0A6 
X-CRM114-Status: UNSURE (   6.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 24 May 2024 08:53:40 -0700 (PDT) you wrote:
> merged tag 'riscv-for-linus-6.10-mw1'
> The following changes since commit 0bfbc914d9433d8ac2763a9ce99ce7721ee5c8e0:
> 
>   Merge tag 'riscv-for-linus-6.10-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2024-05-22 09:56:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.10 Merge Window, Part 2
    https://git.kernel.org/riscv/c/f1f9984fdc5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
