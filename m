Return-Path: <SRS0=TqGV=WQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296B4C3A589
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 14:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F099B22DBF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2019 14:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XR0AMTnA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F099B22DBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0vGD2F8lHx4ukg2T9mYRMIdPsxzgJZa9c5Ef0LQg0g=; b=XR0AMTnA5F6ETf
	lV3vVKodyUDdHHlpxp0+yME8eRQvy0XlIb6SNzlex5aJ24wQdFNBSI0j+Q9WI+osr1tNPF8X88a4i
	7DW/GAm+0gLqEBlSFFrhooe95PeDYrEvXVJnzfUjYh5ktXMlCbI41mHA8ANLm9NLhnWB4JkdVMEex
	3h7MTDBzID5nv+/ZVBkQWRChQxRZ58Iawmfl4rKGdslgeBjeaxRU4pCSDh9KIdY4jJeCHhdFl27tw
	np1fwk/Uvqq0K512Pw7TmXRzmQjrJMLDyzjhWDOZ21dNekxsuNCvkxpzO3mn1/XwW/7JTCh+VkfdM
	yr7EEX7k2712vopnp7/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05bZ-0005no-KT; Tue, 20 Aug 2019 14:59:25 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05aj-0004yP-0m; Tue, 20 Aug 2019 14:58:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0DD42AFA5;
 Tue, 20 Aug 2019 14:58:30 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
 marc.zyngier@arm.com, robh+dt@kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 01/11] asm-generic: add dma_zone_size
Date: Tue, 20 Aug 2019 16:58:09 +0200
Message-Id: <20190820145821.27214-2-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820145821.27214-1-nsaenzjulienne@suse.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_075833_202134_89C00933 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: phill@raspberryi.org, f.fainelli@gmail.com, frowand.list@gmail.com,
 linux-kernel@vger.kernel.org, eric@anholt.net, mbrugger@suse.com,
 linux-rpi-kernel@lists.infradead.org, akpm@linux-foundation.org,
 will@kernel.org, nsaenzjulienne@suse.de, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Some architectures have platform specific DMA addressing limitations.
This will allow for hardware description code to provide the constraints
in a generic manner, so as for arch code to properly setup it's memory
zones and DMA mask.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes in v2: None

 include/asm-generic/dma.h | 8 +++++++-
 mm/page_alloc.c           | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/dma.h b/include/asm-generic/dma.h
index 43d0c8af8058..c2f39cdb64f6 100644
--- a/include/asm-generic/dma.h
+++ b/include/asm-generic/dma.h
@@ -8,7 +8,13 @@
  *
  * Some code relies on seeing MAX_DMA_ADDRESS though.
  */
-#define MAX_DMA_ADDRESS PAGE_OFFSET
+#define MAX_DMA_ADDRESS	 (PAGE_OFFSET + dma_zone_size)
+
+/*
+ * Some architectures may have platform specific DMA addressing constraints.
+ * Firmware can use this to fine tune the device's DMA memory zone.
+ */
+extern u64 dma_zone_size __ro_after_init;
 
 extern int request_dma(unsigned int dmanr, const char *device_id);
 extern void free_dma(unsigned int dmanr);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 272c6de1bf4e..b514afee5451 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -133,6 +133,9 @@ EXPORT_SYMBOL(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 
+u64 dma_zone_size __ro_after_init;
+EXPORT_SYMBOL(dma_zone_size);
+
 int percpu_pagelist_fraction;
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 #ifdef CONFIG_INIT_ON_ALLOC_DEFAULT_ON
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
