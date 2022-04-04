Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CBDC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 05:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IkLEnZr9kE0yZgg+wVwrKn2AseYH0MOHxMpgjf2UyM=; b=Z3UTu8Z6N792gZ
	Wz9dgI98d20pr3Zaf7CVb0T6VrtS6A21NkzfcGwevJxb/T2qzS+gwh82QDEIliHArltcoLJzItmCW
	rjMjsdl9nD7WYxMBFLzLNtLdzH4Dr1/4FYkcETj2KvItBfXSkqFOU144/fDUocV3L+xJKz1X+oJt/
	vAlCWXrwschSY1ipfq/Fq3FRChTW4BDIM7mSjuQPHp6zJGdYFWIIb7AHYnuaGc/Z30Ym+AKrLUo3f
	O5cqfr0RURt/I6DrK/OBushT9ZsDuywx0b/j2eMd0FShHCLHKkSJGgTLcX+tPKp9oeU0QfLaUlPYI
	WrHft3RNNuUX54S/+aNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbEzM-00DChK-7B; Mon, 04 Apr 2022 05:10:52 +0000
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEvS-00D9Gu-8c; Mon, 04 Apr 2022 05:06:51 +0000
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
Subject: [PATCH 11/15] swiotlb: pass a gfp_mask argument to swiotlb_init_late
Date: Mon,  4 Apr 2022 07:05:55 +0200
Message-Id: <20220404050559.132378-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
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
 kernel/dma/swiotlb.c         | 7 ++-----
 3 files changed, 4 insertions(+), 7 deletions(-)

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
index eabdd89987027..ee655f2e4d28b 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -37,7 +37,7 @@ struct scatterlist;
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-int swiotlb_init_late(size_t size);
+int swiotlb_init_late(size_t size, gfp_t gfp_mask);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index f6e091424af3d..119187afc65ec 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -292,7 +292,7 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
  * initialize the swiotlb later using the slab allocator if needed.
  * This should be just like above, but with some error catching.
  */
-int swiotlb_init_late(size_t size)
+int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 {
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
@@ -303,15 +303,12 @@ int swiotlb_init_late(size_t size)
 	if (swiotlb_force_disable)
 		return 0;
 
-	/*
-	 * Get IO TLB memory from the low pages
-	 */
 	order = get_order(nslabs << IO_TLB_SHIFT);
 	nslabs = SLABS_PER_PAGE << order;
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
