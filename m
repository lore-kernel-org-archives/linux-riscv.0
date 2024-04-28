Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5BCC25B10
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgtqu3RWKZKdhC+MwNEhDHQnPklrqR7hm1PLHvL+qE4=; b=n9kRGiOQW9J24b
	s8xkIWVALZv3JE8X34JqgvHPjc8SZ7k82JLznnzMov0EmEYb3xKG2L8/gU7NcG4etoXitn1m+HJ9J
	EsQFLjR6JSpjJ6HQqFCmD1HiIfNE7dX5jOPlQgbUwl+dTanHNydH2rCbHct4GY2GTRnGH4Ev8Q0Cs
	CyZOK6gl6Rhr3fvRH93C9bZl9wMS8g1ihob3PaSptZL3lFHalKRf2QtSjSuU1a8L1PyiLs3TmG9IP
	itiJRpxf7YKhnkde580qwZqvxbEdjKLxkL31Hod6wOhguNZrGZV7pfexYWXcoGqsFtucqHW5iYCyi
	cZ7tFQapcgAjDS/GE0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZp-00000000nss-2VPG;
	Sun, 28 Apr 2024 22:00:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZZ-00000000nj1-38QN
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1728BCE0A23;
	Sun, 28 Apr 2024 22:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4C54C4AF1D;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341635;
	bh=i0lgj4Gi4l7oqdJ7DvxdlIR0OkstYyRvXjI4yj9zdRo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HFePvE/RtKH5Z6L5x9jhbEi8evaKNPLoBTsa4exJ6iHJHGMnIZa9Gs12Blr+04Zfa
	 AUMZQ+KhknlXyFoc9+0tIAK1det3byxvh3G283lbaVWw2El3zKRJc9AX2WtPsarDjk
	 Mg1cwWrbFaDANMRPXIpl/ufu9auK1/3B2+UphJtOYd9YsXPTKJN3ESD7AWtVZXF4xh
	 9j1ZeLhUJ2WNmjdDNN5KnLdOBxXhR654ga6RFGbkucalf8FTOXgtu/DG7FZCmTIjJb
	 EoTBKGhc9fTs0GgYcZEOrM/dsM/y/A+R8YgMKDPQR15ePzjs7uHxhe21/ObDkWmaGg
	 yf0oHbOXpbrhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7432C4167D;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 RESEND] riscv: select ARCH_HAS_FAST_MULTIPLIER
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163487.22130.12031747809558123919.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240325105823.1483-1-jszhang@kernel.org>
In-Reply-To: <20240325105823.1483-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 samuel.holland@sifive.com, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150037_981459_4671D8FA 
X-CRM114-Status: UNSURE (   7.78  )
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

On Mon, 25 Mar 2024 18:58:23 +0800 you wrote:
> Currently, riscv linux requires at least IMA, so all platforms have a
> multiplier. And I assume the 'mul' efficiency is comparable or better
> than a sequence of five or so register-dependent arithmetic
> instructions. Select ARCH_HAS_FAST_MULTIPLIER to get slightly nicer
> codegen. Refer to commit f9b4192923fa ("[PATCH] bitops: hweight()
> speedup") for more details.
> 
> [...]

Here is the summary with links:
  - [v3,RESEND] riscv: select ARCH_HAS_FAST_MULTIPLIER
    https://git.kernel.org/riscv/c/0a16a1728790

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
