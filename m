Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B1CC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AWhIBXWGFfr/RbH4kEDIkb4de/S9hVOrXQBfx0lbL+4=; b=EJQghBvL6uveJP
	qxP0Pwfu/nihRoCHKHwRXSjN5gc2JI5RsnkIxfFfP+IBUUOtbnpluj8X+Rg77p98HVnn2DZ9XcQlS
	75/mXK0pW8PzO+WcDIS7I3R9kDcBol00OC/H4R6CgyFBdWQCol81KBS2eJcA6Tm4eQWvLTW3VW6HZ
	NLtfXYPoSwJ/PdgCHC+M3oInHixjPAkYqnCBpt+5xMr3O+B/ox6hT5atXOMSP3c3IeSp6YrVUKmaI
	tJjDjUFRDDrUQzNvEXpCo6V58xZMZAffZt3jpA9n+fAFfkYC5qjJostxBgT9cdv11H0Nu+nLi3iJN
	JaCTKjGD8Tw2PAfByjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2QX-006IsQ-0s;
	Wed, 19 Jul 2023 08:20:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2QV-006Irc-31
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TLLnjZ2cgb4BLvYFjK3JaQqLRgohKxvpW851SM2IKB8=; b=nIUq53XlwSixyBGSAWiCEgcBhT
	57cLwBpnTCYJVNhSXXmsKGtOXD1YGfghsC2B9fnsbnj7o3+7yLWf1uwc89ARgLgYZxlcF236ceoxu
	fX/VZYVL9hXKNMXPM+gj9Be95f38h0QdHC6sxj2rTUkcwz8rqA8tYA7FWvphCDFBBmLTkrVxMHzJH
	4QSqla+G9x+7+0IDVIixb77m0EmDAZWRUpjJ1dIZ9GxjNLdrR3slCJHDIkqXURKbDdN/K6sHxcZMr
	Qph7Yp9swr4meQhuflcRP2JgqdIqIkOTKzVMURawZyFdRIjvcORIADPl24I9nvZq95IrLpnMZ388B
	wk99v0Lw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLmij-00BhXr-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 15:34:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D65D861644;
	Tue, 18 Jul 2023 15:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41155C433C8;
	Tue, 18 Jul 2023 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689694427;
	bh=yQK5I0+HMW9nWQ22U27x/b51/ujU5XxLQPYhyGnOtwU=;
	h=From:To:Cc:Subject:Date:From;
	b=rY51zBkT/0hoHP7Mm8B5FRNu8nHsPs6l05QAL/UYOYvplcrBu0lt7Ccep8iAUSocT
	 3RyJwkakKLhWOdVG/4JFr2m8pFubJViamN0uMoamjRd8NK5LKCGAuVEjcAT7X7H9/i
	 O5c2pTqj3dhjefvHCQUo/MrqGpOYdT5whSD5Bi0M/lqIg//ALL+bNs4DVXaR6FHry8
	 SK4lm9pSHqpHF/NZzNIwDKXL7UNikdDBUAWtU38fjvhWfcofXKDTdqPsTFCg5UzWsW
	 wjUUJ7U3ImkDyyA5m1+aBja5s7I+OVJiTU1XXDbIwXPwObGfqmhh6a+cLjwbSpiM8k
	 CMo80hx/FvQCA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: Reduce ARCH_KMALLOC_MINALIGN to 8
Date: Tue, 18 Jul 2023 23:22:12 +0800
Message-Id: <20230718152214.2907-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_163438_116538_C39306A3 
X-CRM114-Status: GOOD (  16.90  )
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

Currently, riscv defines ARCH_DMA_MINALIGN as L1_CACHE_BYTES, I.E
64Bytes, if CONFIG_RISCV_DMA_NONCOHERENT=y. To support unified kernel
Image, usually we have to enable CONFIG_RISCV_DMA_NONCOHERENT, thus
it brings some bad effects to coherent platforms:

Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
kmalloc-8 slab caches don't exist any more, they are replaced with
either kmalloc-128 or kmalloc-64.

Secondly, larger than necessary kmalloc aligned allocations results
in unnecessary cache/TLB pressure.

This issue also exists on arm64 platforms. From last year, Catalin
tried to solve this issue by decoupling ARCH_KMALLOC_MINALIGN from
ARCH_DMA_MINALIGN, limiting kmalloc() minimum alignment to
dma_get_cache_alignment() and replacing ARCH_KMALLOC_MINALIGN usage
in various drivers with ARCH_DMA_MINALIGN etc.[1]

One fact we can make use of for riscv: if the CPU doesn't support
ZICBOM or T-HEAD CMO, we know the platform is coherent. Based on
Catalin's work and above fact, we can easily solve the kmalloc align
issue for riscv: we can override dma_get_cache_alignment(), then let
it return ARCH_DMA_MINALIGN at the beginning and return 1 once we know
the underlying HW neither supports ZICBOM nor supports T-HEAD CMO.

So what about if the CPU supports ZICBOM or T-HEAD CMO, but all the
devices are dma coherent? Well, we use ARCH_DMA_MINALIGN as the
kmalloc minimum alignment, nothing changed in this case. This case
can be improved in the future once we see such platforms in mainline.

After this patch, a simple test of booting to a small buildroot rootfs
on qemu shows:

kmalloc-96           5041    5041     96  ...
kmalloc-64           9606    9606     64  ...
kmalloc-32           5128    5128     32  ...
kmalloc-16           7682    7682     16  ...
kmalloc-8           10246   10246      8  ...

So we save about 1268KB memory. The saving will be much larger in normal
OS env on real HW platforms.


patch1 allows kmalloc() caches aligned to the smallest value.
patch2 enables DMA_BOUNCE_UNALIGNED_KMALLOC.

After this series:

As for coherent platforms, kmalloc-{8,16,32,96} caches come back on
coherent both RV32 and RV64 platforms, I.E !ZICBOM and !THEAD_CMO.

As for noncoherent RV32 platforms, nothing changed.

As for noncoherent RV64 platforms, I.E either ZICBOM or THEAD_CMO, the
above kmalloc caches also come back if > 4GB memory or users pass
"swiotlb=mmnn,force" to force swiotlb creation if <= 4GB memory. How
much mmnn should be depends on the specific platform, it needs to be
tried and tested all possible usage case on the specific hardware. For
example, I can use the minimal I/O TLB slabs on Sipeed M1S Dock.

Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/ [1]

Since v2:
 - remove Change-Id
 - use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
 - update Link in commit msg per Conor's suggestion
 - collect reviewed-by tag

Since v1
 - remove preparation patches since they have been merged
 - adjust Kconfig entry to keep entries sorted
 - add new function riscv_set_dma_cache_alignment() to set the
   dma_cache_alignment var.

Jisheng Zhang (2):
  riscv: allow kmalloc() caches aligned to the smallest value
  riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/cache.h      | 14 ++++++++++++++
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/kernel/setup.c           |  1 +
 arch/riscv/mm/dma-noncoherent.c     |  8 ++++++++
 5 files changed, 26 insertions(+)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
