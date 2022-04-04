Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECCFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 05:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oicJTE+FiCEvW3K99B0fatY3hMPoo1B/VV/XDgdZpk=; b=hJ8K6g0tnDXTJ8
	qia3UtfBw4DLzMICQH7V6qK1vNEX4QF625h7VdIgb/CD0ioYgnO9wc836kX5WZfgvxVM64WqbkAgy
	NVxC/7rxNq++/aYg4Ubl5XpYzJnaPicfOh9cK/+IxE8kPxWKtKVhP/Q1GcIGPbAQ5ltxumGPyAIli
	zwheknJnILKdVUG8nw6IDJqqYC3d/lA26kgtdLaTEgtJOu+IIGCfgn36TFRmUhi8JgHp9o6kvFyVE
	aPE3/dGn/AX1MWTcNCgJweW3T+mXsgQaUzI+f/FzX53uX5iuUe3FHESyvuQ0d9tJE/3iQhMyG1x5t
	u/QKYNQehx7UjM0mNXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbEwu-00DAjm-8j; Mon, 04 Apr 2022 05:08:20 +0000
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEv8-00D8yQ-5x; Mon, 04 Apr 2022 05:06:31 +0000
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
 linux-pci@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 06/15] MIPS/octeon: use swiotlb_init instead of open coding it
Date: Mon,  4 Apr 2022 07:05:50 +0200
Message-Id: <20220404050559.132378-7-hch@lst.de>
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

Use the generic swiotlb initialization helper instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/cavium-octeon/dma-octeon.c | 15 ++-------------
 arch/mips/pci/pci-octeon.c           |  2 +-
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index df70308db0e69..fb7547e217263 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -186,15 +186,12 @@ phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
 	return daddr;
 }
 
-char *octeon_swiotlb;
-
 void __init plat_swiotlb_setup(void)
 {
 	phys_addr_t start, end;
 	phys_addr_t max_addr;
 	phys_addr_t addr_size;
 	size_t swiotlbsize;
-	unsigned long swiotlb_nslabs;
 	u64 i;
 
 	max_addr = 0;
@@ -236,15 +233,7 @@ void __init plat_swiotlb_setup(void)
 	if (OCTEON_IS_OCTEON2() && max_addr >= 0x100000000ul)
 		swiotlbsize = 64 * (1<<20);
 #endif
-	swiotlb_nslabs = swiotlbsize >> IO_TLB_SHIFT;
-	swiotlb_nslabs = ALIGN(swiotlb_nslabs, IO_TLB_SEGSIZE);
-	swiotlbsize = swiotlb_nslabs << IO_TLB_SHIFT;
-
-	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
-	if (!octeon_swiotlb)
-		panic("%s: Failed to allocate %zu bytes align=%lx\n",
-		      __func__, swiotlbsize, PAGE_SIZE);
 
-	if (swiotlb_init_with_tbl(octeon_swiotlb, swiotlb_nslabs, 1) == -ENOMEM)
-		panic("Cannot allocate SWIOTLB buffer");
+	swiotlb_adjust_size(swiotlbsize);
+	swiotlb_init(1);
 }
diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index fc29b85cfa926..e457a18cbdc59 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -664,7 +664,7 @@ static int __init octeon_pci_setup(void)
 
 		/* BAR1 movable regions contiguous to cover the swiotlb */
 		octeon_bar1_pci_phys =
-			virt_to_phys(octeon_swiotlb) & ~((1ull << 22) - 1);
+			io_tlb_default_mem.start & ~((1ull << 22) - 1);
 
 		for (index = 0; index < 32; index++) {
 			union cvmx_pci_bar1_indexx bar1_index;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
