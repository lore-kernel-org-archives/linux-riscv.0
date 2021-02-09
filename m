Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BC9C433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 00:58:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C010264E82
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 00:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C010264E82
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XgQ1/GM8HlBWPpWuwyQGDYzhiFCCC1G6NO+OGpkg0HU=; b=sJZ+Rmh8PmZA5/a3hvSdZA56BJ
	TjZrxtBlDxQ6+VXLLBVhvZIKvhD7MEkn54i6p84woOHWmR0HyKaqTFHuKECRxj2pbgarnn5uxrqRD
	Y+TuzVigvctTuKEiQjcGaDJokdFy18b/pc2kIWRmOthtHOjKOZP2n9ZuslMeLO7SGSTumFstyLBUd
	mCIqX/PjUJRjSv3iEb3CEks1K4nnhQTEGIAv2sbBnx3f11jR+3+5wmjI7AHY/5t7tCbaLdq49dpcA
	hR//Iucy9m9X/GPGmiNSdJJlngOx3Qijm6k5xPI6N7VXpZkc2ZVNp4SNLKGGGXo1FFu5iVIV95eZf
	3NzJi7aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9HMI-0002vK-IS; Tue, 09 Feb 2021 00:58:26 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9HMG-0002uV-E1
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 00:58:25 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DZPc92R6fz7j85;
 Tue,  9 Feb 2021 08:56:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Feb 2021 08:58:09 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2] riscv: Cleanup setup_bootmem()
Date: Tue, 9 Feb 2021 09:01:51 +0800
Message-ID: <20210209010151.85751-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_195824_704668_792A0889 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: atish.patra@wdc.com, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Paul
 Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

After the following patches,

  commit de043da0b9e7 ("RISC-V: Fix usage of memblock_enforce_memory_limit")
  commit 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
  commit b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")

some logic is useless, kill the mem_start/start/end and unneeded code.

Reviewed-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
v2:
- Update changelog and add RB.

 arch/riscv/mm/init.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0b86a1a12da2..241f22348403 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -108,34 +108,17 @@ void __init mem_init(void)
 
 void __init setup_bootmem(void)
 {
-	phys_addr_t mem_start = 0;
-	phys_addr_t start, dram_end, end = 0;
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
+	phys_addr_t dram_end = memblock_end_of_DRAM();
 	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
-	u64 i;
-
-	/* Find the memory region containing the kernel */
-	for_each_mem_range(i, &start, &end) {
-		phys_addr_t size = end - start;
-		if (!mem_start)
-			mem_start = start;
-		if (start <= vmlinux_start && vmlinux_end <= end)
-			BUG_ON(size == 0);
-	}
 
-	/*
-	 * The maximal physical memory size is -PAGE_OFFSET.
-	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
-	 * as it is unusable by kernel.
-	 */
+	/* The maximal physical memory size is -PAGE_OFFSET. */
 	memblock_enforce_memory_limit(-PAGE_OFFSET);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	dram_end = memblock_end_of_DRAM();
-
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
