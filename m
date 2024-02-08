Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2427C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTOosGBiqt0G3Bcdx1bhLlDDA1zaBDPOUfvPflWqnYc=; b=Wf/uCRxCQ10+Oq
	QmAWDqbMXFi+rNaZLfZowZ6xxUYiYEBBorEF7U4sCgIp7AMe31e6w7cLfB1ZPSVcOKamBvGUxgfnU
	oYsVV5ZO/MLzH6xVgDxRD202MrLxB537y5bx1g0JvO57mjypctYHRrLpnjKo/KOHA+8jDB/IMlajy
	hR5WjnL96AVA7qN15iGhnuhOmSGe7S1NlpHgPf7fKKhIzYBqAR7MbugaW2fVdbZdJLfteCXYxVHkk
	EI5TpSJnnS2royO8ZOjSHOx3npKYMuzPBUYk8Ztrsje72QdqbomvR9xPAxEX+HgiAjWSUu0CCEbe1
	ocvxhFneS4cKe3Hhe4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFa-0000000COYa-15vZ;
	Thu, 08 Feb 2024 01:30:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtFW-0000000COOl-0m44
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 01:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8743ACE1B4F;
	Thu,  8 Feb 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B63BC433A6;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707355829;
	bh=J3zyaMpO6Yajzz/cHVlPUFGg7dudckSRxCcFJRXqZ+E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nh4izxvvNvT+KDqNgaWRhC7BmcIYgB8gmpFSdFKqY7WKSuGCsqcWkwS/qa3fEJTG6
	 kG/Aa8+ryx3mxXUEZiQIIRY86YZM5ThWJzuAl0v5q91IZ1CE17uz/VtWTtdauTjQez
	 Torqgz3KvjJ6Iubzr0c7nmkjRCjGQrczfPxV68zKG7Dbr7pyLsMGatCz9HDG02m4L3
	 ock9BI6ZvwCaNFpayxsB6vyGl2pOBLD9r5KXfiuXuWENlAFNfJt9h1YObP3nOSXZYz
	 dSu72ySE79DlBI5A+9R2lAkEwRBbATorKwAsJ046tnZCvavw8Z/5wm8YStHEIXM3g4
	 ruY5YPNZCcNrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3140BD8C96F;
	Thu,  8 Feb 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix arch_tlbbatch_flush() by clearing the batch
 cpumask
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170735582919.12826.5541680034564428573.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 01:30:29 +0000
References: <20240130115508.105386-1-alexghiti@rivosinc.com>
In-Reply-To: <20240130115508.105386-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jszhang@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_173046_457759_8875DDBF 
X-CRM114-Status: UNSURE (   8.31  )
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

On Tue, 30 Jan 2024 12:55:08 +0100 you wrote:
> We must clear the cpumask once we have flushed the batch, otherwise cpus
> get accumulated and we end sending IPIs to more cpus than needed.
> 
> Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [-fixes] riscv: Fix arch_tlbbatch_flush() by clearing the batch cpumask
    https://git.kernel.org/riscv/c/3951f6add519

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
