Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F30E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQuIlw2yc5kJJETvE21YYJKnQRmZQfkpJ9ioL1iYYdQ=; b=SKDg/HDM7U69M3
	iKhVoJQI7vF+7TzMgNnbB7qiePNNh0ntdxAiisyU1TY18FkxUIUYN61DoXTga2xZKhqtzmn6mxrTW
	7qrNVPCk8QgyL4C++TdeDIeGz5WNDAe92q4hNJMMY71r7iaI144ILp3KYBUQX7RCcebq/OeVKZ8AI
	7SzNoRt2+/ufLPaJLyGtAfAZwqF9h4YqjfAdKk0+3G0cd1j/S9UAlOvaibaEH8a9n7jibExFx34Ba
	I/mAcfrhgiFc5uk6hGOxVdXgXFwt1Xmd6cWKEuR/82pjq/srvgiz21BdSsUqbMFoKhhP+8s54ah+A
	TUVCUNWWHFSjqbp8k/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvD2-0000000CdrK-1Hw9;
	Thu, 09 Jan 2025 16:16:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvCz-0000000CdnQ-1lFP
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC3C65C5CA3;
	Thu,  9 Jan 2025 16:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC82C4CED3;
	Thu,  9 Jan 2025 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439392;
	bh=N0K2fUUZiT5S8AtXybWvlF4A8ZPgxRZ683066WaK6DE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iELjAewSOPbolsIKurxjQ7zRsA+N2qPHi7gSaBeLyJJiQvWkh0I9MHKd3j4WVqo/s
	 JS+Ly0+ZxsWgmFU/ag79zzCdF6Dbg8HC3QCtIXQ/ljm9B/Vs19ZJ/eO1XhNHDJ5TCa
	 GlVIhhyp3q3S33wpZ6Z6pvjNbPGd1h9WwfdJfL6g+l0CrQGFl2cfZRcGd+hf4QUBwg
	 TFF1hGy9ZGhe4aROuuG4I2voPOa2Erj5hB8aora04Yjwv11khkD3TeIN4HsopniXJJ
	 BRP9iSoj9vYkyJwrRNgfwJkf6M/zUEjRzzt77upUFKGm/CO/jQSNBy644zTQn/gwhK
	 hkSxRD7kEpwiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC6D380A97D;
	Thu,  9 Jan 2025 16:16:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: kprobes: Fix incorrect address calculation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643941449.1375203.9833257781109413385.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:54 +0000
References: <20241119111056.2554419-1-namcao@linutronix.de>
In-Reply-To: <20241119111056.2554419-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org, john.ogness@linutronix.de,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081633_526662_6CF7EB62 
X-CRM114-Status: UNSURE (   9.20  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 19 Nov 2024 12:10:56 +0100 you wrote:
> p->ainsn.api.insn is a pointer to u32, therefore arithmetic operations are
> multiplied by four. This is clearly undesirable for this case.
> 
> Cast it to (void *) first before any calculation.
> 
> Below is a sample before/after. The dumped memory is two kprobe slots, the
> first slot has
> 
> [...]

Here is the summary with links:
  - riscv: kprobes: Fix incorrect address calculation
    https://git.kernel.org/riscv/c/13134cc94914

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
