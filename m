Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38AEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 07:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6dzVFIozEalNnEbE9IGc4pEbQrd4JlSflCNGjxyA1U=; b=HezwX0fBvAkPzL
	V/mobr4Mh/xpYBRRFYgaM60AkkXi3Y9KpVwbGXqcmQWh6eFnybQw/Y5e8AKAcIWEnRK+WgZ0fXB9Q
	PsHr2ydF9q0CTdE2QIu7pjlhhAC6JAUHCHjaLTLO5go9fGYz1i97yQmI5HqYhnYcZn6rkg+V9wJMd
	tglThfcE14yLvkS7zE1qoKO4B6/Wi4WG3juRXjl1MlUhisw1jwT370JkVuoxSw9SF9HFAOR3fyDBF
	OuE1cssA6LVZbtW16yd6Wq1doms1e4wtxAVR02jXSHGffcoohOLi4SukpRGlk9+UWsSnOJv/n0eSY
	CEWLFNFv8IW0xr7EqFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfIq-0049vJ-4A; Mon, 14 Mar 2022 07:39:40 +0000
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfBd-0044s6-8e; Mon, 14 Mar 2022 07:32:13 +0000
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
Subject: [PATCH 13/15] swiotlb: merge swiotlb-xen initialization into swiotlb
Date: Mon, 14 Mar 2022 08:31:27 +0100
Message-Id: <20220314073129.1862284-14-hch@lst.de>
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

Reuse the generic swiotlb initialization for xen-swiotlb.  For ARM/ARM64
this works trivially, while for x86 xen_swiotlb_fixup needs to be passed
as the remap argument to swiotlb_init_remap/swiotlb_init_late.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/xen/mm.c               |  21 +++---
 arch/x86/include/asm/xen/page.h |   5 --
 arch/x86/kernel/pci-dma.c       |  19 +++--
 drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
 include/xen/arm/page.h          |   1 -
 include/xen/swiotlb-xen.h       |   8 +-
 6 files changed, 27 insertions(+), 155 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 28c2070602535..ff05a7899cb86 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -23,22 +23,20 @@
 #include <asm/xen/hypercall.h>
 #include <asm/xen/interface.h>
 
-unsigned long xen_get_swiotlb_free_pages(unsigned int order)
+static gfp_t xen_swiotlb_gfp(void)
 {
 	phys_addr_t base;
-	gfp_t flags = __GFP_NOWARN|__GFP_KSWAPD_RECLAIM;
 	u64 i;
 
 	for_each_mem_range(i, &base, NULL) {
 		if (base < (phys_addr_t)0xffffffff) {
 			if (IS_ENABLED(CONFIG_ZONE_DMA32))
-				flags |= __GFP_DMA32;
-			else
-				flags |= __GFP_DMA;
-			break;
+				return __GFP_DMA32;
+			return __GFP_DMA;
 		}
 	}
-	return __get_free_pages(flags, order);
+
+	return GFP_KERNEL;
 }
 
 static bool hypercall_cflush = false;
@@ -140,10 +138,13 @@ static int __init xen_mm_init(void)
 	if (!xen_swiotlb_detect())
 		return 0;
 
-	rc = xen_swiotlb_init();
 	/* we can work with the default swiotlb */
-	if (rc < 0 && rc != -EEXIST)
-		return rc;
+	if (!io_tlb_default_mem.nslabs) {
+		rc = swiotlb_init_late(swiotlb_size_or_default(),
+				       xen_swiotlb_gfp(), NULL);
+		if (rc < 0)
+			return rc;
+	}
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index e989bc2269f54..1fc67df500145 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -357,9 +357,4 @@ static inline bool xen_arch_need_swiotlb(struct device *dev,
 	return false;
 }
 
-static inline unsigned long xen_get_swiotlb_free_pages(unsigned int order)
-{
-	return __get_free_pages(__GFP_NOWARN, order);
-}
-
 #endif /* _ASM_X86_XEN_PAGE_H */
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index a705a199bf8a3..dbb7b83fc3e48 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -72,15 +72,12 @@ static inline void __init pci_swiotlb_detect(void)
 #endif /* CONFIG_SWIOTLB */
 
 #ifdef CONFIG_SWIOTLB_XEN
