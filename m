Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF56C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U+rpNmxbrlCA5xuqsINj2tOPyjumJrlKsJm+Ke+Zdv4=; b=Hmn8GoJTloEdDY
	xyixCa5WOl+DpqBgoev3vQK37MragqchL6rKTI53SLLwkX1qL2tia8GEWeUAh6zegN8m9OgDstaYn
	0zgQSBCLCN1zAsYSJ4tLMzEVUvxGlkINMCNwwkyXga0OAbgdkTE6fmKH9D6t4PWlLogRphRmKidMx
	uPmA2Rijf1D5fg4g2rHnDtQS2nyP1t2jGRsg9ZCSLiDTboZTKnmmkGhzVkz2H97CJAnbKIK1pHt9X
	rD6F6polJDSd1Tk66cIctBWGU1thp4tFXqqMhRgrXuBW29nWC1vP8HJ0S2LZw1bQIlz7PgMubDyTS
	C5LAHsyvCZ1DHrmPs6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9QSR-00Flvm-1h;
	Sat, 02 Dec 2023 13:54:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9QSO-00Flug-35
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 13:54:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 46A91B81C18;
	Sat,  2 Dec 2023 13:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848CCC433C7;
	Sat,  2 Dec 2023 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701525290;
	bh=bomojrOAMU2gHGxmYDLygOQUoO4KABGe2Me37Cc0YE0=;
	h=From:To:Cc:Subject:Date:From;
	b=TLDhW872Qeq6T2lOiL/tmbelYRkMW2rIQaE4jkN2Q7OnQKvnK0+B81Hngx2UZIR6/
	 ETWx7tcNYE1TVKJ/8r0TWFldBBt2c6NYUdKvD/W53sET147ei1ih0uJTMZ62Xg1vv+
	 D/4V4wCKLUKiU811CGfxekWJC4K6Fggm+IeihHucqryvW612yFnA8LGBAEtNM8svgs
	 vMuRCcbUFUwuUPLb6beNdkzHMJzbgsMvem8OkFLCefLaFbR1d0cEhJFlyN0VhjWcFn
	 yRoteBGcCKVHJ9iOC9iJtNNYym5kkvhP81ByRe4F8vGM9m0Du3s0rI+Ok4JtfJDPIx
	 Vyg8Ib3CbhMAQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required
Date: Sat,  2 Dec 2023 21:42:24 +0800
Message-Id: <20231202134224.4029-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_055457_135037_16527584 
X-CRM114-Status: GOOD (  12.27  )
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

After commit f51f7a0fc2f4 ("riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC
for !dma_coherent"), for non-coherent platforms with less than 4GB
memory, we rely on users to pass "swiotlb=mmnn,force" kernel parameters
to enable DMA bouncing for unaligned kmalloc() buffers. Now let's go
further: If no bouncing needed for ZONE_DMA, let kernel automatically
allocate 1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing on
non-coherent platforms, so that no need to pass "swiotlb=mmnn,force"
any more.

The math of "1MB swiotlb buffer per 1GB of RAM for kmalloc() bouncing"
is taken from arm64. Users can still force smaller swiotlb buffer by
passing "swiotlb=mmnn".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

since v2:
 - fix build error if CONFIG_RISCV_DMA_NONCOHERENT=n

 arch/riscv/include/asm/cache.h |  2 +-
 arch/riscv/mm/init.c           | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
index 2174fe7bac9a..570e9d8acad1 100644
--- a/arch/riscv/include/asm/cache.h
+++ b/arch/riscv/include/asm/cache.h
@@ -26,8 +26,8 @@
 
 #ifndef __ASSEMBLY__
 
-#ifdef CONFIG_RISCV_DMA_NONCOHERENT
 extern int dma_cache_alignment;
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
 #define dma_get_cache_alignment dma_get_cache_alignment
 static inline int dma_get_cache_alignment(void)
 {
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2e011cbddf3a..cbcb9918f721 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -162,11 +162,25 @@ static void print_vm_layout(void) { }
 
 void __init mem_init(void)
 {
+	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit);
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
 
-	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
+	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
+	    dma_cache_alignment != 1) {
+		/*
+		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
+		 * buffer per 1GB of RAM for kmalloc() bouncing on
+		 * non-coherent platforms.
+		 */
+		unsigned long size =
+			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
+		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
+		swiotlb = true;
+	}
+
+	swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
 	memblock_free_all();
 
 	print_vm_layout();
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
