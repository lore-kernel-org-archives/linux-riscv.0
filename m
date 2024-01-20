Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB12DC47DD9
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXoGu78P3HssxBJZ6xdvK6UfapUzYmeqOIWY2FwqIB0=; b=vvSznVitUkn/CV
	2T0FngJWD7nns2LDrmljfuTZvH2oPYiXFBQeFBnZkVppLyGQLcE6UUI9PbKR9wnGXulV1BA8VwXKg
	97o8AWO52F3Kfo6LWhEUEjbRUgMWF5Cw63HuIIB8NT34GchOqLrGI4NCicybfHShVXN/1VoC12lhT
	3lCzL+gXvgD6oDpLy2lMZJhboW73poF3TVVpbyhwsIjjD163GIGnt9ZQNF5OiaTPfYz0FMLGArQKl
	bQcEjPmiXKbiT84wpzqe8GE5nLaDw+C2pLYesTPuxgMv4OMNBgUf2i9THjK7BQGdHUzGop+Jk8QRc
	Yi4OmPyyY8fclt7I4ySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbE-008OCU-0C;
	Sat, 20 Jan 2024 21:09:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIb9-008O9Q-0g
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:09:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F4FE60C35;
	Sat, 20 Jan 2024 21:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C3EAC43390;
	Sat, 20 Jan 2024 21:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784990;
	bh=4qgLOd9+lbH3Kbu84onZLztZgw4zMTuXW5joJu6tgV4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q3JVAx1dr7/DmuB+/yI2CdLuXSn2QhR/aAQsiCxHJoxNdYGJDZykTy8bfepNkBaWC
	 fyrri6bdqzeQ7JkDfdfxcHZdfEFlwFairsw2Flzvuou8t1LDne0Yjsb/jFYXKrD8qd
	 fRFsB5YSc58MfEM4BTbPV6zDBq1wttUmrNXmKceU3SaOdzA6o5mx33c4k6D8hy4v6T
	 0R8TUFHsfTiG7CU9C8W7DrYp8C0gFCMRH9ZdRCeZheSYagCxzekxmi+RhRgGQ3RlQG
	 cWbmoTuSY2dzUSm68ko6YI4j9IdFiX07VyiaaPj4fvfc3IRzZVSYqatO4Z8qlJDRBO
	 7UMRKyo0B4Msw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09F97D8C970;
	Sat, 20 Jan 2024 21:09:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: Enable percpu page first chunk allocator
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499003.24348.2691177844867923598.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:50 +0000
References: <20231212213457.132605-1-alexghiti@rivosinc.com>
In-Reply-To: <20231212213457.132605-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, arnd@arndb.de, dennis@kernel.org, tj@kernel.org,
 cl@linux.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130951_289258_A0FE4FA8 
X-CRM114-Status: GOOD (  12.23  )
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

This series was applied to riscv/linux.git (fixes)
by Dennis Zhou <dennis@kernel.org>:

On Tue, 12 Dec 2023 22:34:55 +0100 you wrote:
> While working with pcpu variables, I noticed that riscv did not support
> first chunk allocation in the vmalloc area which may be needed as a fallback
> in case of a sparse NUMA configuration.
> 
> patch 1 starts by introducing a new function flush_cache_vmap_early() which
> is needed since a new vmalloc mapping is established and directly accessed:
> on riscv, this would likely fail in case of a reordered access or if the
> uarch caches invalid entries in TLB.
> Note that most architectures do not include asm-generic/cacheflush.h so to
> avoid build failures, this patch implements the new function on each of
> those architectures. For all architectures except riscv, this new function
> is implemented as a no-op to keep the existing behaviour but it likely
> needs another implementation.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] mm: Introduce flush_cache_vmap_early()
    https://git.kernel.org/riscv/c/7a92fc8b4d20
  - [v2,2/2] riscv: Enable pcpu page first chunk allocator
    https://git.kernel.org/riscv/c/6b9f29b81b15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
