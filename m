Return-Path: <SRS0=buhn=EG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0229CC388F7
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2020 05:56:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11B1720791
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2020 05:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOR+6edu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11B1720791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6BmFN7cJLOKnI5bqW6Dd3T7DFyur+qAhE+n72PXQiGI=; b=TOR+6eduMaufshiDoHvI3b32oZ
	cT+Dn/r0jXN0zAekqzE4Nui1d3Sh78Zf0x+GqJUJQqWT1dQ01mq1Xa8lKMdBKjAoLb+0Ywz7Jpurh
	0/+6yQqbed+tycdOzJvtPzniiQoFz9MiZ4OfgNNZYJJXI9bqJdDQznHJFZ3LHPn7B2B7A+FiG6Ygp
	9jGcM4qkF6qWaFbc3ODKkN9VPaCLu0taqxDEj1yDPMn814iRKSn/pbCft0g0WYkE/dj/nL+35Wwe4
	xNYciCjOQYzJii6g29sxL5GMHGtN5NF+qEO80hoGtz6ztlO0XQP6YB0HD28jf40WMUbaEg0dM6a4/
	ij9Gk8sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYjrt-0001em-Uk; Sat, 31 Oct 2020 05:56:01 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYjro-0001dc-SG
 for linux-riscv@lists.infradead.org; Sat, 31 Oct 2020 05:55:58 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CNT1R6ZxnzhZHQ;
 Sat, 31 Oct 2020 13:55:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 13:55:28 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: Enable CMA support
Date: Sat, 31 Oct 2020 14:01:12 +0800
Message-ID: <20201031060112.151854-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_015557_173861_E745C768 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

riscv has selected HAVE_DMA_CONTIGUOUS, but don't call
dma_contiguous_reserve(). let's enable CMA as expect.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ea933b789a88..87ae4b99442a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -13,6 +13,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/set_memory.h>
+#include <linux/dma-map-ops.h>
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -41,13 +42,14 @@ struct pt_alloc_ops {
 #endif
 };
 
+static phys_addr_t dma32_phys_limit __ro_after_init;
+
 static void __init zone_sizes_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
 
 #ifdef CONFIG_ZONE_DMA32
-	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G,
-			(unsigned long) PFN_PHYS(max_low_pfn)));
+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 
@@ -185,6 +187,7 @@ void __init setup_bootmem(void)
 
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = max_pfn;
+	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
 	set_max_mapnr(max_low_pfn);
 
 #ifdef CONFIG_BLK_DEV_INITRD
@@ -198,6 +201,7 @@ void __init setup_bootmem(void)
 	memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 
 	early_init_fdt_scan_reserved_mem();
+	dma_contiguous_reserve(dma32_phys_limit);
 	memblock_allow_resize();
 	memblock_dump_all();
 }
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
