Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626FAC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T10l3gh2oQr0EJx+6aom9WopSXetVN9lDQbmM1O+nWo=; b=lv4B91m6EajVdy
	PuaMw5KR+8huCBZ3WrqfRO8Xc9LsqnKrGXGOj5Unmiwiy4f+QxG5AilvLQMApBu+Z28/LtAJ4K66E
	ChjYRLLzAocM3V5uda65HuKKHllmBC9qMKWXvKKLXVWUtYrJY0jtHx2tuDN2k0AZWEKL+B0yaXQWd
	CRjwEA/Oc8iXX4DoDfW29WP2CLZY8SDtu+WQ4MnrNKZHdA7TzUVZeOuaimNCZFQuJdf18fTFcOnEr
	VABC43nKuJ2D0giv7VlrUMihE0YjERUAg3VVjX16bPe0d75q0SOGbWyzldqETsa0MeB4DValwwDhM
	W9ZH2djjggazxBFFtXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiH7-0000000Gz0A-10Ps;
	Mon, 25 Mar 2024 11:13:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiH3-0000000GyxK-1i8T
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 11:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61B15CE12D6;
	Mon, 25 Mar 2024 11:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655F0C433C7;
	Mon, 25 Mar 2024 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711365230;
	bh=sf6mJcuyNikMRdduR4UQlk6A2RQlNed9frvcHXQotOo=;
	h=From:To:Cc:Subject:Date:From;
	b=b/hKpDDf2yVvm7N4rbZtQBjtnrHFpaBGU1tuIUV3FJrPb+AzjmE8ksDN3KwvvZBNK
	 rpjeuG8OYc0tAjZWSaqBai301lcOAGUOb/kKtkvvSapOkRqniavt6XXBfwCv1efMWW
	 zj/z0cvYEh87mR18EsFoD55kJ9kevJuUwm3r5UE5Wf7MACpyuBGPPZVxWuoHbcxHUZ
	 b9BCFopMO010/aVJYK9pSef+Kmzb4vH3wjCyhp5vKCME7LO/esuThbCG+utkHfeY5w
	 kdhDdrMCQdzr/6xCYMEdrWaES2E3qT6DttCFSDEgSs+jXE2HQJ56+GvLALTekJkiiG
	 RItNXxDm++hKA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 RESEND] riscv: mm: still create swiotlb buffer for kmalloc() bouncing if required
Date: Mon, 25 Mar 2024 19:00:36 +0800
Message-ID: <20240325110036.1564-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_041353_670167_C7C0741F 
X-CRM114-Status: GOOD (  12.66  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
since v2:
 - rebase on v6.8-rc1
 - collect Reviewed-by tag

since v1
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
index fe8e159394d8..ac5e7f64c05c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -161,11 +161,25 @@ static void print_vm_layout(void) { }
 
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
