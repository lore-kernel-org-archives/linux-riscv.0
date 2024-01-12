Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A600EC47258
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 06:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aX+69FSKz9eA1ThkXcQSS7nQbkE0mNwsTJ/9XQAUtPg=; b=4ofWBdErRoRR1T
	r5cigP/COQr3I2TFnW420T1hHFkdPBdjUpyUJQkAMpx4sV23Xa/qWJvR/wuROTvXoki3uMITMhL7S
	lSGyaWF3068k0HXc2N0Bu66gOOxydkLW/qsmojB6F8iUseyJAylPd+HCNr9kRLPBIEk6vngqj+Xdg
	LNiCm41bfKk9WyRNZ92P3lk9C8iSxdLl+cMnn1xtxvz5mFZ/+80yW5c2YrvQllXdMgc7W02MkYt7T
	1rhdAUuvn405pZDBHx9jGrC8vQAY2KFBBZ5HvzRz6HlW5/u1bqYwtoLgpx3GiFgmEah8x5T491ep+
	nyxaKCkk6r7poCUstjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3x-0020w9-1g;
	Fri, 12 Jan 2024 06:30:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3s-0020sS-0x
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 06:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6CEDAB82259;
	Fri, 12 Jan 2024 06:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0A7CC43399;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705041031;
	bh=aZ9M2uKV6onpNRKsHx+QyMJOm0urWPWtFbPW2xqWs08=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MikZ87mnhB9HH1R7gMvXdNW9prX/1oyBMOBB/8n5d5VPk95YQZqp5DIGcEgOWzzdG
	 yUclOZ8J0/Pi8L6xpIH9l+I2pF+kK99NORstrRmjGNm1Xtxv+HjXvP883xKL5ipKeB
	 u9+XA41SJbg4z4/kRa4Bj7Zawf9WeyIt2A/zl3OhCUUPIzU1PBVtRt4QEtdNE9OdHO
	 crFRG+4EqPcQGoLbQljsQSuSIfOUVUvJSwcT++jm0F1QtYEnFV6vdijlkEJJRqE8sK
	 MMXvAHzjNgHTHRiLo5hQUEhPUIsKaiv5beCMWnyTcTqwPmxTgC6i3mCCUPp0ejYnbZ
	 MBDQSBYzxceBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7034D8C987;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170504103087.17535.15863318828506386951.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jan 2024 06:30:30 +0000
References: <20240108193640.344929-1-alexghiti@rivosinc.com>
In-Reply-To: <20240108193640.344929-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_223036_521879_F2564B28 
X-CRM114-Status: UNSURE (   8.59  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  8 Jan 2024 20:36:40 +0100 you wrote:
> Allow to defer the flushing of the TLB when unmapping pages, which allows
> to reduce the numbers of IPI and the number of sfence.vma.
> 
> The ubenchmarch used in commit 43b3dfdd0455 ("arm64: support
> batched/deferred tlb shootdown during page reclamation/migration") that
> was multithreaded to force the usage of IPI shows good performance
> improvement on all platforms:
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
    https://git.kernel.org/riscv/c/54d7431af73e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
