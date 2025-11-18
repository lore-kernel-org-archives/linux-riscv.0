Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C13CCD19A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 08:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5B78vqFc/rrnhaxVz0o4WnWizzQV+Z3ILxwRjweYFU=; b=YWdXxCZjW2zYY1
	sijf19yABfblkoG5GHk1ZSjIhdAPH9YDhzqjWBPEYgS6oRh4O9U9mULGhbVrHAr0jlnV0DyM4hClE
	lJXcrKqJdqsY4i8pOOVYWvQFMYSx9TzSnm0HgbDM/L4FVGT4FGIn/NVCBLlhObD2xodXHm8OfnKrD
	dBMdQ2ODQTwd+ZEMhcp9A7v/2ww8aWi2PcGV/1gFpRd7d11Cy+wX3UDMc4q/byMVgqgYudhRik+bX
	QEgiEv8zlxFPQo9UjeFW8lMqKlb3aAZISbzd7xtGKrLBP9fnYPDYlZICvc9F+ZZyOt3iMv8RHlYV0
	zJbpX01iFBRjvV6oYmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGr9-000000002JQ-1vii;
	Tue, 18 Nov 2025 08:14:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGr8-000000002JA-2Apv
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 08:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A845E601D0;
	Tue, 18 Nov 2025 08:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD6DC16AAE;
	Tue, 18 Nov 2025 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763453669;
	bh=0CC4f7M1SiULjMXIJIXEs5EIBqs9WKMZKN5YwkFxQi4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qcTNakD5xzuGQsgBcKeLTIEsJKLFIxm7z4Z7Rw3Hc0aXjsLNbsK0sNtTEiJb0Fajb
	 +N6yZ8xw3Dm0+KmbHkkBY0goaClTkTD0RFXvOxA3l+Ik2PNaEHKPGULRg2WEyxq84w
	 smjKp66KKGEJBTdAPFSS98KHJTWsd5o3kmAhQtQhAI2Zr1MaG3rYm+MiC7EdxiQgzp
	 guTo1hKDfjIdvzOzuUTV6oGKnYG2ZKYb8Yp0sB9hMKz0ddM6syb2sN3xZmyk6vZ+Yz
	 HVsPGYDOHlrkPtlltylSQ135bLDX+2XAOgv8m+C0r1TxONxDK5uNGw7M9vnXS8cmRT
	 IBroFQPLHnOYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B743809A2D;
	Tue, 18 Nov 2025 08:13:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove __GFP_HIGHMEM masking
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176345363474.4032995.16191176205928685745.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 08:13:54 +0000
References: <20251107182620.95844-1-vishal.moola@gmail.com>
In-Reply-To: <20251107182620.95844-1-vishal.moola@gmail.com>
To: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu
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
by Paul Walmsley <pjw@kernel.org>:

On Fri,  7 Nov 2025 10:26:20 -0800 you wrote:
> Remove unnecessary __GFP_HIGHMEM masking, which was introduced with
> commit 380f2c1ae9d4 ("riscv: convert alloc_{pmd, pte}_late() to use
> ptdescs"). GFP_KERNEL doesn't contain __GFP_HIGHMEM.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/riscv/mm/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - riscv: Remove __GFP_HIGHMEM masking
    https://git.kernel.org/riscv/c/cba94f87992e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
