Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8179AC02198
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sS1SQ4aq9Oy7PclgX5FAyGrnFUIBNbDXCehSnfx5Axk=; b=EVjl/rnkwY/Cok
	xDFOBK6w6/uhnumLLpvkMxPe0gDnK19jr0caKlSSMet7OcP8dX/LXiRiB5LOv4Mnaru+UW8ohvUb5
	kyC+1n/jAH770W8X09Z5Hwx2a/6GUCwNDB40dnEIMwsi3yGhTM2G9J0t0y2bPDPQVcMRt2/KLak5E
	ZBaIdx1Rv+XoWcjWYK1P9LWsbcAuHd75gWg9LhPFZ17EUoRj9h3yrIrc8xILu9rgnD2SpLl5JXBUV
	klF4K71XmVWDiXB+v7GRuBxPMjGv+qIMK8H2a+JCf0lDuzmc0dMLgaN0oHxb7V1Wi/HKiX7zLzlF1
	B0RMJ3nPMl1JHV9VzXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4GP-0000000GiHy-1hm6;
	Mon, 03 Feb 2025 21:45:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1v0-0000000GQJt-2obX
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FB77A41C1D;
	Mon,  3 Feb 2025 19:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6A8C4CEE2;
	Mon,  3 Feb 2025 19:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610138;
	bh=pvSRZHIEnWzlylvGKez7eh4ZaAQSXHHezzcyOVx53k8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LLnNaoetflYy1QzF7yAch66K4VyIGY9uBq2xA1Sk08Mk2PJNG3ioGe9ptvYOKNN6W
	 gjzQlIdtYcEGr4mAcRL1+/J/aPBA02ZIKN66dAwW0K0036mun/6lo/o5haL8Gzkr/U
	 jEWrXF1pxqY3kvQDhPzVM8rj5xshx0e3/+8J3DvOVdyNW+uJoeH8cbuz6TcIUvMuwd
	 suFqIHJOxyqWGOuU81Sxz5/QAsA4XkwJuHYBdpJhER6+8+0Y+gDOdLbUEpEXDf2LT7
	 3UE8rfn2Mdr2jBvtVzBXPK1DXd2D9Y6MFwQi2ScEEgZL1n5cLW8m4rN9RHuF2EuS8A
	 r99vDcNXcnz0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713C3380AA67;
	Mon,  3 Feb 2025 19:16:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861016523.3409359.17144106857280906043.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:05 +0000
References: <87ed2a8ow5.ffs@tglx>
In-Reply-To: <87ed2a8ow5.ffs@tglx>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, helgaas@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111538_832775_D11314D3 
X-CRM114-Status: UNSURE (   6.71  )
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
by Thomas Gleixner <tglx@linutronix.de>:

On Sat, 14 Dec 2024 12:50:18 +0100 you wrote:
> Alexandre observed a warning emitted from pci_msi_setup_msi_irqs() on a
> RISCV platform which does not provide PCI/MSI support:
> 
>  WARNING: CPU: 1 PID: 1 at drivers/pci/msi/msi.h:121 pci_msi_setup_msi_irqs+0x2c/0x32
>  __pci_enable_msix_range+0x30c/0x596
>  pci_msi_setup_msi_irqs+0x2c/0x32
>  pci_alloc_irq_vectors_affinity+0xb8/0xe2
> 
> [...]

Here is the summary with links:
  - PCI/MSI: Handle lack of irqdomain gracefully
    https://git.kernel.org/riscv/c/a60b990798eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
