Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C01C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRBH4L5N9Ps3354DUD9DxiyLc3CCupuho1rKnVnx1ZI=; b=Rt/e7G9ofoLL+/
	NxusQzawK/4vOZkLsOB2QRvRxmibBMD3INViu3kWtDkjeZH5Rs+mIOOA5mEE/Fm43BkguhfDJExj0
	8u+isrC021Ldvp0V3KhFJxUSA11Ra8NnieRZTSxnlzoakS/WgRjgn2QZ/fyjc7cYdkM48f7KYJkol
	fvcOwM+nKPJgGV1Kmx7XxAf9Kp/FMdLVJakKDixl/fLwq8erJ7NJG5TIA3jUlO0eJgymY1Jfnczo3
	FjUVDaZmyXYi3Fz/+lvKN3LHiDBHfjQS92qZT0WAeNwabfElV8Nr1PBs/zpQrvmYuxzk9xbKEg8gQ
	iArjlK180KUEhUQsyqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayL-003Fi9-0Z;
	Fri, 26 May 2023 17:11:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayH-003FfI-0C
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 17:11:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96D06651C2;
	Fri, 26 May 2023 17:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24CEC4339B;
	Fri, 26 May 2023 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685121080;
	bh=NqqasUnRMBLReOmJzfWs5pvHZNoT/9CPsg7U+dgQNHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/6CXpeHNUGKQyClLnumeEU4WdVQ0v8ClQth1L1b9KGS6C8PaXWnAEiR3wZEqunEe
	 cGvry/QwoEgYKFwdE6S8D1CGMT2AjnhMLomwpNTHxqHqz7PTBH6FIsdHxo2jmlgqf+
	 qLP5vdpNAIi+DOzIkcmlS2R4bjuP+MRaxFYqNkx1GEzi0zQevkg4NTpWn6DQ45QHT9
	 3dLnTe/tGy8xVoyoyrza3W+r6aRDTIEkIC6CmBceFxj6vLrBxT18saM1slxX4wBf4/
	 t0zQj1LjdVjwjm71EnF8EI7PHZpb2r+/UGueBe7pDY561UJ77DVEJs7DT+aGbhRtgx
	 WSD1FXf35HPGQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 5/6] riscv: allow kmalloc() caches aligned to the smallest value
Date: Sat, 27 May 2023 00:59:57 +0800
Message-Id: <20230526165958.908-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230526165958.908-1-jszhang@kernel.org>
References: <20230526165958.908-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101121_182655_D112BF4D 
X-CRM114-Status: GOOD (  16.50  )
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

[1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/cache.h  | 14 ++++++++++++++
 arch/riscv/mm/dma-noncoherent.c |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
index d3036df23ccb..2174fe7bac9a 100644
--- a/arch/riscv/include/asm/cache.h
+++ b/arch/riscv/include/asm/cache.h
@@ -13,6 +13,7 @@
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
 #define ARCH_DMA_MINALIGN L1_CACHE_BYTES
+#define ARCH_KMALLOC_MINALIGN	(8)
 #endif
 
 /*
@@ -23,4 +24,17 @@
 #define ARCH_SLAB_MINALIGN	16
 #endif
 
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+extern int dma_cache_alignment;
+#define dma_get_cache_alignment dma_get_cache_alignment
+static inline int dma_get_cache_alignment(void)
+{
+	return dma_cache_alignment;
+}
+#endif
+
+#endif	/* __ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_CACHE_H */
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index 0e172e2b4751..21b553c299db 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -11,6 +11,8 @@
 #include <asm/cacheflush.h>
 
 static bool noncoherent_supported __ro_after_init;
+int dma_cache_alignment __ro_after_init = ARCH_DMA_MINALIGN;
+EXPORT_SYMBOL(dma_cache_alignment);
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 			      enum dma_data_direction dir)
@@ -78,5 +80,7 @@ void riscv_noncoherent_supported(bool cmo)
 		WARN(!riscv_cbom_block_size,
 		     "Non-coherent DMA support enabled without a block size\n");
 		noncoherent_supported = true;
+	} else {
+		dma_cache_alignment = 1;
 	}
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
