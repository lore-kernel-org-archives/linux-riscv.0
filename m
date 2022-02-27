Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B165EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Feb 2022 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5av6AvqEznczHAzJrkDX9ME0yCFRMA+mGWKXHr2skCQ=; b=xhKQL9DkoZMqvY
	MbFSTyo883AoQ1X3agRrTTABtsXyBlRDTb9hqrphITLlpto0UZcOvzW51UsVM/Uq7eWMk+BkCG/GB
	BqWN40aBhhwMMBD3vbd0odhfF0l/HitaUbXmWZSVdL7nMd3YMIzILIdoHtG/4HO1u9rHZvhP2DcFK
	VfWyEdWLGlrDSDju1mzChzvbdzR2S2RDXlIEOACznYrXW9498DCN1vi0BAC9WXxz5rjvXzigwYqFm
	vacE0NDtcV8DcG8jNj3fZ25qwAUzvCMFiKckyOnnpJcTJoXYAm/p4BrqtYbOTA05Zk/M5D/et0aWI
	UDmwEl2UOmnbIhS7Uoqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOKbk-009PDS-V2; Sun, 27 Feb 2022 14:33:08 +0000
Received: from [213.208.157.39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOKZy-009Nyh-As; Sun, 27 Feb 2022 14:31:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
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
Subject: [PATCH 05/11] swiotlb: pass a gfp_mask argument to swiotlb_init_late
Date: Sun, 27 Feb 2022 15:30:49 +0100
Message-Id: <20220227143055.335596-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220227143055.335596-1-hch@lst.de>
References: <20220227143055.335596-1-hch@lst.de>
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

Let the caller chose a zone to allocate from.  This will be used
later on by the xen-swiotlb initialization on arm.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/x86/pci/sta2x11-fixup.c | 2 +-
 include/linux/swiotlb.h      | 2 +-
 kernel/dma/swiotlb.c         | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index e0c039a75b2db..c7e6faf59a861 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
 		int size = STA2X11_SWIOTLB_SIZE;
 		/* First instance: register your own swiotlb area */
 		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
-		if (swiotlb_init_late(size))
+		if (swiotlb_init_late(size, GFP_DMA))
 			dev_emerg(&pdev->dev, "init swiotlb failed\n");
 	}
 	list_add(&instance->list, &sta2x11_instance_list);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index b48b26bfa0edb..1befd6b2ccf5e 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -40,7 +40,7 @@ extern void swiotlb_init(int verbose);
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
 unsigned long swiotlb_size_or_default(void);
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-int swiotlb_init_late(size_t size);
+int swiotlb_init_late(size_t size, gfp_t gfp_mask);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 5f64b02fbb732..a653fcf1fe6c2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -290,7 +290,7 @@ swiotlb_init(int verbose)
  * initialize the swiotlb later using the slab allocator if needed.
  * This should be just like above, but with some error catching.
  */
-int swiotlb_init_late(size_t size)
+int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 {
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
@@ -309,7 +309,7 @@ int swiotlb_init_late(size_t size)
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-		vstart = (void *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
+		vstart = (void *)__get_free_pages(gfp_mask | __GFP_NOWARN,
 						  order);
 		if (vstart)
 			break;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
