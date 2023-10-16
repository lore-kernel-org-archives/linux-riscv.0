Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548FFCDB482
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0q9DLPvXNlZfGDe/qNwgzR5/pD2Ihgb2BIMIgYELyo=; b=zYyUNRzODBjHKu
	+KbRYErraXeChrqAVIu+eLM/EGGOpgzRI362P5gKrUqXRmyjWtR0AbRf6WdsFUwJDhOVRtKap5jZj
	pF6gkhITjWSJWr3qdTiptFnUfWBE+9IZ4rNfyqR6uViMZtUiPHeLCICjmzbKhfL0XY9bjOp8S1Vc8
	u1DWscsdpa0jzKza3LdXJC2UY6H2TWmYmLIXJa4hkzvqF/5dNLhyHivo9rbZoR4UK2HqzCBZ8uq8G
	gb5+RAKhiF1xgbIF/GtYNoGhe91616toTLIHVhasxwA+CvW5VBitVFJd+YbdvVt+NC2ghmFurlhXa
	axGo7nDrB+oaVtW17uVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSp-008R28-2Y;
	Mon, 16 Oct 2023 05:48:27 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSo-008Qyh-10;
	Mon, 16 Oct 2023 05:48:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: [PATCH 11/12] m68k: don't provide arch_dma_alloc for nommu/coldfire
Date: Mon, 16 Oct 2023 07:47:53 +0200
Message-Id: <20231016054755.915155-12-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
References: <20231016054755.915155-1-hch@lst.de>
MIME-Version: 1.0
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

Coldfire cores configured with a data cache can't provide coherent
DMA allocations at all.

Instead of returning non-coherent kernel memory in this case,
return NULL and fail the allocation.

The only driver that used to rely on the previous behavior (fec) has
been switched to use non-coherent allocations for this case recently.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/Kconfig      |  1 -
 arch/m68k/kernel/dma.c | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 6c585eae89f4dc..c1c0faffb0d413 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -3,7 +3,6 @@ config M68K
 	bool
 	default y
 	select ARCH_32BIT_OFF_T
-	select ARCH_DMA_ALLOC if M68K_NONCOHERENT_DMA && COLDFIRE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index f83870cfa79b37..eef63d032abb53 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -33,29 +33,6 @@ pgprot_t pgprot_dmacoherent(pgprot_t prot)
 	}
 	return prot;
 }
-#else
-void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
-		gfp_t gfp, unsigned long attrs)
-{
-	void *ret;
-
-	if (dev == NULL || (*dev->dma_mask < 0xffffffff))
-		gfp |= GFP_DMA;
-	ret = (void *)__get_free_pages(gfp, get_order(size));
-
-	if (ret != NULL) {
-		memset(ret, 0, size);
-		*dma_handle = virt_to_phys(ret);
-	}
-	return ret;
-}
-
-void arch_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, unsigned long attrs)
-{
-	free_pages((unsigned long)vaddr, get_order(size));
-}
-
 #endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
 
 void arch_sync_dma_for_device(phys_addr_t handle, size_t size,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
