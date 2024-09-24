Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF23CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h88vYqdZgBVZuEc03fMIZVnzm280gzJqxKjtGLMZtkk=; b=onaFU+eDvVXUY8
	9WOoRVhTQy4jDvNZqcK8cj4iCqMoIqGzTsyWXCOD/jYCEf1bNLelQWEobbnNoNHuUMZeChvSseXyd
	g5I31phsF8PRWP5eBKoszbau14CO/fKXl/F9gbwTDdtzzVXF6QocClR3ydu4RhaAfNYBIoCDR24AQ
	aucQ3+/lbfjLZm13T3f1yPjfX1+VIsBedMUzwK1XECy5A7+3JQgH05uAgVDS9hOdAs9kT0aH0Yb/4
	9aOXXaKMfzYw7of/+wBY1lmlB5DQyXM8KSbk+VnYulWk8k43hyT54ftAK56ehadIIMdqYhSfWfQaA
	GO1Q5zW8Hub0cCAdArIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszDp-00000001HoL-0sg6;
	Tue, 24 Sep 2024 06:40:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sszDm-00000001HnO-331x
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 06:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63979A431F0;
	Tue, 24 Sep 2024 06:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21090C4CEC4;
	Tue, 24 Sep 2024 06:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727160025;
	bh=lkZehg6JpPxOeq06pNGSR9Agq2BdElcGM+SA/3kprYE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=msD2f6slEPZPj2bn+00HwxiReyqPN3bPdYsFys5xis5rvZWNTvy9IhrDQprbs6mwO
	 M0GRb6leT1yr678MY6gC4mXKTWDB0y7yW7KPoD2+OGIIC4HxQ+LyGPpjdhWVbGyLvY
	 5KfP4deduwPtXknjXRXyzxutHUS8ZwHY0QU0zqZXFYFg/GsNmJ2UDE3OUwvTeVVi3i
	 aUbuCaRGC3oYPjGMbP9fxKe805ZkgIcW1v/fPx5IkgEKn+50pkZf2Hqf+4GNyiZYUB
	 Dt51st3Q0ZzWhEOYAXvydDXAdpkTioTyjL5QVkgAqqe2LbMd5bU11xOwcGPgUYAWGP
	 AgPBjuzM+LxYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCDC3806655;
	Tue, 24 Sep 2024 06:40:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172716002754.3899939.7102805134119390923.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 06:40:27 +0000
References: <20240731162159.9235-2-palmer@rivosinc.com>
In-Reply-To: <20240731162159.9235-2-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_234026_921398_B7DFC789 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, 31 Jul 2024 09:22:00 -0700 you wrote:
> I recently ended up with a warning on some compilers along the lines of
> 
>       CC      kernel/resource.o
>     In file included from include/linux/ioport.h:16,
>                      from kernel/resource.c:15:
>     kernel/resource.c: In function 'gfr_start':
>     include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>        49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>           |                                     ^
>     include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>        52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>           |         ^~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>       161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>           |                           ^~~~~~~~~~
>     kernel/resource.c:1829:23: note: in expansion of macro 'min_t'
>      1829 |                 end = min_t(resource_size_t, base->end,
>           |                       ^~~~~
>     kernel/resource.c: In function 'gfr_continue':
>     include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>        49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>           |                                     ^
>     include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>        52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>           |         ^~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>       161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>           |                           ^~~~~~~~~~
>     kernel/resource.c:1847:24: note: in expansion of macro 'min_t'
>      1847 |                addr <= min_t(resource_size_t, base->end,
>           |                        ^~~~~
>     cc1: all warnings being treated as errors
> 
> [...]

Here is the summary with links:
  - RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
    https://git.kernel.org/riscv/c/ad380f6a0a5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