-static bool xen_swiotlb;
-
 static void __init pci_xen_swiotlb_init(void)
 {
 	if (!xen_initial_domain() && !x86_swiotlb_enable)
 		return;
 	x86_swiotlb_enable = true;
-	xen_swiotlb = true;
-	xen_swiotlb_init_early();
+	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
 	dma_ops = &xen_swiotlb_dma_ops;
 	if (IS_ENABLED(CONFIG_PCI))
 		pci_request_acs();
@@ -88,14 +85,16 @@ static void __init pci_xen_swiotlb_init(void)
 
 int pci_xen_swiotlb_init_late(void)
 {
-	int rc;
-
-	if (xen_swiotlb)
+	if (dma_ops == &xen_swiotlb_dma_ops)
 		return 0;
 
-	rc = xen_swiotlb_init();
-	if (rc)
-		return rc;
+	/* we can work with the default swiotlb */
+	if (!io_tlb_default_mem.nslabs) {
+		int rc = swiotlb_init_late(swiotlb_size_or_default(),
+					   GFP_KERNEL, xen_swiotlb_fixup);
+		if (rc < 0)
+			return rc;
+	}
 
 	/* XXX: this switches the dma ops under live devices! */
 	dma_ops = &xen_swiotlb_dma_ops;
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index c2da3eb4826e8..df8085b50df10 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,7 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
-static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int rc;
 	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
@@ -130,132 +130,6 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 	return 0;
 }
 
-enum xen_swiotlb_err {
-	XEN_SWIOTLB_UNKNOWN = 0,
-	XEN_SWIOTLB_ENOMEM,
-	XEN_SWIOTLB_EFIXUP
-};
-
-static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
-{
-	switch (err) {
-	case XEN_SWIOTLB_ENOMEM:
-		return "Cannot allocate Xen-SWIOTLB buffer\n";
-	case XEN_SWIOTLB_EFIXUP:
-		return "Failed to get contiguous memory for DMA from Xen!\n"\
-		    "You either: don't have the permissions, do not have"\
-		    " enough free memory under 4GB, or the hypervisor memory"\
-		    " is too fragmented!";
-	default:
-		break;
-	}
-	return "";
-}
-
-int xen_swiotlb_init(void)
-{
-	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
-	unsigned long bytes = swiotlb_size_or_default();
-	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
-	unsigned int order, repeat = 3;
-	int rc = -ENOMEM;
-	char *start;
-
-	if (io_tlb_default_mem.nslabs) {
-		pr_warn("swiotlb buffer already initialized\n");
-		return -EEXIST;
-	}
-
-retry:
-	m_ret = XEN_SWIOTLB_ENOMEM;
-	order = get_order(bytes);
-
-	/*
-	 * Get IO TLB memory from any location.
-	 */
-#define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
-#define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
-	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-		start = (void *)xen_get_swiotlb_free_pages(order);
-		if (start)
-			break;
-		order--;
-	}
-	if (!start)
-		goto exit;
-	if (order != get_order(bytes)) {
-		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
-			(PAGE_SIZE << order) >> 20);
-		nslabs = SLABS_PER_PAGE << order;
-		bytes = nslabs << IO_TLB_SHIFT;
-	}
-
-	/*
-	 * And replace that memory with pages under 4GB.
-	 */
-	rc = xen_swiotlb_fixup(start, nslabs);
-	if (rc) {
-		free_pages((unsigned long)start, order);
-		m_ret = XEN_SWIOTLB_EFIXUP;
-		goto error;
-	}
-	rc = swiotlb_late_init_with_tbl(start, nslabs);
-	if (rc)
-		return rc;
-	return 0;
-error:
-	if (nslabs > 1024 && repeat--) {
-		/* Min is 2MB */
-		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
-		bytes = nslabs << IO_TLB_SHIFT;
-		pr_info("Lowering to %luMB\n", bytes >> 20);
-		goto retry;
-	}
-exit:
-	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
-	return rc;
-}
-
-#ifdef CONFIG_X86
-void __init xen_swiotlb_init_early(void)
-{
-	unsigned long bytes = swiotlb_size_or_default();
-	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
-	unsigned int repeat = 3;
-	char *start;
-	int rc;
-
-retry:
-	/*
-	 * Get IO TLB memory from any location.
-	 */
-	start = memblock_alloc(PAGE_ALIGN(bytes),
-			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
-	if (!start)
-		panic("%s: Failed to allocate %lu bytes\n",
-		      __func__, PAGE_ALIGN(bytes));
-
-	/*
-	 * And replace that memory with pages under 4GB.
-	 */
-	rc = xen_swiotlb_fixup(start, nslabs);
-	if (rc) {
-		memblock_free(start, PAGE_ALIGN(bytes));
-		if (nslabs > 1024 && repeat--) {
-			/* Min is 2MB */
-			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
-			bytes = nslabs << IO_TLB_SHIFT;
-			pr_info("Lowering to %luMB\n", bytes >> 20);
-			goto retry;
-		}
-		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
-	}
-
-	if (swiotlb_init_with_tbl(start, nslabs, SWIOTLB_VERBOSE))
-		panic("Cannot allocate SWIOTLB buffer");
-}
-#endif /* CONFIG_X86 */
-
 static void *
 xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flags,
diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index ac1b654705631..7e199c6656b90 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -115,6 +115,5 @@ static inline bool set_phys_to_machine(unsigned long pfn, unsigned long mfn)
 bool xen_arch_need_swiotlb(struct device *dev,
 			   phys_addr_t phys,
 			   dma_addr_t dev_addr);
-unsigned long xen_get_swiotlb_free_pages(unsigned int order);
 
 #endif /* _ASM_ARM_XEN_PAGE_H */
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index b3e647f86e3e2..590ceb923f0c8 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -10,8 +10,12 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     size_t size, enum dma_data_direction dir);
 
-int xen_swiotlb_init(void);
-void __init xen_swiotlb_init_early(void);
+#ifdef CONFIG_SWIOTLB_XEN
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
+#else
+#define xen_swiotlb_fixup NULL
+#endif
+
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
 #endif /* __LINUX_SWIOTLB_XEN_H */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
