Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29151C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F348B60E95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F348B60E95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NvSvN4ArXMxXLez018mzHnuJI+BLg87MqvX5eMpXoA=; b=l0+lX08xgTppja
	cY8J6xmJ+maYSNPIJst1tL9r1o3vP8mkIB9oYK5DEiCnnqkSYGA1e0zAfWRf79x9LsJ7Y6jSdv7hX
	ZriiTbyWrtQWmlOUVFMXq3k/6BCdtwgCCZTJ/L9wioXcURBjoSyqJtE0FN62ETa5SiNBL6Fqb40WH
	x9IIrPzqrrud9G98kFfv0KSgYCMpDrcMnBLvSaokZHSN3LAobZuxjxPyvviafj+7eB1dTE1no6i7e
	OF1DWob76MwpNJq3EXJXV2g0y/bItbCr5x/fXtECe4AX48+b6z9okXhftpOXuI67+6hQhpB1s6E06
	frEyRM7v7A0lL6+Rv2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m72ua-005zRf-7x; Fri, 23 Jul 2021 21:40:52 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m72uN-005zHa-RQ
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 21:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627076439; x=1658612439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6g3J4tjDKnyTria/2MziFd3JxC/MOWlZq41Ya428Sw=;
 b=Zg8g9oblJiBjP6M0DV35HemAET63Xtwc8a8/SJisK7bR6yZaBdczCkaE
 7XHxAzoSQtao33sHW+dznFVFRz2ejGZwNCuBmLf0aUcoGEhRLYE68eeeG
 jji+VpWX6zugw8CjZ3SEqiSNBHGRpCSlcnFJv21UeUU6rzJLKruZMKaHm
 683NaIy6hWOUb8ML0e5Xa7O77yCfbIQJxeKxO5SgP4TL7hNjmXVpq5+CC
 tUw9H2mz+aYrj+W9GOHoE65l+Hc1ylhy1HhFn53LZoAy3dM3cEJnc7bnr
 PQP3TYOt+iXZlN0Xy5B4EMEE+1lrYFwpT3M0Djh4tMsdwVnnIo/tKtPQj Q==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="279198462"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 05:40:36 +0800
IronPort-SDR: PJaqyizG6HwnnB7G2XmeLedahqSZZUKTcTicaIyZGfmtUjiwYa5PaUMfYM7N62aVTACFYJK4Tm
 nvKrxbZ+6SkhYAQgrRki8g2/U2H4sR003c0mkfmf3zQhdd+zrWfkVmfU/exF/mVmnPURI/J6p9
 OSPgDV2N3j9erCvSrFkTTkrC8XetTdlH1vBgLEX6l/URgE+BxFX+4HXc19lQs+KMvPcv6Ti9la
 7mZeheEsPB6d+bQ9DtTorJHlOgPvN7EnVa+/HBIPO+0XNR3wMjkCIiMSiSXai2yHQUXGH52+PH
 XyRE/5JoQHyqE1wLxcI2xEzm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 14:18:26 -0700
IronPort-SDR: RopbJ1mZd7BhWsWcKFEmQ7WtbbN2Hmd5BOsJ+cqYC6WWZaLYWC+YxSjr74sWYzac7mWE8ByX20
 CjRTn0VmrM7uFgp31+YYSGzhOkMwzw0yorw6oML5t49P3RXU1r2Ggeemijjor6l/XapslEa0m2
 efJZGKLNB4+Wh1h6o8OMOfaZYU44hIeGI7gVEgGMpQJprdd/+e6YslEk3fnyYFOqj73qVJG5et
 AvJhFih8nRANtXfnJPf3u9tps3aivhLC4QFlxZWyQwvdpA3R/L/rUVEQ84bdHZ67CJxbGW5mA9
 YWY=
WDCIronportException: Internal
Received: from ucfbox21.ad.shared (HELO hulk.wdc.com) ([10.225.167.4])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Jul 2021 14:40:37 -0700
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
Subject: [RFC 3/5] dma-mapping: Enable global non-coherent pool support for
 RISC-V
Date: Fri, 23 Jul 2021 14:40:29 -0700
Message-Id: <20210723214031.3251801-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723214031.3251801-1-atish.patra@wdc.com>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_144040_027217_6EE2E35B 
X-CRM114-Status: GOOD (  21.70  )
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

