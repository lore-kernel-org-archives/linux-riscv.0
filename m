Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B12C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 21:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+N3hyzjLqGxnxLxA/8j5M6HJYbpQPWLeUF4/4DbP2ks=; b=YktRKosHWFxkEJ
	8WlxETuUKF6J1nTDBshDw22MLnqoNtKHXTiJ3t2sNtH60J0R74X+6sLKin/1jdpCM84U8+Yk50skV
	l1tb+CAXwgvO1MA/1i/FxntWcfKi2/6Z3nZvQ2LqQlNqf9pljxnAMNPS5P+2A0EuzVZId1z7KTJPA
	uTreI2ike+UTL++mcJg1JY5DvkBzye+k0jwfIB4NdWoNRnmxEw0msRlln5bysRhcBk5xmo2LpL8F4
	wCLTi78snpw7poo1XHgheT3swpgGXo/7JzAvwRtxaiBSCRmZ2E9kPjb64BDJKO7444aASCAY9cTYB
	kkAEjGlNovD7DPWL5Z1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUya-000C0W-02; Sat, 18 Feb 2023 21:42:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTUyX-000Bzi-AA
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 21:42:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 04C0660BBF;
	Sat, 18 Feb 2023 21:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E432C4339C;
	Sat, 18 Feb 2023 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676756550;
	bh=CdUqu4Ltiz9xlUwtAM9NZWeJBHqCx2QoI+fRvuA1mDc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=W7GnDhWxviyGhfPF/QPLu8vKlep6Y+So4JDoMV6/mmjlf34vYa8sBzbTQ1KeZ05/d
	 DgmPonC8BHexYLkMpWB/5fl7g5mtl+r+OtABUy2BY2396htE9qQbLV0Nds/2Jfhw4u
	 feDCiFzFz+EKhr5EFV7vgOWM7d7dlacu+z+5lcBCudJGqLRKgOpeYi34pE3tDVIvDO
	 kugQP2C8rbPbufrNIyV/y9FkiZrusG2SLvcxo4sucT9DQdfudxoFCYB+CvIhTGTRWd
	 r8nIhPrE29FNADXjzDkypiKL2t2bSX6iDgebTnGdvSQX65qCwFcLaprwfhpsTXPJC8
	 o2WJjXRcwD0Wg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43FB7E49FA6;
	Sat, 18 Feb 2023 21:42:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: move some stray __RISCV_INSN_FUNCS definitions from
 kprobes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167675655027.26920.12021264099395656112.git-patchwork-notify@kernel.org>
Date: Sat, 18 Feb 2023 21:42:30 +0000
References: <20230113211955.3534431-1-heiko@sntech.de>
In-Reply-To: <20230113211955.3534431-1-heiko@sntech.de>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu,
 ajones@ventanamicro.com, jszhang@kernel.org, heiko.stuebner@vrull.eu,
 conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_134233_438735_AEDF7D6B 
X-CRM114-Status: GOOD (  10.62  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 13 Jan 2023 22:19:55 +0100 you wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The __RISCV_INSN_FUNCS originally declared riscv_insn_is_* functions inside
> the kprobes implementation. This got moved into a central header in
> commit ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header").
> 
> Though it looks like I overlooked two of them, so fix that. FENCE itself is
> an instruction defined directly by its own opcode, while the created
> riscv_isn_is_system function covers all instructions defined under the SYSTEM
> opcode.
> 
> [...]

Here is the summary with links:
  - RISC-V: move some stray __RISCV_INSN_FUNCS definitions from kprobes
    https://git.kernel.org/riscv/c/8658db0a4a0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
