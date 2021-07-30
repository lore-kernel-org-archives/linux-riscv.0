Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9DAC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 12:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A5A60E97
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 12:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0A5A60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C4nn/18UbH/GCp9bx4x9oQL4RBTQq7J2MJdA3dQnvC4=; b=K9iBebaHFIyOQ/
	zJnw3BuGFKqiKiVP0+qGr6a3P5Hd9vBh3LSJA9BOJabhrgvhJxUHixAkARUdFpc3huZKmbaNjUyGC
	s0vtl0J9xjwuNZJdZXeosPlSfH4R/trsqg+JarkhkfDIo/gfD9zN+JWIUAylKEUfIFmZygdoHayPi
	WuxrkkxDAvfp61ZPmZMjale+AfmXQ4PPkEjGqhfmgOmOxZINeyO1Si1bHGzcrzO793KrxqevEp8fX
	3I5sOWDdyL4LgI1l2IErquh3fwq2DgIujfN+egmmsK/s3K1TS0LFgQe44lv8XsaGf3Ch6sguAHvgB
	6Ui6UF0ES/8tXqvJTW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Rre-008dD9-M1; Fri, 30 Jul 2021 12:43:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Rrb-008dBj-4a
 for linux-riscv@lists.infradead.org; Fri, 30 Jul 2021 12:43:44 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gbn6J1S39z7x0m;
 Fri, 30 Jul 2021 20:39:52 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 20:43:39 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 20:43:38 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>, Kefeng Wang <wangkefeng.wang@huawei.com>, "Alexandre
 Ghiti" <alex@ghiti.fr>
Subject: [PATCH v3] riscv: Add support to allocate gigantic hugepages using CMA
Date: Fri, 30 Jul 2021 20:48:41 +0800
Message-ID: <20210730124841.178455-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_054343_388863_7B2FDF01 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

Commit 9e953cda5cdf ("riscv: Introduce huge page support for32/64bit
kernel") adds support gigantic hugepage support for RV64.

This patch adds support to allocate gigantic hugepages using CMA by
specifying the hugetlb_cma= kernel parameter on RV64.

Cc: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
v3: Update changelog and add Reviewed-by.
 arch/riscv/mm/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a14bf3910eec..e547e53cddd2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -19,6 +19,7 @@
 #include <linux/set_memory.h>
 #include <linux/dma-map-ops.h>
 #include <linux/crash_dump.h>
+#include <linux/hugetlb.h>
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -216,6 +217,8 @@ static void __init setup_bootmem(void)
 
 	early_init_fdt_scan_reserved_mem();
 	dma_contiguous_reserve(dma32_phys_limit);
+	if (IS_ENABLED(CONFIG_64BIT))
+		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
 	memblock_allow_resize();
 }
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