Currently, linux,dma-default is used to reserve a global non-coherent pool
to allocate memory for dma operations. This can be useful for RISC-V as
well as the ISA specification doesn't specify a method to modify PMA
attributes or page table entries to define non-cacheable area yet.
A non-cacheable memory window is an alternate options for vendors to
support non-coherent devices. "dma-ranges" must be used in conjunction with
"linux,dma-default" property to define one or more mappings between device
and cpu accesible memory regions.

This allows RISC-V to use global pool for non-coherent platforms that
relies on a uncached memory region that is outside of the system ram.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 kernel/dma/coherent.c | 49 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 97677df5408b..d0b33b1a76f0 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -9,6 +9,8 @@
 #include <linux/module.h>
 #include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
+#include <linux/of_address.h>
+#include <linux/libfdt.h>
 
 struct dma_coherent_mem {
 	void		*virt_base;
@@ -302,19 +304,27 @@ int dma_mmap_from_global_coherent(struct vm_area_struct *vma, void *vaddr,
 					vaddr, size, ret);
 }
 
-int dma_init_global_coherent(phys_addr_t phys_addr, size_t size)
+static int __dma_init_global_coherent(phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)
 {
 	struct dma_coherent_mem *mem;
 
-	mem = dma_init_coherent_memory(phys_addr, phys_addr, size, true);
+	if (phys_addr == device_addr)
+		mem = dma_init_coherent_memory(phys_addr, device_addr, size, true);
+	else
+		mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);
+
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);
 	dma_coherent_default_memory = mem;
 	pr_info("DMA: default coherent area is set\n");
 	return 0;
 }
-#endif /* CONFIG_DMA_GLOBAL_POOL */
 
+int dma_init_global_coherent(phys_addr_t phys_addr, size_t size)
+{
+	return __dma_init_global_coherent(phys_addr, phys_addr, size);
+}
+#endif /* CONFIG_DMA_GLOBAL_POOL */
 /*
  * Support for reserved memory regions defined in device tree
  */
@@ -329,8 +339,8 @@ static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 	if (!rmem->priv) {
 		struct dma_coherent_mem *mem;
 
-		mem = dma_init_coherent_memory(rmem->base, rmem->base,
-					       rmem->size, true);
+		mem = dma_init_coherent_memory(rmem->base, rmem->base, rmem->size, true);
+
 		if (IS_ERR(mem))
 			return PTR_ERR(mem);
 		rmem->priv = mem;
@@ -358,7 +368,7 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
 	if (of_get_flat_dt_prop(node, "reusable", NULL))
 		return -EINVAL;
 
-#ifdef CONFIG_ARM
+#if defined(CONFIG_ARM) || defined(CONFIG_RISCV)
 	if (!of_get_flat_dt_prop(node, "no-map", NULL)) {
 		pr_err("Reserved memory: regions without no-map are not yet supported\n");
 		return -EINVAL;
@@ -382,10 +392,33 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
 #ifdef CONFIG_DMA_GLOBAL_POOL
 static int __init dma_init_reserved_memory(void)
 {
+	struct device_node *np;
+	const struct bus_dma_region *map = NULL;
+	int ret;
+	int64_t uc_offset = 0;
+
 	if (!dma_reserved_default_memory)
 		return -ENOMEM;
-	return dma_init_global_coherent(dma_reserved_default_memory->base,
-					dma_reserved_default_memory->size);
+
+	/* dma-ranges is only valid for global pool i.e. dma-default is set */
+	np = of_find_node_with_property(NULL, "linux,dma-default");
+	if (!np)
+		goto global_init;
+	of_node_put(np);
+
+	ret = of_dma_get_range(np, &map);
+	if (ret < 0)
+		goto global_init;
+
+	/* Sanity check for the non-coherent global pool from uncached region */
+	if (map->dma_start == dma_reserved_default_memory->base &&
+	    map->size == dma_reserved_default_memory->size)
+		uc_offset = map->offset;
+
+global_init:
+	return __dma_init_global_coherent(dma_reserved_default_memory->base + uc_offset,
+					  dma_reserved_default_memory->base,
+					  dma_reserved_default_memory->size);
 }
 core_initcall(dma_init_reserved_memory);
 #endif /* CONFIG_DMA_GLOBAL_POOL */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
