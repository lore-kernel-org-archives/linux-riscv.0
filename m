Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA20C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J5MxAYMOMluiUkRp2SBRUACQ4gG1tXozzG0FUSBk728=; b=gnS93SAkf9Hv0G
	eWCFFuJM54XR52vrk9WXIYrLAsnLSF9g83YeltBBlCmi3Yt/6oSaTlA6v1aVAk5fNrkX1Xic/g6hy
	fQtzVdGA+wPPRtTFFqN1qpUOK7ZIMP3tsQQRuLQKipXmXzlU/rrPygaIiImEgD2qhuaVDxUHBnf27
	7eK+YRv2FhFwtWe9fH/rutC5KMbUPWlrxITz4elDdtxI2QcP8FuNL5Z1wj18alsDsov63T2/MVwWh
	V0LK5oZ3IhLkrcDK2wdHMiaMnzsJPBoYpOcAMiWOprNf18UAgyGTHsrN1bVPl1m6L3GWePHD/IPzy
	9N/UxDi5f0LzbvT6Bh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayA-003FcV-39;
	Fri, 26 May 2023 17:11:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ay7-003Faf-3C
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 17:11:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8787261648;
	Fri, 26 May 2023 17:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCC7C433AA;
	Fri, 26 May 2023 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685121071;
	bh=sQf8nvL0qon3rojAWzrVu8GvM6yNzwhTLBg4MCurido=;
	h=From:To:Cc:Subject:Date:From;
	b=Hv54ZxcXVKtKv17i3AEUpmzl9SWIGIcLpo2GNRqvoxU2UD1Yi2b9rqR6gqoFsgOoj
	 PGtah19agVR5zsZrFgR4gfRptCpu+K9TGmmFAloRVWVy+DsFhDhA10psD7uaTmsNQI
	 yvWPu/7WvOof6S4bSD+9OQt5r1P80vdruJ6KQW2uHdJ8Vr54EAiHcxrEFMzm4Dpe1p
	 WDi3gyeLEky9rTKaUbkMFNi4EANajxna/wBVazl0/relBIHVmTHZS1kMOZeTFmTSC/
	 qAv6XY9/NqZoy1p4Wwmy7xL1SMU/b1h2GuBioJ62pAL3Yl1DFhz00G6n2OWL50jW3R
	 EEngp5IjwgnXg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 0/6] riscv: Reduce ARCH_KMALLOC_MINALIGN to 8
Date: Sat, 27 May 2023 00:59:52 +0800
Message-Id: <20230526165958.908-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101112_116244_FA31BDBA 
X-CRM114-Status: GOOD (  15.57  )
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
it brings some bad effects to for coherent platforms:

Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
kmalloc-8 slab caches don't exist any more, they are replaced with
either kmalloc-128 or kmalloc-64.

Secondly, larger than necessary kmalloc aligned allocations results
in unnecessary cache/TLB pressure.

This issue also exists on arm64 platforms. From last year, Catalin
tried to solve this issue by decoupling ARCH_KMALLOC_MINALIGN from
ARCH_DMA_MINALIGN, limiting kmalloc() minimum alignment to
dma_get_cache_alignment() and replacing ARCH_KMALLOC_MINALIGN usage
in various drivers with ARCH_DMA_MINALIGN etc.

One fact we can make use of for riscv: if the CPU doesn't support
ZICBOM or T-HEAD CMO, we know the platform is coherent. Based on
Catalin's work and above fact, we can easily solve the kmalloc align
issue for riscv: we can override dma_get_cache_alignment(), then let
it return ARCH_DMA_MINALIGN at the beginning and return 1 once we know
the underlying HW neither supports ZICBOM nor supports T-HEAD CMO.

So what about if the CPU supports ZICBOM and T-HEAD CMO, but all the
devices are dma coherent? Well, we use ARCH_DMA_MINALIGN as the
kmalloc minimum alignment, nothing changed in this case. This case
can be improved in the future.

After this patch, a simple test of booting to a small buildroot rootfs
on qemu shows:

kmalloc-96           5041    5041     96  ...
kmalloc-64           9606    9606     64  ...
kmalloc-32           5128    5128     32  ...
kmalloc-16           7682    7682     16  ...
kmalloc-8           10246   10246      8  ...

So we save about 1268KB memory. The saving will be much larger in normal
OS env on real HW platforms.


patch 1,2,3,4 are either clean up or preparation patches.
patch5 allows kmalloc() caches aligned to the smallest value.
patch6 enables DMA_BOUNCE_UNALIGNED_KMALLOC.

After this series:

As for coherent platforms, kmalloc-{8,16,32,96} caches come back on
coherent both RV32 and RV64 platforms, I.E !ZICBOM and !THEAD_CMO.

As for noncoherent RV32 platforms, nothing changed.

As for noncoherent RV64 platforms, I.E either ZICBOM or THEAD_CMO, the
above kmalloc caches also come back if > 4GB memory or users pass
"swiotlb=mmnn,force" to force swiotlb creation if <= 4GB memory. How
much mmnn should be depends on the specific platform, it need to be
tried and tested all possible usage case on the specific hardware. For
example, I can use the minimal I/O TLB slabs on Sipeed M1S Dock.

[1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/


Jisheng Zhang (6):
  riscv: errata: thead: only set cbom size & noncoherent during boot
  riscv: mm: mark CBO relate initialization funcs as __init
  riscv: mm: mark noncoherent_supported as __ro_after_init
  riscv: mm: pass noncoherent or not to riscv_noncoherent_supported()
  riscv: allow kmalloc() caches aligned to the smallest value
  riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/errata/thead/errata.c    | 22 ++++++++++++++--------
 arch/riscv/include/asm/cache.h      | 14 ++++++++++++++
 arch/riscv/include/asm/cacheflush.h |  4 ++--
 arch/riscv/kernel/setup.c           |  6 +++++-
 arch/riscv/mm/cacheflush.c          |  8 ++++----
 arch/riscv/mm/dma-noncoherent.c     | 16 +++++++++++-----
 7 files changed, 51 insertions(+), 20 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
