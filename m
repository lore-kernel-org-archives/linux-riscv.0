Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3406C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7215760EB6
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7215760EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wK/pQY94DKPHqrINA5IwCVN8IPxrNkGCCwKkTvwnsdU=; b=AexST/EDmb8DCE
	7xmRA4OG2wyO6Lfh7NENbbyFvEZNEaDL5EO/AuSeojWZDJqyTvTsGmIQYbqiAeSwT2MRN4M0SICpW
	N/PZpXAo2GHljy24fvI4hyYZpQ9y+P+eNWsAvVsgx0DCQAGGTTzn/c6iz3L+xV1wijMr8C1K47RnK
	+Lc0iLNGaFfnkZuueV8n1W9ZP6tJL6y7W+HQhqrMISaZu20d2jcsocjRJMIuqZJ5+KEtXD3Mmbhoc
	uxgfZ20A00wSOiDRzDTwE4zwNWfcEwv5PdoFWtvDWemG1QPyPJnIJFJzMBoEA/dTnG5kDh50Upr6i
	7akIPgpaq/qig8m2llTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m72uS-005zN7-PQ; Fri, 23 Jul 2021 21:40:44 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m72uL-005zI1-U1
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 21:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627076437; x=1658612437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z1V0kd2qCOL9tX4hStPvB2PLIDsfutT0f6QLFPZOYuY=;
 b=fsm2ItKcbv2fUuG/PS7cVktAtYtKaPqk9Hbu6DzV7BtxMUk7SIylVCT/
 IaIRCOd9iPvHJ13K3EpfS6UUzxd0iW7doBYUof/lX3THFUtiQFH7ZqNps
 AJjIcjmPosXyDf0paHT/96thTNP20x9q56oNAVRi+rrh/LMIpHVAUJs+V
 C2eHGyMmRlmLDjDmqpwD3ckI2j0ublAxwLrhddvNGiJQdnNje9Tt0Wf+M
 zDmR+cbipEfZK0hNIcC2b6Qqy1rU4CtSHOecu5Qk1dM9JHa6xfmbDlA9C
 bX5bfZTt73SP9m2JDSjcj/LElh0QNO5mcCGqg0tVH7fxs2/C7BfREmrhs w==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="279198453"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 05:40:35 +0800
IronPort-SDR: vnQ85W6CHdzcPt7JLBHacfEdmoqiruEfwalDrOIjVTOM8m40Q1amHgO57kpPKl9KNCWsBuD5+4
 GdpjvPw8o80XVjlwtkWAKB16XGWk5+SveHgaE4dQTxrA+kMoxLjlW5UArOnnC8OshqPGxIeuQM
 LkWdX6l1a7D4ezhLdhbyyuvcy3vzycJs6Y+eBiOQrDAKoge1s+XoMvvAqDmvzHGGVXjWWrFM+w
 xiHIZCoX8HK5N21MfP/I0edQcO+kTpv1PtjZKIlbq6rkrlB0n0UzbMhIzXhIGiLETjsuHD9AXH
 fmpoci8qk1YZu3pccA/JRjbz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 14:18:24 -0700
IronPort-SDR: 7ealWTp55CZ7bL3tJ/aaVbGP16h6pCxLZLGJvdMqFInFeK8lXI6qJJN+T294Fk+cYCKbuRL5a4
 DhDqryWpLNkLiLpQOnSDhKLtI/n83up5yrg0WRdErqNgFt6WnEsy6VIRw8FiXw0beTku/Xy+2j
 Cn5C3UcecDXN800Im5bjdY1oxeqxFb3MnA6CPcHcUHHba368h5HZWtH2v9d/0hlW7IwbBfjpDC
 xgEeNzkU5VFflnDZT1HNlyhkeQBEszXMbNruQNMxO/1AVPQTvXu4H3WBXPGZCJ/IUvMI+MhHm5
 AlM=
WDCIronportException: Internal
Received: from ucfbox21.ad.shared (HELO hulk.wdc.com) ([10.225.167.4])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Jul 2021 14:40:36 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>, iommu@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tobias Klauser <tklauser@distanz.ch>
Subject: [RFC 1/5] RISC-V: Implement arch_sync_dma* functions
Date: Fri, 23 Jul 2021 14:40:27 -0700
Message-Id: <20210723214031.3251801-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723214031.3251801-1-atish.patra@wdc.com>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_144038_115469_E35C5D47 
X-CRM114-Status: GOOD (  17.93  )
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

To facilitate streaming DMA APIs, this patch introduces a set of generic
cache operations related dma sync. Any platform can use the generic ops
to provide platform specific cache management operations. Once the
standard RISC-V CMO extension is available, it can be built on top of it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/dma-noncoherent.h | 19 +++++++
 arch/riscv/mm/Makefile                   |  1 +
 arch/riscv/mm/dma-noncoherent.c          | 66 ++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/include/asm/dma-noncoherent.h
new file mode 100644
index 000000000000..5bdb03c9c427
--- /dev/null
+++ b/arch/riscv/include/asm/dma-noncoherent.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef __ASM_RISCV_DMA_NON_COHERENT_H
+#define __ASM_RISCV_DMA_NON_COHERENT_H
+
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+struct riscv_dma_cache_sync {
+	void (*cache_invalidate)(phys_addr_t paddr, size_t size);
+	void (*cache_clean)(phys_addr_t paddr, size_t size);
+	void (*cache_flush)(phys_addr_t paddr, size_t size);
+};
+
+void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
+#endif
+
+#endif
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..959bef49098b 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -27,3 +27,4 @@ KASAN_SANITIZE_init.o := n
 endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
+obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
new file mode 100644
index 000000000000..2f6e9627c4aa
--- /dev/null
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V specific functions to support DMA for non-coherent devices
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#include <linux/dma-direct.h>
+#include <linux/dma-map-ops.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/libfdt.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <asm/dma-noncoherent.h>
+
+static struct riscv_dma_cache_sync *dma_cache_sync;
+unsigned long riscv_dma_uc_offset;
+
+static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
+		dma_cache_sync->cache_invalidate(paddr, size);
+	else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
+		dma_cache_sync->cache_clean(paddr, size);
+	else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
+		dma_cache_sync->cache_flush(paddr, size);
+}
+
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	if (!dma_cache_sync)
+		return;
+
+	__dma_sync(paddr, size, dir);
+}
+
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	if (!dma_cache_sync)
+		return;
+
+	__dma_sync(paddr, size, dir);
+}
+
+void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
+		const struct iommu_ops *iommu, bool coherent)
+{
+	/* If a specific device is dma-coherent, set it here */
+	dev->dma_coherent = coherent;
+}
+
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	void *flush_addr = page_address(page);
+
+	memset(flush_addr, 0, size);
+	if (dma_cache_sync && dma_cache_sync->cache_flush)
+		dma_cache_sync->cache_flush(__pa(flush_addr), size);
+}
+
+void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops)
+{
+	dma_cache_sync = ops;
+}
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
