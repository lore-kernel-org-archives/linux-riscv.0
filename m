Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C76C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 05:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=paQ+zT/cqtlD0vhkdIBQVNgj6t/pMVmMe+3NjcnWvB4=; b=nES2V7CD1aT7XP
	01NxEB3+5hDTLQGwZsA5iZlydSCvmvX9sQYNpuUcPLx3hlIJNObQYtoanY/XjVfEns3pSrFW/OTDt
	zVTgjdM+rgCC7ArfH4zALojvQRKADsgfqOOgM+fp8VYr9ray0cqU4o7IaWbiCo4gnw7JZx9/Yg5GM
	WGeJizhDi1Zxf5eltTQBv0O8n4wEB0zG9J4utgLy6cvTsXm4KnaaiemyXOxx6kTYfLxKmIl4KGPLe
	AQtGkhB/vrtI8P/9QJ8Zt9WYbgGRsHjnGlgGljnlXvhxYHYItI1a4nQ5p9X6m8lAZ21rcuRtu6D3L
	YsRloBXKtXi44LcKXl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbEwN-00DAAu-NG; Mon, 04 Apr 2022 05:07:47 +0000
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEv3-00D8uv-7w; Mon, 04 Apr 2022 05:06:26 +0000
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
 linux-pci@vger.kernel.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 05/15] arm/xen: don't check for xen_initial_domain() in
 xen_create_contiguous_region
Date: Mon,  4 Apr 2022 07:05:49 +0200
Message-Id: <20220404050559.132378-6-hch@lst.de>
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

From: Stefano Stabellini <sstabellini@kernel.org>

It used to be that Linux enabled swiotlb-xen when running a dom0 on ARM.
Since f5079a9a2a31 "xen/arm: introduce XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped", Linux detects whether to enable or disable
swiotlb-xen based on the new feature flags: XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped.

However, there is still a leftover xen_initial_domain() check in
xen_create_contiguous_region. Remove the check as
xen_create_contiguous_region is only called by swiotlb-xen during
initialization. If xen_create_contiguous_region is called, we know Linux
is running 1:1 mapped so there is no need for additional checks.

Also update the in-code comment.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/xen/mm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index a7e54a087b802..28c2070602535 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -122,10 +122,7 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 				 unsigned int address_bits,
 				 dma_addr_t *dma_handle)
 {
-	if (!xen_initial_domain())
-		return -EINVAL;
-
-	/* we assume that dom0 is mapped 1:1 for now */
+	/* the domain is 1:1 mapped to use swiotlb-xen */
 	*dma_handle = pstart;
 	return 0;
 }
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
