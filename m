Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D56C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 07:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt0XmzOqPWJ4FjAYMN+i88VNZp6wzwmtxlHJhXhHPtg=; b=iL0yiLuluAuJMp
	QHTXQunUJ7fcK/daZwmu4rg4vX5ZslhxpgMZX9KDxjNpO+s1kalgCrxgwreEV+ucb/sUSm9W9n2LF
	Ih26Jr3o/JEpsoYJME6FYil29IXZvWoIr3cyk4HutriduCMMou614msrzrIfKCCo3WOGz1NyLFet5
	A0iR9IaaR0W0Yo02wubL+ZMvnb04694lcWL0+JAQFkXpXVBLYvRawdasdA55eFuXiLOfAY7Z2x0Td
	t5GBjJVuzCOQJekiYha5/rE4/bTDtMzi+zapULHilC2OGdYIM90hFkLay+ZsfaqK2GaxIlqAOfak7
	A2+DeVbPjkjmLVfTBYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfJg-004ASX-Qi; Mon, 14 Mar 2022 07:40:32 +0000
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfBg-0044uH-2E; Mon, 14 Mar 2022 07:32:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
Subject: [PATCH 14/15] swiotlb: remove swiotlb_init_with_tbl and
 swiotlb_init_late_with_tbl
Date: Mon, 14 Mar 2022 08:31:28 +0100
Message-Id: <20220314073129.1862284-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314073129.1862284-1-hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
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

No users left.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swiotlb.h |  2 -
 kernel/dma/swiotlb.c    | 85 +++++++++++++++--------------------------
 2 files changed, 30 insertions(+), 57 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7b50c82f84ce9..7ed35dd3de6e7 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -34,13 +34,11 @@ struct scatterlist;
 /* default to 64MB */
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
-int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	int (*remap)(void *tlb, unsigned long nslabs));
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	int (*remap)(void *tlb, unsigned long nslabs));
-extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 88ea7b9bce6e9..d04bacdb0905b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -225,33 +225,6 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	return;
 }
 
-int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
-		unsigned int flags)
-{
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	size_t alloc_size;
-
-	if (swiotlb_force_disable)
-		return 0;
-
-	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->nslabs))
-		return -ENOMEM;
-
-	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
-	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!mem->slots)
-		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
-		      __func__, alloc_size, PAGE_SIZE);
-
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
-	mem->force_bounce = flags & SWIOTLB_FORCE;
-
-	if (flags & SWIOTLB_VERBOSE)
-		swiotlb_print_info();
-	return 0;
-}
-
 /*
  * Statically reserve bounce buffer space and initialize bounce buffer data
  * structures for the software IO TLB used to implement the DMA API.
@@ -259,7 +232,9 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = default_nslabs;
+	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
 	size_t bytes;
 	void *tlb;
 
@@ -280,7 +255,8 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
-		goto fail;
+		panic("%s: failed to allocate tlb structure\n", __func__);
+
 	if (remap && remap(tlb, nslabs) < 0) {
 		memblock_free(tlb, PAGE_ALIGN(bytes));
 
@@ -291,14 +267,17 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 		goto retry;
 	}
-	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
-		goto fail_free_mem;
-	return;
 
-fail_free_mem:
-	memblock_free(tlb, bytes);
-fail:
-	pr_warn("Cannot allocate buffer");
+	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->slots)
+		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
+		      __func__, alloc_size, PAGE_SIZE);
+
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
+	mem->force_bounce = flags & SWIOTLB_FORCE;
+
+	if (flags & SWIOTLB_VERBOSE)
+		swiotlb_print_info();
 }
 
 void __init swiotlb_init(bool addressing_limit, unsigned int flags)
@@ -314,6 +293,7 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
@@ -355,33 +335,28 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 			(PAGE_SIZE << order) >> 20);
 		nslabs = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
-	if (rc)
-		free_pages((unsigned long)vstart, order);
-
-	return rc;
-}
-
-int
-swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
-{
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long bytes = nslabs << IO_TLB_SHIFT;
 
-	if (swiotlb_force_disable)
-		return 0;
+	if (remap)
+		rc = remap(vstart, nslabs);
+	if (rc) {
+		free_pages((unsigned long)vstart, order);
 
-	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->nslabs))
-		return -ENOMEM;
+		/* Min is 2MB */
+		if (nslabs <= 1024)
+			return rc;
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
 
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 		get_order(array_size(sizeof(*mem->slots), nslabs)));
-	if (!mem->slots)
+	if (!mem->slots) {
+		free_pages((unsigned long)vstart, order);
 		return -ENOMEM;
+	}
 
-	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
-	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
+	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
+	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
 
 	swiotlb_print_info();
 	return 0;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
