Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240A0C4708F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 09:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B3A613AA
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 09:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4B3A613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/ikvowseD4dA+kZM/uu0QBZ78U6Uot7F5DxG6GpBaQ=; b=L/ThDaZjYwzlYF
	w+xen9oWZiu6haN8ctax9ZD/6Jk6PuPriTRhVA1V0pltwVXKikhSc3ZJDvhvgKq62hbbatqphmmgY
	3GTNwHXjWGMQcoCOkKK9FLphR7z8uS0/YM/TKqLVIaF3LeZGvnq9au2otuLD+UIIV+0US+nJI1uyi
	cwTZ7CJvKqGK5dcohH5Xn3dBFu2QRe4bC28UKPrCS/eohVyzbksLPBDx2QiKiAtAaxnBzfjJLiHXK
	KnKlL+eFit87voUABzj55cs2VeS7sytprWXMYVZ3WB6GqAX1EqJ40alWvbbvtKMVFl2N8YMo8NjWL
	TiQKGDjp6NeNS2HWFXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMlF-002qTN-Je; Wed, 02 Jun 2021 09:02:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loMVz-002lCO-JW
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 08:46:17 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fw2cK0XPCzYpCy;
 Wed,  2 Jun 2021 16:43:29 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 16:46:13 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 16:46:13 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 <palmerdabbelt@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH 2/2] riscv: Add mem kernel parameter support
Date: Wed, 2 Jun 2021 16:55:17 +0800
Message-ID: <20210602085517.127481-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210602085517.127481-1-wangkefeng.wang@huawei.com>
References: <20210602085517.127481-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_014615_850385_E0569DBA 
X-CRM114-Status: GOOD (  13.20  )
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

The memblock_enforce_memory_limit() could change the memblock
range, so move the dram_end assignment after it in bootmem_init(),
then support mem= cmdline.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/init.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 17f2e1da2b3d..ce61510a08c0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -127,19 +127,39 @@ void __init mem_init(void)
 	print_vm_layout();
 }
 
+/*
+ * The default maximal physical memory size is -PAGE_OFFSET,
+ * limit the memory size via mem.
+ */
+static phys_addr_t memory_limit = -PAGE_OFFSET;
+
+static int __init early_mem(char *p)
+{
+	u64 size;
+
+	if (!p)
+		return 1;
+
+	size = memparse(p, &p) & PAGE_MASK;
+	memory_limit = min_t(u64, size, memory_limit);
+
+	pr_notice("Memory limited to %lldMB\n", (u64)memory_limit >> 20);
+
+	return 0;
+}
+early_param("mem", early_mem);
+
 void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
-	phys_addr_t dram_end = memblock_end_of_DRAM();
 	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
+	phys_addr_t dram_end;
 
 #ifdef CONFIG_XIP_KERNEL
 	vmlinux_start = __pa_symbol(&_sdata);
 #endif
-
-	/* The maximal physical memory size is -PAGE_OFFSET. */
-	memblock_enforce_memory_limit(-PAGE_OFFSET);
+	memblock_enforce_memory_limit(memory_limit);
 
 	/*
 	 * Reserve from the start of the kernel to the end of the kernel
@@ -154,6 +174,7 @@ void __init setup_bootmem(void)
 #endif
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
+	dram_end = memblock_end_of_DRAM();
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
