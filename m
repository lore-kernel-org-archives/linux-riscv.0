Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72149C47083
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 09:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3E5613AA
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 09:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3E5613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZdFzsCKVHl3aVTgOa+onf5/ImpzXLeGAhgxQPQFoXE=; b=SXpKdeNfZ7aHUK
	tTFV7AYKMOi4ssDFuhrxfi5rgUk+vLhXcks5p25vXMRD1MeupQlRiiJ6qAZZTnpofEb8j28WWSuNz
	NHcisSDhxFs6F/aVWlTg0j+nJ064WqC7fX0ml6QWK9H5oico9glVAUDvVTcRCQxR1c5Tec3BecpqD
	YwFak/Zs9vjXOPbYtf7z+cMZf0ruJ6YQ9jKOdjNXQYCs27LqNl5mNCIzD58hKpbKKTGIcKzsaujti
	0AJ0JpRWFRjBUOLfyhQoIOUE86U8pPKiM31tu4YZdO2FB8AldYlA2HEj3xt410woNJbl+RwDSgOBQ
	xbn0/+QRCFT3QyFaVLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMlN-002qWF-Sk; Wed, 02 Jun 2021 09:02:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loMW0-002lCN-K5
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 08:46:18 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fw2cJ45zGzYnSb;
 Wed,  2 Jun 2021 16:43:28 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 16:46:13 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 16:46:12 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 <palmerdabbelt@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH 1/2] riscv: Only initialize swiotlb when necessary
Date: Wed, 2 Jun 2021 16:55:16 +0800
Message-ID: <20210602085517.127481-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_014616_864412_F25FC7FC 
X-CRM114-Status: GOOD (  10.42  )
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

The SWIOTLB buffer is not needed unless the physical address space
is beyond the limit of dma, only initialize swiotlb when swiotlb_force
is true or not all system memory is DMA-able.

Also move the swiotlb_init() into mem_init().

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/kernel/setup.c | 5 -----
 arch/riscv/mm/init.c      | 8 ++++++++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 03901d3a8b02..0ccf5a1a250f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -17,7 +17,6 @@
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 #include <linux/sched/task.h>
-#include <linux/swiotlb.h>
 #include <linux/smp.h>
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
@@ -296,10 +295,6 @@ void __init setup_arch(char **cmdline_p)
 		protect_kernel_linear_mapping_text_rodata();
 	}
 
-#ifdef CONFIG_SWIOTLB
-	swiotlb_init(1);
-#endif
-
 #ifdef CONFIG_KASAN
 	kasan_init();
 #endif
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4faf8bd157ea..17f2e1da2b3d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -11,6 +11,7 @@
 #include <linux/memblock.h>
 #include <linux/initrd.h>
 #include <linux/swap.h>
+#include <linux/swiotlb.h>
 #include <linux/sizes.h>
 #include <linux/of_fdt.h>
 #include <linux/of_reserved_mem.h>
@@ -113,6 +114,13 @@ void __init mem_init(void)
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
 
+#ifdef CONFIG_SWIOTLB
+	if (swiotlb_force == SWIOTLB_FORCE ||
+	    max_pfn > PFN_DOWN(dma32_phys_limit))
+		swiotlb_init(1);
+	else
+		swiotlb_force = SWIOTLB_NO_FORCE;
+#endif
 	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
 	memblock_free_all();
 
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
