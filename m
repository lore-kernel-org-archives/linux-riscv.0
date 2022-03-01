Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B84C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u08ocgydzywcgrI+1KI01sAN3sxR/Rl9uG48dZcxlZE=; b=ircOpjYo+eyRhM
	Nkwi3cMH4cHXJQBVjSv7X/xW9QtO3eXxkE5pW5QPybz0dz2w5InKtAjZH8Ee9Bi0HQPllkxXByUnb
	jLC/SqAlbNYyFNs8cmQLKK1s4bhbrK5IgPfWg+iGxN/YdWmMCQ5JrLS2MlQ+/vkTaxTG+Vuih0/10
	0gENU5n6S+i5q376yTSUJqnRNxOl9cqCOmoJzPvSvwkdHBHJS10USQQaNksMBSZyEoKiC8AqijZf/
	BuwVAk2lD0G8fDl8zU4rWsTWZEp4xhzSoVwwr5n+7lNLBmbmTCn2VrGnxvA8WU6jsttY1KAZq5I7b
	ZT1gtgNsOLTJzqt6N+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP09r-00GEA6-EH; Tue, 01 Mar 2022 10:55:07 +0000
Received: from [2.53.44.23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP08E-00GCz8-AM; Tue, 01 Mar 2022 10:53:27 +0000
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
Subject: [PATCH 03/12] swiotlb: simplify swiotlb_max_segment
Date: Tue,  1 Mar 2022 12:53:02 +0200
Message-Id: <20220301105311.885699-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301105311.885699-1-hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
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

Remove the bogus Xen override that was usually larger than the actual
size and just calculate the value on demand.  Note that
swiotlb_max_segment still doesn't make sense as an interface and should
eventually be removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/xen/swiotlb-xen.c |  2 --
 include/linux/swiotlb.h   |  1 -
 kernel/dma/swiotlb.c      | 20 +++-----------------
 3 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 47aebd98f52f5..485cd06ed39e7 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -202,7 +202,6 @@ int xen_swiotlb_init(void)
 	rc = swiotlb_late_init_with_tbl(start, nslabs);
 	if (rc)
 		return rc;
-	swiotlb_set_max_segment(PAGE_SIZE);
 	return 0;
 error:
 	if (nslabs > 1024 && repeat--) {
@@ -254,7 +253,6 @@ void __init xen_swiotlb_init_early(void)
 
 	if (swiotlb_init_with_tbl(start, nslabs, true))
 		panic("Cannot allocate SWIOTLB buffer");
-	swiotlb_set_max_segment(PAGE_SIZE);
 }
 #endif /* CONFIG_X86 */
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index f6c3638255d54..9fb3a568f0c51 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -164,7 +164,6 @@ static inline void swiotlb_adjust_size(unsigned long size)
 #endif /* CONFIG_SWIOTLB */
 
 extern void swiotlb_print_info(void);
-extern void swiotlb_set_max_segment(unsigned int);
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
 struct page *swiotlb_alloc(struct device *dev, size_t size);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 64b390136f9ef..e31c235b5fd9e 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -75,12 +75,6 @@ struct io_tlb_mem io_tlb_default_mem;
 
 phys_addr_t swiotlb_unencrypted_base;
 
-/*
- * Max segment that we can provide which (if pages are contingous) will
- * not be bounced (unless SWIOTLB_FORCE is set).
- */
-static unsigned int max_segment;
-
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 
 static int __init
@@ -104,18 +98,12 @@ early_param("swiotlb", setup_io_tlb_npages);
 
 unsigned int swiotlb_max_segment(void)
 {
-	return io_tlb_default_mem.nslabs ? max_segment : 0;
+	if (!io_tlb_default_mem.nslabs)
+		return 0;
+	return rounddown(io_tlb_default_mem.nslabs << IO_TLB_SHIFT, PAGE_SIZE);
 }
 EXPORT_SYMBOL_GPL(swiotlb_max_segment);
 
-void swiotlb_set_max_segment(unsigned int val)
-{
-	if (swiotlb_force == SWIOTLB_FORCE)
-		max_segment = 1;
-	else
-		max_segment = rounddown(val, PAGE_SIZE);
-}
-
 unsigned long swiotlb_size_or_default(void)
 {
 	return default_nslabs << IO_TLB_SHIFT;
@@ -267,7 +255,6 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 
 	if (verbose)
 		swiotlb_print_info();
-	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
 }
 
@@ -368,7 +355,6 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
 
 	swiotlb_print_info();
-	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
 	return 0;
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
