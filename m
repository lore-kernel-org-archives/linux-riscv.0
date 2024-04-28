Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1912CC25B10
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/O/l1vYr1EPJTWTrCNH/C0J1KNDwD1Q9zlPRxvdDL4Y=; b=bVTVUYHoLyPC8G
	bD9BHjL5BKSOk74jVP2FEqsYh4aBtlVDMI4kh7vT4QD1OfgHiWM3hnTA6s1z3zwFiFU1bxBOBJYEI
	UFvxBqSXTN8FWdODQAIrJLZjrlRSUuxnGIKeU+h+LjpE90VkRYAu/2kEhuJfi0Jhw/M8tujTF/056
	E9cHX0Y7OvTTBZEo6/XU8zGugSWJFtpRABQpIUF6OddLCRwgASi/FWF0DCw/3WvhWyWRk42QnPJSj
	h92+Q2hd3N6o14hHYF0xz1fd0AEFG7DBoGGzcmJudAtG9qs0IyxApiMCsXZ6nT4lfqMlqo5BX2zRN
	A4gEVriqqhC20BjBq8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZj-00000000noB-0VXw;
	Sun, 28 Apr 2024 22:00:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZY-00000000nir-3ZRg
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8624B60BAC;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8679C4AF1A;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341634;
	bh=KC1Yo+XrpJuh0Ne3EzvGhOeRZkWrMX/+3F9OQYAAjOI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M2Hnp/Dcu4sDVlPACCyZ9vfEPsQt97EJonugf1tdn2ldnRdoxxXIIpsCnJwqaVQTU
	 YOXcvermLT+EDVjEI7EgcyNjsSnSDcVOtQJJbwOTd+OJEIqdTpI1vX5ZtDYY0qaSYR
	 fD+hpQDebee6kcavBHzkQmO8ak+G4CiQ73QlrkYxEFv8mxSVWaUfPsEjQwaxk+IB/X
	 PqdYg83/OFR0aqsCYanzqaUZs4SGboDrQSfMcNlDx+Y95pKJ2EVdfdbd1E2trpHO7S
	 D2UU9d7kHPR1t+9os3Cx8x6R8OBQU/YjRrIjCjuQfXAVvkwa8cyzCoZ04FTE9ZaVUZ
	 tq2d9RuFr2SJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC6A0C43638;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 RESEND] riscv: mm: still create swiotlb buffer for
 kmalloc() bouncing if required
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163482.22130.12186262884085784070.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240325110036.1564-1-jszhang@kernel.org>
In-Reply-To: <20240325110036.1564-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150036_988137_02B75526 
X-CRM114-Status: UNSURE (   8.68  )
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

On Mon, 25 Mar 2024 19:00:36 +0800 you wrote:
> After commit f51f7a0fc2f4 ("riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC
> for !dma_coherent"), for non-coherent platforms with less than 4GB
> memory, we rely on users to pass "swiotlb=mmnn,force" kernel parameters
> to enable DMA bouncing for unaligned kmalloc() buffers. Now let's go
> further: If no bouncing needed for ZONE_DMA, let kernel automatically
> allocate 1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing on
> non-coherent platforms, so that no need to pass "swiotlb=mmnn,force"
> any more.
> 
> [...]

Here is the summary with links:
  - [v3,RESEND] riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required
    https://git.kernel.org/riscv/c/fc7a50eed986

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
