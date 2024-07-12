Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF59C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6V212753Ijxh7szYqudjzVMWrZnahG48bTaqKuo0beI=; b=E1bdyIak9rA0jc
	ytCbdliutSPIc+EjsCJ4xz38wHnhlsjEmbK0AkWwL7dfFxtpqzN9QqHvCk6S7ksemgZAWk+atm8uD
	sGUeJyJjkwh5J90VGs+sN41W/V47K6A55OENE2UYiB9o92Cikhs8XmquwsHq96vKpO1iCjBuKeiZ4
	thmq8FRcftw4FTlWgWoFZFuCC7qakxFXYNKCSakkw3DHSEA1X7IX0XbSYX2kCVLsllJEDkuyJXjZO
	A3/DhzqxwSyIai9duuRWKpUFJFx+meKas0pRaNtWQMULQWYJ0/T17/1TqFMOCrQ61O5+jgRvZSQ5E
	DBy/806koffxlPOmWHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOK-0000000HGIV-2qG7;
	Fri, 12 Jul 2024 10:20:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOF-0000000HGG3-0FTS
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 10:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4BE84CE16C9;
	Fri, 12 Jul 2024 10:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 907F9C32786;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779632;
	bh=RnzPJHw3EtG6YPeqag1VcDrc0jcCFRsUX3IkvXy3Ve0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=msqPesQ9wVhM/XWK4aYizxpJJ7lkb1dmKJ38Z9MbAtBsF7wkZcmmrhhuqIBV+AVUW
	 y2vhp9Ch30Gvfb6HXrqoSDFdT9uVdTpoBtaKQGLy4yzI5Q+zY9YMBR8C9vruwjVlVo
	 2QMXHKxDpxWh1No3MT3/FdoB6LN8RnNA7qd7pbzmzWjcZ+WUM2OvjgsCQjABaFRRTl
	 q6iaKa3V7TZUy9EBrbqRaIFQr0xPlpIbs9mrV7tsp8h5F33c8mf8mxSMou3Q2lE8ml
	 GXCRV/ejOYHpowe3NITlXDXQypWa0Azf8UxAxPGQADefcMcFYDN6CtNCZSLNI/++ZI
	 yuolv06Wp3b9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85C52C4332D;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Improve sbi_ecall() code generation by reordering
 arguments
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172077963254.4770.3789114985844710075.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jul 2024 10:20:32 +0000
References: <20240322112629.68170-1-alexghiti@rivosinc.com>
In-Reply-To: <20240322112629.68170-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_032035_442864_A02A2838 
X-CRM114-Status: UNSURE (   9.47  )
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

On Fri, 22 Mar 2024 12:26:29 +0100 you wrote:
> The sbi_ecall() function arguments are not in the same order as the
> ecall arguments, so we end up re-ordering the registers before the
> ecall which is useless and costly.
> 
> So simply reorder the arguments in the same way as expected by ecall.
> Instead of reordering directly the arguments of sbi_ecall(), use a proxy
> macro since the current ordering is more natural.
> 
> [...]

Here is the summary with links:
  - riscv: Improve sbi_ecall() code generation by reordering arguments
    https://git.kernel.org/riscv/c/16badacd8af4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
