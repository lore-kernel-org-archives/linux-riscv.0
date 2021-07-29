Return-Path: <SRS0=H4U1=MV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A92C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 06:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF9B60F02
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 06:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FF9B60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h9vMiNgnNLcqjcfpUkdRW4xkSA+iut0TQJOl5MD5jWA=; b=loPGatY/LGHAbr
	Gmqgzl1wkytZ2lH5K5X0giaQGhsrrkjply0i4t7mOMbjii0H6EFD5IK5ieGoLfrwJzJLNbNEfK6eW
	h/X4YMqj1ldeac6AEKMB9VsH1ZRF/rU2VcxUWyFvN1etpWYreBmsg8Fdft1WkpInVsQ+mhokofplR
	x4cuoWaxM8WC78f2z2326RrjGWjUEHHOsqIZTXbBdzWLo/h8IIcFZtxb2w8bMNZMAq+nkIGY5a/QP
	U1DUrLKw6Fjr5sly406i9RMBm6bTJFmSuBKhhOnSWUd7dadlB16xHaox1LIBlxjPYPSCeuKUYKIpy
	tlCC093DEtARuWl0XKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8zND-003FFR-Rm; Thu, 29 Jul 2021 06:18:27 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8zNA-003FF0-EW
 for linux-riscv@lists.infradead.org; Thu, 29 Jul 2021 06:18:26 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gb0YX2Y2HzYhpK;
 Thu, 29 Jul 2021 14:12:16 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 14:18:13 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 14:18:12 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH] riscv: Add support to allocate gigantic hugepages using CMA
Date: Thu, 29 Jul 2021 14:24:17 +0800
Message-ID: <20210729062417.157133-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_231824_762296_4BE6E40E 
X-CRM114-Status: GOOD (  10.55  )
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

The RV32 only has at most 1GB memory(MAXPHYSMEM_1GB), so let's
disable HUGETLBFS on RV32. And add support to allocate gigantic
hugepages using CMA by specifying the hugetlb_cma= kernel parameter.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig   | 2 +-
 arch/riscv/mm/init.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8fcceb8eda07..20a589605307 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -33,7 +33,7 @@ config RISCV
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
-	select ARCH_SUPPORTS_HUGETLBFS if MMU
+	select ARCH_SUPPORTS_HUGETLBFS if MMU && 64BIT
 	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a14bf3910eec..f2268402894b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -19,6 +19,7 @@
 #include <linux/set_memory.h>
 #include <linux/dma-map-ops.h>
 #include <linux/crash_dump.h>
+#include <linux/hugetlb.h>
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -216,6 +217,7 @@ static void __init setup_bootmem(void)
 
 	early_init_fdt_scan_reserved_mem();
 	dma_contiguous_reserve(dma32_phys_limit);
+	hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
 	memblock_allow_resize();
 }
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
